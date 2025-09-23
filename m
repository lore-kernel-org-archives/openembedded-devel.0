Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFA5CAC5BC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.14122.1758625605706470712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5RMsFQk;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b2ee3c13aa4so208200366b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625604; x=1759230404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEsGX9TOYm36g/lK2Cp3y/CWQ8g196oob4/U1imQDVc=;
        b=M5RMsFQkiUrpgc4axEr7Um+KTN64lX3OB0OIcb0IQz8airFh+UBQ2B4DY89qvTBE9t
         K/55RSo2HvPABso/HvV+EXFFJNPG4M8SH3t4VflD3kje97d1ymaql18pF99VWwmEgDRz
         Cpmqw69Gs7x7e6YGC2wHk3Z59j8HIXyEGPVRRZrHoetS17sZuhrXGMUXDY/te5kT77FU
         dVSLhjgDrHLIHjh5T0cqrI6ZcUu2efT7lZpgq2nkTG3s4ODb3uLXASSXGqP+mteljiH3
         kSvpFu6hUGJswOpFfgoQJP6wOOEIj8SV4F7xTtpxAJGkavRRk6lXA3PkjJ3Xt1Qo8nCX
         sDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625604; x=1759230404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEsGX9TOYm36g/lK2Cp3y/CWQ8g196oob4/U1imQDVc=;
        b=CJjt1iIqTaWglZAdbtPuhCPzAG98HKy+you3btYjymcWlyclx3H/eqsCqPwUHC8ZXI
         vRWQJtIe2D7Olk6/OJYpt4ourqBUtZwVBAST265OlIVrvKu4chRet2kfxW6RV5IMCMqq
         NAIxbZIJmDuYlfqREhcygzqqw6U2+SGhbQRixSoVEG1GksrYfrChuQnZUx+/WBA0Gb96
         GSHfNE+9IHR57Y7lZQ1PJccuhkfGCV8v+jP6ipvVz3vhh3Ekb/Me8AD+xKi4ABSabXpp
         OblKCS+y/249tWunHc+HEPgkChWuuarRsYiCM44F+FirU4+2oM/OxntkB/Tv3oGMP0zo
         c17g==
X-Gm-Message-State: AOJu0YyExglk4vs6S+kNyu+xIxSGINfIppKwgKn2RY9Ggw++qX8EoLje
	ebMKM9fA9Ni/vWecpwrSrKFUXp5VA9p7JRPeCDQr7v5EbOti3RIETje+g4CbVQ==
X-Gm-Gg: ASbGncvHSYJ9q7gmEc4HzpHWrgDtubXCkbQYnVSo64WLj0n76Ym0x/2hj0C+wUlwb/n
	JEHyOugirE1VgWtmiLbRh/6R3EbTFDkkHNS2BDM4GU/SPZhnPSzaTB5L7w6Q0sAA4anWe7rrUOF
	Kvo1iY9yoG7kmZrXMeHyjWJRff5pw9dKf07epcNTmaxaLWlpUN6dnqhO0WwAVpKAhs/QbX/Kaxn
	3k11pmKuLwNhsDuqY2xoRKZiMBe8GL6NYr2Ih7TW7NZpozFmqdta22mcKTez/QaR+h8r1YVofTV
	Tkj4ofP7YlwxdVjN2yuvav5vicKwyIvOozzVrryCUyMjA+fij5ARGvkG3CyMsIg46G23Sh7Ppv1
	ermpo2qizazd4Xejx0Z3D
X-Google-Smtp-Source: AGHT+IH74PXPBKRwTaeV1tXU9pZJIsRFz5thpDKspMiuTOdTKFCMD5v4TXMO1BFxYVuLxCTYs7zr1Q==
X-Received: by 2002:a17:907:2da6:b0:af9:eace:8a52 with SMTP id a640c23a62f3a-b302ba11b03mr220094566b.50.1758625603987;
        Tue, 23 Sep 2025 04:06:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/22] gjs: upgrade 1.72.1 -> 1.72.2
Date: Tue, 23 Sep 2025 13:06:24 +0200
Message-ID: <20250923110636.3413021-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119674

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Various fixes ported from the development branch.

- Closed bugs and merge requests:
  * gi/arg-cache.cpp: Fix building on Visual Studio
  * doc: Reflect support for constructor with GObject

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 757dedbc811bf3f09e259353a943effd1ae16733)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.72.1.bb => gjs_1.72.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.1.bb => gjs_1.72.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
index 355894073d..3170341560 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-91 cairo"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "17c0b1ec3f096671ff8bfaba6e4bbf14198c7013c604bfd677a9858da079c0ab"
+SRC_URI[archive.sha256sum] = "ddee379bdc5a7d303a5d894be2b281beb8ac54508604e7d3f20781a869da3977"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \

