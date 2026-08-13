Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A356DC5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28106.1786651768214049503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X3iO1wzY;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso308510a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651767; x=1787256567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nl4qnslmsSTGPBAs7rcD4EJ6efHWuFZP7sStwMs8RKU=;
        b=X3iO1wzYcU7X466c7IBK1zvlNFdCe1gf4sVymqrHlMlI49mXSBMo9Rq/UdDbgNAVXj
         3wbOyIijDIc5701XVp6jSuXVlucMWqP1K8B5F9dOXKXmurSbu1THwNihxIYGmGXfJXMI
         si0mcVWIAJa9qFTJ6NxmdBBos962UIRxtNMwTkItP2wMXYWKsEPQSWFRgKzypTj53dMY
         h+UQL4RxzGNO2zyTPTsVAT3SW6DD6VhZlAeDUbEmpBMTXfj6c99s+ySyCQFlxQnVLp5K
         XBiXjbmGZ9AHnf+G3WTepKyYUnV48rtSpP1XGDaFcKH1YKq3PNRBjxQWbo4MhwQnlVrB
         HLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651767; x=1787256567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nl4qnslmsSTGPBAs7rcD4EJ6efHWuFZP7sStwMs8RKU=;
        b=JxWYxl0GsJZRBBI0mOFF7mXht+wbCnoaw6rZYFnhOJEN/azYFENLG8XOYUiZ/m9sbE
         iknUdGSHTExS9qhTd1t3ERYSuXPHP7uZin9dx7CTe816SjUIKcsAef58Gm8rcqTgSZyU
         PA3TwjWqUaNtqY47/9pb0DwVsYnRrRsOCTmaY8N2v7LDPemHVGNoC3uZ+nF66GucAivi
         0BI+ynA+wuPw+qXhAudphCcRImouqLwWguXJDwzsKugQToOWQ8c9hRyGxXtXyov7VxyP
         DeOuIQSGzk21a2/9q4bIVEUq4M58ZNBol42yvD6g/q2mVV6SvM6O6yL7PquTaJiGHrFW
         oDnA==
X-Gm-Message-State: AOJu0YyHw/nHwmh7/PFX9Ko/kS4lG52Zsd5Vpl5GMZ81iwNfDvI1kikf
	ackHCCQnrBKWo028ELa2FVeVdmemsbv0NBynhzYTDAq1a1g082h1tefjNsc54dCC
X-Gm-Gg: AR+sD11/AUaOkFQhoxNTIwTu2S2z3xwDrNwxXW3USk+rPIAW7iO9PfXnnSO7d3CqJbt
	OBsVIcxqhh2uA0jdvvhc0NRS64CkF8fKNwYznYRFxd3Z5oh2+Zaq4Z2Akr4O70rubuHeYTnNqAc
	To84Lo+bfG4UcF+iN8F0uAldTHSiJZX1eswLghW0UvAOZx2PcCiJoaAaFabmXZuzB8EvPWN7imq
	FfxpAUV6GGPlitQEsR6fFgGpXEerbG8DbZAIc+2ZA6aSfoju2O5JCQsyuvwBHog7DZvK+xlI5BW
	i0+N4pMwleZHLC922IUessm+yH1hVKEOaUWYzKNkm9gW8QQV0i8Iu5dr9HqSKq/lLxDlmtTfPiy
	IJhnnC66sUhF3I8A0/ArxUSv+kL46FrOqMpr/uLqUW5Jr+N7X7qGTbBu3tDu3HD8lrrsZHmCA3H
	wvPexK/fGjiB12c+tvxxI/pRKRMKGLeoDJV2ZzI/tP556NQtx3XLdqB7/Q+yPiuUnk2wGxEUXRa
	bBHcdiZ+JFoNOqMr5SVrwXpg5fnMuE3gO7wSoE4iVxWsETwukhFMBJcAOnFlUFz1wFJLj3bc3sM
	kCPTIt/GrxnEcCaeZdDx47AAa7Szt3Kn4wWHS6/iWzi7HXIIxK3YUoxYr9TyGhg647Evhy+CbIt
	7WQ1byfs2tMKj2ZVyQAy35+mXzphkbrYldgxZtFmCuZnRiA==
X-Received: by 2002:a17:90b:2805:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3933b7c8671mr686061a91.9.1786651767562;
        Thu, 13 Aug 2026 13:09:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 27/80] python3-gnupg: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:41 -0700
Message-ID: <20260813200834.1302829-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128971

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
 meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
index 38e5b99341..2f2738ce9a 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "3fdcaf76f60a1b948ff8e37dc398d03cf9ce7427065d583082b92da7a4
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} +=  " \
 	gnupg-gpg \
 	python3-logging \

