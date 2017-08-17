Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA4E77809
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 10:46:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7HAkoVD011161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 03:46:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 17 Aug 2017 03:46:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Aug 2017 18:51:31 +0800
Message-ID: <1502967091-31272-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: fix CVE-2017-12588
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
X-List-Received-Date: Thu, 17 Aug 2017 10:46:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Backport a patch to fix CVE-2017-12588.

The zmq3 input and output modules in rsyslog before 8.28.0 interpreted
description fields as format strings, possibly allowing a format string
attack with unspecified impact.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2017-12588

CVE: CVE-2017-12588

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../rsyslog/rsyslog/CVE-2017-12588.patch           | 40 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
new file mode 100644
index 0000000..73c3310
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
@@ -0,0 +1,40 @@
+From 6bc4aa975a83abed43d734299ce76cd9e1a14aec Mon Sep 17 00:00:00 2001
+From: Thomas Deutschmann <whissi@whissi.de>
+Date: Wed, 17 May 2017 23:05:24 +0200
+Subject: [PATCH] imzmq3: Fix building with -Werror=format-security
+
+Reference: https://nvd.nist.gov/vuln/detail/CVE-2017-12588
+
+CVE: 2017-12588
+
+Upstream-Status: Backport
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ contrib/imzmq3/imzmq3.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/imzmq3/imzmq3.c b/contrib/imzmq3/imzmq3.c
+index 9ca17871..d32dcbc2 100644
+--- a/contrib/imzmq3/imzmq3.c
++++ b/contrib/imzmq3/imzmq3.c
+@@ -403,7 +403,7 @@ static rsRetVal createSocket(instanceConf_t* info, void** sock) {
+ 
+     /* Do the bind/connect... */
+     if (info->action==ACTION_CONNECT) {
+-        rv = zsocket_connect(*sock, info->description);
++        rv = zsocket_connect(*sock, "%s", info->description);
+         if (rv == -1) {
+             errmsg.LogError(0,
+                             RS_RET_INVALID_PARAMS,
+@@ -413,7 +413,7 @@ static rsRetVal createSocket(instanceConf_t* info, void** sock) {
+         }
+         DBGPRINTF("imzmq3: connect for %s successful\n",info->description);
+     } else {
+-        rv = zsocket_bind(*sock, info->description);
++        rv = zsocket_bind(*sock, "%s", info->description);
+         if (rv == -1) {
+             errmsg.LogError(0,
+                             RS_RET_INVALID_PARAMS,
+-- 
+2.13.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index d1d391b..6e3a75c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
+           file://CVE-2017-12588.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
1.9.1


