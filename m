Return-Path: <erik@riscstar.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B939C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 18:51:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13775.1745607086380317732
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 11:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@riscstar-com.20230601.gappssmtp.com header.s=20230601 header.b=0fVJKLBP;
 spf=pass (domain: riscstar.com, ip: 209.85.128.48, mailfrom: erik@riscstar.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edb40f357so18311475e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745607084; x=1746211884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYMzm8gPEno2o5EgRSn1waaqYfTqOnsH4IIX3wcgmE4=;
        b=0fVJKLBPhr79Q+Ca8zJDbKyWfauG1qe+0cvEcE8up/s8giDcU9AYrlPEFLIimKJiN5
         XROaZha3yq0LIqkj/f3RrMtucDRw2hAnU7byIbMO30xm5A6yqY3UJiST/Z/+t7YiIWpL
         hKVjoeCE4vO1CmdBsNAZVsky/jf62OldAXy9XGcFj00ku1SaVFcUWqc1y4ojW+V20tgB
         VGVL0POfhf0aMnN2ZylX5R8VvuPc/FatAx+BCrPXS0uWNQZVn7SDoPkwdoZl2gXNfV71
         G17CrakB/dVfOOjMtCoQCTpjyY9lVGi8C0t01p632CrLYNLVnVbDpHCGHXsFAvN3+ey/
         j/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607084; x=1746211884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYMzm8gPEno2o5EgRSn1waaqYfTqOnsH4IIX3wcgmE4=;
        b=XljOzxnzJl2bwaQ49qCXZOIKpP5O2/fkFclM94PlS8cpZ5watTmyl3SkXcN6IoDxUy
         w6jnZPFKhnuiTou6c9pGUAtLKwpb6CWYTnV1NRe65ukTZyyRquvGVg1b8icn6nUSNfo3
         Y3viKoWRrI0FEhu0bzHDTFTHKdSilKK47ThvP2ffteSLwGYmGE17HJgkuza0OZNjngEm
         g09am0+oZ2rOmgX45oDLd6oOA/vDP1HExAXBoZHfWagaLjLSSdFoqqVG7aY2yK1f1Afe
         ySpQsTrrVswqcQMz0n5onUtqw0C6QIQ4ISjZ1jj+0qoRMMb2ouH8eV6yUaMrJoE6RbBF
         D1Jw==
X-Gm-Message-State: AOJu0YySP4LiN6OOUTWf2xIoU5GwQMiNMuwaglCGdsXRpvKUNHCmOOIu
	xweVThxqxY2m0IbDi6LBZlRHO+r7drZ3y3a7J4rtatW1t4cvg9uQsAaVRo+ssfbVlaqOYvBlJZ0
	5Kio=
X-Gm-Gg: ASbGncs8E3LBP/faJBSa+S6rFqNXM7rd5IHdvV+8D6d8rAeto6mDGewz1CgSg37ViGa
	ktnT/6JwezCrq7/8utII+TNTRtJExhj6kS/eZfU+U+o48ffYg/X9Y5saOmhw+oDYE8H0h+9ilbD
	Z5CKyirdKFRMJ7AZJnDfU1VOWelFYO14OHmDJSdH9PnP1Pmro+ueJpYmMqPCGIhFTIoSXIKGcff
	qNXk9oG3vBTJZeDY+G77O1r5Li9pKWF4NjLYN5VByGkJII9TULFD79q5DP4CZoBnYPJL+SfXQod
	CZZsCzV4AshGUwa2fY9wVw==
X-Google-Smtp-Source: AGHT+IFsFBQ+ZRmwsiWu4Ekkov0JOP98vEkjp3FW3sGZAFkSytxiyIRxGJZDasSi4kMCbY2UYSo85Q==
X-Received: by 2002:a05:600c:5029:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-440a65cdbafmr30391745e9.7.1745607084489;
        Fri, 25 Apr 2025 11:51:24 -0700 (PDT)
Received: from ablu-work.lan ([2001:9e8:d596:8d00::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac26dsm65255475e9.21.2025.04.25.11.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:51:24 -0700 (PDT)
From: Erik Schilling <erik@riscstar.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Erik Schilling <erik@riscstar.com>
Subject: [meta-oe][PATCH] zram: fix RDEPENDS for systemd service
Date: Fri, 25 Apr 2025 20:49:37 +0200
Message-ID: <20250425185118.1118692-1-erik@riscstar.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 18:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117136

This attempted to pull in the entirety of util-linux when systemd is
selected. That falls apart when building with `NO_RECOMMENDATIONS = "1"`
as util-linux only weakly recommends util-linux-zramctl.

Hence, we want to pull that in explicitly.

Signed-off-by: Erik Schilling <erik@riscstar.com>
---
Hopefully this now does not go through twice... I forgot that I was not
subscribed to this list yet and on first send it looks like non-subscriber post
are not allowed.

 meta-oe/recipes-extended/zram/zram_0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
index 89292118d0..e4522f89a1 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit update-rc.d systemd
 
-RDEPENDS:${PN} = "kmod \
-    ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux','util-linux-swaponoff',d)}"
+RDEPENDS:${PN} = "kmod util-linux-swaponoff \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux-zramctl','',d)}"
 RRECOMMENDS:${PN} = "kernel-module-zram"
 
 
 SRC_URI = " \
            file://init \
            file://zram-swap-init \
            file://zram-swap-deinit \
-- 
2.49.0


