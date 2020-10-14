Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.976.1602637598279887260
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DtP+jwBH;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 33so1340149edq.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IRMpF/1szwvz4utg2qQ+Y+lTT0HCKTFN7Jw5bNRJW5Q=;
        b=DtP+jwBHn/N+3e9nafLJdo8VjAfPc0xNm6Qx1TD4aeI3uy1lJnniZCnwSkbvbWuxgz
         jY/+nFXcg7Tp//3/3hZ6f4UVhOAG659PrOwooZF2Nu90iKtIpYPeP/37fJ/aFG9VlLrI
         kZf+gv2vP3qVChDDv894ePf5cL51JGnOpG0aqpAd4JahF9aVUZuc0tPmr5RypD/LiZ7B
         wPe/FGEBHSD3U4UIZ4ee4EDSQiKPfQpDEDW6kA+osgTDwBieQZTJA0IBiydzwnwgXT7g
         seMWiPOlgkVsHHYtM/kFQC9t2erp46v+HNSfPyxAy3tsJkSYH5B0JkvxJXxS516s9I5e
         XuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRMpF/1szwvz4utg2qQ+Y+lTT0HCKTFN7Jw5bNRJW5Q=;
        b=D3DD1RfIlDJV0RMb72nEPtxeVejpnPleHyP8HwLgRfk5X8Y98ucrxSdmb5cQiNSM8Z
         GWvUphGtjHSsZWCiUuy4XLhn8Djfc5F8s7c33InBC/MF35wFHGaqR9tH6VEzlpFS/w1B
         VXTuHZz88VmrQW7ajTESGJWiFYCthq6xItG3psTC4WBRIxMrWGyZjXy58CA36UG75aEs
         Je4GMI/W/CU8IH+XTr4zu1qKlE6fphbKrseWXOUEjL/1JLpmFU1970Grb/bd0JJwCasI
         urPvmK8+/icMrpmNatywVQjjT+QIZDBS7gNFKmn9mIYvjkAwjFlcgph/R7JNt2mNVVt7
         rwew==
X-Gm-Message-State: AOAM530ON8v0IZxeBT7tU+9r4Ue3DiJXm1pdMtnwvDuhsAkUbLLcIo6J
	2vTv21nwy3OXmgHMSMRRohfmgoTsFlc=
X-Google-Smtp-Source: ABdhPJyljbIqLdVoJ2CyBtSMTxrM9AqiAp1EpG86ynIhmul42DgaUhuyNJXVPcs713SFUzx2gGafDg==
X-Received: by 2002:aa7:cd93:: with SMTP id x19mr2462407edv.183.1602637596528;
        Tue, 13 Oct 2020 18:06:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/8] gegl: upgrade 0.4.24 -> 0.4.26
Date: Wed, 14 Oct 2020 03:06:16 +0200
Message-Id: <20201014010617.1086948-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gegl/{gegl_0.4.24.bb => gegl_0.4.26.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.24.bb => gegl_0.4.26.bb} (93%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.24.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.26.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.24.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.26.bb
index 77c30f7de..6ac1e6ca9 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.24.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.26.bb
@@ -26,8 +26,7 @@ SRC_URI = " \
     https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
     file://0001-meson.build-Give-note-if-sdl2-was-found.patch \
 "
-SRC_URI[md5sum] = "3a8062add20effb6f92b4b614facbbd5"
-SRC_URI[sha256sum] = "7765499f27341b0d16032e665319cbc12876483ff6a944fcdf24a9c58e3e254a"
+SRC_URI[sha256sum] = "0f371e2ed2b92162fefd3dde743e648ca08a6a1b2b05004867fbddc7e211e424"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
-- 
2.26.2

