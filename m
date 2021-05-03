Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web09.1805.1620069137039536497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YBzSpAS7;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso6088970otn.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4vK6gt0CKaDdlJnLLfPFy6Pzhp8xOkvWdmahtI1w3IA=;
        b=YBzSpAS7DmoWNmmK9VeR+DAv8GiQ1iyB0SnW569LYCdcbB/kVFEm9pODUAVbmb7CBa
         NceDzSUzDkPFy+FPfQMTvyDJWl08qqShnaO/WN3T0XXRrMY6p/8VH98Hp9m+zDcSzRMU
         qMlHMcuC8D+rRcNvyBhTuv+km6kV+xjhTyeCmiP5QqYGYWnC5X6GngociCic8zDJpIry
         G/qCi3H+P0SPenVEfSUPlHp+mtBbQun9eXTjfkJED086fvLlpmMYSI0EgD1cNfjyr3Jk
         GzVwIhWZpbP6eAlaQgBWTu5fOeUE0pBDU4bczTxbfStO22URPdcQDVA9O0xvx/T/jl1Q
         wR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4vK6gt0CKaDdlJnLLfPFy6Pzhp8xOkvWdmahtI1w3IA=;
        b=p/cV35n2lH/kfYCVvwLFjTGB8ktlDA1KE+Ow/p8GbCW0rmVuWmoz5VltDHgnDZfQDE
         JBVVV2iRTjLhrP5JrbQRV17jPIk26c0Mgo6MS7X4v3m0hjCCHyMXj93hPlkq12Xpl1nG
         nrrTCQLuEvoSuCiZRgcTOXQ6VatXt2MpI10hzH40nKFF5YLptd7cr9hY4FwtTr3Ef+wA
         s7aYXCrb8ifec6hbwFudY9O7A1ff21swtKhRsd5VrPIrdrklCptldfJs2R5MX7B2NzOa
         uBjGRGCIT91SFq6ovinVHKQ/FJNyNK36Dv9h3tdJ+7mParU1OrdH2WG74xMkDRyM/1An
         sbmw==
X-Gm-Message-State: AOAM5317OyWQYnLWPKrBMFh5ewnKKrtL03M86KSuQB2wgVIZrfZJLLBl
	jbC3L27P+l0yMyNFrL1U0r9K/XEBvNdWNw==
X-Google-Smtp-Source: ABdhPJyDeRZ9UL77x84wDQvvC8NzZRRakzhIaja6OE/1lBy1ps4gSU86GGJaWMOuC7t36khUN+F3Lw==
X-Received: by 2002:a05:6830:2086:: with SMTP id y6mr15968455otq.356.1620069136247;
        Mon, 03 May 2021 12:12:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:16 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/14] libdvdread: upgrade 6.1.1 -> 6.1.2
Date: Mon,  3 May 2021 12:12:00 -0700
Message-Id: <25532d82a7ac752b93e00b1afa84b08c1c301504.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1dc583540355ab6af483b20b945cbd7c42984ccf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libdvdread/{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
index 65f5b6adf4..ed7443dfd4 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
-SRC_URI[md5sum] = "09c7423568fb679279fd2a2bc6b10b6e"
-SRC_URI[sha256sum] = "3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796"
+SRC_URI[md5sum] = "034581479968405ed415c34a50d00224"
+SRC_URI[sha256sum] = "cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.17.1

