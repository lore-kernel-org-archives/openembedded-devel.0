Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2EDCCD180
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12426.1759309014173376269
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHoy1x+9;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e29d65728so47135675e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309012; x=1759913812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=NHoy1x+9cK/1KVijXVpW7o3PEMEECUqjir5e4owmK9C7yL9syq8Nb96ygVfWAVIX1I
         16xFDsLlRw86lRVxzeMjx+uYBFavI1oHVcPWCtDDxi3phDP9Yl3BVpl/BW8G41yesVPw
         kyp6nH9Mxul7NpB1nK8Ld7uhFXAiUTsRgMKSFSGJz4WhedZIYKdhUbn/EKllvmirkTa4
         elsFvTQsdDmfxuY1QBeEgFZCJQga/iK3MN/yWs7L0VdjFVt0eZuEWEUn+2nH6DZaGnmo
         Tuqf1+CfTg2RN5gldvqkdVAYUD58+/RoHHRqayuEfLAIs80YkwzP/qsUUhHCCbebM5va
         l1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309012; x=1759913812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=es0O2ttlv7kAfWakgTNKcDIQFKgvs8312DcFRJ4zRXxwcxSyiLqWqNkbbCpe9qAYLd
         I2mKyaIHbmhLeLjVfon+oDlC/3b1WSXrvhtCYNt+dcCa0bbkRRs/F3S1/uXTfPeSuhjk
         YLatcwlgaRsB9izWBBVuzQ8KZgicMjC37vRgXuuncdHvFVw/KqpjB2NnxhskauTPefkL
         lQgLgd/MCB+/bHeKG36TwEG/toJq0ew9FAS22AmeNUu0sMmtohu0MeJC3QNOz2g0Ej9b
         54h9YKA2tdC8lQJM5mqLPERq/rNhsFXDo4S4I+vRRI/T221Na+VGeGmdStmF4w2pEpSb
         3crg==
X-Forwarded-Encrypted: i=1; AJvYcCVkPtDmZNlQCb2RGrwDvyUF9FMdRim6NU5/lR3x19RMwS+unnEkbX/TvSb/w8S4fLtvOvEaLlbHkFN4/K0A9FhvVLw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4pWetigsDsCZYy2d2XhlYSz8rFcHyiSKm78gjq7BQvVm8xsMs
	WECNCzQYASE1oKV+/i33KmUjhGcYLC17f90jd+n89w5+8XJZYPrdoIUg
X-Gm-Gg: ASbGncsBndA0KP/Nzl2Tv6l8GerhAe4aorKWSkYF+aityr8Hh6yc2+QQbmH7fWMFTJ+
	cw9HsheClV0z727xXhRcQTwGSBuaeqrWHMfMaEeIbVryOjfCEKeesXd8IXD+dTI8LEOM3Cx3JM6
	WXbH697PIFUIs0rQTu6SxHvXpfTtZlX7eUCEcWxe34NMhQ5GQyC1/HXAIThnz2YvfdqW2Cs+LFR
	Dpx3JpxORvjuEdHtel5bRU6zgiNn1F42oVeXOsC74cecHa80bVgrqgz+SMYtZ4Bh/6V6iNUwLAV
	D6A+5ZbdBvEiSDrqiad9fqI/bTRYOkyMJfCnhhl3IiCAB+Z2MwbSrJ18XEO8gE40atfJcPSn58o
	SRHmc+8XToDLeOTZQG7hlao1zxwxBUeGHrB6cg5D1yk+s8VdYh2fAtZgKFZP+7al4zI0FUFvS4C
	oau8EU4LCjQbM6KbC63ctgcqEksMtF8lakd4UOGwph64isJA==
X-Google-Smtp-Source: AGHT+IEerSG4K/XZCVl17Kq/zUaANKOoEG2vGizNU0aEYh2GzbQdwNej3YP7P33lXdHoAXIfV4Gx2w==
X-Received: by 2002:a05:6000:288a:b0:3fb:ddb3:f121 with SMTP id ffacd0b85a97d-425578191afmr2019845f8f.45.1759309012464;
        Wed, 01 Oct 2025 01:56:52 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603381sm28236126f8f.31.2025.10.01.01.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:56:52 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: ivitro@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Joao Lima <joao.lima@hbkworld.com>,
	raj.khem@gmail.com
Subject: [meta-oe][PATCH 1/3] openocd: bump the openocd, jimtcl versions
Date: Wed,  1 Oct 2025 09:56:47 +0100
Message-ID: <20251001085648.73-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120096

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

