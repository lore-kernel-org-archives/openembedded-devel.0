Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F996D1038A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 08:06:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8812.1764144367245022561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 00:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kvy1chNe;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3707315f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 00:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764144366; x=1764749166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RC6r4HtglYqPD6Lrx18Fr4zWNSzfikcESaxl+lULE6M=;
        b=Kvy1chNetQKdWdfNmCN/OqGi6p/IbpHr8PFRrlBAM9EP4SURIf8fLlrrXlbGX8Z7GT
         3IuJiK4wPlx8zY8+J6IYlSvxjGNx4vywHfz/IAwqHIxfWEaBn9gb37ZTgUDuFtCzTt+x
         I/8Eu8aijqvgAUoqGzo1FCwuVP3kpa2Hco01/8FOa3/bByB3eLF3pKNR4NlaK4ozsZX1
         vg0hhIHFx7XF8L/rJdUtiDJMDvkj2l9UwnSkwODPbg8ERBfXc8ml/wzi0jRhLvFw0TE6
         Wlb5ntC5f/NjX0FkdF4K3AkL1GzNhpLVU2hFC9nY15u1+zR89aWLUDa4ZpzPCLWSGScF
         qBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764144366; x=1764749166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RC6r4HtglYqPD6Lrx18Fr4zWNSzfikcESaxl+lULE6M=;
        b=uqzC0rrBAn3LENjUtU1pOEeJ4FP5hzqlVlRc3GZfk9o8E0Nr9gadr8AsBZgHWcRohn
         YWzFdO6UjKQIz53Ff3yDkBpweJQ9ohuRW5tBEcDaDXEOIMl1OWu0S5EP9rHMACG0Q6DF
         NZ+m3+qdK2PL8myvPrvh8H0pRys9IrvJGaX4c9Aowmzd6CMpmNWuHGE4Vp8m7KWQFNWc
         F2p6fyoSx06KzqeGCyp6d3o9Xl+p3aemWod2SC7u4kCCSVqzMxLDLIuNchWu3pK3WnC9
         EDADDk+qiBTg6IRrBl8+CpKwoWkzTM2oBdMEiRE2wQHqKT/IsrQJJlOANWjiytnayavy
         juFA==
X-Gm-Message-State: AOJu0YwKS+/Cskjk2WarRUx0F6xneSrwRe4wh02pIqOuAuYLs0xTwgEL
	XNngY/Q0378b7RULi194O6S7d4ej27hDUelMWZ5kNJUIe9rSlEvD7Vim9PMuOQ==
X-Gm-Gg: ASbGnct2qtfmPDX80CNFO1ZLwyKol4R7nWpFKZP5v2yGRUcp9DakpZNgXqcB4xTx5t2
	sTHMvDJE1hB7/cZKW5AAEbQynhxDNmnaxu4xKh2S/df+7oRhMSMKctJePSKyXtgqREnEPtIHQ8L
	Rha76zDIidQRCkCGJNFl6AwpoCmCQSmAOqvIsNNiRAcLyiXeFwdDJhL99F8AwTevWoa83JzdHbB
	UZGx+2OcmzOtQ+mB6hzimSMgdycz48+4bvKFYMPXA8FMwGBT8uC8Oyvq6ijZyABg1KKh2VpQbhR
	T8NYozuevzXnBe8oGvqdjt399JQN6jaVoJxEDGc3bH6EBE+3l2833P9QqLkMwrGTh5jHaXXq1xc
	EcF7kh8pNCmOwfZ9M75pKDBUPamnPgA2pvztDz+MVsMXKq47HKOzVf4pUhWI5arfAyEuOzcQM+J
	5Ee5KC9rG3
X-Google-Smtp-Source: AGHT+IECx1rFySxMEeBSQ+12JJsMBVuM1r0oObXYSnkm2wJH2TAobj5k3ZIGe5juguSKNNxLlz2Syw==
X-Received: by 2002:a5d:588b:0:b0:42b:3806:2bb5 with SMTP id ffacd0b85a97d-42cc1abe1fbmr21288559f8f.12.1764144365542;
        Wed, 26 Nov 2025 00:06:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fe8sm38909974f8f.15.2025.11.26.00.06.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:06:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xorgxrdp: upgrade 0.9.19 -> 0.10.4
Date: Wed, 26 Nov 2025 09:06:04 +0100
Message-ID: <20251126080604.70046-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 08:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122074

Changelog:
0.10.4: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.4
0.10.3: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.3
0.10.2: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.2
0.10.1: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.1
0.10.0: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{xorgxrdp_0.9.19.bb => xorgxrdp_0.10.4.bb}     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.9.19.bb => xorgxrdp_0.10.4.bb} (61%)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
similarity index 61%
rename from meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
rename to meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
index 533b0801cb..48e4fdc9ea 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
@@ -10,14 +10,18 @@ DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
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
+    ${libdir}/xorg/modules/input/xrdpmouse_drv.a \
+    ${libdir}/xorg/modules/input/xrdpkeyb_drv.a \
+    "
 
 require recipes-graphics/xorg-xserver/xserver-abi.inc
 

