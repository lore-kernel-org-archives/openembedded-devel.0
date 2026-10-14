Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E32CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:58 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9266.1791969956731022293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S1jyKuKL;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8874539bccbso128963b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969956; x=1792574756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrJMNcGZHCA2dnWbt7JzXk2YA1A3mKdG0q5nJaYh+ds=;
        b=S1jyKuKLzkauTqYZ6YS9G5M3kq8Dh1tckeh1UDTWfj5x7zWdP4JjVIRmX9qasobrdD
         tOhsu5Ma9k5NVkDK/HHnjbUmX5UISeMSylRaBz3ICnj8mlh9X8CVX8/4a9sNa7x/tLDu
         qv1ZlQRnKHJpVnBaHVSsy9Unfbk/3smFIpRMRXwtKuX3n0rWoAVTg3jfh6nhqNjvcP+7
         3v1kpcYVHQ1DnJtl+NRVaXtHRe0VQD431dCAy1oYflhk3otvGIuDaTh+CkYfCyOvqI3n
         ly/f/uQYOgxtah0XLV9b98TQ+XdohDOgoFfT4T262OglaWMIC2rXiifQoxiP4z7gK9ej
         2t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969956; x=1792574756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrJMNcGZHCA2dnWbt7JzXk2YA1A3mKdG0q5nJaYh+ds=;
        b=SiU+pyZZ8/7ntAKw/TfkciYlryXBnEERMUT06ezBnhcjFx4d98yGvsh65Ye6OBn4DC
         tcml32QogpI2A8hBRv78eS90dXLpafToFkXfvhBcVtacff9UlJ23IWGPnO0rCEV7NZtY
         OHz2v3FhjCMPE7Y5VZpkhVEbwZYryzD2gkBHPFxRp2qr/19JjpZ2TyogHbCcqRu5eW/A
         Ui3W/FQEkt3AUd5bKyhqvm1AOkqULqRBvhTr7/aMuahBX2u5VaBIvS+w2eEtT5pcvoi4
         WCNE2SsHR2NGqXsnWt2BLjeREDQBqYLEibLsgJyqIKbghpPHeX2JQOjHIyr1EvcyMbTY
         +vag==
X-Gm-Message-State: AFq9FYJyzb117EImwR0+8z9Zqs5IFgszH3+57Smum8IHw0FR5VoNF2uV
	qh16bSUSwl53hHo9sF0Xw0/CnW1hS7tNKKqfT5ddkBV48c9NH7lQlNmEnmrExA==
X-Gm-Gg: AYBFou2FBpbAcJx9lMy/kSd4n7dHELBD3aaA9dqQ4DhepoiAI3U+G5Nk+iOkiLHRZDv
	Vc54X71YKqm2GmcP2mCtMAoY/fGBDQcaY9ko8/7MtjdneKXtmCa8c+zuxJjMkUq4lIP6YMuPpwJ
	XxhpaJ3tiByzpsq5ZyzePaRWLYV6vAD8iI9hzFuaV8fwmEy+7y0mruYN0lnh2mMbNjU5NeabEOp
	lhpsdWghfLPwj1QYArLPOgXorABL2Jffd6lVsgT8Q80ZUQBPL4klnwfipHm8Z1iXND0bCAIZ3Hd
	pvRnLAdApzLLwSJi+i/PowyEeB4bao7nGuIgPSz1c/JqeoOY6JHjW2wgF/o39pvr2x14H1vpIoF
	0wLejAkPRufKb0dJJTmbVtF2t6gEyzmMt5qObckuM7NXrtS2XSXao3NTPIe+QnPkxJEYMJbKeBP
	IdD/85nE/083a7ogWhMaVFzMNdR4LT/opfdflnX+GDUm/wIHpKL6+qvrzw+GQo1QQDlqQ62PiNb
	duuU9i0u+L/oSRCyZVGHjwu2JP+s5+TX3frtKw=
X-Received: by 2002:a05:6a00:1a13:b0:899:f331:9bd0 with SMTP id d2e1a72fcca58-899f3319fb9mr7235436b3a.43.1791969956174;
        Wed, 14 Oct 2026 02:25:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 14/17] libspdm: upgrade 3.8.2 -> 3.8.3
Date: Wed, 14 Oct 2026 22:25:10 +1300
Message-ID: <20261014092514.454505-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130882

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/DMTF/libspdm/releases/tag/3.8.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb} (98%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
similarity index 98%
rename from meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
index f77057d9fd..3ab77a5cfe 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/DMTF/libspdm.git;branch=release-3.8;protocol=https;tag=${PV}"
-SRCREV = "f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d"
+SRCREV = "98253fee253c9e0b4313e64b373af3c7614c90e5"
 
 inherit cmake
 

