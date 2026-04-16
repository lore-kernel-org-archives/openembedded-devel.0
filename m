Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75838F433F0
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7044.1776318676869982578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KctUVYez;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c63e942f3so1217810c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318676; x=1776923476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqk2kvXRpHE00DX2judtIz4ZJeOjbPECQ/dESO/SpIw=;
        b=KctUVYezf+15eurSIo0DXDLuHUDj8rDUoobIrE8bsQPRZtkTUgmNMis1ugTHRsKZmk
         Eq2HMai96H4O3pHxWm1pDYdSCSj8KzwIeHuXQaXuSc9B+/MhCUWVX7qREN1LFESqF2IM
         IKU/TQC0rVM6Wtea4q50LdfoczJufZIzUrzWXYXhUlq2Qh6MLNojl832y/dcjuyefSmn
         V8pUDgpBTxFMBdafeG6qOMbbxxiK+nNRgPn92o3rkikv7wSTEx4k8bHf9bRjZaxPG4xl
         T073lFIBUlQZOiyv1RtC4cQQxz2+HWTAAhEgLRueIkdzBjQjv1csG1wxDXUnSDgaQuha
         7M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318676; x=1776923476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqk2kvXRpHE00DX2judtIz4ZJeOjbPECQ/dESO/SpIw=;
        b=MoGDoI57em1mQ9wdxszAr4+nYx/NGV0EGBeVRpQHofj19igdXOuUP8XeS5/WWUhbsG
         chRqcuZqr65VMEiK5J490MvYLsot11dB24tqi0PUgCqLOWy11Tn2hoQbjKoVhbIqRMPj
         CqclhzfFMKiJAP1HTrcjx4id6CnUg2iBDHqptDDqL+LZx4z9DHyWSW+aZQHxq58dHXJw
         Q83TiUII5JIv3UPVYRVum+/Wb1bMK4Nsg0IIiA5FQV7g3WJDIB6zlcdggQdB45m7NYBn
         xsnu6Zs4dM8HD03pnJdeG0b2sqv0nyCJVppzmzTdHPbPoQ8dkt0iNmrRQS9wWiRKRzWP
         SsMQ==
X-Gm-Message-State: AOJu0YzB0EEUXKHqNeN2Qoalh+1zzn90UMF2hXb6DxVRXH3eY7eiEpYX
	p/9tW6XDI0Wt3tpbC8Ar7oD8KYS5ztgetfva/X01mq4kvioaZqD65Fjqf9eJpECR
X-Gm-Gg: AeBDieviGcpVWzuJy1ctaDdFfJIjYRar+aJnpQtQNn0zjI7wE7pgM05ggm5O1+5awg8
	mpwQlAxhlrIF+7lwh12b3zy2/TrhgXBq+SJ2nHrufVM5TQ3Y2Yaj3gtETFm4maRc+3VV+1XdgPb
	f+1tgxsOrQl563f0Vy7gXaKoXU6qOQpNQ9J+HWH6fb5pjf6X4DTP8oFv0z/b2hZGANSPJdyj+si
	IuRImp9Iv7YEpIn+/+JUrpD4NiuBsO8qEQ9Lpw68/jgYNKyOV1dAVffnwbxj03DdQYKRmxk9FnZ
	IO1J9I74hw2nDfFFE4c0oMzFvBlPPdr4vkPDTtYwsYaDHaxoBpdzOUH1akWfeh8qNOsxMGD3Xtr
	OQDy3ebKpFRuMf6/i1xotWm/1bXmCT9e8zGjE6t/JJUB9BeKkMyqzA9Ba88xtWMxFDXlxzwgdd2
	hemnsxA0H1qiiqeFgY6ytGzhoPxQFSBEaurMQG7l/ufaFGyZxOVVI+5HiwKkQ0oMY7uRZlOtovP
	PoJOVnlcfwxkZ8W/fAqpO5WsqDA8e788QIEzElm7gdvgIx/nvQPORoVI7E4I6EKWinYKVHFi4qs
	aIGrhE4pQHZcvb5yPiqwr+hid29T81XGunFBHwATEkoAG2drbxE=
X-Received: by 2002:a05:7022:6085:b0:12b:ee7b:51e9 with SMTP id a92af1059eb24-12c34e3f299mr15371354c88.4.1776318675911;
        Wed, 15 Apr 2026 22:51:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 13/18] eog: Update to 49.3
Date: Wed, 15 Apr 2026 22:50:53 -0700
Message-ID: <20260416055058.792189-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126392

Turn color management into packageconfig knob which is turned
off by default as it needs x11 support.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/eog/{eog_49.1.bb => eog_49.3.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/eog/{eog_49.1.bb => eog_49.3.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_49.1.bb b/meta-gnome/recipes-gnome/eog/eog_49.3.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/eog/eog_49.1.bb
rename to meta-gnome/recipes-gnome/eog/eog_49.3.bb
index 202d68700a..d67c3733af 100644
--- a/meta-gnome/recipes-gnome/eog/eog_49.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_49.3.bb
@@ -13,7 +13,6 @@ DEPENDS = " \
     libpeas-1 \
     libportal \
     libexif \
-    lcms \
 "


@@ -22,7 +21,11 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"

-SRC_URI[archive.sha256sum] = "fadd12e14ba9cd2be6989dfbcef40001645b63440ceed8e04867b07587b066dc"
+SRC_URI[archive.sha256sum] = "6b4e69c7a8086ae85d556ca4a24daa665b5622c4097e1ee59564bff4cc963124"
+
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11','cms', '', d)}"
+
+PACKAGECONFIG[cms] = "-Dcms=true,-Dcms=false,lcms"

 GTKDOC_MESON_OPTION = "gtk_doc"


