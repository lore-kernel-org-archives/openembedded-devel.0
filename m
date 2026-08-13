Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F33BC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:30 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27823.1786651829040178874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j0Ubw003;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1296033a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651828; x=1787256628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hC6zxZktLCSzPRVKK19H0uDDxgsU50WIwy9lR32uIbI=;
        b=j0Ubw0030OI5adswMPj3SjQMTKJ9EylCSTgCDpWZj0vpYZa06+FPO6X0fdV7mwKvDW
         REdd431lALVkRQuZ1JEtuWg9qr0x+tMlO53Z6K7nTdI6f/ERfzO3Q0xpVtN7gjWSls5z
         QtClXy/2f51COXmTPAFBa6z4fdZ4KfR0ntH44uDlBuS5Cr+z6WguBL94HduGEQYYqPFu
         wkN9rdseN9brN2hi1XOes5r2HSkEr/dueFOSAOaJ01Jc60mOqoUQ/Wvqepu9kkgl9CEs
         imZdfoOY4c4Cni3lphjzyb9aZPejY7pMKUpFwKkIU4sxljqIhKDwTbRuaZ9KNTmzgBUv
         4snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651828; x=1787256628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hC6zxZktLCSzPRVKK19H0uDDxgsU50WIwy9lR32uIbI=;
        b=OppT6XhyeYBzWtgkqe5rUFh+1Sorpb/W9+898G85QCIoqKUfZ5+RramFWmmPPw88s6
         4vK9sMGnbm4tvjxIoUM+jO8MlgGZxZxQPZdyjY+kPfYJiqRAlMIVoU13bTpfuHP8DWXb
         NMPdOHLeOaU7OkfO1Y9bBw5dMPINX42CYJj8Y9GO5ahPFoF/E4uHrK06buNXZFPJunLa
         Oc8HlPHkpvDhDGuRLdhyozXkbOBRh9mAZUz2Pi2y57Sf4Bn2sMlPolRHy9DiOf3UDJgT
         eiNarFeFNvptPPhApdYpCpuUdBT+5Hr4NEkiVSeNKwTICse97LdPVqCGUZTTTiIlFp5+
         XOiw==
X-Gm-Message-State: AOJu0YwTcaxb9KQ98+yfUzrAEdeJvShO5JHq4mviBNacx0SwvUGNDrWI
	DMQINqMNLBfU5GdLTebqZHeHfDLPMY1/7OmDt8Dni1zz1ci0vZKcSgj1L7LEhA==
X-Gm-Gg: AR+sD11Bc+sbDKAEumCQaWeSpDC9hVP4AtRvaXr5vQT0nN2MEaABqEswE3DGwNZrh79
	OW392ve4cQTaGWTlWHdjdaw9QFaDmaYjosaDLrQ/bGtX+c8OQwlK4nhgKdSf4ebg6AwE7wFbjyy
	Gst1in3ykwpH2uB4rgnKSHX1DiasYpc4+kaSJ3B+aIX8UomnFBJ/VCr9ZNBrig/1l1N1LiXN2Z7
	GzArqpogbZNmPPVV82yxzymjEbZtoYtnAh/erTnG5VcDUizB6eRq7J/5Vh3DNaO4jQMFpYEr3G5
	Byhjtmx+hQSq76NmxESC4vlJvG+sEv9dKoC2EairZxJIT6/ecfmezGQCUU8Ug7TzdFZkDjFTVd6
	zsw2/QblkimDesNfAxJqlRut8kS1WT9lgCiAZ8y7Eoj9CRPPZcNcbiFp1Q5tncoNSi76k+ygeLo
	+Vd+7FUk59QznYCTYTuDhITNK8L2VuXidv1ekMUFmMoNhl+yL7gTtavesRyiqFJ5iNhpH2Vj/aY
	g9TBv3e2v7kDCAaFN6Xx+EWyYJHLimnn3wUBJ/3UahOe9CmTh7PPwTZNWcVFimuf8ar8ETHzWiD
	fkhPczyzuBL7oUBTkIzhskEYPCB2M0mWlt9RVZJx8Y2AyvnyUdjV4MSWAMsKjrUMvFPRfTacdTB
	90fDC8gqrmW66F7ItSRzRrczmJ/ly3jTpuoY6g4qrYQNo6Q==
X-Received: by 2002:a17:90b:264c:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-3931f47d73bmr4914271a91.6.1786651828438;
        Thu, 13 Aug 2026 13:10:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 61/80] python3-pytokens: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:15 -0700
Message-ID: <20260813200834.1302829-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129005

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
 meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
index d0c3875eee..cf692089c3 100644
--- a/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627dc9a75d5dcc4759b26bacf13a4c46"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "292052fe80923aae2260c073f822ceba21f3872ced9a68bb7953b348e561179a"
 
 DEPENDS += "python3-mypy-native"

