Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.6962.1585948931939410105
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id z5so8819718oth.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7ljn1EKMa/OIqnALexAD5N0y1DYiywjT3giSf037Z3I=;
        b=qc55O62o6gwXOUolpOTtqiwKLxaa6sWnQDHiZQdEcxVaPZbZHmfxswFdhzTnPRoiUC
         nLscaTckhUGxGNPQHVhzC5RsZZRjZ6G88MzYrOFbD2/qNebeBmlzcGfCSlQW2zGYI+ug
         b8KhsMvDhEe7Uy9dmrc5XWNv4m/UiO4G4lQzxatnxiZBMHlTmdoKbysjzYEeLanDu2hZ
         oxcvBUhPMaRgcWK4FiHrtz/6ZaDblie2r1+VdcN3LTqOGfnvh4pXXUpnXC8VQL9UHlpl
         gwaxIFqVQMHAt4uu9ftZoDXMJowkvT8JsQ5+V7h1J5Ytit5fRDPWJ9kiND7n9GFiJ3Cu
         u4uA==
X-Gm-Message-State: AGi0Pub3OgTtrvefUeSKqekeAt2D5NynJMMD5JIlaYDflijdcCBTHPhF
	wVz92X8+lTNGb+S+8njHma6b8vdIKvQ=
X-Google-Smtp-Source: APiQypI8ZyVwk9iBpUHY4XIizvql36AK7Yi68bl6J+8wCZvmKhhBimpolm8xAfNs2WsQbqcjZB4PSg==
X-Received: by 2002:a9d:4ee:: with SMTP id 101mr7924350otm.301.1585948930880;
        Fri, 03 Apr 2020 14:22:10 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:09 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/10] python-xlrd: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:19 -0400
Message-Id: <20200403212120.23481-9-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-xlrd.inc   | 30 -----------------
 .../python/python3-xlrd_1.2.0.bb              | 33 +++++++++++++++++--
 2 files changed, 31 insertions(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-xlrd.inc

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
deleted file mode 100644
index ee73e76b91..0000000000
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Library for developers to extract data from Microsoft Excel (tm) spreadsheet files"
-DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
- versions 2.0 onwards) on any platform. Pure Python (2.6, 2.7, 3.2+). \
-Strong support for Excel dates. Unicode-aware."
-HOMEPAGE = "http://www.python-excel.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80"
-
-SRC_URI[md5sum] = "e5d5b96924d791b22898b622eb3e918e"
-SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-inherit ptest
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-	install -d ${D}${PTEST_PATH}/examples
-	cp -rf ${S}/examples/* ${D}${PTEST_PATH}/examples/
-}
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
index b7bd969c71..571dba6fa8 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
@@ -1,2 +1,31 @@
-inherit pypi setuptools3
-require python-xlrd.inc
+SUMMARY = "Library for developers to extract data from Microsoft Excel (tm) spreadsheet files"
+DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
+ versions 2.0 onwards) on any platform. Pure Python (2.6, 2.7, 3.2+). \
+Strong support for Excel dates. Unicode-aware."
+HOMEPAGE = "http://www.python-excel.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80"
+
+SRC_URI[md5sum] = "e5d5b96924d791b22898b622eb3e918e"
+SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+inherit ptest pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/examples
+    cp -rf ${S}/examples/* ${D}${PTEST_PATH}/examples/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

