Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAD7E7AD44
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 16:35:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.140417.1766680515957521614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 08:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VtpCEmTZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so68456875e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766680514; x=1767285314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7eKHwBqEMyMrJBj55k2KA4EnqIS5CRxmqKosV1CBt0=;
        b=VtpCEmTZ68sOQfIcSZwqi/17PA8UUq0Iq98sVMNeJnFcNzvZxna+e1dwhYaUH/OCup
         5RNmWu5JsrdACFtIV7WBilIP3XSDlVoYug62mb86/ZDej/g9fxreb1FNPnpLg2MVq5vq
         N8T7+ZVv6olOE4yVMp3oSCJo9+Xo97rilRtiNtPMnRsGEQmwXpvqgqzbTlb8PL41fvdE
         2EtTjb6Wy941QeAz6mxrFtUn1MsJKTUGVvyqqaS7YiMjJXlsqBiIlCpxKyzYbhAUqZZd
         KIki24iQUJH1g2fdq7wJz2ruuVqmhpZOc6pcMnNyVY2HJVbVsEZlYOCuYd/u7Lnmv6rL
         ujFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766680514; x=1767285314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7eKHwBqEMyMrJBj55k2KA4EnqIS5CRxmqKosV1CBt0=;
        b=kUBnqZlnBGi+EcKrFI/F+E40kzyDyhpF0qfzL4HFbDReV3Sng2iUlgYmddG/I+5V/r
         /jIarepCK1SIQyqm7RIeoBzSEMRj71KwYW/UIEcB040P84ezSBaZyRX62whRjggjqdQn
         aZU8oM6xVkUJdhmdseLzJm/CwSuME2CNZQOteJoOtoSwA2y5xHcFX+e3DdQ8j2XhevhS
         mdXUkg+aj4xYVwKL+66KzcvVmquVvWmfwDqf1ZIvTDA2eFN+03UFvZq32+0yKHdL+QIQ
         7hhy9lAA6lpvt/zvU5NSDR6zxqH6lIc06dYheHivUCvUv+eRHtvJhqn6UWHnnYdon1tV
         YMhw==
X-Gm-Message-State: AOJu0Yy5kDtYIa4KmI9vU6qP1t3gxX3qrZlZzbaNWcfAntaAz9gBMXEv
	7OpEyLlyzACYK7bJSpjQSvzgIYL/t9weTPjL4opjVQ3GkRdtxgErGRJlKWOyKA==
X-Gm-Gg: AY/fxX7rGRxPYbqsQIRsjt3RSbHcwbzpvp7mdyNBZ9yZTUZq91/kwDtjqikWnAooF3W
	SVjj0b3U0B2TxLvnH4shiFtKTZwjopKehhZFuerJtkclIzgwpUqyHVrSEcom2Zs4Vj6MAjaxljs
	SVM0de+nhF+vrnf+hphKeXwPx87z0gCcef0vY0LBc25yctIHlANYuTRyx/tTiO1hRgWbt+bQRc2
	Nwjn3ZQToZfzj1/U6ZtIN9HjPwANUqoQjfXcf/HkbBzsyczfC4kgShYIl7HHCs9z5aWHUj8P3Y2
	QZQQrtdWHNK5A39Le71I3RgIYhoNVsW+QT4uter3+GxSeDfU62bgMcboQdSuvIv1/JufxvCjc2G
	7M4gmFNX/tZEprglVtg5XRZyBaJ33YodiKknavskSvkyBMPWyHcGtfterySLJa8gHzkbgiTT/VK
	flrbmZu5zl
X-Google-Smtp-Source: AGHT+IFy+R63IbWt42Q6JOsvbdkOBXOhtqIXa9oUrg83ayDDRZUA3oGIKYym2+nQ1L8Dw8EeV1iZgA==
X-Received: by 2002:a05:600c:c0d5:b0:47b:da85:b9ee with SMTP id 5b1f17b1804b1-47d1c038cf9mr193827625e9.31.1766680513973;
        Thu, 25 Dec 2025 08:35:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm393937625e9.15.2025.12.25.08.35.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 08:35:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] tigervnc: sync xserver code with oe-core
Date: Thu, 25 Dec 2025 17:35:08 +0100
Message-ID: <20251225163511.3087783-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 16:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122927

TigerVNC compiles its own xserver. Synchronize the xserver version
with oe-core.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 53832939e1..0adaf70b98 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.15-branch;protocol=ht
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.16"
+XORG_PV ?= "21.1.18"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[xorg.sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.

