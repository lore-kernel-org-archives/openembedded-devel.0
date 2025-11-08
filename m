Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6991FCCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 15:08:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7234.1762614517048760337
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 07:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aoDIfciU;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4777707a7c2so1581265e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 07:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762614515; x=1763219315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBTqtH5WqKgxrYscMeuNWocm99dMxAtm5YZMdQEdRbs=;
        b=aoDIfciUFuVhSeUl1ucoG0NKsxNcsR/+NlP9YBI9U1R6S6RG8T0rAwuM6Hl8I43OZE
         sNa6TCdghGk6O5rvSQpR/ACnDZZg2EPQiOVYYzFEudP9e5Btp8iLIF9tTDk922RLAFiZ
         916eaVv2nqMk8jNdD23JmjfEW9ptEK6cS0hFL98EE4dm8m63AnLQXd2TrRk3DQajTpoJ
         FxjEnxCtUxJAs1JJlUMsZOAYI1DdqCtCZU9BXf30deaD6FPEAgG7OclFTRPZcMSi8uUd
         MSmg9zIOpyE19vbdwSlMe8F/9CZI7dCuP6qu3JBn9Ysxxdx+MAr7PH9bD2uD3SLbdb4m
         C4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762614515; x=1763219315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dBTqtH5WqKgxrYscMeuNWocm99dMxAtm5YZMdQEdRbs=;
        b=nQklv/yt4rba0WM9FMhrbwTIxbwhnuLhEMCdTVz9EMZ62gjLOfHBv1BPLG1U8sHCAB
         iC9sKKpTg9mHUXgAne/AtmxZ4do7AtA5cuQ8MyuoGbQA5LXpixb6nHSTcBpMtlKochGe
         4eJQnOahPiBqO3pzkPj4MoSq3t8mOYLOuRqx/pqsHGRhm6WrO8NNBPe3pMspJpZr5jRX
         JkM9Jyp3rFMN10tzarcesmf/ntHC8zf1x0t+V/9W1J35Y9Z2a6r65P7J1fXRO1C/7z/m
         DTXGO9VxeVbWo0jP/a26FTvWWQ4yf9AKqKO+L+8bsyoY6GU8X97VWhDS7GEVKHxepxLS
         ygYg==
X-Gm-Message-State: AOJu0YxreWniRDdGRaHfVPe49rqH6AUSB5ybvr0YI4ZPXV1Om30q/PmL
	AtZan2SOHA+RudY1yOF5O+q9A7kjxiVzphNsALfYpYNPuBusXmAPHtiS7i/X4nIE
X-Gm-Gg: ASbGncugMfLITw7Wtq+hazOJC530+xnBlPDZaJb7nxCymoZr0sTZBv42wjlafdPRqrG
	VgZNHUsvI48HYBLpxQqy6x1uPuqmHncGHwRqJ8DDbYNZwJQ0rN5TLYe6jfpCiW8uKglie6DhNqa
	oVCKkS378Is4/pP8GOhh5VsDIrongX/+AI7uNbxQWbncJ7y+rWrv9zr2qDUXCu/lWAkLaHjKlqY
	6qgua2sWHtjCSxwu2GJXort5VsZvK5NagK7ctK7whJUhQQ4zhnflQnpkSQOKs0opOYxXUElxYR1
	KX8uCmYHtG5kgXZqY5yg2dNI9Z2qP333F6E7J5T1HNOy6fcPYIJksXm8sjyzzDNp0yhQOpEdlSX
	Wg1zM5D2P0W6E9jmr2D1t4LPe5eQmVDCtfSRKzVbcLmsXoBPT7Ui2k8Urfy/rKUuFeyn1vNAQo5
	1i6vnMiZyu
X-Google-Smtp-Source: AGHT+IElZTGDW9RG6GRDeOYtVdOdAFMHXB9hS0jwj6hl6CTFAd9EBQJWcYTJ0FP5sS9ogNZabJ8j+w==
X-Received: by 2002:a05:6000:210e:b0:429:cc39:99c0 with SMTP id ffacd0b85a97d-42b2c64e495mr2591349f8f.1.1762614515214;
        Sat, 08 Nov 2025 07:08:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm11869284f8f.19.2025.11.08.07.08.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 07:08:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] libvdpau: fix SRC_URI
Date: Sat,  8 Nov 2025 16:08:30 +0100
Message-ID: <20251108150833.3299165-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108150833.3299165-1-skandigraun@gmail.com>
References: <20251108150833.3299165-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 15:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121395

The old repository was moved to a new freedesktop gitlab instance.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
index 3ba561a54e..6449b90e8e 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 DEPENDS = "virtual/libx11 libxext xorgproto"
 
 SRCREV = "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
-SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/vdpau/libvdpau.git;branch=master;protocol=https;tag=${PV}"
 
 
 inherit features_check meson pkgconfig

