Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0668A60B29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:56:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01P7uOrg021136
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 23:56:24 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 24 Feb 2020 23:56:18 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Feb 2020 15:56:16 +0800
Message-ID: <1582617376-453370-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH V2] ngnix: fix error during service startup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 07:56:24 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
invalid argument

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../nginx/files/nginx-fix-pidfile.patch            | 99 ++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc       |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx-fix-pidfile.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-fix-pidfile.patch b/meta-webserver/recipes-httpd/nginx/files/nginx-fix-pidfile.patch
new file mode 100644
index 0000000..90159a6
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-fix-pidfile.patch
@@ -0,0 +1,99 @@
+Description: Fix NGINX pidfile handling   
+Author: Tj <ubuntu@iam.tj>                  
+Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
+Last-Update: 2019-06-04 
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+
+Upstream-Status: Pending
+
+This patch is from ubuntu, https://github.com/aroth-arsoft/pkg-nginx/blob
+/master/debian/patches/nginx-fix-pidfile.patch, for fix below
+error info:
+nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
+invalid argument
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+diff --git a/src/core/nginx.c b/src/core/nginx.c
+index 9fcb0eb2..083eba1d 100644
+--- a/src/core/nginx.c
++++ b/src/core/nginx.c
+@@ -338,14 +338,21 @@ main(int argc, char *const *argv)
+         ngx_process = NGX_PROCESS_MASTER;
+     }
+ 
++    /* tell-tale to detect if this is parent or child process */
++    ngx_int_t child_pid = NGX_BUSY;
++
+ #if !(NGX_WIN32)
+ 
+     if (ngx_init_signals(cycle->log) != NGX_OK) {
+         return 1;
+     }
+ 
++    /* tell-tale that this code has been executed */
++    child_pid--;
++
+     if (!ngx_inherited && ccf->daemon) {
+-        if (ngx_daemon(cycle->log) != NGX_OK) {
++        child_pid = ngx_daemon(cycle->log);
++        if (child_pid == NGX_ERROR) {
+             return 1;
+         }
+ 
+@@ -358,8 +365,19 @@ main(int argc, char *const *argv)
+ 
+ #endif
+ 
+-    if (ngx_create_pidfile(&ccf->pid, cycle->log) != NGX_OK) {
+-        return 1;
++    /* If ngx_daemon() returned the child's PID in the parent process
++     * after the fork() set ngx_pid to the child_pid, which gets
++     * written to the PID file, then exit.
++     * For NGX_WIN32 always write the PID file
++     * For others, only write it from the parent process */
++    if (child_pid < NGX_OK || child_pid > NGX_OK) {
++	ngx_pid = child_pid > NGX_OK ? child_pid : ngx_pid;
++        if (ngx_create_pidfile(&ccf->pid, cycle->log) != NGX_OK) {
++            return 1;
++	}
++    }
++    if (child_pid > NGX_OK) {
++        exit(0);
+     }
+ 
+     if (ngx_log_redirect_stderr(cycle) != NGX_OK) {
+diff --git a/src/os/unix/ngx_daemon.c b/src/os/unix/ngx_daemon.c
+index 385c49b6..3719854c 100644
+--- a/src/os/unix/ngx_daemon.c
++++ b/src/os/unix/ngx_daemon.c
+@@ -7,14 +7,17 @@
+ 
+ #include <ngx_config.h>
+ #include <ngx_core.h>
++#include <unistd.h>
+ 
+ 
+ ngx_int_t
+ ngx_daemon(ngx_log_t *log)
+ {
+     int  fd;
++    /* retain the return value for passing back to caller */
++    pid_t pid_child = fork();
+ 
+-    switch (fork()) {
++    switch (pid_child) {
+     case -1:
+         ngx_log_error(NGX_LOG_EMERG, log, ngx_errno, "fork() failed");
+         return NGX_ERROR;
+@@ -23,7 +26,8 @@ ngx_daemon(ngx_log_t *log)
+         break;
+ 
+     default:
+-        exit(0);
++        /* let caller do the exit() */
++        return pid_child;
+     }
+ 
+     ngx_parent = ngx_pid;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 0d229ff..2824c66 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://nginx.init \
     file://nginx-volatile.conf \
     file://nginx.service \
+    file://nginx-fix-pidfile.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.7.4


