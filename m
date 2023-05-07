Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4933BC7EE32
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.94797.1683499450027179521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BmmZDvTy;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9659c5b14d8so621790166b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499448; x=1686091448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdPgmCfy1GsYYrPPzT+kkKWReAwWItEV1BJf6fo+R0g=;
        b=BmmZDvTyxjOsDtkhFTj0fgyLUzAkr17l50RWvFkJs6izM/w44rebAulSW4MHyAFdKV
         8eaS22BmBMlxUJaZHqfhQTtvHZd+RgkWtagWRtSG5y7nDClXDfwoCQOiRnIa/s/8SS+m
         pQqM6Y6gypc+Mo2vBO6ndwg/XUlx1P/ZiXYBFlo3XRf6lcTVXBi8t0ZnjvH0JqMjTUGr
         OD0ZrsnMEfyrkPCIakzdBAGKNqeLPpNJpGwc6DJNIlSisd+lQmeAC85tw7jP1aE5shTp
         e2JM521IxitCTNqjYPHYJQ5tJEHF/dCSp8BPBRzseoga9xgkpWy90GWGWt5znCDAPlY+
         IF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499448; x=1686091448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdPgmCfy1GsYYrPPzT+kkKWReAwWItEV1BJf6fo+R0g=;
        b=X046drhckCKKriKaHibtwAQkUcCuR4sEqDSRzDo7ZdNMjUNGxfMP0d1KEvJHyEcMQS
         NbvFFvdzPr+4jhbBR1TvpgpaojFIJD5gRUbYDWrgEUXwwNCRBSbm6l65SrHKcPxy7CjD
         ozICv5keMR6xCCEZy2kSmuGM1ZJuAhZ3dNboftX4SgrjvMwk6zCJvGbo50gsang3H3Ub
         JM2TB8ETnK8dU+r4C22MJf6jDIe8ekODvoD+ACivMrTfwbFCSoddm0yeFWXyUs0LGL++
         75l06eSce2lwHesU2HCFLnoqI5Y8DEt83Bvda2BoDoYPmvWD8Sg/1OLO6di/oXvEDZwS
         Hc8g==
X-Gm-Message-State: AC+VfDwHahUCseDGC+IrlGKpKFeL8WAoEcpmumn3MeT6Fw+luZl1mIM4
	eJjoyc2VLqhyJvvxu9+cO0R9VB3EC3A=
X-Google-Smtp-Source: ACHHUZ6DxNfDazRXfknJgd632IW15SximBA/9Had4pLImlb0dGZLrd7Ghw4FUuP3wmJ/YUAA0/ktgg==
X-Received: by 2002:a17:906:974b:b0:965:ff38:2fb3 with SMTP id o11-20020a170906974b00b00965ff382fb3mr6092908ejy.74.1683499448374;
        Sun, 07 May 2023 15:44:08 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hu7-20020a170907a08700b009661484e84esm2691304ejc.191.2023.05.07.15.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/16] libxmlb: add missing dependency on glib-2.0 and xz
Date: Mon,  8 May 2023 00:43:42 +0200
Message-Id: <20230507224354.1149327-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102366

* without gobject-introspection-data in DISTRO_FEATURES it fails with:

  http://errors.yoctoproject.org/Errors/Details/702774/
  Run-time dependency gio-2.0 found: NO (tried pkgconfig)
  ../git/meson.build:119:0: ERROR: Dependency gio-2.0 not found, tried pkgconfig

  and http://errors.yoctoproject.org/Errors/Details/702777/
  Run-time dependency liblzma found: NO (tried pkgconfig)
  ../git/meson.build:121:0: ERROR: Dependency liblzma not found, tried pkgconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
index 3366b7e7f9..61abd07fda 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
@@ -8,6 +8,8 @@ SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
 SRCREV = "a6cac6a715d57c393bbddee4d0381ad943341af9"
 S = "${WORKDIR}/git"
 
+DEPENDS = "glib-2.0 xz"
+
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
 
 PACKAGECONFIG ??= "\
-- 
2.40.1


