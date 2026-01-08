Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C814CF6C15
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:46:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1672.1767858381932956430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ir1628r8;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43246af170aso894376f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858380; x=1768463180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lw0flcEI00Max1uecu2Q/X8wqBCuVnjBQuzlSwPKsnM=;
        b=ir1628r8nDwpb8AQmDhAVmAWiqeRu0Z+aTw16SEzuTD9Ggc/fSkLDY/4QMCAmV7OV9
         4pXWhozcXGVxTlfq94fr67OuFyR2Mdz8yI+Ci+gFewAX+1Ul8FnRSBiG4b5GV8Q+/7sY
         0C3svz4R2mK1hni9NfTTQpzzFPwX1Vq6qChuvDDf6N6DDc1Bt83ZjyHg00tW9UhdGc/2
         Xj19GcMLxsjrHnqOPoL71l6+zwByqHCaQPtIa1MLdvexL5wPnRVEvd1bCrZDdLjthCFg
         t6Rlz+UbZGiFdxZgc5XI9kDeU995J+c44yHogV3yz+yrHMNgN4Z3UvK30iAM9OR1q4ZV
         TGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858380; x=1768463180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lw0flcEI00Max1uecu2Q/X8wqBCuVnjBQuzlSwPKsnM=;
        b=JYvkdzWWX9g2iIGZ2Uaci1yHNPRBRE8ltapRKY5ZyYpRfFkyTXlKl2uMaNycFn0yIX
         L7Bu6i0GQN+HMk/ZB3FlHl5qGdD2ifVI4WEIFz+eO5V/HDWx3nO/IQrgHkptW8MsD2kY
         npXsGr3p82ehURmFK36N/rUxAlntfBEpNkoo0+OjCSJLyP5ItlF2cas+cOBQA5v6ATyq
         l74zNo3LEK7kyIyBWzW0O2OdQHTicZQqYWlaGZnXblb8ev/Db6u2R83pbQ42e5b+fsa9
         2CUaERkdHNU9mbvbyeilrd1lhMI0E+VcozBxvCqB8JAwBrRiaUAT2xAqabj9jspqRLP2
         wQAA==
X-Gm-Message-State: AOJu0Yx/dye+1DA5rO1t3DQAPynSKDn2vGs+7mCXtGLklqYZU0cuq0y2
	ASMEWcj+6dalwmOhoT+5KKoYPW9ocddxUMAgdSTOFGwG5JHRE502DTn268lUtA==
X-Gm-Gg: AY/fxX5sCY3kNfjOIR+B3i6FOtPuEqgv0+6l0rtbpvqDQmkg05bysq84zQQYV44DliX
	v4HtYPRRtGSjl1Hj+n3mBU1cjELy3MzSpyj1tFCyrvVG8n2Ch7DLwKPHJXmYvmx+EtLJUZdlbvK
	6gBo6vAJmqJIAJw5HdmEpKUnGtxrVRKp5nwlSIgn6SdMtLSIvCNm9DnpXwWO0zoKyrTmHMwgYFk
	4qEpSStPS+kd5gZyfOhiocYBBcArJe2Zjv7CTa9PhVbaHBQW5k8jwjqLz0YRvI34TtMX1J+O7f8
	eNoK5wzDl5FpKg2ugY2WG6QWzjrT1wtbUkLNJMB+1ufdASONhw0L0xEorKGGmbVtdL1BawjgsdQ
	RIFtG0s8/ExCBpi6U9RL7OIFq0SzpFpaoqFvFjLnfUDRNHOWPUXc25/cwzQJO16kKA2pdqXGz4x
	LhfuBAxUuB
X-Google-Smtp-Source: AGHT+IFHdBGPfmDEAr7dkxgAI5AEsn0rTyHI4A3hzM09goVJkHSEaTocwB8OEay6YwwM0f9B1V2Y3g==
X-Received: by 2002:a05:6000:2207:b0:430:fb00:108a with SMTP id ffacd0b85a97d-432c362bf62mr7573842f8f.2.1767858380085;
        Wed, 07 Jan 2026 23:46:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm15200292f8f.11.2026.01.07.23.46.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:46:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/5] openflow: don't overwrite CVE_CHECK_IGNORE
Date: Thu,  8 Jan 2026 08:46:14 +0100
Message-ID: <20260108074618.2782232-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108074618.2782232-1-skandigraun@gmail.com>
References: <20260108074618.2782232-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123249

The recipe contains two CVE_CHECK_IGNORE declarations, and the second
one overwrites the first one - however the first one is also important.

Instead of overwriting it, just append them to each other. Also, move the
operations closer to each other, so it's easier to see what's going on.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/openflow/openflow.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 3c29a5c8cf..2134b57713 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -18,6 +18,10 @@ CVE_CHECK_IGNORE = "\
     CVE-2015-1612 \
 "
 
+# This CVE is not for this product but cve-check assumes it is
+# because two CPE collides when checking the NVD database
+CVE_CHECK_IGNORE += "CVE-2018-1078"
+
 DEPENDS = "virtual/libc"
 
 PACKAGECONFIG ??= ""
@@ -58,7 +62,3 @@ do_install:append() {
 }
 
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
-
-# This CVE is not for this product but cve-check assumes it is
-# because two CPE collides when checking the NVD database
-CVE_CHECK_IGNORE = "CVE-2018-1078"

