Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCF1C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:40:32 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.5065.1750502429582758570
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7r26/Qw;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e81826d5b72so2476596276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750502428; x=1751107228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juHKQNjNQLrz9agche2OXAc7Xbx7GEiMVvBPUTPajq4=;
        b=U7r26/Qw8f1y+OMdds+FT/2qMu0wy+57BRr/02cNTzMOR/4LWBhm8wc0Dhbp5d5a/5
         ixQfjiyCWm3gHkD+F9PNtlVUbFo/wO6RPl6e3Wy2wrxFyk4YdfcMZSvozrEjC6Od9GIV
         IEFZ7OLZt8voSnFLuraBW26R/yNSca1thKGSn9rSSpEnG7FqJkyiIEIk64tLAPiPbSiB
         8+IWS6jMaiyPLWcKKxd8Cx5gc7yoyuormMWdV2qHSvhjneeolLoCOHxe9pCtTKMwELLE
         zRmWzIbYS+pZ2wt2QpiqQhUmV32cYgiVjxYaf47EGyPdsgoNrz3nkCoUszc7FJUEahZb
         4mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750502428; x=1751107228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juHKQNjNQLrz9agche2OXAc7Xbx7GEiMVvBPUTPajq4=;
        b=fTn8+igywH36xKWmkIb8BB6PaCmC90jWddFavuLVcRDjQZJIlA5NgoQSF0xI8/nQrj
         KfRqGncm5RVaFEjYSMRO/+7GbhDvguMomnD+qb4ELEPZXE78JgURgd5G7Ts6Jd1KBsxI
         O393d25u/1wwi0FGtNe/6UJ9DBChhbTvP2DsCRgipdwYpxypc4CtOSriGJ3kCVSeML0X
         oqbmBy+4ye5ijDj4ASU9QECDaCrD8g+LLtWLtioLhgCW04V9qeDDQeGJjX22VFCIy9Vq
         RwEAk35jIk1sTknpjRof0Pr+fauf1kgj4peN6GUoGArANk2bFBPGQNyuVocIEevHOeCW
         JbmA==
X-Gm-Message-State: AOJu0YxAOpDuJSeC9hVzwVZwL1ZS0234Yi4kaWQ8HnzxLJLdy7PSw3Kj
	ml6DNbalMOJrJy5eAOGSxJVj2nLUc9SqR2iwx6s4iFCkTJe/hnlR1khJ9EFSdYJA
X-Gm-Gg: ASbGncvxPwdx4YNueoQePkc1yuX6If7fYD76FV3rNiK84NQk5FIINwlCDqMOgNkcyp6
	GoTlldIdJxWYPhcwIbL6B+Nf12VoTTd4JgokIYysKGumInPaQvDDVn8NiK6CStbAkSRE0d19MM4
	cCuHoHBHPVOe7klva0XvfppyOp39Aed9TSmc7aK0nhm+wRtoR5f8Jq/ecyw4HBIk/0MpQ40tcMI
	A/8J+U9p3xGYMzB5B7lEA5tcBt9bF3UQQ5ZM+8OiMTZkGZMEl/hj1O27thrVGMl5VqqmLudm5fu
	2x5CxnIeSV82mT04SZWVfH6ufXJb12EvxPh8QYuO45a18rywQh19PXf+0S7bW5ZD7Ch1ubASJu6
	oiJP5zx1V1gFGgMutqpAH
X-Google-Smtp-Source: AGHT+IEU8+ogkqq82Ex3IaOv2v3NkkQYroO7L1BkVtdNHz76H68C7DgiYcqZFknGzKCnUGL3MyPDhA==
X-Received: by 2002:a05:690c:7082:b0:70e:7a67:b4b5 with SMTP id 00721157ae682-712c6517813mr83844177b3.22.1750502427548;
        Sat, 21 Jun 2025 03:40:27 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2c76sm7792147b3.102.2025.06.21.03.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:40:27 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/5] libxfce4ui: upgrade 4.20.0 -> 4.20.1
Date: Sat, 21 Jun 2025 06:40:07 -0400
Message-ID: <20250621104010.766706-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621104010.766706-1-schonm@gmail.com>
References: <20250621104010.766706-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117999

Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libxfce4ui/{libxfce4ui_4.20.0.bb => libxfce4ui_4.20.1.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.0.bb => libxfce4ui_4.20.1.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.0.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
index 22ce3fe67b..b2dd9dfa79 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 Widget library and X Window System interaction"
+HOMEPAGE = "https://docs.xfce.org/xfce/libxfce4ui/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
@@ -12,7 +13,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "75e8996984f20375aadecd5c16f5147c211ed0bd26d7861ab0257561eb76eaee"
+SRC_URI[sha256sum] = "ec99f0b8f6d7cd4222c8f8e3bca51d144fb240d719829344b354900eb3a07100"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.43.0


