Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA575CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17722.1763014854152842961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9oH3G0r;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aad4823079so402009b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014853; x=1763619653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx9HmwgHjOOMI3Y+NlDQPb4zH+mHeRr9CM6E14k+Mgs=;
        b=j9oH3G0rVNGEwHmHKRzBKnp4wehenBIlCK00QIC8wAj4t7w5mohIzK1BAyZSXAheGo
         iUxPnvrPQKzhslFhT8xkt3ApHJ2hki7ajmoijU9AOqtfEoCgLLDkkOEmAZgEmspXSxUt
         JMqWV9B7Eex41jv5lqWJt0SCFNGHUQWurpkr2pUSF/CTDQtaKviimUIgRWSKly8reY0+
         JL5kyS1z0GRTJadwRWO6A3dGfqVOE2bAJdbF+4D/FdKMBmlqRg+RL+n22zoRRwrChCUB
         bLvZ/1VFzVRKDHY0IK5ugOB+odEu68NEXvphFBSreNjBrW12V4UrLc4RP1X66b4wTK0F
         1R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014853; x=1763619653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qx9HmwgHjOOMI3Y+NlDQPb4zH+mHeRr9CM6E14k+Mgs=;
        b=MQNGmyJazfADN8xhU5SaLYSYB/rBB1V6qm8+0U3hc8IA6tJVzWKd/yvjI7D86WvM1D
         uAlQrWnXc+t63rRbcgVzkPpBATPZh7/uwSIBZahD4m4/Zz7/oMQTqJac2iw4M+pLtDPT
         vtvoOHR3W9Yib95b2PYqBNq7OmTScb8O9W6kdEj4DYjHyU3PKMKtLYrRBgZUmQEk8F1l
         YV2oxNZLjUt0/r8R/CqH0Rf76BMoSNbe10xxyJT1GJRMt+/4bLkDZLLOEW3pd4hFWcoi
         DvPRXuJwyrTQNrXPol7K0SIs0UiujtVA1KLTOe702yhF/2uCItyc1YzUFsn0oyNd6jCC
         CtJA==
X-Gm-Message-State: AOJu0YyYw0+a3+MU0HnGTZ3YjvubuiPE3Zk79dDzjJYGf9NqwmTwpBuZ
	brSqKac/fGww9UwhmqQOLn+6gJvDoEgOTCaDBd39NwN7aizS9OE0htG1iP0tGA==
X-Gm-Gg: ASbGncvV8PYFixLDuVFjiU86yEQXW+S4UGaNoNx0JT29fDSIh/dUQvrcdMVMiwbI7VG
	EAQrNYl0haW/S1iJApKhnapJR/35ZxnJGUuMuLBg4lFGi+BCVhGdWf4NUB6BHIPCG1pbg/GM1in
	1KeNqHVC0El+Xu/+juL+ZEPlL17/lgMnXG40fAJUR2lhPtEi7oyjT6OwOrLRTrXbpV8xIkU6tEc
	hANXVJQnMCO3EOd5EShgWn8jV209jhCjiMVSKnRNyGFH7sKxaw8un5kIrxOPW0O2kP2YQNKq0eq
	6J8KqirdYIm1SDulkje3hqkRSSYsq12PupBS1MQvcgWvYJlFNjlaK0Vp6JZjhsDHGwPwol+8Qdk
	OC00OSF69H0dL5+gAn8JyhwqlBZuotkwJq1AM5fjx2Yg+hJmPg1VGDOlqcgkSXFgo2qWsthQpxw
	f7ItVQZF67cNd8Gw==
X-Google-Smtp-Source: AGHT+IH+xfkSEEZhP46OS8TF4BCDFbsHtxGEGRDQJb2VNfCAhuIiWXnnwJzCftsq2k/l1625f0ZmAg==
X-Received: by 2002:a05:6a00:3904:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-7b7a4afa415mr6158672b3a.20.1763014853408;
        Wed, 12 Nov 2025 22:20:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 28/38] neatvnc: upgrade 0.8.0 -> 0.8.1
Date: Thu, 13 Nov 2025 19:19:03 +1300
Message-ID: <20251113061914.3756301-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121626

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4485e2ec712731df3869f9e96c2f04e1352fbae3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
index c9c4a6c27a..9065050c62 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
 
-SRCREV = "46432ce8cade0b54a38d4bb42eb07f96c8ff49fd"
+SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
 
 S = "${WORKDIR}/git"
 

