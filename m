Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605FFC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:16:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.13476.1678428954048998512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m4xDumb8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428962; i=@fujitsu.com;
	bh=tuUjKamMzyg7ilI0K06+abhEuQCttK6pl2O5zAUEIRE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m4xDumb89V4UvX8MBEFmD4ju7G744YIWpr9Ubj0KLqnnlIy+TpdEhQ+FCwIqv1OAY
	 Wl1YPV+78WF/Ni4VhyaEhPP2YS7azPTzgZd4Pgo7mXkJDIFePE4T3NX/dA9Rsu5hhw
	 FUVUHZRkoRfNSxvzKFcJNkMVmbHRKOmgzd7ixv1P+TqsWXa1/Tm4K5fetonVn0XqKv
	 tqm5foKYDijRzFP1GfRHpUaP3w60u+T+ZwDQ+w88XJeXU6DwYZMiYVRNoN7Qv5vxtj
	 ZZqy+np46izBzzBkn/GKPdI4uieGxeFcrQfMRW2Zk+biUtQh64lGZzelTScza7sLHg
	 KLdWQ4QRAKj/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqKt4miv
  F4OQJXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePb7k72gh96Fct/ZTcwXlDrYuTiEBJ4wihx
  784/JgjnOpPEj5v3WSGcPYwSK2ZdZe9i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAR+JrU+ngdWwCKhKHLk4C8zmFXCUWLCjnRXElhBQkJjy8D1YL6eAk8Tdt30sILYQUM3vJ4
  vZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaF6cWlaUW6Rpa6iUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBIZvSnHa1x2Ms/v+6h1ilORgUhLlVU7lShHiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  bv3BFBOsCg1PbUiLTMHGEswaQkOHiURXtYdQGne4oLE3OLMdIjUKUZdjqtXruxlFmLJy89LlR
  LnZT0OVCQAUpRRmgc3AhbXlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qAXMKTmVcCt+k
  V0BFMQEfs2sIBckRJIkJKqoEpSLDymb9v8EKt1lc7RROSGJTVWG9XCJyTt71R3Gs25U6Hdl6v
  6JrVZ24v7/c4dj3pUJl0p9Aek96w32pPypwe+IdqWrZUvZEX3XhutvLRMxuVzu6+JyG3c4Pjw
  4xPn35ePKZzZbGySPEs1szFs+3CmzdVGYXMEo1T2u6idz63yuqYcbDiqXt2jxJ6LjVx/ZgVrv
  V9Es8W2b6dH9mfee92XmvbHTp56ay83yYyC6rt5ZjzzlTYZlRzuhhZSWjd02Kaa53d8TLau+z
  /7jcHjK3Y3FmyT80VOOS/2ml+VN90pZeH87M9rSq6rN19Vriqru67LdiZdVLaNFNh7l8ZHw3O
  6Xy+4W9YuNN8WfPilViKMxINtZiLihMBxGUsa2YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1678428961!594504!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23738 invoked from network); 10 Mar 2023 06:16:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:16:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 14BDD100191
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:16:01 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0893F100182
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:16:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:15:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 10/11] nginx: upgrade 1.20.1 -> 1.23.3
Date: Fri, 10 Mar 2023 14:15:37 +0800
Message-ID: <1678428937-7700-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
References: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101482

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2021-3618.patch
removed since it's included in 1.23.3

Changelog:
==========
*) Bugfix: an error might occur when reading PROXY protocol version 2
   header with large number of TLVs.

*) Bugfix: a segmentation fault might occur in a worker process if SSI
   was used to process subrequests created by other modules.
   Thanks to Ciel Zhao.

*) Workaround: when a hostname used in the "listen" directive resolves
   to multiple addresses, nginx now ignores duplicates within these
   addresses.

*) Bugfix: nginx might hog CPU during unbuffered proxying if SSL
   connections to backends were used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nginx/files/CVE-2021-3618.patch           | 107 ------------------
 .../recipes-httpd/nginx/nginx_1.20.1.bb       |   9 --
 .../recipes-httpd/nginx/nginx_1.23.3.bb       |   6 +
 3 files changed, 6 insertions(+), 116 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
