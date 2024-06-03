Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB814C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 23:09:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.8348.1717456171440984526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 16:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XrEatObs;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b8e0e98adso629216e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 16:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717456169; x=1718060969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCMx9sYc1uOiXitud5MW0vmewkEubFu+1lnNmuqRHW0=;
        b=XrEatObsnfY/aW2Hl5Zc9PAyJrH5nmr5sAj4g5XJXJe00b9MkOptu2yfzpAUwz8mMM
         cOfCjC3oT7mlA3eVqjLpn1kvNPIcD0OQHQmnBMBnlrTv5EUUv6ooeVEJEukG8tuBRk4p
         emcVEj0wWNqOfGZZgxsiYpCnnFnpuBvLxDZq0i/j2aICv7CEL4yPcVSaoSkQXI8Gvt96
         F4KNpqGpzcdxv99y/vk6zetIWcox7CjP0enc4y/+6n4tY4jd1ZpqyjcmvPaWPL3IqLZM
         DiPEUtwrcMNYPOnnNIef9zXoAF+hn0CUYL31YMy0KG2xmZQtDvttd82bVq8jt/dBhhV1
         siww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717456169; x=1718060969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCMx9sYc1uOiXitud5MW0vmewkEubFu+1lnNmuqRHW0=;
        b=hJIhiL1nhHnrPZwomvNQFlCLpPGWt4DWJ6Hbg7G7wD19k0zQilZInKrVzeU33xSmd6
         wOEUO1wqomCdgPa/P4+n7irf/ifk1GJWRlKL/yS2vx2SYNsZedMn7dNgIsIGeY1BNUAS
         rQponXCB/C+oE7gKJbN+BmVIUSpYR5oV0I5A+cKeJCycLV5ToL5KHVulYi7cCbBUGE/j
         5W04UViTmlA00t1MGYw6JmbKgBCcbUUdx9jPOImSqvLwgGzP4Dw+8zBQlljglniNp7bS
         JC6cUKe3d+l+XTy2BDTlzoSpn6jI41lF1IjcNhXGBVJ26A3rJXOCxhoEHtf8GWKEq+vc
         X/ug==
X-Gm-Message-State: AOJu0YzzhJo+HbsUMcV7PQjfd742KgOKqF3j6ubpZXZkBqP/kLg8FYPM
	7uooIR4lV+hJML3hKQYlOmexb6VOFAWrXPHG/k5wtIa6G+gqr8OODltHlTr1Jglj2n2hbokUWZA
	R
X-Google-Smtp-Source: AGHT+IGAz/mbvywvyabVBTjXAsmHwamlTgOgrTOuHUso7876aJf8yZ3uBoCZCpJnzJ2zgIb6ZJ1QPQ==
X-Received: by 2002:ac2:58ed:0:b0:521:54b5:86a3 with SMTP id 2adb3069b0e04-52b896f1d0emr5869889e87.64.1717456169289;
        Mon, 03 Jun 2024 16:09:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9ae898d1sm401469e87.246.2024.06.03.16.09.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 16:09:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 2/2] lmsensors: fix building with GCC 14
Date: Tue,  4 Jun 2024 02:09:27 +0300
Message-Id: <20240603230927.4164477-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603230927.4164477-1-dmitry.baryshkov@linaro.org>
References: <20240603230927.4164477-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 23:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110681

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


