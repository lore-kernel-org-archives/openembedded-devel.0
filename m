Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B35CD5BA9
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 10:56:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.6613.1725533812475265530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 03:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BftevJRC;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso708081e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725533810; x=1726138610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjMuXn31VBBQ/8wJ+zz2u1hfbNxuh9RfgO/wQf4a0lg=;
        b=BftevJRCJwxRI5D8EEFWfXiw/k5sOR+s/lj+zwEPMO4FmzFQrvGuxmTIteiwqmd9ES
         VvvYR0DNCf94UNToK7D/kwgbrRsQG7KoKs2PuzLTCp02xqTvgLAh/memM9hj57WYOLsf
         srHIVmEKEW7UAXS1WL5U7RW+3zfpNZygpuujwe+8byE/PBcyLc8NP1+AlkajYh8DN2EE
         u0f99BTKDJJ9oLPniPq1r4FOAsVXLeK6y5knGHc2ZOca0t0c+b/pqZrDKDMj59wZ4juz
         ufwaEr4KmcPyjcBESbD/Ec7SI7I0GJVqFue9tg3IaqrgV+hkGBGQbEQCKgxWM2vyNZUY
         tYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725533810; x=1726138610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjMuXn31VBBQ/8wJ+zz2u1hfbNxuh9RfgO/wQf4a0lg=;
        b=OE3ui/1+2y9HIgMdU4EvHCF2uChFi+97cpdaMxrxxRd+pUBZIHdFOPMz0O3wovNSr0
         nAKZ1wKVOX2i2LedAMFhSWe5miOkBzB1y15k2V58OoDpIbz/2y+/ph4RqMxIoVR8dOfT
         Au1yONZWDvtvQmsexY5wyO7l6VDMnZ/fTwADCwArqbFB6h6K9bxRwP/6jOf9uPuyDO3l
         B1758iMFtYRBG5q4dKBLs5J4wyvrdgVX64/O8TEfGkvhtKzx7/cTnIQ2BAI0Mm7ZqyaV
         g3WiYvahMLYA/PAZo1I5rrhLWu8UFbzaIkw8h2oFZGqYvHDeYgRsJ3Hwczium/h7gZ8M
         yj0Q==
X-Gm-Message-State: AOJu0YzY6BJ9jZ+iML4u9WKfkkhfEFZx/yj1BDXiO6R9J7BI5eFXN83N
	9kcFPJXa/wo3pfJjDNlDUZP2+Ied0crPRtcm5FPNWoPmC8w8Ro6vBm3DGppaOHytxV3PsKro4y1
	V
X-Google-Smtp-Source: AGHT+IF2kPt+6JdWpm6UL8XaA50O3P966VE7smmlB9dFOKBz8MJOHRKANwNhD9JSg25/SO5PIyJRQw==
X-Received: by 2002:a05:6512:238a:b0:52c:e1cd:39b7 with SMTP id 2adb3069b0e04-53546afd6d3mr13720132e87.5.1725533809478;
        Thu, 05 Sep 2024 03:56:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540841a3csm2627636e87.226.2024.09.05.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 03:56:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Raghuvarya S <quic_raghuvar@quicinc.com>
Subject: [meta-oe][PATCH] android-tools: create flag flag file for adbd at a proper location
Date: Thu,  5 Sep 2024 13:56:33 +0300
Message-Id: <20240905105633.2832450-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 10:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112101

The patches by Raghuvarya changed the location of the file that systemd
uses to check whether to start the adbd or not. However those patches
completely ignored creating those two flag files, as done by the
android-tools recipes.

Make the android-tools create the /etc/usb-debugging-enabled file so
that it's possible to enable the adbd automatically.

Fixes: a29c6386d576 ("android-toold-adbd: Fix inconsistency between selinux configurations")
Fixes: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
Cc: Raghuvarya S <quic_raghuvar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 18068478f8c7..d2680b457867 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -190,7 +190,7 @@ FILES:${PN} += "${libdir}/android ${libdir}/android/*"
 BBCLASSEXTEND = "native"
 
 android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/var/usb-debugging-enabled
+    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
 }
 
 ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 198ef281f2f0..a291fc39a2c8 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -189,7 +189,7 @@ FILES:${PN}-fstools = "\
 BBCLASSEXTEND = "native"
 
 android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/var/usb-debugging-enabled
+    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
 }
 
 ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
-- 
2.39.2


