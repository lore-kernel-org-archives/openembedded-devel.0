Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6532FC5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27833.1786651843937561335
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rLPBfSOW;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc73e322dbso6264375ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651843; x=1787256643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GwBt01LhmjVqQVc8PWX2rlYbUYgfKW0YKwECbmkGXE=;
        b=rLPBfSOWHyE+ZNXc2LVTosCvlA0zrl+TVBsPJ6J2bdTrWArD2U9vmiI2gHoURoGN7U
         XOA1/PfZK4jHsTOQ3kBGUIghk7oKMsmx1UZ87+xe8OfaGc1hDG+rJYNInAp4sk5ULziS
         KazWL1o4AdidSVTB6nSLHXOJIaZn9iGetHTmH2X+BO452wF/g/ODfNU1DYCE/OWpEc8U
         zUMUHzCBRCky+gK08776Zc2pxLbRMySPv/v+ehzQmF/QFApGa/+aTFFJvF+9tpNEParE
         ATlch27CKMW/G3SDRxfuA8uG1NFQO9/WfEpZjv0Sb5/Ueg9mosUVsQy29U4MTq1zkcNE
         jOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651843; x=1787256643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GwBt01LhmjVqQVc8PWX2rlYbUYgfKW0YKwECbmkGXE=;
        b=CFLHhI3PbSCeKCiNuJ9jys7aquwBZE9fBudyuB+9EIhlO8wS2A2UEgRzWZCq7Zfn45
         N1m6LNnc+nbe61icLpQ56VnlirhUlKYcoco/yyvod1LFxEDo+45CVeXW6fEtIrOAS5S7
         m0qTRwzGOuzXQKSUXgXa7WxiZ81osnhK+cbhiXZfI2tBT9SZ9Om59Edif7RvLVKtfOB5
         eIfDLfegQBCQas3RClkOmZFmeJ2s2A9NMppCsw4NQs91OQPKuKGxZ6vwnoXdcbdtlqjW
         1mQIOhqTZtXfzQwprf2MuqOiArIGIYeIOiMzaAy42DiDMtX3sz0E2OgdcnZPcpWV9/yD
         UZ0A==
X-Gm-Message-State: AOJu0YyeQXifC4obPgaIiMlgk7jvO+juHNtHQfnwoPZ9kQ0NwrYF4xOt
	MIFq4XX3vBFxcbJQaRBBG5wQpsf3JFBnJanDH9JbXJZ0n4CgIekRUFsdyvvJCg==
X-Gm-Gg: AR+sD13fbzP1eG/PVyS4lKSQrscKiO1YvHnxcMLyKhg39KMblzIFK+aHs05/C+pY/Ri
	/HhH56Lh/lzctdYGDCtSZnOzqAUVlFC1CBT6T32OkNbMkBi/JVcswo2GnE+XG2RM/mTdcGHQjul
	6y1qIJ6mwc/JYLY9zeUFwQKyyTCHtcasdLyGy+eQWueDrDfeslTk4HBZD/IsbuPHRN4zz2nKphZ
	jASrraU2MUwtKOE6OgUFgvvPWocKlKHb7iW9gbXVfBz+MuJJFknHg6Tr5ymvOFPWTqbU7cMP4Au
	NASqZaug2IjHrWtLAQgNBnhbx1dnbUseeyYFqxXZi+5Fkavjk/AHUzmzF/ac+vdeFivalE8iNrQ
	QDasqCtYMR0XRR2bxc8mU5tmKpR6CG0PBxX6deJEptGaFs6yR+P76b58yUKmXSMpXFAPANYHu/k
	3xIjrtUFVRvX3AESbDtfRIgJ4BEBz1OY3PdzyqPlkiJh3yOsl8XKOBYl+w3cbTpbs8roPVJKm2E
	M0zS1jDVTsJfAL0jXjSbJOzlzM87w05Qk57sYexj/Ujo29lKN7eKPEu3quh+5NteemQQJ3JSozL
	5zc2e4jOs7H/2htwoIXKg3yZgmR+ETfWCXv5e4ToEN9ipfGdLuTg9TAZoWM/+98qiOXQdHqh7oE
	onA/ciahMkcKiSDGDMGI8c0y5PpTBidkl1bZYdcftnEdoBw==
X-Received: by 2002:a05:6a21:4910:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3cc71dce3e0mr367109637.9.1786651842968;
        Thu, 13 Aug 2026 13:10:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 70/80] python3-toposort: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:24 -0700
Message-ID: <20260813200834.1302829-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129014

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-toposort_1.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-toposort_1.10.bb b/meta-python/recipes-devtools/python/python3-toposort_1.10.bb
index ce903dcec3..26a049f559 100644
--- a/meta-python/recipes-devtools/python/python3-toposort_1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-toposort_1.10.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] = "bfbb479c53d0a696ea7402601f4e693c97b0367837c8898bc6471adfca
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 BBCLASSEXTEND = "native"

