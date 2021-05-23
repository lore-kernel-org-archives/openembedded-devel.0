Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.15762.1621809244564920334
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pse4jVJ/;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id y7so12188905eda.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iNj82K5C0+R+PUVL03oUtorqXYAP9m9Bi2eqcfqsu9Y=;
        b=Pse4jVJ/eqsMfSOO/is1PvtEcLjNgRZgzjak0GDZMgPmbo63CukeNWMn+O2hxKERdY
         zEGZ/HP2dSA9yRnOt/RGSFInUrj/HwjYW0y2Of48yAQSfx12RWR9vjBjhGEu5vNETsdh
         owWRdSINubTVDCV8uRMfxskBOq6Jns8ja2b2mwEMh7BYXF5A8sIh8ViNrMGXl4rPMse9
         Xn9khwIhLiwULPSgXoLM7ug67c+OHlC5ZlDRqLn9wiVTi9PfQqUpXMMp1vBQzMPWZJuF
         taI4acQf/sSM2teh8ksDzE8dVqezU4lx0u0p8tcwFEkbd/8DZZB2XPn7PjgXo5n4rKPO
         u04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iNj82K5C0+R+PUVL03oUtorqXYAP9m9Bi2eqcfqsu9Y=;
        b=IV+V7fvAR/61tHUa4ea8thOzrhNXOIEMk42/f/cyqFXb14P8vQtIG/+64DCHPOj0dx
         obenwySOlkPSPd+gZr1oDTDmRGaQPJrjmtylnbMo12e2R/d2bbuxTTgqlt2ZsLVRAPTu
         uKMEqO3lrL2sHwfFe0s4ZyJrReFdxEX+7PSrDZCtaWZUCo4801gmhB3KnDkbOgqwwOkN
         tepBVaVk53bDZrWr3gqC4Dc92bbakQeKXcq0SqJpsd7fDkiI3wJvjBSMB4kaRAcZVYn3
         u5aiIkDxMeH42dM2Ot9JP+0oSMzlTCqilOldlFzEBbIGsj/UAWyYu1e5qyQNc2IpdMNK
         pSTA==
X-Gm-Message-State: AOAM531TX24fmPk2c64ixZPBrC6kjpcjSq5SHP4Lc4Olb5EZSebIooKB
	eIoFrnEl6lMNxb9y0S6ZA+5u1l/F7ZE=
X-Google-Smtp-Source: ABdhPJwNQZ6eHf0BSyxf8vS5AzDviPmNNgVozTpbQE8nOdlO6lg71HXa/a+/bfARglvf4/cdTBE12g==
X-Received: by 2002:aa7:cf19:: with SMTP id a25mr9772859edy.336.1621809243178;
        Sun, 23 May 2021 15:34:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:02 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] botan: upgrade 2.14.0 -> 2.18.1
Date: Mon, 24 May 2021 00:33:48 +0200
Message-Id: <20210523223353.2576671-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523223353.2576671-1-schnitzeltony@gmail.com>
References: <20210523223353.2576671-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-crypto/botan/{botan_2.14.0.bb => botan_2.18.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.14.0.bb => botan_2.18.1.bb} (89%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.14.0.bb b/meta-oe/recipes-crypto/botan/botan_2.18.1.bb
similarity index 89%
rename from meta-oe/recipes-crypto/botan/botan_2.14.0.bb
rename to meta-oe/recipes-crypto/botan/botan_2.18.1.bb
index 13b2c6649..041eff039 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.14.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.18.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=a02e03c8fa2c5e7b9b3fcc1b9811fd3b"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[md5sum] = "ebc68c08b99bbc4b4fc9bdbfad398b02"
-SRC_URI[sha256sum] = "0c10f12b424a40ee19bde00292098e201d7498535c062d8d5b586d07861a54b5"
+SRC_URI[sha256sum] = "f8c7b46222a857168a754a5cc329bb780504122b270018dda5304c98db28ae29"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.31.1

