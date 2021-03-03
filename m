Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.2560.1614745016467866339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 20:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GP1D5mZQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o38so15362269pgm.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 20:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5hjwP+0ZdtnqjUW0beaW/lyE/Fc1eUiOgJlSGzdktQk=;
        b=GP1D5mZQK6xbzNOQhIOUK3NmlwMszRZmzhdB/DEpIf+bEJzUGOgryIIAUJxtJ9dC3r
         NgU/KSg/Nha410a6WlwKt1jhszRxrOhM7bjRBbosKXH9dCSdHdJJgNlW9fE7flaRJ5H+
         6bC1RNmDMmunxlIi0kLqI+hoK4RJIK5ktH1bbhQLfHGYM/AAEHj9KcuQULOfaUOcWglF
         9pLxf3r7CYSPCjlXYs3PpHQD/2fvvnjnV1ggCQtgdV27X16Pu29bOPJtYVoXfZAQu9Rv
         vrIsIVRM5gb+hpzE88t5llAOs7icpmiFAl9QPfs+GSQcMIh+6Efh6q/fjQWj1Kd0axDZ
         0+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5hjwP+0ZdtnqjUW0beaW/lyE/Fc1eUiOgJlSGzdktQk=;
        b=is0jhmNoG857xwXnmejIFPcTOuLH9H8zbvsaUTt8DZXDSymZF8Gra29OE2wp9mNh/i
         4+OGcE8mh4oO4na9/paEnL9kWwBRpYgYHm8mkkk8N37AIGrwtXL07KDTxAvYWPKINf98
         3KdguP+09DDgB4g+9QYnWu9gDNiKkyGuS6bJMTa4ZZYo6Kb8WnNMw4NumGj/c5cP1b5X
         5l4GrNytHIYyf/lV0P1fk6H+9zaA1L00FP09A7AAFUDYIliNA+kKRgUD7/+SDSKgq9HV
         NA17yZeFAanueEdpCjUxy63EeLBAEwdzn8HrcMYEk8KqOa5Lajbi4/heA2qZLURHHVpa
         cH9w==
X-Gm-Message-State: AOAM531B88+/DhE01T0CfiN0Wd2Y0CsG6rfBrr0Bhf6deUo4JazaEHwq
	vWerVNNBODMGWG3nCVXwrZ1pTQLpAjNJ+Q==
X-Google-Smtp-Source: ABdhPJx+t8VKtyiivk9EJnQn00SJ85udWYKc4DAysUlshHb6bIcDL/bj0bQeU0v3cRZ6ITH8BsZrdQ==
X-Received: by 2002:aa7:804b:0:b029:1ee:5df8:f414 with SMTP id y11-20020aa7804b0000b02901ee5df8f414mr17512145pfm.33.1614745015702;
        Tue, 02 Mar 2021 20:16:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id m9sm4824631pjl.4.2021.03.02.20.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 20:16:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 4/4] opencv: Upgrade to 4.5.1
Date: Tue,  2 Mar 2021 20:16:50 -0800
Message-Id: <20210303041650.2457462-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303041650.2457462-1-raj.khem@gmail.com>
References: <20210303041650.2457462-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...gits-needs-opencv_dnn-module-to-buil.patch | 28 -------------------
 .../{opencv_4.5.0.bb => opencv_4.5.1.bb}      |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.5.0.bb => opencv_4.5.1.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch b/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
deleted file mode 100644
index 022680331a..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 114af1ca23ff9bf2e521b2969e343e74cdd8eac1 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 1 Nov 2020 12:29:56 +0000
-Subject: [PATCH] samples: cmake: digits needs opencv_dnn module to build
-
-Intrudeced in commit 397ba2d9aafb5312e777ce2f886d7b568109e931:
-add OpenCV sample for digit and text recongnition, and provide multiple OCR models.
-https://github.com/opencv/opencv/commit/397ba2d9aafb5312e777ce2f886d7b568109e931
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/commit/79a82013ad2af04269891ce15281c9fdc31d3f66]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- samples/cpp/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/samples/cpp/CMakeLists.txt b/samples/cpp/CMakeLists.txt
-index 617629df2e..14ab6141df 100644
---- a/samples/cpp/CMakeLists.txt
-+++ b/samples/cpp/CMakeLists.txt
-@@ -14,6 +14,7 @@ set(OPENCV_CPP_SAMPLES_REQUIRED_DEPS
-   opencv_features2d
-   opencv_calib3d
-   opencv_stitching
-+  opencv_dnn
-   ${OPENCV_MODULES_PUBLIC}
-   ${OpenCV_LIB_COMPONENTS})
- ocv_check_dependencies(${OPENCV_CPP_SAMPLES_REQUIRED_DEPS})
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.0.bb b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.5.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.5.1.bb
index 5263ffc03b..116cc27f5d 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "d5fd2f0155ffad366f9ac912dfd6d189a7a6a98e"
+SRCREV_opencv = "1363496c1106606684d40447f5d1149b2c66a9f8"
 SRCREV_contrib = "37315babf9984a5b6aa981644a20dd8df1a5ff02"
 SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
@@ -49,7 +49,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch \
            "
 SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.30.1

