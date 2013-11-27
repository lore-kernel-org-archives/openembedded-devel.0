Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66B356D86B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 08:37:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAR8bC3c012348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 00:37:12 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 27 Nov 2013 00:37:11 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Nov 2013 16:37:10 +0800
Message-ID: <1385541430-19861-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] proftpd: move pidfile from /var/ to /var/run/
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Nov 2013 08:37:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

/var/run/ is more suitable to store pidfile for OE, and this fixes
"/etc/init.d/proftpd stop" failure too, since this script assumes
the pidfile is under /var/run

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../proftpd/files/move-pidfile-to-var-run.patch    |   39 ++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch
new file mode 100644
index 0000000..953bbdd
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch
@@ -0,0 +1,39 @@
+move pidfile to /var/run
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure    |    2 +-
+ configure.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index e6268f5..ebed38e 100755
+--- a/configure
++++ b/configure
+@@ -33587,7 +33587,7 @@ cat >>confdefs.h <<_ACEOF
+ _ACEOF
+ 
+ cat >>confdefs.h <<_ACEOF
+-#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
++#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/run/proftpd.pid"`"
+ _ACEOF
+ 
+ 
+diff --git a/configure.in b/configure.in
+index df9186a..e2ae868 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2790,7 +2790,7 @@ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
+ 
+ AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
+ AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`")
+-AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/proftpd.pid"`")
++AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`")
+ 
+ prefix="$pr_saved_prefix"
+ exec_prefix="$pr_saved_exec_prefix"
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 6571b9c..14d88cf 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -12,6 +12,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://contrib.patch \
            file://proftpd-basic.init \
            file://default \
+           file://move-pidfile-to-var-run.patch \
 "
 
 SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
-- 
1.7.10.4


