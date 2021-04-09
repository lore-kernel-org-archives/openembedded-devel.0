Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.3679.1617934877876293835
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DaW4z80g;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id s16-20020a0568301490b02901b83efc84a0so4277791otq.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OSFmaoHxPlrlOPlDpiXY6q2XIWCYOAb7+GqUeTVpSjA=;
        b=DaW4z80gdlLyKTom1YDwaNAJ1KO/jd0wKz7ax/chvgHvOLwBRWISUOvpOafZU2Zbma
         5KSKQENphmg/6lPCNNr90bRnTgiQfhGT4XSk1oVBHH8CqRzwnIdw1dnkSKj/9PnmguJY
         Clcp+IyRRVBYVWpJktCK7yJau7k/Lgbl19Hv4uCbAMXpmZ9e9eCCH80qkxVr8LNtbLU2
         pgjLPLW9XB47kp0cmiur10Gp/UjpZqhnHCXbsxHnWIrH2AV/0PVW4uyy6hbQl1F48Uup
         T2B85rEG4EN4kjIWHd6GoegU0FSLGiM2aOfeZlnuXq//HQmMncYHxi3N8tEEFiOSHI9g
         pPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OSFmaoHxPlrlOPlDpiXY6q2XIWCYOAb7+GqUeTVpSjA=;
        b=H38m9yiVMyYcsQrQKJNw01BIkejXRJYCv5v4HC1rRVKIQ76/zbBcHFisb2YN2Lo+kk
         ib7mZwH0c4FWWZNh243uX23jR/Hr9vtOEmZmO++d1I/uyJZg+Oi+L5/QDC6mCTJ6F9oq
         lOFJilIFITybu5XFBjz0t1/pZviXUM3BWh0/xYq7PP4c9r3EpmA1ExyQt9lJKuL0hr1A
         suNmUyeftMM6Ty/A350YutJaGrOzKuimt7UELjm4ExL1bOdShZZOtlRvELtuFAqukwRH
         pPUKGQjk4x6bp6Nom5SQHaDsITulJJLGbO98Lr4us/dLxQDs8BHeyRo6ipww8dE2y4gN
         YTZw==
X-Gm-Message-State: AOAM5310mjJp3VwVVUHp6pPZytFIalpfqFIGk0OQNHnsDYS5+Ra9Gh+H
	SWshL6e4dFq0Fywpl9VmRzVSLWHx++4=
X-Google-Smtp-Source: ABdhPJzoWkCb/9TYlla2kMymGk+9GYYkgemCz+XWS5dX/YcOPiWwTQxQC+q6UFTv3emR0KWBaJoo9w==
X-Received: by 2002:a9d:7113:: with SMTP id n19mr10971555otj.286.1617934876948;
        Thu, 08 Apr 2021 19:21:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 27/36] opencv: Upgrade to 5.4.2
Date: Thu,  8 Apr 2021 19:20:40 -0700
Message-Id: <99be74540ebede443549fa16ff624bdea50bb6d2.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Drop patch which is already in 5.4.2 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ae4dd366014a87e7a196f5b2e168666cdda5a43f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...building-opencv-using-gcc-11.x-19244.patch | 28 -------------------
 .../{opencv_4.5.1.bb => opencv_4.5.2.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.5.1.bb => opencv_4.5.2.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch b/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
deleted file mode 100644
index ce6499bfce5..00000000000
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
index d87e140ba7d..553fb4e08a2 100644
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
2.17.1

