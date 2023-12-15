Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5C5C46CA2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:53:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.58189.1702626778512895079
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ynw0lfWn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c317723a8so4422695e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626777; x=1703231577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRUWc4JfrCIM6FH+2oiQ8B44XDW43rluhvX2QnZyObY=;
        b=Ynw0lfWnyQrlWiMIWqevXhK4opUW1FTcZL3APNnuHm7VQgv2c+jZuDzYpRn2oTW+kW
         yU8qy0++d9e0gSjEOJA/pCyKUuWXFjwdGfjODioVf4Nr0tQhrDQCZvctOstAEZocwZRB
         9bqp7BrbBL3QBMtHmuL7hIGFeSqI75+GICPee3VMjVAVpFfREn3LxBer51RTNgQWELaz
         KCvE0nVPEWEJ4ynIaagYwP+WhWh+vIpxnizpX/ld5wKRCLbxC63vOkowf3V7nHSVu8kF
         /lXgG5+27mEws6mQAhUskDwMEPR3Q/VqQpH7woqCTZESuAxx/MNxaC1B2Y+Q4Or2LiA7
         umbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626777; x=1703231577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRUWc4JfrCIM6FH+2oiQ8B44XDW43rluhvX2QnZyObY=;
        b=Uxrej8NIT6XRElObnbwMBnd59Zj7o6yIic50tz04OsUFlnEkwbg62wvV/fiHPQ1OTU
         lL19eylErGEfKvXXslpnoFRPqaiPC+3iclE1nuhIwlX/SdYG1ElLGb59/IhTaMQ2CxlM
         +5kHDntSqHVzRm5VdyKNhACEbiiDH6VVfZ21UxmqdVGPIm4Fb3Azk60Xb3z/Aiy7/XSq
         cG8J9qcMiaKXQK5TpeqDPeTAtuaiwPE10dpQyiIT3czTjhXaXdaMK+BME1qHZ3ZeWeEu
         VlEVYX20tptEXPIev83LTbR86rFX3dBV8ZMtCKqrldjt32pFp5N6h+DU10OsxiXL+3aM
         uULA==
X-Gm-Message-State: AOJu0YwSoHcJoeYkaNojq3JfXdhTOaGJ3/M/GR87cyWZtnr28UmH2yCL
	Z06iBi1bdR/o16zfn7ktjFFsStV+qZQ=
X-Google-Smtp-Source: AGHT+IF+InjT7iT/bgAPnSdEEuHauK8BpS5TuXcWiiSZ8fW8+4qmZlXdM2SlZS5KIT8RqWj2oR6yaQ==
X-Received: by 2002:a05:600c:1c05:b0:40c:3856:5e07 with SMTP id j5-20020a05600c1c0500b0040c38565e07mr5750434wms.9.1702626776980;
        Thu, 14 Dec 2023 23:52:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/20] libcamera: skip until upstream resolves python 3.12 compatibility
Date: Fri, 15 Dec 2023 08:52:38 +0100
Message-Id: <20231215075239.3049865-19-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107512

I'd note that imp module has been deprecated for years, so that's what
happens when deprecation warnings are ignored.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb | 1 +
 .../packagegroups/packagegroup-meta-multimedia.bb               | 1 -
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb   | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
index 2a3c6473e..9c04d7434 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
@@ -73,3 +73,4 @@ FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
 # both 32 and 64 bit file APIs.
 GLIBC_64BIT_TIME_FLAGS = ""
 
+SKIP_RECIPE[libcamera] ?= "Not compatible with python 3.12, see https://bugs.libcamera.org/show_bug.cgi?id=206"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 672c8abc9..6ca4d539f 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -42,7 +42,6 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     tearsofsteel-1080p \
     pipewire \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
-    libcamera \
     vorbis-tools \
     libopenmpt \
     mimic \
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
index b4da781f0..4d894349a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
@@ -86,7 +86,7 @@ PACKAGECONFIG:class-target ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readline \
+    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling readline \
 "
 
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
-- 
2.39.2


