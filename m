Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F793CCA476
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.12523.1759309362619836258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aPXMEr6u;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: joao.raul.434@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso1887949a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309361; x=1759914161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=aPXMEr6uxg49B169BqJCFhdevSHs0tXvf+nvYjol05MDvl6DWMkH66NTUE4hv9fQ3z
         2lVzKFO41iyvk1P5vSuwVq9UTnDVUv9v1eqSqau4V7VIo/OW2ZIqCEVylNYAQZ+TCmrw
         8wfVhAVtM//4BxZkQPq95/RfWztj4OCO0W6TUUw4crS1/8GYijHrfQBJvTNnuuC1Qs1e
         Pi+LeaVs3rgnjJZGEz2NlNHL4OcpPguE/GzFfhIa1iDky73O3s2/BKTXqC58yiZT8d68
         gzHEDwINKgOuB1YQ6fVmzDG6fHUvygyxmiUxym9u7XkKt75/GLuj5VsnP6UJq/DRt1IC
         vlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309361; x=1759914161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=GcdBIA3Ur6abqtyztL1NrMm6OGLNdUmM0PXFRyL//Og3lI0nZdXG5gDwv/Pdqe4eq6
         ZZTBJAVz362yuT/p/umNK/E5pgjIheLue++GI/3Gr41dxo6OK6ZHwVr06tJ1Nej9o3MG
         2IqvOZLSynEBxqTuZUTznKCYPxJBnG7bPIKyi1ixx8J0hcTCUSnXLWu/3R4ehlGjuqc0
         e64MsGoAZ6BQzF6DfebswPs13oXdme5CyTA/LSSv4BCngKsSg/uD4XrDh4fXlLBlgPMK
         UYg9C6/m6qXQ5U4yYWqwwIpCtCgsUyVxxLmVUcOKueccSYiu0iFqkFUrc6ZhsMwIajiw
         3cyg==
X-Forwarded-Encrypted: i=1; AJvYcCV2pNWXLdwOJudD/N9KAPxsqBO4fDppp9RtfzF+Rt/ix50QPSrvjgFqvGm+oITpR4Cml5iQI8rQNQuaF2lfZzcOToM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVyhJVk/udSpLSVbhk0B6j1q9urtbGPhfVttQi1CSoIvYuN037
	bqTpSxnr34CWBIsJ8Of5RZWBLTWAiE/QAMmNSYkcfkHNFadC+MMGldlRPgD4v5ZZ
X-Gm-Gg: ASbGnctBBC8h9Ga9/0vmrftk7NmEPkDGsz4/QC3nhv6hm6Myqrng7lV8nj5XUjnuzcv
	0fOEbHKtZIQciR6lgRoGbR+lbFDdoc7xeJI3FMkYaTRe1FWtY7y5EkhiGLW5uzCgOp71OjOIEiR
	Kkoe/KG9mrXChYU6NzYrW8h8+Mv86Fce+uWsMBohG9SzL2Vtz+WKFbi7E3dzfVPzH3Xy2Z0ZB7+
	EiEgmQxCEAiMCcwPzrSf9uRVhzZ/nin8rgI0Y7B8NxrWnQ0NM5wxVX2ed2T14OGK0rjdQOwhnfG
	T2rh3Gc835m4AEGi1MUmhashc0jAd9pDwX9TB1EAaTu/CDaz1Ar6psfwhgm109ZjpWKx7cNRy/9
	CAkOHok/jbpuUK4WNT1ARRDClPSVOme0rGkPa0fNkfXlWtD5OMC1lBfdO8NMnEOzCBUW5/8rZ2M
	rUomD9Q7xb3BxNLyku0WFn4P3W+6BsphtGs2UXIzQWoY+ucQqsunve+bPa
X-Google-Smtp-Source: AGHT+IHn8MN7aHPzUri7HQ5PYcVDWMJkL3ACnJ8DWvVuuwFwY2+WGsq0gsSIdcO9gAFpRIffCnG/og==
X-Received: by 2002:a05:6000:4387:b0:3e9:b208:f2f1 with SMTP id ffacd0b85a97d-425577b39fcmr2064735f8f.29.1759308879223;
        Wed, 01 Oct 2025 01:54:39 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603161sm26546095f8f.35.2025.10.01.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:54:38 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: randy.macleod@windriver.com,
	tgamblin@baylibre.com,
	joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 1/3] openocd: bump the openocd, jimtcl versions
Date: Wed,  1 Oct 2025 09:54:33 +0100
Message-ID: <20251001085435.117-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120100

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff8..2c07273940 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -12,10 +12,10 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 S = "${WORKDIR}/git"

