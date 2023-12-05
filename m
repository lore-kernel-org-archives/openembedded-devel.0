Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53027C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 13:50:10 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.99656.1701784201581551729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 05:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVDTo/sT;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-54c74b3cd4cso6804013a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701784200; x=1702389000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7DG9GbmmnlRjWNvAokhtnGtj5MqnRqJcMyXtVU3LFM=;
        b=HVDTo/sTG7mphxiS2IDErvK0sM/htXErjFBHAFJGwbnuCxxDIiTNajlJ2DMUba8HrM
         XyZHcjXKy68SJiaDLd3/QwQe3TuluqRFyQgrFsjxbrjdzJpyri+VVxKQff+Txzc9rouq
         pbSHEDXEnI+Qi/p8bULrBEGlJPkHSQgYLGVustfJn/HUwZUKfZQAQmGIPY8AW2W3cRSu
         /OArhST/2DzFhPucR5g1EafaRSiFjqVWBsxFveE70X42cyndO19oDubxDyPp/QDeeIea
         NVMaB1zrHQF/5CIYbSwI3L0cS3b+ydzJPt/mtqGCd3QDRoUYTHVncfZ00SQeTql2yKx0
         Vc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784200; x=1702389000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7DG9GbmmnlRjWNvAokhtnGtj5MqnRqJcMyXtVU3LFM=;
        b=iS3rgdYDwE9YkRAv8Ek3NxdA7xVka0EsAAoNR/WRRhiKAe2kkXvGDW2KwjiRvcIhji
         XF4ME7Wqu5byxy9DxsKLhLQDPu8DCJ1C1cfEiSL0VMirugBcuOmwF10mKsD1ORiLgX2+
         GeQPLgBahqfc1hBvkJ4DnbjNmxxPvWFyPM5psVFHkJ26gHNbHpPwAU5Y8AdjivMfwfjy
         qTBZHEFN1Z4wQAE3yDO/sozIcDYfDY/Bmv4lWrRhY8GQkrFHsHihYVvNSH46T1Zcyxxn
         gSv8JHTlETHc9a0NPIri2so3+0tuLJqDqYf5reg1GgAXRMS4eP9Ej8BZDo+R3B2hkMxe
         47wA==
X-Gm-Message-State: AOJu0YyIZ6Cr60eMGivl9FeA5FhwGSsIfwFYB5ayDdTmREMf5FEInrC/
	/yeDj4D6pWEdbqc7xcwzEBK4TotwT8L5Xg==
X-Google-Smtp-Source: AGHT+IGv3Mm1kX/2v6t0iTlKa5cE0nIGhSjvOmu+8JxVapVyftK+Nz/quAuKpB7xJOp1IQdjDtHaNg==
X-Received: by 2002:a17:906:73c7:b0:a1b:619e:53f7 with SMTP id n7-20020a17090673c700b00a1b619e53f7mr1203366ejl.27.1701784199112;
        Tue, 05 Dec 2023 05:49:59 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id k21-20020aa7c395000000b0054ce0b24cfdsm1118007edq.23.2023.12.05.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:49:58 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] jasper: upgrade 2.0.33 -> 4.1.1
Date: Tue,  5 Dec 2023 16:49:47 +0300
Message-Id: <20231205134947.140202-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 13:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107224

* We have to pass "__STDC_VERSION__"  value to cmake option due to this error ->

A cross-compiling environment has been detected.
CMake Error at CMakeLists.txt:430 (message):
	The value of __STDC_VERSION__ cannot be automatically determined when
	cross-compiling.  Please set JAS_STDC_VERSION to the value of
	__STDC_VERSION__ when invoking CMake (e.g., by using the option
	-DJAS_STDC_VERSION=...) or modify the CMakeLists.txt appropriately

* Options that are on by default have been added to PACKAGECONFIG.

* JAS_ENABLE_SHARED which is enable building of shared library removed because enabled by default.

Changelog:

4.1.1 (2023-11-28)
==================

* Disallow in-source builds by default.
* Fix a potential integer overflow problem in the jas_get_total_mem_size
  function (for the Windows platform).

4.1.0 (2023-11-04)
==================

* Add support for building several JasPer application programs for
  WebAssembly target with WASI support.

4.0.1 (2023-11-04)
==================

