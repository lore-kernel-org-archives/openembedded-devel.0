Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.354.1591378328761735658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50784 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jhGCK-0000HW-Vb; Fri, 05 Jun 2020 20:32:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-jsonschema: Consolidate in a single file
Date: Fri,  5 Jun 2020 20:31:52 +0300
Message-Id: <20200605173152.2360-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605173152.2360-1-leon.anavi@konsulko.com>
References: <20200605173152.2360-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-jsonschema.inc              | 48 -------------------
 .../python/python3-jsonschema_3.2.0.bb        | 48 ++++++++++++++++++-
 2 files changed, 47 insertions(+), 49 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonschema.inc

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
deleted file mode 100644
index 8135b0fe6..000000000
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "An implementation of JSON Schema validation for Python"
-HOMEPAGE = "https://github.com/Julian/jsonschema"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
-                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
-DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
-
-SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
-SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
-
-PACKAGECONFIG ??= "format"
-PACKAGECONFIG[format] = ",,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-strict-rfc3339 \
-"
-PACKAGECONFIG[nongpl] = ",,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3986-validator \
-    ${PYTHON_PN}-rfc3339-validator \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-setuptools-scm \
-    ${PYTHON_PN}-zipp \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
index 926990747..2705dd3ba 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
@@ -1,2 +1,48 @@
+SUMMARY = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "https://github.com/Julian/jsonschema"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
+SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
+
 inherit pypi setuptools3
-require python-jsonschema.inc
+
+PACKAGECONFIG ??= "format"
+PACKAGECONFIG[format] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3987 \
+    ${PYTHON_PN}-strict-rfc3339 \
+"
+PACKAGECONFIG[nongpl] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3986-validator \
+    ${PYTHON_PN}-rfc3339-validator \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-importlib-metadata \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-pyrsistent \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-setuptools-scm \
+    ${PYTHON_PN}-zipp \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

