Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F23C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:49 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.156012.1703876560194906487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjvafFob;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5e76948cda7so49482697b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876559; x=1704481359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mja0/+JcD2i1nxHg0nxziNiO7Pvfn2yY5QgNQcBo5YQ=;
        b=fjvafFobjJ+uLkjepdsp2ZWIVSXZ8/hsid87X81TXRd0R2hyr1iw8nGx06KoaOFbJt
         EpbSVEZT01j2c3B3prQp2MIMt1A4HqnTl3eW6r5Kmp8LTgiYh0pCGyaf2I8BaqjakUdz
         4iBVypXFGMFtvgg6UxDAZncskpSOdS+9+0zCYudmgsQOSzYPdEcQtvUNCAexyo5nzbzl
         E55XvNimAMSO36/gy6hWixZMBKR45NuxonjdeRbczzPHTc2429k4xAkAdRPNCgfwZd03
         9d/kj5ROOQYwPAe2JSJWBk2IV4dZIcttwSxNt3KwEa4TWJE0ovruJuE1R9tMEcb8UMA9
         TS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876559; x=1704481359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mja0/+JcD2i1nxHg0nxziNiO7Pvfn2yY5QgNQcBo5YQ=;
        b=HZziU+ti1JiJICllyhwBxLyxMGFAePDjaLQ4MMj9FOol1zIjwUMd+7xq5/SLLFYmjC
         9DwX0gCxbCGH6gOI30qRg0VMTR8EY/2iyS62XVh3NrRwbqC+DHWV142HJyruoO48dflL
         OTo7rGpecBYCS4X054mWtsi5D837503DgztWy68iRIAIr3f1VzKnCo54zbTsOmlwEVcY
         mipBeK0dTMbah0LIcL3YHiQr97PFEcBt8kWmT1axfr8zgo/7x1TnlEW13TLwJ39/+aIQ
         1x5UQMpqdYUXYHB5YtbXftGHOqy1LK1a6XBXHxQ8k1zTbZhWmF/O3OIkfopYhpTTpLAT
         4spg==
X-Gm-Message-State: AOJu0YxlnJVd5VvvpLuqCm1E1Rmz+CDE7M5ySGr3rjelW0SEmR2RfE2R
	K1GdJaTRupNgfI3YCR8yz2mi7Bw3dYL87g==
X-Google-Smtp-Source: AGHT+IGkN2+K93pUlmSuhghGiXpNxdf4IzxFbwehX7OLMV8uzfQ/iXS1A7rpMelFI2XcgyKE0J04OQ==
X-Received: by 2002:a81:5485:0:b0:5df:c224:fb42 with SMTP id i127-20020a815485000000b005dfc224fb42mr7996542ywb.96.1703876559194;
        Fri, 29 Dec 2023 11:02:39 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 07/17] hdf5: Fix install conflict when enable multilib.
Date: Fri, 29 Dec 2023 14:02:20 -0500
Message-Id: <20231229190230.135480-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107889

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/h5cc conflicts between attempted installs of lib32-hdf5-1.14.2-r0.armv7ahf_neon and hdf5-1.14.2-r0.cortexa57
  file /usr/bin/h5hlcc conflicts between attempted installs of lib32-hdf5-1.14.2-r0.armv7ahf_neon and hdf5-1.14.2-r0.cortexa57

The differences of h5cc are as follows:
@@ -44,7 +44,7 @@
       exit $status
       ;;
     *)
-      /usr/bin/arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5`
+      /usr/bin/aarch64-poky-linux/aarch64-poky-linux-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5`
       status=$?
       exit $status
       ;;

The differences of h5hlcc are as follows:
@@ -44,7 +44,7 @@
       exit $status
       ;;
     *)
-      /usr/bin/arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5_hl`
+      /usr/bin/aarch64-poky-linux/aarch64-poky-linux-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5_hl`
       status=$?
       exit $status
       ;;

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fc7666e5bc01ddcdc16d9d3b838be5c35d84fda2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
index 68b91c0b0c..e716430673 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ba0f3d878ab6c2403c86e9b0362d998"
 
-inherit cmake siteinfo qemu multilib_header
+inherit cmake siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -40,6 +40,10 @@ EOF
 
 do_unpack[postfuncs] += "gen_emu"
 
+MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc \
+                     ${PN}:${bindir}/h5hlcc \
+"
+
 do_install:append() {
     # Used for generating config files on target
     install -m 755 ${B}/bin/H5detect ${D}${bindir}
-- 
2.34.1


