Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253D0C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 19:52:34 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.80204.1701719552496799514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 11:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqK6S5v0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-54ca339ae7aso2404157a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 11:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701719550; x=1702324350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umg7QWTkXyuCegAsYlykBIDK83Fgb8VZISwBDPYXQR4=;
        b=hqK6S5v0pwIpuPS7bexOjnN8TGOaOnwNORsjhoErBSHWx9nZ3IL5CyRxG8k90zCP/V
         03Pfp7ZV+GrtkDxe0uKnI0h5sFJGVl9o3ore9Ew0j0pU5WC325cMugP9QafOvsgKoUYJ
         Rqu6b7QkUC55OPlJgMViA8wHPibGWVCC+NAK7yejHP1wdC7vV/57jLwWBciVyMjWoIqV
         GxnJ+kPM21p0xvHv4dawXQuV6GsHH2kdaVV/aJI5Mz7CPzyh4K1nTJ4jWSKoVgVb67wA
         7RDf/3TXPoQOuJVbH/jwWcQgSWPrO2Kyz8T0gpnPNdoKYlpIC+Xqm01EEtId1e4P3k2+
         2B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701719550; x=1702324350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umg7QWTkXyuCegAsYlykBIDK83Fgb8VZISwBDPYXQR4=;
        b=eoI4DYWvlGGZlPiRSagvCzC1cf0EGK6H1zjOo16Z323FlM0qZHSglPAcmM5MGBP//Y
         Yc2rig1A5h/YbcZ2C/B7sxKnlFxQ/SErjAJBUxHzE/kbT+p35ZwUFD7ibWz1X9R4reV7
         V2hHpyvzcEuE2xXgq1ChcCMhYOQud08RfyjYanMtbR0COumvdSVXdqJC92UUy6/WiTdX
         LDTZXfc5M7jQI4qQdo6znspkD8AIZG0phnEJKa3A5FrTFJEBIeuJpB9DSwHbwLY5+n0s
         SiLy0OnyG1ohXTlR4kfXYHSb2MHI8JE1vFUgXgPPGTBKKwLZXB3Obk750t13zVeGfCTh
         jV2w==
X-Gm-Message-State: AOJu0Yw6oILuxwUE+2OSttvQp+58QeN1KVu3jITtz2UBQPZvJNC8HI0x
	kKU+bvocAOg5+o3XUb9bwimw6U9K6SqF3Q==
X-Google-Smtp-Source: AGHT+IEuvR/VoNGaYyhQ05jUB6cjTj1Pgbj1LauwsEd56HuWaNIYWx+kA/+VGfObFd/Lqt9FuU/84w==
X-Received: by 2002:a17:906:6816:b0:a03:90a3:b775 with SMTP id k22-20020a170906681600b00a0390a3b775mr3782939ejr.27.1701719550106;
        Mon, 04 Dec 2023 11:52:30 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id u8-20020a170906c40800b00a0029289961sm5626915ejz.190.2023.12.04.11.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 11:52:29 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Date: Mon,  4 Dec 2023 22:52:24 +0300
Message-Id: <20231204195224.45946-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 19:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107212

* We have to pass "__STDC_VERSION__"  value to cmake option due to this error ->

A cross-compiling environment has been detected.
CMake Error at CMakeLists.txt:430 (message):
	The value of __STDC_VERSION__ cannot be automatically determined when
	cross-compiling.  Please set JAS_STDC_VERSION to the value of
	__STDC_VERSION__ when invoking CMake (e.g., by using the option
	-DJAS_STDC_VERSION=...) or modify the CMakeLists.txt appropriately