* Fix integer overflow bug in PNM decoder (#353).
* Fix a few minor build issues.

4.0.0 (2022-11-05)
==================

* Improve static linking (#336).
* Fix path relocation in mingw environment (#335).
* Improve logging and build scripts.
* Improve JPEG-2000 conformance test results.
* Enable PIC by default.
* Fix memory leaks in function cmdopts_parse (#332) (CVE-2022-2963).
* imgcmp:
  + Add quiet (-q) option.
  + Add debug-level option.
  + Fix memory leak.
* imginfo:
  + Add quiet (-q) option.
* Fix bug in parsing PGX header.
* Fix integer overflow bug (#345) (CVE-2022-40755).

3.0.6 (2022-07-13)
==================

* Fix bug in manual deployment script.

3.0.5 (2022-06-23)
==================

* Fix a minor build issue (#328).

3.0.4 (2022-06-02)
==================

* Eliminate some bogus calls to abort.
* Fix a typo in jas_safeui64_div (#323).
* Add some additional logging messages.
* Fix the source of a potential compiler warning (#321).

3.0.3 (2022-03-15)
==================

* Fix some portability issues in a few scripts.

3.0.2 (2022-02-14)
==================

* Fix a build issue that occurs when a cross-compiler is used (e.g., #319).

3.0.1 (2022-02-12)
==================

* Fix some build/portability issues (e.g., #317, #318).

3.0.0 (2022-02-05)
==================

VERY IMPORTANT NOTE:
This release of the JasPer software introduced some changes in the API
and/or behavior of the library relative to earlier releases, which may
necessitate some small changes in code using the library (e.g., to avoid
memory leaks or other problems).  Please refer to the "News" section
of the JasPer Reference Manual for more details.  For convenience,
this manual is available online (for various JasPer releases) at:
    https://jasper-software.github.io/jasper-manual

* Greatly improve documentation.
* Add support for multithreading.
* Add some customization points in the library, such as the memory allocator
  and error logging function.
* Add improved memory usage tracking and limiting.
* Add experimental partial encoding/decoding support for the HEIC format.
* Fix some longstanding issues in the JasPer I/O streams API.
* Add the running of the full test suite in CI builds for the Windows platform.
  (Previously, the full test suite was only run for CI builds on Unix-based
  platforms.)
* Fix many bugs (e.g., #305, #307, #308, #309, #312, #314, and many others
  not associated with any issue numbers).

* Merged support for JasPer 3.0.0 into the XV software at:
      https://github.com/jasper-software/xv.git

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-graphics/jasper/jasper_2.0.33.bb  | 26 ---------------
 .../recipes-graphics/jasper/jasper_4.1.1.bb   | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
deleted file mode 100644
index 85da5bfb4..000000000
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Jpeg 2000 implementation"
-HOMEPAGE = "https://jasper-software.github.io/jasper/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
-
-SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
-SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
-
-CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=true, -DJAS_ENABLE_LIBJPEG=false, jpeg"
-PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=true, -DJAS_ENABLE_OPENGL=false, freeglut"
-
-EXTRA_OECMAKE:append = " -DJAS_ENABLE_SHARED=true"
-
-do_install:append() {
-    chrpath -d ${D}${bindir}/jasper
-    chrpath -d ${D}${bindir}/imginfo
-    chrpath -d ${D}${bindir}/imgcmp
-    chrpath -d ${D}${libdir}/libjasper.so.*
-}
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
new file mode 100644
index 000000000..9052855d1
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Jpeg 2000 implementation"
+HOMEPAGE = "https://jasper-software.github.io/jasper/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
+
+SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
+SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
+
+CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+do_configure:prepend() {
+	JAS_STDC_VERSION="$(echo __STDC_VERSION__ | ${CPP} -E -P -)"
+}
+
+EXTRA_OECMAKE:append = " -DJAS_STDC_VERSION=${JAS_STDC_VERSION}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
+		   jpeg"
+
+PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
+PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,freeglut,"
+
+do_install:append() {
+    chrpath -d ${D}${bindir}/jasper
+    chrpath -d ${D}${bindir}/imginfo
+    chrpath -d ${D}${bindir}/imgcmp
+    chrpath -d ${D}${libdir}/libjasper.so.*
+}
+
-- 
2.25.1


