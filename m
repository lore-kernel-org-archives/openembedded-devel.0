Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.7107.1585948929230406457
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id z5so8819575oth.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cyw8cfSEeMcad3XS69O3GfbO//A+cgY+Tfggnasyogg=;
        b=A7T/fogiqMbjLI3UgzPTSHKI6ZajAVU5P5mw9Id2qiWAl3kkyYUfm33xcHH/a4LWSg
         a+/B/tNeaufPxC5C2Grx378LZ9JPZmi9o+2CmxfVU+zFMGMyZ6LD3IquCTYc/5AQblLv
         ZSX1QwBZxUFNQstUoOd6BM/rO71jvGL4CmmNRd2xBBAanLH9AewfGoGuMGbRQsGgoP1l
         ZbsZkbu5jgGj05Af6+HN/fiD8lILQ70ofgf+HqRPQ4/CajoEwaqVI5CobCQ19kuV/w0a
         Sf0ozWYXPt61KbRy8Gs/Id3IguEkgLehXIwwur5hl3kHH39UXLFbGajNpZ9xp8hO3HuV
         phHA==
X-Gm-Message-State: AGi0Pua106ZAp6WlQ2tPys7iy04YVUZ+GtRSWTqBzS8GRXFtY1nvR42G
	P6OeuRQAXIPBEyvalgifNBy6eJbP2d8=
X-Google-Smtp-Source: APiQypIzslImGiajdHlg5q0+5lObnmG5Mf2XC7YJMLJ7ZWbKkUh4oeVl8kKoXP2wH35MYf8XVByNvQ==
X-Received: by 2002:a9d:19c8:: with SMTP id k66mr8379522otk.186.1585948927811;
        Fri, 03 Apr 2020 14:22:07 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:07 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/10] python-xxhash: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:16 -0400
Message-Id: <20200403212120.23481-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-xxhash.inc | 22 -----------------
 .../python/python3-xxhash_1.4.3.bb            | 24 +++++++++++++++++--
 2 files changed, 22 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-xxhash.inc

diff --git a/meta-python/recipes-devtools/python/python-xxhash.inc b/meta-python/recipes-devtools/python/python-xxhash.inc
deleted file mode 100644
index c02c29eb78..0000000000
--- a/meta-python/recipes-devtools/python/python-xxhash.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "xxhash is a Python binding for the xxHash library by Yann Collet."
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
-
-SRC_URI[md5sum] = "ce9cbbcc89620fd47a2468badd08dcf0"
-SRC_URI[sha256sum] = "8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-inherit ptest
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
index 76bc41a11c..c114a6c8bc 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
@@ -1,2 +1,22 @@
-require python-xxhash.inc
-inherit pypi setuptools3
+SUMMARY = "xxhash is a Python binding for the xxHash library by Yann Collet."
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
+
+SRC_URI[md5sum] = "ce9cbbcc89620fd47a2468badd08dcf0"
+SRC_URI[sha256sum] = "8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

