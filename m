Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11969.1794070362246514102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mGiJU98n;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so14825315e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070360; x=1794675160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVOP8fo9eBuhsOmPgqa1dh0kS65TadwiF3rIGGBYA7M=;
        b=mGiJU98n1aHBbJmrFAlzZGIz5Sgx6uGT0/bCp2YHc42yhxPd86YTKYp+cJdOAt5kJK
         Fr3i/AiEHkXpWN1sRXb5lf+uKIfGDcgbNhcbf2UpzEbWed6M2kWwo+mbHafCTCCU9yjj
         C0lgEQapgjBlBAHXXcGu19sFuw4JYOsD6iT50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070360; x=1794675160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVOP8fo9eBuhsOmPgqa1dh0kS65TadwiF3rIGGBYA7M=;
        b=Q3pw8e2k7My3SycK4DmgF2g0QbybnaOqRgCrURS+AF5q9wNl04tb0WXZY8IG6glaux
         Pq1FClpyotqmHAaDtXHe6mkqd+Lq2vpdGGQ5EuzfHYV1hx9oQ6KPDQodr6irAO7NAeOD
         uv29LwYZct8Ul6xXhntlojsDk56lb14ocU5ttHdqt6coGNobJgbp6HVtZRR9FTOV2lhc
         lMOYTBv+sT2e+iQY9ZQR5FWaFzTTBJs7+ii51AJk6oOOHjyakhVRamlW+0FFXaW3c5Rv
         k7XyDJkbhjkuDvvvngCguf0u1jhrNjU+uVrSbFCHhN0AeDPB3qYQ00RAJRszeSWQKjz1
         nqaQ==
X-Gm-Message-State: APuU4Z8vHGCLMyZb4p6RZQduENN3hfjzJBsmyWoGsrgl5LfSzgUBzPaw
	DOzuNop6DibLjakElQBNdtP8ct7RvPJtpzqNrCCLxfPPGq5GDHj9Y4QJrnaJIpLYIA2rHf5JXHq
	jiiqn
X-Gm-Gg: AYBFou39zk1BvOg9uy5Pl6NZOfT7ztqosMmKkOmwiPRrhH+o3pR83UwrrfzGaivg5oF
	RdIs+rSv+SnIMQOTtEjALwrSSpR6l1EUaXaZfPSSQAbTq5CHS6K4sehjTT7z/MFdgJkiDtS6SX8
	gr8qrxsKMMKFUsZOXMF94RhUPxPEwHBG13VoCwj/+y9j4+2OvYoUoOEwFljXGAa60RaXuuOrE6W
	ho3ylpz1Mbb27CY+pcoUiUQlUwjelz+Rpj+gsZRf8B0OsZ+47P5ozZQDe1ko6BRQg7xdqoeB2B5
	vOyD95rsLnwtIl9wA3sLbUqUG5X7rCr+xucUsdkL3/+gvhH70nzMHzbKR8IKLrFPPzhr1Dc8xtE
	Ld5clEnVK+94jn2VG5rgYTljGGYMjtQtO2lFDEmXmfr/e7Hzmsx485zJg/HC8SUmSrAtHe/ogkT
	LoPtaXmW1DPg3GNNg/rGkZSABQQt0UCNODEvfq+YHJscmLOJzK9Bj6W3D8ow6qD05iIVRJqv4ZJ
	PNPnxE0OHXxwoUFcA+Qi0KF1I83FThja0+KR1GEJYR9tnETiW7G37x3mYZHGbu5DycBg6MsqV1E
	oMe6kuBBLZOLYPF6QHigmyeEyrMM9MjtS3lg/9gJjFViave+KoISHYVi6VNdYb3DHehjg77SiY6
	P8AlIOrFjiqBiCarPORPcbtOUDvAOIg2FQoIaQhU+ORZr29CyB4K3lw==
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr85750045e9.13.1794070360540;
        Sat, 07 Nov 2026 08:52:40 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 17/22] libsdl3: Upgrade 3.4.14 -> 3.4.20
Date: Sat,  7 Nov 2026 18:52:16 +0200
Message-ID: <20261107165221.122340-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132002
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.4.20:

- Fixed mouse wheel direction in mouse relative mode on Windows
- Improved Wayland clipboard handling
- Fixed color cursor alpha mask on X11
- Fixed a crash when Vulkan texture memory binding fails
- Fixed transparent windows using the Vulkan renderer
- Improved handling of Nintendo Switch controller calibration
- Fixed Nintendo Switch controllers failing because of missing
  stick and IMU calibration
- Fixed reports stopping on the Flydigi Vader 5 Pro while the
  Flydigi Space Station service is running
- Added support for rumble and trigger rumble on the Flydigi Vader
  5 Pro
- Added support for the 8BitDo Ultimate 2C Wireless controller via
  HIDAPI
- Fixed a crash recording float audio on Android 10
- Improved relative mouse mode handling on Android
- Fixed window orientation on iOS 27
- Fixed keyboard focus when using the latest Xcode on iOS

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch | 4 ++--
 .../libsdl3/{libsdl3_3.4.14.bb => libsdl3_3.4.20.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.14.bb => libsdl3_3.4.20.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch b/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch
index e6d372c4c0..823c4d37a5 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch
@@ -1,4 +1,4 @@
-From c8a74ad998879e52badd09e9e52477c8e87d0e5d Mon Sep 17 00:00:00 2001
+From 6f1bd0a468f5c7b49dd63125aacd8af2dd8fd8da Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 31 Jul 2026 02:25:45 -0700
 Subject: [PATCH] cmake: Pass _GNU_SOURCE via CMAKE_REQUIRED_DEFINITIONS too
@@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 93a99bc..e37858d 100644
+index f7c1528..4381326 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -122,6 +122,11 @@ set(SDL_CHECK_REQUIRED_LINK_OPTIONS "" CACHE STRING "Extra link options (for CMA
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.14.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.20.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.14.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.20.bb
index e03ac974a5..d496b18f32 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.14.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.20.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz \
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "30d4aa2b3037718142b32dffd4e72f917ebb6cc5227150e7bb9c45efb2153aeb"
+SRC_URI[sha256sum] = "f3bb06f55bed9557227a700af2ea62e49497ebdf58037732a731a5fb3ef8581f"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.47.3

