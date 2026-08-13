Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE70C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28152.1786651825840936761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kmeDitlB;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso6013145ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651825; x=1787256625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBE4KH2sTw530pX9ixWeif3XfCDtOyv5hldZcePFEjo=;
        b=kmeDitlBKq8jdjuCfbMqZwbPL4CfLViEyCumBjryCXNTEuDyRUDVWzwfEikVJDV+rD
         SFPeMdz1zKe2kotc35BkbTXa5DeXtqdbTjyUISYvZZFSG1xG1Cap3IpXJTy646IN96Kl
         qfL0OxUHZA2/YCd1FznTe060OZBSGLZBH93k6S7ZYzZ3NE9qocX+LzSDlu5MtPPikRs+
         bABDMgKhh7AqY1s3Isp6b0LNQARCnX8Q6a5/3L1EZKecW/axrhDNOXkH5gGHNpR0Ihrs
         NB3EwUdPJXbKooHAoHVKG/VQl8gP/zTyaUGGbm0QBy4BG+BEGg71mBzyCVOTGFXZWtYI
         PbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651825; x=1787256625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBE4KH2sTw530pX9ixWeif3XfCDtOyv5hldZcePFEjo=;
        b=pp52LrcGllnmJDTfEgwZlPVD1tjh/Rk2tOsc713njFM9To1HCcCV04a9BKI6yYRg6S
         jJbvWKbeDAAysm1Ka10DRox9dVF1RbXebb9VcO3/9c/QHT4j628nIVe8ddAU40wY4S1P
         4fEJ+l4T0Ls5qFzc+9Hth7IkLBEvtGgMnCNJNdUEPxoblslTOUQcRtXLHxOllmNiiv1N
         vyFgO+kyK7nALqwNCU9/r9OWr+FUtvthXLtY659tmLZ5aQINyNX7FypUDST4VrNYPtbJ
         8TEGq+sbWItPo/OXKZJYeuLRuTdT0nB1gWsMDGm5FlbmRQGGj1JBbx4eYb3bRY8QINSE
         KFXQ==
X-Gm-Message-State: AOJu0YxHWJscpJuetf+o73yyiFAlpliYB/JrHjGrGN9y4pZ1HCBtnZmM
	xHJjLQdncrL+GT83dQcf44/ktbydCYgT6YvYjM9eDkTOPzz8t5rHSksZh2sQOdmm
X-Gm-Gg: AR+sD11nW5930BWVK4C1g9u5kWujrlmC4KsSik8hGhKra5g8szKIPc+8je9DbxUYt3A
	HPJm/nW5mhz7akjVyhSb5XrnOw7GmEXgLHgD1n72cNQ5isM6uTj+5yn+kiifz0KugiecePAfTJj
	3Uy6LzL3Jk2Yoep9Y71meqrQunqqXv3Dy9LVVMCThKR1Gej3LTa1uQtHp2e/CbHgJOLTGfeHz3l
	R/tiIFv+Kpm52zFD5tJxTNmM1cn1kwLOu6/YBO2rRQHJ2ROJbwAau0v9e+bhhybnOwenWM+Iac/
	Mjs5s/NpmUj8iq9xoR8mP+opkNUGVWHWlMsEc/xlpgbzC/IztEJTg6JiCP81JRfajOEIbFpztqe
	sWfgCqv9a/I6USh0Y+jgvc/oVcpo3NznA/vH4W5XDEHDYkSSUCE5/cCv8rXH4HMaB+FR44FgIZp
	UDs/53C+9YnO0HQeo42g2mUzjSi5Zj0zMMnx85uEByPPJbAAOPd8ARXF1xEUzkwKEmYJuCm2HW+
	T/4I/4cTyvdfa7DsGiQxzOtjaDG8NGYJuY/k+7J0QlC7M7BKs2nJWomkdXMxtjkHKaBZbndk4BN
	zaa3kF+5TogN5zFLY67VKgjjDNc2Fug6vUla/3hrrXcm12oH1QPyLS84eUd8LdFaFTgWnBOaaZ3
	CCcJ1gNeBqxCkZh/zYocyWqjocGCS0t0Pi05gj3NFk7nlvw==
X-Received: by 2002:a05:6a21:e8b:b0:3cb:eb06:ce09 with SMTP id adf61e73a8af0-3cc71de3b98mr295009637.25.1786651825076;
        Thu, 13 Aug 2026 13:10:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 59/80] python3-pyruvate: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:13 -0700
Message-ID: <20260813200834.1302829-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129003

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
 meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
index e05b63587f..e322d5abe3 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
@@ -23,6 +23,8 @@ SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-defin
 
 inherit python_setuptools3_rust cargo-update-recipe-crates
 
+DEPENDS += "python3-wheel-native"
+
 # crossbeam-* -> std::sync::atomic AtomicI64, AtomicU64
 # not supported on mips/powerpc with 32-bit pointers
 # https://doc.rust-lang.org/std/sync/atomic/#portability

