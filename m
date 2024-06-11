Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85739C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 05:06:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.2426.1718082409973409080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 22:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNlvmvvF;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c1def9b4b3so615479a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718082409; x=1718687209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ygt3IuWqsGaX9YxFVYzsS8oVDFBKS0CFJji2x98u+2g=;
        b=mNlvmvvFiAa0Cdpk8fSPSqo95L76UICddI7U/zmv1ClBAJaDc5T260EnkXldlhKUxF
         OEhZfy54Jt4BieZSvTei59S9Z6EEU16BUZpIOwdRHR32k+Xnl6IAPDhhy2zglMh47475
         kOZpDmQplIG7l/kNJy+kyum7dx+NovrqXpaPOE5599aRk9U8u72Nj0jf02yul7+VK1tx
         sz0yYieaRhCCxEb0DzoMst0/IsIDhID1PEAXCvtUwLKEhSwo1AZ/73KzxGvPd4swqv2V
         jc24ITUWU+ZmSakQg+RhBa90ZtxeAQmdnC/23lDz8spOzx4almuk7qDZSSvXiJxxAVLn
         rNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718082409; x=1718687209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ygt3IuWqsGaX9YxFVYzsS8oVDFBKS0CFJji2x98u+2g=;
        b=NSuUWQfZ/r2vhnGXfZnzFR4WrY1/kMsIwichsQXBMOr1PSqt6t7JvsebKsjkts431Q
         PMyK9F3LkYk1pqLFB1LRg8Qfvs5hWPd5NmgSDvIsOuQ7JIC3LfNMym2g3ANbYC45+Ou6
         U+VwyYQIOudYBaOly49eXT1ZOkFYHUy+X78gEDxQ0mD77Ho6ZwQN3bsRaO+u9+eO23+1
         4PUfnXezcnU4/r8houkU+uGMsfAoEgL9ySd8jpvJM6ldRrX7HoYPdYICykL3nRPZcMem
         CHGiZqfq9Fb0UUZMSn7WiIShQ/HW4tIZLvYQ/U+/EQ+ST1R3LcpaRmuw+miw7D5MwRgA
         S4ag==
X-Gm-Message-State: AOJu0Yxq7CrDHuQ3AAlttV5XI2a95XPMDikcCCCu/BKSKe5taA3xjlL1
	/aZLlwGhxugRmqT3GqsFX1u0bhvYkHelmgS/ETslQbmJiYDusYaH0zeltQ==
X-Google-Smtp-Source: AGHT+IGsXUfXu5Xp3iD9c21S7EqmAMfwYT4E53XlfHXqTaw+dVSj7UU9eEUTkU8TJ8jpCuF5/6kkdA==
X-Received: by 2002:a17:90a:4706:b0:2c2:dfc3:10b6 with SMTP id 98e67ed59e1d1-2c2dfc31253mr6772802a91.24.1718082409000;
        Mon, 10 Jun 2024 22:06:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3212f579fsm1541584a91.16.2024.06.10.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 22:06:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libjxl: Turn sizeless vectors as a packageconfig option
Date: Mon, 10 Jun 2024 22:06:46 -0700
Message-ID: <20240611050646.506553-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 05:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110814

We need to disable this on riscv64 as it results in undefined symbols
with clang especially

libjxl/0.10.2/recipe-sysroot/usr/include/hwy/ops/rvv-inl.h:591:17: error: use
of undeclared identifier '__riscv_vsetvlmax_e8mf8'
  591 | HWY_RVV_FOREACH(HWY_RVV_LANES, Lanes, setvlmax_e, _ALL)
      |                 ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
index eced6c7726..8df0e9a2c2 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
@@ -18,7 +18,6 @@ EXTRA_OECMAKE = " \
 	-DJPEGXL_ENABLE_PLUGINS=ON \
 	-DBUILD_TESTING=OFF \
 	-DJPEGXL_WARNINGS_AS_ERRORS=OFF \
-	-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON \
 	-DJPEGXL_ENABLE_SJPEG=OFF \
 	-DJPEGXL_ENABLE_BENCHMARK=OFF \
 	-DJPEGXL_ENABLE_EXAMPLES=OFF \
@@ -31,9 +30,15 @@ EXTRA_OECMAKE = " \
 	-DJPEGXL_ENABLE_TOOLS=OFF \
 "
 
-PACKAGECONFIG ?= "mime gdk-pixbuf-loader"
+PACKAGECONFIG ?= "mime gdk-pixbuf-loader sizeless-vectors"
+# libjxl/0.10.2/recipe-sysroot/usr/include/hwy/ops/rvv-inl.h:591:17: error: use
+# of undeclared identifier '__riscv_vsetvlmax_e8mf8'
+#  591 | HWY_RVV_FOREACH(HWY_RVV_LANES, Lanes, setvlmax_e, _ALL)
+#      |                 ^
+PACKAGECONFIG:remove:riscv64 = "sizeless-vectors"
 PACKAGECONFIG[gdk-pixbuf-loader] = "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=OFF,gdk-pixbuf"
 PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF,gimp"
 PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
+PACKAGECONFIG[sizeless-vectors] = "-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON,-DJPEGXL_ENABLE_SIZELESS_VECTORS=OFF"
 
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"

