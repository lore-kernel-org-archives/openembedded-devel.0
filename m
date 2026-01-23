Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2CBD72367
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 09:46:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64082.1769161586098823343
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 01:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SjZan8gI;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435a11957f6so1683073f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 01:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769161584; x=1769766384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUEj2WUiEQscRMRmRuewkX4M1ugZ62Ax2rEFTPKNXTw=;
        b=SjZan8gI8X6tmf32zrLZ1DrQ4daChTvcCQGANp583KbFyE98W16dZaAxkWoxVuYIZd
         M5IPFHX/Ur4ttJc/34JYwjfGxRGapY03Aqq/FHyQ8Q5LvWt1DmNBZ7NZtcfBN+O+7Xi8
         /pStgy/CWNr3Ts8RdcNf8l6RlVV1zFtnr9EyaQOL0R12EmOwGdUSWFfLWNKU63NtJZr7
         LbrtGKfwBjQgMZRwoWa+piNzUcD3ts0o63I2Vt39aKiaRAqYRJBdl+S96H07LP1olGYJ
         Hsbr6kkEJ1HwsIP7fnazSzSdjVTdfDcMqmsQaydT1bUgIK2t90o7iJj4sucQDxnUAsQV
         hw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161584; x=1769766384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUEj2WUiEQscRMRmRuewkX4M1ugZ62Ax2rEFTPKNXTw=;
        b=w+0+wiLsQbcM++WFmcHoaPaqARQzDcoD1dgrM71rBODWRytgxk1TVUfbxl1fvQ0B2d
         E7h69NVztLquELwGmi0XzqyxkUcneCTZCZk9pACVQhF/043HNznz1UEnjJI4M5riUR0J
         cRwUSro4NF0JB7wFoC+i+omAXklN4h9bTa864le/GkxNufLTYI7mKaWMYSuKJBHQAjKT
         p9F9krcSGfpk+ONB86r27wPLC18FO9RfuXSDPi//jFy4QDfRbCeWE08bXq1lexKm6muP
         qrwAVCtPG7eF3CmXvq71xw2gpDh3Reh/dEzul6xRvNmqCcdlv2na2+OlPLbMu7jdHiOe
         btzg==
X-Gm-Message-State: AOJu0YyJhUSpXn8WZUYV5AQORKpga7DhbxR8jbV3J1ZjT9Ly+B77KHzf
	6fO3DAm6fph1KCBadQ9zThP7y6k3wHGKah6P5JtyxDhTa4s9bKZHgJNFXOtyhw==
X-Gm-Gg: AZuq6aIwl1f+AXZhfU9jmNv7VH16kPUB6/gM0ifnEg9QgzFqixgbV+EXy1XWxYmiFcv
	V9exneSEawvPlsZy2bI0bcdIikfWTTaon8xZbmvGeHtA9gr+fd3z3koQpTtAcJx/wcgv1bOkv16
	KiGmimFVed4L6x0v/ibrzrRml/vld+p+zZXOoOOKJCTj8Eagu3J+6jfTTJU1qFkSEiKFgle7aNN
	O+mCMeq1RirxuuoymSYF/qUXCjiZsWgHuFJuPIQ7MOfNdX2QO0oMh73306fZZAG9csH9zlb2sx2
	mczusaoJzhJZhGyGYrjTW7KAb/+uhY2rFt6x5+l+y9jO2F2jyglYiFDhy4f0SetcTd23K5T62mP
	rIVLNIZ4rWVErIeweStmRZypIm8MsevXEILq3GX6+JVZv/7zZH0e7GtU/2qY4NwDjgM0d+KME9b
	xAsFJTjwRKnOrz3wbRxY+xkdkrHts=
X-Received: by 2002:a05:6000:2410:b0:430:fbe1:382a with SMTP id ffacd0b85a97d-435b162198dmr4817526f8f.54.1769161583620;
        Fri, 23 Jan 2026 01:46:23 -0800 (PST)
Received: from toster.lan ([185.228.162.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c01783sm5602029f8f.3.2026.01.23.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:46:23 -0800 (PST)
From: Shoudi Li <quaresma.jose@gmail.com>
X-Google-Original-From: Shoudi Li <shoudil@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
	Shoudi Li <shoudil@qti.qualcomm.com>
Subject: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple UDC controllers
Date: Fri, 23 Jan 2026 09:46:04 +0000
Message-ID: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123778

From: Shoudi Li <shoudil@qti.qualcomm.com>

For the boards with multiple UDC ports, adb funtion will be impacted due
to below error.

ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
ls: write error: Device or resource busy

Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
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


