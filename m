Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D808D10399
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 08:58:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9254.1764147506617925146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 00:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N/8C7CN0;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so286804f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 00:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764147505; x=1764752305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2zqDwzKe83W4LMqVaFoK0FDctbjFnxr2O/CITDJ0mo=;
        b=N/8C7CN04zy+vLbWtWg+6fYyoWb16mkmYDi0QbTtpFP4kYSE/xCBoJFzDtCiSPmIoh
         a83jHyma/G3T//FMwVcygaD8b6Eg/9UKXQnsnNMCdHxsKNJW+2MyDJGMoq18RAll23uF
         azVy2UMuo786V3gQ9ezDPkDvW+HCKI9Kw+oShGQ57WEQAlf3sWBpen7JQwffBJkYgCHf
         xxCifUAf4UIFU+hQyPXbSMdQooAOoqveOS2uXag6olmSoI/t3myM+tWcRJ+T7dEzsIUC
         NrnBi2HMk1y6kMk/zoYelX29rcJQ280XRoPkWsuM4VKDCkSUjp1SchRKkH4A0uaVyLed
         EFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147505; x=1764752305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2zqDwzKe83W4LMqVaFoK0FDctbjFnxr2O/CITDJ0mo=;
        b=SRTRQudDVTbL2i4+eB/T+k+oMFg2sZQxROENsUZHGtkIAe4St8CWZhvmuYsz981V8v
         zNW6kPd6s8sBXW4qkqEkNO+1RrCn/VwpdH/IDXtKHz7etGl8DJoeFpJdyeIR3fM5dgr9
         aWIwX8KNodsGLmFacVK9bqKmicZEBIi2UvKkwImL8SukXz/jOYOy22sMql8dfpp+/Hyc
         h5Zz9FC7bePibJRVLT3Je81J7wvfLwBDvMFCLhNBv59WDuen6I//e4jlFjvwGRa/yznZ
         zO38mpFjFay/eYBIsW9lZn1lYb2jBIvrDmBEmI9dAovojmfN6yaeRWymrqc7H8hzvayK
         yqvg==
X-Gm-Message-State: AOJu0YwUB0wN5FFYiiLVkkb5IPY2JM6KjRTC0kvQ+3Ik1R/I/geC3RZE
	PDIzXL3w8LdStfkMUoKEn7IUlyctrbDT0UaBvs82Cgbf4KFaVBPvghr4pXXo3g==
X-Gm-Gg: ASbGncv9vMY6Q0n0MFoWaDdFakiXq3d3rQqo/TWn1GzQZZbaqt0/uBjWUQ8JCJn9Nht
	on6504HsLimSZLQq5Fa5B0L29DMPlZD3dZ68/3iWzUwUF2r6gedvTLCVSBpyRYfZ2eAsY1XqVip
	r7DgvJt+p15h8ywwAln05mJF1f6CTqzI+/uOy7mWQmnUSodPLa3aFjztDyNRRH1XWCFq/Vi+2cO
	n8qlr+U49T085JuKWjJFislRBt5jLGeOVk7OTBL62we0dpVY2WfpKPqtcIf16awZ4XgR7ZiNb1J
	67EznyErTrHwAW66qgPZRbwF3eSSJrgRjW22wkwnbD0OrAAhLgA8sCAHWlo2EQQjpMDmXk+nJOA
	8c9NMFuLHl6W3B8C6rBuYIFpUsYico1OC16pdpoqWl07LoDxJX4bzvlfz/sPi/nJ5IjUOGlm4P9
	OHtaoRiSsH
X-Google-Smtp-Source: AGHT+IHH5wLrHMK76zXh6zIlbSVBso2Gpyz0lIzowpxkWTuogLI+Y/qkc44qeMTsCfJoiYT97D0h5w==
X-Received: by 2002:a05:6000:438a:b0:42b:3746:3b67 with SMTP id ffacd0b85a97d-42cba7c4d0dmr25844376f8f.25.1764147504883;
        Wed, 26 Nov 2025 00:58:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cbd764dbesm35919817f8f.27.2025.11.26.00.58.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:58:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] xorgxrdp: upgrade 0.9.19 -> 0.10.4
Date: Wed, 26 Nov 2025 09:58:23 +0100
Message-ID: <20251126085823.73442-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 08:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122076

Changelog:
0.10.4: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.4
0.10.3: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.3
0.10.2: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.2
0.10.1: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.1
0.10.0: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: removed duplicated entry from the staticdev package file list

 .../{xorgxrdp_0.9.19.bb => xorgxrdp_0.10.4.bb}      | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.9.19.bb => xorgxrdp_0.10.4.bb} (65%)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
similarity index 65%
rename from meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
rename to meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
index 533b0801cb..f111c4eed9 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
@@ -10,14 +10,17 @@ DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=v0.9;protocol=https"
-
-SRCREV = "d463bad9639c910fadc2f30dac473c7688b11cfc"
-
-PV = "0.9.19"
+SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=v0.10;protocol=https;tag=v${PV}"
 
+SRCREV = "2b1f913f4aa6b88d63d9ce9302c61cb0e39483f6"
 
 FILES:${PN} += "${libdir}/xorg/modules/*"
+FILES:${PN}-staticdev += " \
+    ${libdir}/xorg/modules/libxorgxrdp.a \
+    ${libdir}/xorg/modules/drivers/xrdpdev_drv.a \
+    ${libdir}/xorg/modules/input/xrdpmouse_drv.a \
+    ${libdir}/xorg/modules/input/xrdpkeyb_drv.a \
+    "
 
 require recipes-graphics/xorg-xserver/xserver-abi.inc
 

