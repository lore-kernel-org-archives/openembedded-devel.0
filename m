Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5786.1591667377461798653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 18:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0591nGNV000993
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2020 18:49:27 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Jun 2020
 18:48:53 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH] multipath-tools: fix do_compile failure due to json-c upgrade
Date: Mon, 8 Jun 2020 18:48:53 -0700
Message-ID: <20200609014853.94857-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The new json-c does not define TRUE, so we should use 1 to avoid
do_compile failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...01-libdmmp_private.h-Do-not-use-TRUE.patch | 31 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
new file mode 100644
index 000000000..a78bfd2c6
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
@@ -0,0 +1,31 @@
+From cdee4a7e9f8aa880eb4f381aa4325c1ae42951f8 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 8 Jun 2020 18:43:10 -0700
+Subject: [PATCH] libdmmp_private.h: Do not use TRUE
+
+As json-c has been upgraded and TRUE is not defined any more, we should
+avoid using it and use 1 instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ libdmmp/libdmmp_private.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
+index ac85b63f..4378962b 100644
+--- a/libdmmp/libdmmp_private.h
++++ b/libdmmp/libdmmp_private.h
+@@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
+ do { \
+ 	json_type j_type = json_type_null; \
+ 	json_object *j_obj_tmp = NULL; \
+-	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
++	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != 1) { \
+ 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
+ 		       "key '%s' not found", key); \
+ 		rc = DMMP_ERR_IPC_ERROR; \
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index af34a4b39..5018f51d2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0031-Always-use-devmapper-for-kpartx.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
+           file://0001-libdmmp_private.h-Do-not-use-TRUE.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.21.0

