Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.20948.1586104948921819940
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 09:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id f52so12768326otf.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 09:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cdX2/MIWRq+CB9xzKD6bAWbP0TAhLKasMV/vItkNNQo=;
        b=fdEym3VREm56eif2Pkw0ngjWquWpUcillwJ8TjgenXkA7UoPBKW7gGDnv326CPr3na
         mDgIfeGQEwSrDIf9VaNcAb9wlJMMcyTTrPOjpiPOwalemYu8Qh9Gm0ExbpUfw5gsKgim
         23GmEu0K9pdsJmN79hwC42Mj2z2T1caMg2BVf5eZYT3v2IooWsq2TuUHigT0jiQBsa4h
         8BFglMR5OXDxi4Ugi8WaWUVzgF8wFCW3WdgHV0dA9zZW5xaXJ6wbi3Q1F3JFIdF7Y7vA
         3p6u/E4ORP2wgs2HGaTnvOKmaKqe2oKjhmBj7jMTtEbqBjU7P9dze9R0+nGwVZCF8+NC
         OdfA==
X-Gm-Message-State: AGi0PuaQTa8czNYyylWW6WOm17Pu3/81+O197S9kxWwb+Zz9Ec8poh1Y
	zsm2z+EndWAfOvI3KWt5oOE4BhbJiFk=
X-Google-Smtp-Source: APiQypLyRxqohT+i+oewPajT+gM/bWhIC3si+EY0qkxcObesddahXM68xYsdjK2sCAGHe+NXzY25lg==
X-Received: by 2002:a9d:3b5:: with SMTP id f50mr13941847otf.31.1586104947768;
        Sun, 05 Apr 2020 09:42:27 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id r15sm3866573oie.18.2020.04.05.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 09:42:27 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/6] python-pyserial: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 12:41:55 -0400
Message-Id: <20200405164200.31599-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pyserial.inc                | 44 ------------------
 .../python/python3-pyserial_3.4.bb            | 46 ++++++++++++++++++-
 2 files changed, 44 insertions(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyserial.inc

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
deleted file mode 100644
index c9580de264..0000000000
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "Serial Port Support for Python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
-
-SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
-SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
-
-inherit pypi
-
-PACKAGES =+ "${PN}-java ${PN}-osx ${PN}-win32 ${PN}-tools"
-
-FILES_${PN}-java = " \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/*java* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*java* \
-"
-
-FILES_${PN}-osx = " \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*osx* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*osx* \
-"
-
-FILES_${PN}-win32 = " \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/*serialcli* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*serialcli* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/*win32* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*win32* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/miniterm* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/miniterm* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*windows* \
-    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*windows* \
-"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
index 17ed3f8bc4..eee8eb2d16 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
@@ -1,7 +1,49 @@
-inherit setuptools3
-require python-pyserial.inc
+SUMMARY = "Serial Port Support for Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
+
+SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
+SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
+
+inherit pypi setuptools3
 
 do_install_append() {
     rm -f ${D}${bindir}/miniterm.py
     rmdir ${D}${bindir}
 }
+
+PACKAGES =+ "${PN}-java ${PN}-osx ${PN}-win32 ${PN}-tools"
+
+FILES_${PN}-java = " \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/*java* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*java* \
+"
+
+FILES_${PN}-osx = " \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*osx* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*osx* \
+"
+
+FILES_${PN}-win32 = " \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/*serialcli* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*serialcli* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/*win32* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*win32* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/miniterm* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/miniterm* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*windows* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*windows* \
+"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

