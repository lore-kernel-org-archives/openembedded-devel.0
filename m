Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92C7C25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 05:35:54 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.6037.1716615349646798171
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 22:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZZHUJvbY;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e73359b8fbso69833351fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 22:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716615347; x=1717220147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvvvazecp5dP7pkcmCqpNq/vkEstyjHtnC5XTnW/3vQ=;
        b=ZZHUJvbYVYNLAe5EIL9pbM43NZ7W1D3M4KTSZZauLxKBP09IQOg5GXwfeypJzETBTO
         oOEfiEy1ofz/cUQEIapcJm/6ndjEkX5OzV+gyFzbd/ABmgFsP/KVIMzGDJ7DTph81Msv
         FLOHMXpzyohnj+OtRWsf6561s4ejKXH7QfSHc89zrklXaeqoEJJVPwxxAnzisGB+z0br
         vjCyhu2IJSWDaX8v/SBfr+RVgnUAlcDZL5LcUlUb1K9xbqI9VfhLJIJutPqEhYthBIyE
         UX+meNqIHojjzMhpSm5x/6Le2cB0CdjCkosHqjDlNWV6fg3iZSvey9sjEh8oHW/Uo+pn
         JiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716615347; x=1717220147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvvvazecp5dP7pkcmCqpNq/vkEstyjHtnC5XTnW/3vQ=;
        b=RPCYqvcsLdAG85sJPhyN13au1283KvOjcG8J0cNsJ/WVCPmtz4U80xsXT5M1HzGedW
         AJRObKg7o0WgwiH6N7oO6eyjMIwq4wpVwuDPybgXd8VhV6x6MQXmicWGey5rIvkxZ89w
         fqfFcvMoPjuSe9OVhbuYy9CzKVyXDpUUv6lafiIQaxSxZ00rDdsTpsL7uwexg0xnlEyA
         yxc+aU5AHwpOTCLtV0WxidkKormUAYVe4NEkmqLx7CJJVfj/Rl20hHpfFkqL3x/EmbE1
         +zzggrgPH7CzFtxVVtqGYO6El4WcBo38gC4UkcK6bBMZM20I9VwG3zA48/atzr4nIAQO
         +njw==
X-Gm-Message-State: AOJu0YyQn5chtsNKOgCJc3rYTMK8w5ULkMWtFWx+IotXJXD6jfHr16bR
	MR28QOAr1l1w16ip02NTRz11N4XJUbnZ3GdPXg/JfPm5VzVJB4+eD6NkCDyYn7PY3YWU8MuZVp2
	W
X-Google-Smtp-Source: AGHT+IHkeHA8zpEcJimv4RllK5SZojSpHrkw6DgMg9NV8k1tz+j6m1N6IEI5EmWz47ENcTVZ6+xiog==
X-Received: by 2002:a2e:9d45:0:b0:2e5:3f56:2a0e with SMTP id 38308e7fff4ca-2e95b0c4cd2mr32620301fa.24.1716615347233;
        Fri, 24 May 2024 22:35:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc4a7asm5481131fa.3.2024.05.24.22.35.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 22:35:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] lmsensors: fix building with GCC 14
Date: Sat, 25 May 2024 08:35:46 +0300
Message-Id: <20240525053546.141252-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 05:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110527

GCC 14 is more strict regarding const pointers conversion. Fix
conversion to let lmsensors build with GCC 14.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Submitted the patch upstream and changed the Upstream-Status tag.

---
 .../0001-Fix-building-with-GCC-14.patch       | 36 +++++++++++++++++++
 .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
new file mode 100644
index 000000000000..0ff8b3801b95
--- /dev/null
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
@@ -0,0 +1,36 @@
+From fd49cbcb7f3402e1a4a99b71b901a564060039b4 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Fri, 24 May 2024 14:16:21 +0300
+Subject: [PATCH] Fix building with GCC 14
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Submitted [https://github.com/lm-sensors/lm-sensors/pull/497]
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


