Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCD5C27C53
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 07:52:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9719.1717573951036418923
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 00:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eULVs31J;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b98fb5c32so4684258e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717573949; x=1718178749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCMx9sYc1uOiXitud5MW0vmewkEubFu+1lnNmuqRHW0=;
        b=eULVs31JfMRN67g8ohM61GeX4FdccgSg05jJ14B1fh34AQ4Nd4/YW9lI1ZeO+yQ/FU
         B2KJbuNiUoh6e8wjLMFP4/q6Lsb0HpSBk41x3Mol/VRpO4mwp2wLNuHJQ0GNjtv+CI77
         sBxVwG3VwMcwJCAEJ/+ra23xytqlfbddxSVbbXNgtAaxm6SaV+wSXgv0hUx+DWcVUo+5
         YYf78nil9mg8SLdZIw/7HKr8WDh17ugnC+zp5/07P95s8or+T1tS9KFmsoaUXxQp8fhg
         aydaBCbNNAasuUg8RciDob12SsnKsfVDLg+0amwelobYjq+LDul4p00Ca/8QhYfWK3+w
         XZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573949; x=1718178749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCMx9sYc1uOiXitud5MW0vmewkEubFu+1lnNmuqRHW0=;
        b=PSWvxS5IBYMMtLp1funxHrpY4G9QcjkiMMzKz2ueMZbLt/rDQH3+OhkXc5gfkSkaos
         pA9KjiwK2+SWCHDrmf7igr8uOZ6ozxwIAFBI6uGSHjiocGm3RbhYyIfIJedWYVD9KQre
         V6M4GxdBvdoezHGSNKJINT1DOU/17dWD/mFOuijtmC1RIt3c5/IdWbRoKd9kfitZP80z
         o/smnsBywNFNZK+nZbIS7JFgbtVSktCBF15aeY7EujhbYpZ9Y4GxNzAkpxNYS490LPhz
         zgVchT1Fi3+GBFsGjsR/Wbs/B6BunOKZhooJZ9RE/4Ucu4Wa5/MNP2UTAhVHnR+H6keY
         6G0w==
X-Gm-Message-State: AOJu0YzaFtiZOmjLREJbsuFLCgwb1NbbOoho+72KpPySMWA2Unub1yUF
	MyS0pDYokN/A05KJKUgbzyndPLzXIx7CaOkTCqFGLrQqDVYvbjDG33dBhB29XBBrYJ6xcVG3pSh
	L
X-Google-Smtp-Source: AGHT+IH/RTP+bdaKAeuPVuCROnjbKqitS5rIjr8S29jttloBz1Cf7f+kpy36YeGM6U+izJE/HtnRAw==
X-Received: by 2002:a19:741a:0:b0:52b:9941:4b96 with SMTP id 2adb3069b0e04-52bab50b714mr1164786e87.63.1717573948758;
        Wed, 05 Jun 2024 00:52:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9c8a7766sm690199e87.181.2024.06.05.00.52.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v4 2/3] lmsensors: fix building with GCC 14
Date: Wed,  5 Jun 2024 10:52:26 +0300
Message-Id: <20240605075227.1833641-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240605075227.1833641-1-dmitry.baryshkov@linaro.org>
References: <20240605075227.1833641-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 07:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110698

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