* Options that are on by default have been added to PACKAGECONFIG.

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
 .../recipes-graphics/jasper/jasper_2.0.33.bb  | 26 -----------
 .../recipes-graphics/jasper/jasper_4.1.1.bb   | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 26 deletions(-)
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
index 000000000..d5f35f175
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Jpeg 2000 implementation"
+HOMEPAGE = "https://jasper-software.github.io/jasper/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
+
+SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
+SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
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
+		   shared-lib PIC hidden jpeg heif opengl doc latex programs multithread pthread bmp jp2 jpc jpg pgx pnm ras \
+		  "
+				  
+PACKAGECONFIG[shared-lib] = "-DJAS_ENABLE_SHARED=ON,-DJAS_ENABLE_SHARED=OFF,,"
+PACKAGECONFIG[PIC] = "-DJAS_ENABLE_PIC=ON,-DJAS_ENABLE_PIC=OFF,,"
+PACKAGECONFIG[hidden] = "-DJAS_ENABLE_HIDDEN=ON,-DJAS_ENABLE_HIDDEN=OFF,,"
+PACKAGECONFIG[32bit] = "-DJAS_ENABLE_32BIT=ON,-DJAS_ENABLE_32BIT=OFF,,"
+PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
+PACKAGECONFIG[heif] = "-DJAS_ENABLE_LIBHEIF=ON,-DJAS_ENABLE_LIBHEIF=OFF,,"
+PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,freeglut,"
+PACKAGECONFIG[doc] = "-DJAS_ENABLE_DOC=ON,-DJAS_ENABLE_DOC=OFF,doxygen,"
+PACKAGECONFIG[latex] = "-DJAS_ENABLE_LATEX=ON,-DJAS_ENABLE_LATEX=OFF,,"
+PACKAGECONFIG[programs] = "-DJAS_ENABLE_PROGRAMS=ON,-DJAS_ENABLE_PROGRAMS=OFF,,"
+PACKAGECONFIG[multithread] = "-DJAS_ENABLE_MULTITHREADING_SUPPORT=ON,-DJAS_ENABLE_MULTITHREADING_SUPPORT=OFF,,"
+PACKAGECONFIG[pthread] = "-DJAS_PREFER_PTHREAD=ON,-DJAS_PREFER_PTHREAD=OFF,,"
+PACKAGECONFIG[pthread-tss] = "-DJAS_PREFER_PTHREAD_TSS=ON,-DJAS_PREFER_PTHREAD_TSS=OFF,,"
+PACKAGECONFIG[strict] = "-DJAS_STRICT=ON,-DJAS_STRICT=OFF,,"
+PACKAGECONFIG[bmp] = "-DJAS_ENABLE_BMP_CODEC=ON,-DJAS_ENABLE_BMP_CODEC=OFF,,"
+PACKAGECONFIG[jp2] = "-DJAS_ENABLE_JP2_CODEC=ON,-DJAS_ENABLE_JP2_CODEC=OFF,,"
+PACKAGECONFIG[jpc] = "-DJAS_ENABLE_JPC_CODEC=ON,-DJAS_ENABLE_JPC_CODEC=OFF,,"
+PACKAGECONFIG[jpg] = "-DJAS_ENABLE_JPG_CODEC=ON,-DJAS_ENABLE_JPG_CODEC=OFF,,"
+PACKAGECONFIG[heic] = "-DJAS_ENABLE_HEIC_CODEC=ON,-DJAS_ENABLE_HEIC_CODEC=OFF,,"
+PACKAGECONFIG[mif] = "-DJAS_ENABLE_MIF_CODEC=ON,-DJAS_ENABLE_MIF_CODEC=OFF,,"
+PACKAGECONFIG[pgx] = "-DJAS_ENABLE_PGX_CODEC=ON,-DJAS_ENABLE_PGX_CODEC=OFF,,"
+PACKAGECONFIG[pnm] = "-DJAS_ENABLE_PNM_CODEC=ON,-DJAS_ENABLE_PNM_CODEC=OFF,,"
+PACKAGECONFIG[ras] = "-DJAS_ENABLE_RAS_CODEC=ON,-DJAS_ENABLE_RAS_CODEC=OFF,,"
-- 
2.25.1


