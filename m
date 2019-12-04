Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C8D8F7ED5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 08:41:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; d="scan'208";a="79573707"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:41:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7EEDC4CE1C09
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 16:32:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:41:19 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Dec 2019 07:02:17 -0800
Message-ID: <1575471738-11717-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7EEDC4CE1C09.AAF2F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-jsonschema: 3.1.1 -> 3.2.0
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
X-List-Received-Date: Wed, 04 Dec 2019 08:41:26 -0000
Content-Type: text/plain

0001-setup.cfg-add-non-GPL-format-option.patch
Removed since it is included in 3.2.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-jsonschema.inc  |  6 +-
 .../0001-setup.cfg-add-non-GPL-format-option.patch | 96 ----------------------
 ...nschema_3.1.1.bb => python-jsonschema_3.2.0.bb} |  0
 ...schema_3.1.1.bb => python3-jsonschema_3.2.0.bb} |  0
 4 files changed, 3 insertions(+), 99 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
 rename meta-python/recipes-devtools/python/{python-jsonschema_3.1.1.bb => python-jsonschema_3.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonschema_3.1.1.bb => python3-jsonschema_3.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 258bead..df1d3ef 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -7,10 +7,10 @@ DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
 
-SRC_URI_append = " file://0001-setup.cfg-add-non-GPL-format-option.patch"
+SRC_URI_append = ""
 
-SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
-SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
+SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
+SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
 
 PACKAGECONFIG ??= "format"
 PACKAGECONFIG[format] = ",,,\
diff --git a/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch b/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
deleted file mode 100644
index afc38a3..0000000
--- a/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 8df0332475991884b8e1801d31f9c3e06d06bf9f Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <nick83ola@gmail.com>
-Date: Thu, 14 Nov 2019 18:58:56 +0000
-Subject: [PATCH] setup.cfg: add non GPL format option
-
-This is a rewrite of the following upstream commits:
-
- - 10f8a3e Add format validators as separate modules
- - af37707 non GPL format option
-
-removing all the non necessary bits (tox in particular)
-
-Original author: Nicolas Aimetti <naimetti@yahoo.com.ar>
-
-Upstream-status: Backported. [ to be removed for releases > 3.1.1 ]
----
- jsonschema/_format.py | 33 ++++++++++++++++++++++++++++-----
- setup.cfg             |  6 ++++++
- 2 files changed, 34 insertions(+), 5 deletions(-)
-
-diff --git a/jsonschema/_format.py b/jsonschema/_format.py
-index aa04090..c967d98 100644
---- a/jsonschema/_format.py
-+++ b/jsonschema/_format.py
-@@ -248,7 +248,26 @@ else:
- try:
-     import rfc3987
- except ImportError:
--    pass
-+    try:
-+        from rfc3986_validator import validate_rfc3986
-+    except ImportError:
-+        pass
-+    else:
-+        @_checks_drafts(name="uri",)
-+        def is_uri(instance):
-+            if not isinstance(instance, str_types):
-+                return True
-+            return validate_rfc3986(instance, rule="URI")
-+
-+        @_checks_drafts(
-+            draft6="uri-reference",
-+            draft7="uri-reference",
-+            raises=ValueError,
-+        )
-+        def is_uri_reference(instance):
-+            if not isinstance(instance, str_types):
-+                return True
-+            return validate_rfc3986(instance, rule="URI_reference")
- else:
-     @_checks_drafts(draft7="iri", raises=ValueError)
-     def is_iri(instance):
-@@ -280,15 +299,19 @@ else:
- 
- 
- try:
--    import strict_rfc3339
-+    from strict_rfc3339 import validate_rfc3339
- except ImportError:
--    pass
--else:
-+    try:
-+        from rfc3339_validator import validate_rfc3339
-+    except ImportError:
-+        validate_rfc3339 = None
-+
-+if validate_rfc3339:
-     @_checks_drafts(name="date-time")
-     def is_datetime(instance):
-         if not isinstance(instance, str_types):
-             return True
--        return strict_rfc3339.validate_rfc3339(instance)
-+        return validate_rfc3339(instance)
- 
-     @_checks_drafts(draft7="time")
-     def is_time(instance):
-diff --git a/setup.cfg b/setup.cfg
-index 74bc4a7..878221c 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -40,6 +40,12 @@ format =
- 	rfc3987
- 	strict-rfc3339
- 	webcolors
-+format_nongpl =
-+	idna
-+	jsonpointer>1.13
-+	webcolors
-+	rfc3986-validator>0.1.0
-+	rfc3339-validator
- 
- [options.entry_points]
- console_scripts = 
--- 
-2.20.1
-
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.1.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonschema_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
-- 
2.7.4




