Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D0ED72362
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 09:41:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64431.1769161292948728861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 01:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sg/3LN3I;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359a316d89so1575321f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 01:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769161291; x=1769766091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXxbbmex0ZYiPbEx/HUh8ve6LKK31KdZ47xKCMZfCAc=;
        b=Sg/3LN3IZdXG0bpmnXss3h1arjl85cfrchbRrcZu1tfJ6sKJSUswcV6sWgDdnIfLBJ
         GVfROC36hWXXz7fvFN0FbqGuPTcuUCZMbB1U9HK2ZFGEbYy3UtSHsZtgZmz4l2c9rnNR
         r5QmDFTVt8rJ1OUpeLdqxWS4AKpTTeGCgW9P11gpNMN6YJbcFj3DH2FdcZKi/dGx57le
         Z7CslAj6lh+1KK+lp6UrJYMOJg+szRNNVYwJmqqzrspsSEpWOVGtKPyPI2Pt1LZKaYs0
         yN/HvsE5YThPVDWriIVjjz/LPRKLAorAnj3CJ+eNTqjI2EvUKC4+GeL1wYJxTO8wUZ9M
         gXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161291; x=1769766091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXxbbmex0ZYiPbEx/HUh8ve6LKK31KdZ47xKCMZfCAc=;
        b=GsFRGSn309JuyiFyXd1Y3BQ7JB7azjt9Lgq26PQ1N2XeexSJGkBZ8t5+3x6o0mS6vV
         eyf5U93AOrj7ogEmaJ4sYoTzGpCkCx/bcIhTPaLn+w/Upj2YFuExbzb8/LHTCXrK8J+i
         hz4Z8SHsiXZn00/0sqBF3VzEhDp9EAeTm90hbgmhWwqAJFjn4hjS8I8eCOd62f7t1oxo
         ld3xEeaRa65iEDpgsD6mIOAVDHJkuHViYJB8p9BSYoiUEo6PDni9/uIRmHAzLYDUJaI1
         HIqmXA+l/qK009M3GHhgO6SaA3inABS266xvz+kvCuOgmjZSGaAXA6/dQEz0FpeVBXeg
         2VnA==
X-Gm-Message-State: AOJu0Yztn62EV4M97w4hQjMcCQ8YTkgq7WJEteYT7Fl/AfHuQF4L2UCz
	z1gg6NfyxVslzHgKjDp92HW3WxCSi9anS+1CSw4rr9pNVsKhZHM9TxVPjdmONA==
X-Gm-Gg: AZuq6aJpw9N4XiFO9yowQhCsHVyAPs6yL4sD9GMArOBQHvmqLPeTXIzFF6s0rS8MSlz
	FjxGSNWIi2s8t+MMs68dkE+4Gk2VEGmPQPSBZHvMBeRoK3xADaHrYXIgflBNj2EhsyF14yw2QUZ
	k+Vp3A8qsIAwyWe+Y0TXt9N8JEl1wt/JZDZEtGnxeftZCUYA0i635JmBZ84c3Rtu9XVstOchN2g
	HFkwZkJTFPtQyWU9F8TfJdl6a0EkbLwpU/C2dhikizFoiEEt2KbXymT+ZQKI1881VvDWUvgadGD
	Z+HL5z1mFqDAIpzWQvXJPa9UFQu/ePzH75O3Y5RTM4LweEpkBajgJmUmUa1DZUq/xt1oFf1N4EL
	M0CqowOAc8tME6705awdHcH1SRrBfQO7TcZQOH7oFFqjE5U5qx3BdTESfFZCmIuH870axC3oRG+
	MLJ5QS+7efyv3nnV8J
X-Received: by 2002:a05:6000:288c:b0:430:fc5a:40ac with SMTP id ffacd0b85a97d-435b160615emr4717964f8f.54.1769161290658;
        Fri, 23 Jan 2026 01:41:30 -0800 (PST)
Received: from toster.lan ([185.228.162.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e716b6sm5428466f8f.27.2026.01.23.01.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:41:30 -0800 (PST)
From: Shoudi Li <quaresma.jose@gmail.com>
X-Google-Original-From: Shoudi Li <shoudil@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
	Shoudi Li <shoudil@qti.qualcomm.com>
Subject: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple UDC controllers
Date: Fri, 23 Jan 2026 09:41:19 +0000
Message-ID: <20260123094119.2665-1-shoudil@qti.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123775

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


