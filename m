Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.3464.1617854849409958019
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 21:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slc7VNP8;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so2419511pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 21:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSz/iFSx+yohLUtVvTX433Qvl2fn2pmIPEjVE32TVr0=;
        b=slc7VNP8NE1TIk0Jk2WfvQq1iweuoeYDpmgywSu4jloeZOG8z3oVoHUeE+9C2x6N7x
         sAGoCU5JWh/EqV+hVjVau5oCiZXso2/TA5GeOHtF+Ae4Jvr5DSGWTZUbK5uKpEBEwthv
         7KIRvuN8XKtE4iB819F6mY6lJ1NKQEVYk1OkF8hixLCWFBuZTp/jJzgCo2bCefKT5Qmc
         evOnfxmAiLUdhUUEXmlbVG36RdSKB+KWiVYp9yj9OC66Y2Fhvi3Osb9Sq7HJSGXi32LN
         eTcfbLLecAlj/6v8IpSwoPHcNY9/cBuwQVaEdDIIuuOMl0JSI4+C0FGfoui1kKHJ52VH
         TxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSz/iFSx+yohLUtVvTX433Qvl2fn2pmIPEjVE32TVr0=;
        b=GAFQFFpT1ZS8jbQSRSqtCzvigzdFSxeSG52R9oYbTAUHpmBs4PKW8gPoIQr75knm6+
         mT+d8pRGpyUWGNpbcY1FDXmVVM/LmzHnQTv6M8oWnmVA+Dabjm4U40bTI6j3VMzkZA9a
         tYzR7S4hUpO4IFF7eb+1p2+pzkgID71RYTl7XLqftHH6wFvx9LaJIpevTTtomqjE/QJj
         Hwg5HOUDbFHBF0WbMRo/LeDWe1Th891eZ9t9tVllXCPjihzbLDzbA1PC06+qK6kAldrE
         a3ObmfNGuOBRgQVN1lL3nf08SrsjGVbcAxHimQB49IMuLohyO+VamPjI1Ad3DdFfjN+n
         TeVQ==
X-Gm-Message-State: AOAM531Lpygp4vjitiNlLRVSUh4MESxNUT9pcWWUX5M386oqH0AzFVDM
	ddTrtvMWDveNCkBXQhPmKjVMYpnF2TlAwQ==
X-Google-Smtp-Source: ABdhPJwiz68JiiILmbOllVgyGTgkNwteCzRGUNebzfSmUJUTwJN0lSVpy1UM6FVKzCKJ2GsicN82UQ==
X-Received: by 2002:a17:90a:528b:: with SMTP id w11mr6390672pjh.162.1617854848512;
        Wed, 07 Apr 2021 21:07:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id n16sm22734918pff.119.2021.04.07.21.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 21:07:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Upgrade to 5.4.2
Date: Wed,  7 Apr 2021 21:07:26 -0700
Message-Id: <20210408040726.941701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch which is already in 5.4.2 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...building-opencv-using-gcc-11.x-19244.patch | 28 -------------------
 .../{opencv_4.5.1.bb => opencv_4.5.2.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.5.1.bb => opencv_4.5.2.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch b/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
deleted file mode 100644
index ce6499bfce..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 67e1a5400383543b28fc69eb09c9429cb9d8c026 Mon Sep 17 00:00:00 2001
-From: Your Name <you@example.com>
-Date: Sat, 2 Jan 2021 17:43:11 +0000
-Subject: [PATCH] Fix building opencv using gcc 11.x #19244
-
-Add missing `#include <thread>` in modules/gapi/test/test_precomp.hpp
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/pull/19247]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/gapi/test/test_precomp.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/gapi/test/test_precomp.hpp b/modules/gapi/test/test_precomp.hpp
-index 7b3c695443..e92b1d03bf 100644
---- a/modules/gapi/test/test_precomp.hpp
-+++ b/modules/gapi/test/test_precomp.hpp
-@@ -11,6 +11,7 @@
- #define __OPENCV_GAPI_TEST_PRECOMP_HPP__
- 
- #include <cstdint>
-+#include <thread>
- #include <vector>
- 
- #include <opencv2/ts.hpp>
--- 
-2.30.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.5.1.bb
rename to meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index d87e140ba7..553fb4e08a 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "1363496c1106606684d40447f5d1149b2c66a9f8"
-SRCREV_contrib = "b91a781cbc1285d441aa682926d93d8c23678b0b"
+SRCREV_opencv = "69357b1e88680658a07cffde7678a4d697469f03"
+SRCREV_contrib = "f5d7f6712d4ff229ba4f45cf79dfd11c557d56fd"
 SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
@@ -49,7 +49,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-Fix-building-opencv-using-gcc-11.x-19244.patch \
            "
 SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.31.1

