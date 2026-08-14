Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E96C5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24522.1786747613829364347
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bFOJZCwJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee846deecso1710347a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747613; x=1787352413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHah4RttRVJhnFJ+toVh7fu6olMIBXlc/ah8UwfRKNk=;
        b=bFOJZCwJYr5ptaNIrMXzFLQDOwhOsC4aDjd0A41METRxhXJtqFBlCzeR+7VAu2PvIR
         24q34KUe3P+eZU0XNKV++vgjlnvmGXaU+yNwV20Htq6srX/HiPHvenjvmc2luKG9Hvvn
         8mYtXw40mK5CylVa4kQ7IDOXky4KQQwiEWDE89vKdFQ2zMLncPm/+hGVWVHH9VNHt1/O
         3JzvAb8XIk6TIenL2lSveSkUnXh/76SxOAG3sngZuOdsUbpy5uHS+uiInhr5aKRV7ZB+
         G6xqXNgQkHT2HWglYjY2rYYMWIUeyNOHOI9izATQ0hXN8lVsXsW1zVx94yVAzGMlJvXv
         ehnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747613; x=1787352413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHah4RttRVJhnFJ+toVh7fu6olMIBXlc/ah8UwfRKNk=;
        b=CxseSt0jU5PC9OPeR1datfI6Ywn0/g1EvzQhlz5nysgCfSwwqIXKnMSAO9McvEXCP3
         oWn4ckLLEPplAZM7K5BMpma/dFfTiJOjULgCQCVeE25O17ZY7Y0ztVyLAJteN9bt/Ov3
         J7XGhSvZR3ezKIdFQplW1LdzwWfg88TCqbAibxDfujkz80FHBm0hTzz3mAcqplZpypaN
         h4cISdjSRwiHTHndAFXeeBHTvEeIJLyuAI+iIQj2iAQ75ClS9V6d6Nz6c2xWb6s41iSN
         O0yR8bjUQq1uB4BMKYBellyFNW2N9G/p8DpZwXG+S1jkKIXQXF+KOm95U5MViCLGQJNn
         AbsQ==
X-Gm-Message-State: AOJu0YzIly5kD290S3p/58rhkzbEa69EZNKGY2OVnOssYcHmQhXzZ8q2
	UEIUHfkGSZmasaMYFBnpHnpkhH2khx5N2PWoKHrwDy0UFQ+MWAdtbY+stmJmAw==
X-Gm-Gg: AR+sD1169+xqPDlGj+KdQglcuJoOIUy5kp81NQ+yw3PRYhNEQhE+CqV8s3ohnARSEj5
	b7j3b7J32wBpTKU1LVjojGn41G9o07MAwYDgvgEGmJqX5kBP4pPc+pf3RGkGqfoSVZbWjQohZz0
	ZiB8CMabOUWJ+pzE8d+uqlhTGYA3dUgN4Xaos8GacI1Oa/0J7j00g03QY+Ov5B2IYuDykeKznvf
	UfhXTS8/6F9+UIpSd1GGIbFNzK5ATfN3ky6Dur0CWXl4GHg2eFZ3Hr+wmKTxp2xWZ+NhIpNAUPJ
	dBrPFx9vvqqoA5xgLbnohtD64qqza9kubG5w6lQJHuNv28P2JbWwojZVrerpthgpb5snLpanZ3A
	vqO5dda0T75fVUWakR6tzc2J/+NglQhrhubnS26/9o83mfK/9HSWiLq7qYByDDa/Irdumz7cvek
	VLtKAj+407AZtiGhtA+Lh2VWUGfFWUY8Thyeg0491+YQJ3MEXKA16g5wIktwI7XBPU9jPcengoK
	SJvF2/yS7PM9DDdvo40T5A4ANeu88NKWD+iUeYOaAYD2WYyGWYs3aZe792ZXDjZGE+Q1f3JHcaO
	+Z4RpgG/fptTeK4pebfaEBjq8qrHCUOceI/ixngWxn9SJ7Q8oEpzeBcJJEPG1LkM/YjFz3/uV9h
	36DqYgjK0itgizLs0iJ1sv/KE6UGksz7eOJBqMQy+Npy/vA==
X-Received: by 2002:a05:6a21:998c:b0:3c3:75ff:95b6 with SMTP id adf61e73a8af0-3cc71d3b98dmr10295547637.31.1786747613219;
        Fri, 14 Aug 2026 15:46:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 064/109] tbb: upgrade 2022.3.0 -> 2023.1.0
Date: Fri, 14 Aug 2026 15:44:50 -0700
Message-ID: <20260814224539.1523174-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129128

Major release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/tbb/{tbb_2022.3.0.bb => tbb_2023.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/tbb/{tbb_2022.3.0.bb => tbb_2023.1.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb b/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
index 0dca19535b..8f48412fb6 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
@@ -12,8 +12,8 @@ DEPENDS:append:class-target = " hwloc"
 
 PE = "1"
 
-BRANCH = "onetbb_2022"
-SRCREV = "f1862f38f83568d96e814e469ab61f88336cc595"
+BRANCH = "onetbb_2023"
+SRCREV = "3046c8b0c29df995980003ea24f4d78c80ec0c8d"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
            file://run-ptest \
           "

