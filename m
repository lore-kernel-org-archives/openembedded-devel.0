Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88879D7789E
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:50:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1274.1769190643589828599
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:50:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGvss6Jp;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so26095075e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769190641; x=1769795441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iABgpWddJvLsMclXePxk91JIMo86lyQADQZRfj0xBAo=;
        b=SGvss6JpzpPZQQiSp4JmKLvJD3+TXXLHVEWh5475dfXGRqNUf1oV994UTMgrwgvKSZ
         wob9rOYFC1YGZbujp3yGmIuO2/P0xkOSNdtbDrbkrSdGkYrcBm4VeC4yaTLUe/Mxcdvo
         Vzi7mY8KZh7pKx3Vd9bUaA4CFvsNv3AHmg98LxoOipyJ/247C7XqPFUUIi/Xbm0s56HG
         y7bgfGPOU6Kh/8IRLMk0a/gviRFSiWk+Fe8GYME/N8IbsfQc70Dp/sWI2TcTa4qDXnYH
         baLxPNYxRC1C5MnwHjbva8t1MuFT0c3PoBFoORjcjpyOKXcB+jJFB/gGXJXUiJK5soaz
         3Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190641; x=1769795441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iABgpWddJvLsMclXePxk91JIMo86lyQADQZRfj0xBAo=;
        b=wlhQKxxCdGiWXXNBc0YpRkxALQ2Nry1AjFB2DhUlEcON5iiHMWUN3vIRdiFTY+9BHu
         rNPRxz9AmGbK83T28gy1cr8lzqZNcTDHUGbL3R3tYFxw9wThr5He3eoUsdaKJhx7xmDK
         pmFaD7b72fOXXNLFomZhUREp32WOYPcQHAPhA/f+MFu0iV/BSOqqaPyhItJN6KaMcQZo
         CwAhBBgNHE4wX8XqhpHB7z81Ooj6G+GB8BbnwB5FgtkBgD96uxa1BnjKh8977EpBgu1/
         9T1s7SD439tQGK2sR9jBobqbmXWaCJ/pPd/OFL1qMIFa1prC47QxZQ4rdSX8Vl39hrY5
         eDrA==
X-Gm-Message-State: AOJu0YyP8Qk4Zh5HgzOcqccW6PSWedTTFlDGJ2d/dIlZ+MGT+VTFSEgA
	lIM1xXlH3Q1JXB9GBvupcGP7Df9sJo0YghQ5TLCNtiz5CdcRc+2INR9T8ILbEg==
X-Gm-Gg: AZuq6aJPSTOZm74WVVXh7jn3YGcgx3IKjC3ZxJuenU4kFkcWtO7jwGI7EFmQlaqnwwB
	pnFWbqdKSjxAiVQ1SudtWiirrT2pWxgPpn3krvjhn5A+05P5ULZaQHpmjJ7px0X7XHCf3/sAXEa
	FsWD7soHaCOljOB0T+SHL9Gf1Is81369kLO2Jf4s3hk5afx9PxE97GCVGR55as8AwEbtVQr1UIB
	7lun6Run71Cmc+6nNv7rfy8DdvouyCtOqcuZQoE+WV+1eA2+I2QbTHYxVxl/LiliBAL/c6wvKkd
	DQLJyJjFTRKAg85GIJo+Brr/Hv2BKUFE9M35NG5flTajLRDKhjNwuBZgNrpesC8tvW9J6CBRfDV
	Ok8kDpVCFU8t5El/C2ab3AAOpg87dl9u64pPEqArvn9PI+Dhp4PhTMu/lEyUyjvKTAL8OkFNRns
	No2eCK7/ms+Pwe4+M=
X-Received: by 2002:a05:600c:4690:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-4804c947ce7mr69630885e9.2.1769190641228;
        Fri, 23 Jan 2026 09:50:41 -0800 (PST)
Received: from toster.lan ([185.228.162.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5b67sm65427585e9.10.2026.01.23.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:50:40 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Shoudi Li <shoudil@qti.qualcomm.com>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [meta-oe][PATCH v2] android-tools-conf-configfs: handle multiple UDC controllers
Date: Fri, 23 Jan 2026 17:50:20 +0000
Message-ID: <20260123175019.4072-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123800

From: Shoudi Li <shoudil@qti.qualcomm.com>

For the boards with multiple UDC ports, adb funtion will be impacted due
to below error.

ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
ls: write error: Device or resource busy

Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 .../android-tools-conf-configfs/android-gadget-start        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
index ca6c3df275..76b5e29624 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
@@ -2,6 +2,8 @@
 
 set -e
 
-sleep 3
+sleep 10
 
-ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
+ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
+
+echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget usage"
-- 
2.52.0


