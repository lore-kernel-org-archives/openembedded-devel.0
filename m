Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C50C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 11:58:20 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.14011.1716551898011932063
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 04:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YtJ4UIXb;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso50008161fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716551896; x=1717156696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0v4NRy4V2INqhQWHV5ZUdiRtktiPv7/xwJaRBi5BXyw=;
        b=YtJ4UIXbDgMaVBxe3uMu6ZrAr7WGaj0KjC9WS1AoI3rvTKMP+WvUG+6n3GtVe4gXpI
         66ZrVfbaEJ3gaQ3b/icI3voYB7jKssaapDraV7lwfcWs7cf3p+zK/BiMAQfWLAjIgxre
         5XLV2L4rsbSBIQrlvLrnEBqyjil5HH/yp0IeXMEQXRbksLZbaeFqhgoIybc/rFoiWBYb
         hM14KK9sq+YvN7d0TbW7swWfcSYdmMq+cYMmAuY1qtKyDPVktfjH468L3B1eiOviK4JF
         ulEfT+xqKKzgHPrmmOb0UV8Wc3o4QlvEpF/hRumc0F+J57iPngYF3klqJO2/wmBYwNIJ
         I7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716551896; x=1717156696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v4NRy4V2INqhQWHV5ZUdiRtktiPv7/xwJaRBi5BXyw=;
        b=U/TEF5bLarVlrUEZB/VLmEwEVsuc03uAF5vdCF1Zn1G9oBHRebBdf5ORCFQSTJxOkc
         B5VTkbmztRxlr5h9HZkH2rmsf/ydePruYi8tFi5F3+dmJcAvfrmmLlmO1KfBLAwn0IMb
         G+nJOEGn8KyK9O0lMcxm0lCMlgKMUYj0VplWOqBlm/d3/hgK0hjMzt0RVjpG7yF+SfyA
         9ziQ4vJKUdqivBthCsFG99NoERKFtNazcwZwjEp+euCHuWGBgWCW0rhOwPdW1ljNhX0Y
         pzVZpg11qV//OI90OaIYlkb78skrRlogU71Kul1j7iO+8THqr8A35N9gRb75+ZBQF7Dn
         KrxA==
X-Gm-Message-State: AOJu0YxGPTvfk3pvx9kCtljpcW8lIkllOdM6fPcAPxFukDOU9+DpabYH
	Icz7Ywaa3KgKWqDrQLmKNB3U84hqPqVG66eyZkhXvUyUZOPE2fJe8aZ1noCvWNL337DTks1485C
	B
X-Google-Smtp-Source: AGHT+IFpVnrkEkyfXYrCFzEUC4jt2PcCat6sVOAwvwPFsGodaJLd/6secyewjZ/9gzODyJBWzthJfg==
X-Received: by 2002:a2e:9e9a:0:b0:2e1:5644:24e7 with SMTP id 38308e7fff4ca-2e95b1cbdd2mr11645841fa.13.1716551895973;
        Fri, 24 May 2024 04:58:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc41casm1770321fa.19.2024.05.24.04.58.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:58:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lmsensors: fix building with GCC 14
Date: Fri, 24 May 2024 14:58:15 +0300
Message-Id: <20240524115815.2501861-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 11:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110512

GCC 14 is more strict regarding const pointers conversion. Fix
conversion to let lmsensors build with GCC 14.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../0001-Fix-building-with-GCC-14.patch       | 36 +++++++++++++++++++
 .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
new file mode 100644
index 000000000000..73938e257708
--- /dev/null
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
@@ -0,0 +1,36 @@
+From fd49cbcb7f3402e1a4a99b71b901a564060039b4 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Fri, 24 May 2024 14:16:21 +0300
+Subject: [PATCH] Fix building with GCC 14
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Pending
+---
+ prog/sensord/rrd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/prog/sensord/rrd.c b/prog/sensord/rrd.c
+index a531362bddd5..36d685fce514 100644
+--- a/prog/sensord/rrd.c
++++ b/prog/sensord/rrd.c
+@@ -299,7 +299,7 @@ int rrdInit(void)
+ 		argv[argc++] = rraBuff;
+ 		argv[argc] = NULL;
+ 
+-		ret = rrd_create(argc, (char**) argv);
++		ret = rrd_create(argc, (const char**) argv);
+ 		if (ret == -1) {
+ 			sensorLog(LOG_ERR, "Error creating RRD file: %s: %s",
+ 				  sensord_args.rrdFile, rrd_get_error());
+@@ -455,7 +455,7 @@ int rrdUpdate(void)
+ 		const char *argv[] = {
+ 			"sensord", sensord_args.rrdFile, rrdBuff, NULL
+ 		};
+-		if ((ret = rrd_update(3, (char **) /* WEAK */ argv))) {
++		if ((ret = rrd_update(3, (const char **) /* WEAK */ argv))) {
+ 			sensorLog(LOG_ERR, "Error updating RRD file: %s: %s",
+ 				  sensord_args.rrdFile, rrd_get_error());
+ 		}
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index f956224e1820..07027225c58b 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https;branch=mast
            file://fancontrol.init \
            file://sensord.init \
            file://0001-Change-PIDFile-path-from-var-run-to-run.patch \
+           file://0001-Fix-building-with-GCC-14.patch \
 "
 SRCREV = "1667b850a1ce38151dae17156276f981be6fb557"
 
-- 
2.39.2


