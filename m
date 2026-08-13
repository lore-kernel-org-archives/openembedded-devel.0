Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851D8C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:59 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28134.1786651795232468086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kZUOVpzD;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso126322a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651795; x=1787256595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZp8FoXVZ/agAnW1zppAoCnf4E2fAnWPHWZewJ5D37Q=;
        b=kZUOVpzDO+K6LVPUGn0qn/EnacX0UENz+hEzxwE32MbkBae//qnW02mqsJLjtc4oOV
         /jdrJcgTFfj73ILGhC0jqChXMpRiLmoppLyfgigqHK6F8ZnDY6ChYCJuQwjiL8GL/2cq
         COGaxhIZcS7YvINZxgULdvmrfU7pqwG/tWwhyGPI7xTpSmhp0Cf2SSOvSux8M5oZic/L
         cwuLs2XZV38c0/GpBLxXDZUNd2WxZwR4nRcuKWK5A/OwWAohhCMN7XED/rjq8TBBS44h
         Et7maX3dJ+D9v27mlj8Xk+qtjoKlH+Nx/Zu19XtTENZVoAFLwFWdiNySRVpWq0bCR+lH
         33Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651795; x=1787256595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZp8FoXVZ/agAnW1zppAoCnf4E2fAnWPHWZewJ5D37Q=;
        b=H+x8+gr02kEno5y4KCjOpvz2G/M1HwauveconHEqndwTpzh5gsBvUtL1GtnBzYxidg
         OhVzrDrNL/shUJeNaw+V0WAxc2TpMjGlmLXFuiwjkSeOXgqcePRMas89/tfFCI4XuYGZ
         jsslgPrHPRaCBrHf/KRlKIhoY5qdOvvi6+0cq0peLCRGdvLqxz1e9ND4p3v4gXsVfkdw
         uu8ZlJaScz7dgab4BudjOSWz8+Y8tc6tUQAGr3NL5bw2uTy03PIGWxAB7pUiXHBU5w1a
         CBDXKWlCgXLTnvtlwijrMsHTZNgpl9y4MQDkQ9pNUFfLiVJihYbXlXn+46sMSR1YP1Lb
         dHPQ==
X-Gm-Message-State: AOJu0YxHjtru4uD85ommDUGcssLlIlNnHJCyEWsuurVt0BYK3xgMtn5A
	MejZdDhfNCW/i7VgIrCgHfx9mTwllNadVTxm9+WxRmGNAxS2F2zjsdYvPwyow2dh
X-Gm-Gg: AR+sD1387NJv7l+qzTo3GgMwS0HY4tNO1uVGuy5GcXiSyRe3flZaf7iezVtsgPDrzDL
	Ad2TDVcMMoTWC1lqjFhh52OjpJ39NCG+h0cgPXjfVI7ImWLu31xZy9mM1YW6mVeitTfrCx8nm3b
	Mykwi1kkvZA3JHxRJ7PXmITfm0HyuoDEHll3VWMHyMHiQK9zoY8pAmeA2ZiMUUvPPkBo+doMdHr
	q8FrmAT5m9ck0ofXvN5dWCvjMpRq5hhK6BBzP2jXVXwW3Ye7gb0QCUmVc24Q6bgfcHLyk+RdUj0
	qOzGpmYB9HjwhUMB1wuL3g2Jv3kuEHnN/e60T0+uS5iBVnNTHeZR8ec16tjupWTbw4OW0mLA4C1
	tAP3FgcTGpZWSbPfO4dm2kvwMgc4gPioNbIYyknm6gfC2vFMC31NBNF5/pAOkkt+N0gI8XNNAXX
	Bb2piLx0ojXC8Fv5mkwh1mfapZ3s96bE7PcMcFe9wJzPrRO8gmtD8ybpMJ1/3MgztHNP9V9AOt2
	4nlxyx+30i4x3SwEe7QD/MuDy5EoPss6cdT2nJjd5XQqIjzySVeeJO3sJ49/2k7PwudVzVFoE3A
	R5HsfLq12QffLCwMEhmI4cGfiqDDAyMfH+rQTwBfDkws7HrdOXnkKl/kceQRsu3JBU7P8bCObPS
	/s30gJBn1vbZ7z7Jkd7B0f7jP/tNCXZFK7kAZ10s3F+fBg+nDDhSiWa0P
X-Received: by 2002:a05:6a20:d48e:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3cc7196e77amr411094637.1.1786651794558;
        Thu, 13 Aug 2026 13:09:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 42/80] python3-mmh3: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:56 -0700
Message-ID: <20260813200834.1302829-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128986

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
 meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb b/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
index 5d4030f46e..4d9be9a7b1 100644
--- a/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=53366c60f8214cfc1d3622ebacd141fb"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "bbea5b775f0ac84945191fb83f845a6fd9a21a03ea7f2e187defac7e401616ad"
 
 BBCLASSEXTEND = "native nativesdk"

