Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F58CC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:49:04 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.4704.1708483741241666192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFURpuG/;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso5861436276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 18:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483740; x=1709088540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/o/zBEVQROZuhoHX0F+L8bNtgbtKWkxGC7ICgejAzM=;
        b=KFURpuG/Vtgo7bG3wD53NRYJIjjgDcEDnY23KHg5kX7Gj8CYHJvtHbSNIDDgyUJJeX
         5xH10jwRoOVUu36kNxa5nBI3MDF/ow1zNsn7IIBd/E+4gblBWe/rtt1hhfWUZA6CiVaH
         qDaIw1C7twDk3OcbQ0IBP66qYMk4Bqc/fzRyzdeaSQqISWOXNlBwu413aX+6SPMxtU8B
         oISYnWcHeOaIoLd1vPxqsa5lypTf7TPqn5Lg1DXFVlwqxX1OVlBTs9GMAv4QCJoB/38+
         97gV6i/BCeUarlLUXtXzizT7Gzb0XOwE41uk2NYw8fF2+5U2TyvxZOzK3TsZpIHEHy6+
         3aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483740; x=1709088540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/o/zBEVQROZuhoHX0F+L8bNtgbtKWkxGC7ICgejAzM=;
        b=GMOtNtT9hLaUqkEO6Z+fLe8kjnBmUBxsnwH7FgpBBaXun7JOlIgE/WAYf+vbLbrEvf
         cGOf1kiYrsUiRBwgZrLA9jmbaOGpoSKn4b7Z8tfAR08CLBRlCA5d3JZ1G0kYZb3DpJSD
         clWz34DrwanyHpqto87XDJXhOiX2Ur6uXNRKcEYobPj0q2lucAPwAgK5QjCq0r2jH2Z4
         YSdSu2R0zZbDDbDWPHsVYh7MZ3lFoot5gTTkvTt3+/QSP6/HNMiwIQB5ioKc5PPwG8L7
         FfmrasZ2QgFHFJTT6avYqFnzC6Adat15dMjc7+I6gdM1tFLhicVdFM7rejBrOdXKf62C
         odXQ==
X-Gm-Message-State: AOJu0YzpyoEYJLApS0HM1KZrOGbeusmbH8+LLifgQ09F3NSSq+eSZ+Aa
	u2a3O0OTb+F4OcOjsHEa7InhgyHqVT42ssyv187yt3gM0xKz+cvtFTeuv4A3VbY=
X-Google-Smtp-Source: AGHT+IGjKNMaZdZi/zFMH7/pXfXFyArXKPCNZOgFuwOd8W0c16dlHPqM6iSfz6fBRssAEEK2StV6Hg==
X-Received: by 2002:a25:b287:0:b0:dcb:d0cb:651e with SMTP id k7-20020a25b287000000b00dcbd0cb651emr13938315ybj.28.1708483740089;
        Tue, 20 Feb 2024 18:49:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::696f])
        by smtp.gmail.com with ESMTPSA id a30-20020aa78e9e000000b006e45fc20539sm5051945pfr.123.2024.02.20.18.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:48:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Replace VLAs with alloca
Date: Tue, 20 Feb 2024 18:48:57 -0800
Message-ID: <20240221024857.1489960-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 02:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108955

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ca-instead-of-variable-length-arrays.patch | 34 +++++++++++++++++++
 .../libcamera/libcamera_0.2.0.bb              |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
new file mode 100644
index 0000000000..a6526d5903
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
@@ -0,0 +1,34 @@
+From 7982e55ce3a8b3c60a47258ff7d37d0dd78c303d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Feb 2024 18:44:23 -0800
+Subject: [PATCH] rpi: Use alloca instead of variable length arrays
+
+Clang-18+ diagnoses this as error
+
+| ../git/src/ipa/rpi/controller/rpi/alsc.cpp:499:10: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]     |   499 |         int xLo[X], xHi[X];
+|       |                 ^
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040529.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ipa/rpi/controller/rpi/alsc.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp b/src/ipa/rpi/controller/rpi/alsc.cpp
+index 8a205c60..8c0ae8eb 100644
+--- a/src/ipa/rpi/controller/rpi/alsc.cpp
++++ b/src/ipa/rpi/controller/rpi/alsc.cpp
+@@ -496,8 +496,8 @@ void resampleCalTable(const Array2D<double> &calTableIn,
+ 	 * Precalculate and cache the x sampling locations and phases to save
+ 	 * recomputing them on every row.
+ 	 */
+-	int xLo[X], xHi[X];
+-	double xf[X];
++	int *xLo = (int*)alloca(X), *xHi = (int*)alloca(X);
++	double *xf = (double*)alloca(X);
+ 	double scaleX = cameraMode.sensorWidth /
+ 			(cameraMode.width * cameraMode.scaleX);
+ 	double xOff = cameraMode.cropX / (double)cameraMode.sensorWidth;
+-- 
+2.43.2
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
index 5b2e863369..b96e69eeb4 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
         file://0002-options-Replace-use-of-VLAs-in-C.patch \
+        file://0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch \
 "
 
 SRCREV = "89227a428a82e724548399d35c98ea89566f9045"
-- 
2.43.2


