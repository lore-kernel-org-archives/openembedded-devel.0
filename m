Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1286EE92730
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44446.1767019919740053466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iq0141wP;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4327555464cso1795540f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019918; x=1767624718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWBUaW6mmto1cO0+pwC/vjcXdnP8afje7128VOI+mWY=;
        b=Iq0141wPSX/oStivtYRwv65xSrjGGYng7Dtsp7K7fPnv++VmqUHpAAU+11g8Kzpyri
         h/AeMXs5Op8mhclWe0D3kWcFCNnzNymmMT4SwOBV9Ikl/Q3E4fzSExhQQJsvSyaF6RjF
         0y54OoWtsbXdXK87fSyYxcw6e8a3D65Zgclomuk2w6pcsL4e7Y5eO/UfbYwCh612LVBi
         DKthUSoEXv/vFu9KzdlpZf9GCnGtL2kMRHMXhs0rU74xomXq927dkM59kqivBzbRyai0
         rHEB03fNtYBF1nclKyAGyZAybxseO8FoNA6t8MCKAQQN90Qwd1SP5LtFx7gHhcwfrr6K
         /SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019918; x=1767624718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWBUaW6mmto1cO0+pwC/vjcXdnP8afje7128VOI+mWY=;
        b=mf0AoSENWEiMbfZd7OxK6MfdiBfHdj+55vzpPaZFN7+4ieq2XR7hki+vguIUdJOxio
         7z8B0wtkEWXuQVZpJ0RH6FRcdKm1ErwuQxYHU3aKuEFoabdiiUB0a6/CAxTRp02nkco4
         99R5V4hSU7MudzzY4K7+HYLNLte/hcmKNafr9gOzX64wRKYIXIosBU04JtdydArTPPDZ
         ZJteHDDegue9Xjj9czNKhT736EXxgcLgFT5pbmFcdKDKsbA+nM/UNYkxs5kae92Fl6vR
         Xxks0p8u3rmmIT9ZNNIlP8X8t0IS5kcHBeU2wpM25BMdbZeL4aHJKXeGxqsLT8/lr1Cc
         o6wQ==
X-Gm-Message-State: AOJu0YzjeNFQqUVNdy7bLTCSAMZRLrXBcwcm1dN8Os8qwgJITVS4/mIE
	63xmPawBtL5wbNxW19PRD+otUpOah5rB/Tn3jcxrDzdoz9f0WYLbldEUV8FTOg==
X-Gm-Gg: AY/fxX4EFoArcFNQDQzOvJtnbmS34Sb2wWw7fOElliIk8AiUfbqKEgmiIzsurGfoyFi
	BEFAvnDbNcDzKodSzFBjDQEYmirRQJajQ88kDObv+nWjbHKE+XLZZsGtgRSH1crtcPxj8Jv0L+z
	CcljveFqywSDiMZJx5klYdLeXNnRqNS8BoZKHobkaMytIvE+hY9/7kGRPeO+GGpYeLEfNzkYzmu
	vT7FpjYztdqU4YWmO09zKHxG80VtuyNsAfrpXeWM8aqH/VEX8OuVk/K43Rwa08GRemmuQ6XQSoQ
	3d86f7qWhVZ0jZw1EWl/t7+XtvbFJ4ctg90ruNHKASjlEtJlE/ao6yZMgXVXr7tpSOjNsY8JIsM
	D1wk7506cS+z/TgM/n0MFZpkWR+tHZvK6g6+Bq9hy+qUraKfVWdyYlPXRhl7HR3ZPR+l0QF7czl
	9m6XbEAmRL
X-Google-Smtp-Source: AGHT+IGwyf4+BHV8fv/H2S9Npxyjcg3z2GuPyZDCsui1BOl0mL68nVWRu33qAKvvsWHpqLGNKhLJ1w==
X-Received: by 2002:a5d:5d86:0:b0:431:fc:694a with SMTP id ffacd0b85a97d-4324e4c71bbmr43517044f8f.12.1767019917886;
        Mon, 29 Dec 2025 06:51:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 08/11] tigervnc: sync xserver code with oe-core
Date: Mon, 29 Dec 2025 15:51:49 +0100
Message-ID: <20251229145152.489068-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122987

TigerVNC compiles its own xserver. Synchronize the xserver version
with oe-core.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fadb9c05709dae9e817a50e4d99093d4e2937933)
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