deleted file mode 100644
index be42a1ed5..000000000
--- a/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 6dafcdebde58577f4fcb190be46a0eb910cf1b96 Mon Sep 17 00:00:00 2001
-From: Maxim Dounin <mdounin@mdounin.ru>
-Date: Wed, 19 May 2021 03:13:31 +0300
-Subject: [PATCH 1/1] Mail: max_errors directive.
-
-Similarly to smtpd_hard_error_limit in Postfix and smtp_max_unknown_commands
-in Exim, specifies the number of errors after which the connection is closed.
---- end of original header ---
-
-CVE: CVE-2021-3618
-
-Upstream-Status: Backport
-                 https://github.com/nginx/nginx.git
-                 commit 173f16f736c10eae46cd15dd861b04b82d91a37a
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- src/mail/ngx_mail.h             |  3 +++
- src/mail/ngx_mail_core_module.c | 10 ++++++++++
- src/mail/ngx_mail_handler.c     | 15 ++++++++++++++-
- 3 files changed, 27 insertions(+), 1 deletion(-)
-
-diff --git a/src/mail/ngx_mail.h b/src/mail/ngx_mail.h
-index b865a3b9..76cae37a 100644
---- a/src/mail/ngx_mail.h
-+++ b/src/mail/ngx_mail.h
-@@ -115,6 +115,8 @@ typedef struct {
-     ngx_msec_t              timeout;
-     ngx_msec_t              resolver_timeout;
- 
-+    ngx_uint_t              max_errors;
-+
-     ngx_str_t               server_name;
- 
-     u_char                 *file_name;
-@@ -231,6 +233,7 @@ typedef struct {
-     ngx_uint_t              command;
-     ngx_array_t             args;
- 
-+    ngx_uint_t              errors;
-     ngx_uint_t              login_attempt;
- 
-     /* used to parse POP3/IMAP/SMTP command */
-diff --git a/src/mail/ngx_mail_core_module.c b/src/mail/ngx_mail_core_module.c
-index 40831242..115671ca 100644
---- a/src/mail/ngx_mail_core_module.c
-+++ b/src/mail/ngx_mail_core_module.c
-@@ -85,6 +85,13 @@ static ngx_command_t  ngx_mail_core_commands[] = {
-       offsetof(ngx_mail_core_srv_conf_t, resolver_timeout),
-       NULL },
- 
-+    { ngx_string("max_errors"),
-+      NGX_MAIL_MAIN_CONF|NGX_MAIL_SRV_CONF|NGX_CONF_TAKE1,
-+      ngx_conf_set_num_slot,
-+      NGX_MAIL_SRV_CONF_OFFSET,
-+      offsetof(ngx_mail_core_srv_conf_t, max_errors),
-+      NULL },
-+
-       ngx_null_command
- };
- 
-@@ -163,6 +170,8 @@ ngx_mail_core_create_srv_conf(ngx_conf_t *cf)
-     cscf->timeout = NGX_CONF_UNSET_MSEC;
-     cscf->resolver_timeout = NGX_CONF_UNSET_MSEC;
- 
-+    cscf->max_errors = NGX_CONF_UNSET_UINT;
-+
-     cscf->resolver = NGX_CONF_UNSET_PTR;
- 
-     cscf->file_name = cf->conf_file->file.name.data;
-@@ -182,6 +191,7 @@ ngx_mail_core_merge_srv_conf(ngx_conf_t *cf, void *parent, void *child)
-     ngx_conf_merge_msec_value(conf->resolver_timeout, prev->resolver_timeout,
-                               30000);
- 
-+    ngx_conf_merge_uint_value(conf->max_errors, prev->max_errors, 5);
- 
-     ngx_conf_merge_str_value(conf->server_name, prev->server_name, "");
- 
-diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
-index 0aaa0e78..71b81512 100644
---- a/src/mail/ngx_mail_handler.c
-+++ b/src/mail/ngx_mail_handler.c
-@@ -871,7 +871,20 @@ ngx_mail_read_command(ngx_mail_session_t *s, ngx_connection_t *c)
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
--    if (rc == NGX_IMAP_NEXT || rc == NGX_MAIL_PARSE_INVALID_COMMAND) {
-+    if (rc == NGX_MAIL_PARSE_INVALID_COMMAND) {
-+
-+        s->errors++;
-+
-+        if (s->errors >= cscf->max_errors) {
-+            ngx_log_error(NGX_LOG_INFO, c->log, 0,
-+                          "client sent too many invalid commands");
-+            s->quit = 1;
-+        }
-+
-+        return rc;
-+    }
-+
-+    if (rc == NGX_IMAP_NEXT) {
-         return rc;
-     }
- 
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
deleted file mode 100644
index d686c627f..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require nginx.inc
-
-SRC_URI += "file://CVE-2021-3618.patch"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
-
-SRC_URI[md5sum] = "8ca6edd5076bdfad30a69c9c9b41cc68"
-SRC_URI[sha256sum] = "e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb
new file mode 100644
index 000000000..a8ffd9b93
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
+
+SRC_URI[sha256sum] = "75cb5787dbb9fae18b14810f91cc4343f64ce4c24e27302136fb52498042ba54"
+
-- 
2.34.1


