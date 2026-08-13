Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264DAC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:18 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27770.1786651751929058680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFwkp5hm;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso167132b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651751; x=1787256551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qiS4ahyZgNuUk0+FB5BXEbbhwJK7hBAKitUJ5k1Acng=;
        b=XFwkp5hmjbxSn9dKBKenh3a37JY3lICp3hqjQlilKF5gm/q/NkoYh1r4yutpK4qC3O
         1bcuoKOJ+8a2ikjpF1HAmMMVHt0/Q0BcYzBoLOMycf2fjpN5WFVmCtZ8QMy9gMsFEpX/
         NECIsslO8Mt+huRmdImm5Tx5q5QJSJ1m9rkAO7716a+D6Ey//yQIJySKB4cX+MleHRs8
         DKaOi0PzqNPjzCG81eq64WocCJ0c5VliXnUhy5qgERqHisueuuvit6dyQf82R3RLvhav
         QPSfIzVyq4iMkpV/rAZw6WDlkTIlApK2kyJhaLD6z9F6S4eNPqLPT1JVwL7H2Dw1mqaZ
         OatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651751; x=1787256551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qiS4ahyZgNuUk0+FB5BXEbbhwJK7hBAKitUJ5k1Acng=;
        b=LLvB3mTqun7Dn/mo2dGx7rt7hA6k11wGYe01cPGRKqdoDGchap5RrO8q+GaICD9fqw
         2tjvVq7l+ga83exSW0bNSrc9AngmQBAck6crG8QrIRYrwwk/tvrvvhFMIObgy9Wrizz1
         bdhV4NwyFXZpBjO0tg7MPD3f8CqN2CrCK0w7MtsxbPPyHeyhyuIQvxmPBXrx2vjC9kw1
         W2HMETxY+/DGAG1mPAmtvMvYgvFRkelpZIB4soz/XnKXr19fUAlpwD/HAJJE5yBrsFsK
         Kr9025MZPoywLoVxCfUSMvaSJSI3aUtulgYXqGmeB7RgAvIbrv/qJZDHx7pVesdV6cot
         0TMA==
X-Gm-Message-State: AOJu0Yyx/G6qR2fVHWOfxz3lMEfrM3E0WyThLU4EVOB2Wtk4QAc4Dwb5
	WPs4jpJO62Ck6KAoWlN1KKjvYw0oZh6z3rPpOYhp5ApOqmh3+0s2R2fqdJCdVaKR
X-Gm-Gg: AR+sD11RnN1KpTf7Du+VkWA2hW0EFqXrqhKvqtmqDft3LOUfX/fm1qSlPGCpMAVdoml
	KaWOm3vtLApFXH9JVS3wAIcjjWGhiHs1f893hT/uAr+WMbNm5I5rmkj6iDZIOQsWd37I0mRPG1+
	yf3JHiZjZdgv3JDuIeO1Dzc4iOQ5bVFIQSPhM91hIPMqZ4662CnbOigTpjiSHiudRt0iz7PhXZv
	qOq2OCshuSdZo3rOpcvZHb7iS/3uXEsXTU6KsfeGC/AkTKtfcjiQLWngowwvxB4uM6SH/07uxYF
	Bhiy2OiJtKyI2uTCpYNR/iARJtnlu2st1gQhzQIcRRtyVBjGfnYhjBIWNLVse/Q79FkgqDSXWgX
	L8D949iT+U9zR2IIZ8iy1VB9VT5NoH8a9GMb/GDynuC4xlnfY9sY+q3NBfNF9AvCeNEGAW28gqm
	ObbYESrCDqRMVjRw0R991Dr0pS37fm7JOfdBpcLp7oSKNFOYOi+mwC75I0/n1J7rkbS7NYprFQB
	eNwkGnKUf1u9uCiqrdzSbLEiSlBjh0KduOynT2hiUHD1yOhcLooANS/q1xaRTpyHLbWX3QfHu0D
	Kc57+ffz31mcJk9X4dwN3W2aV2ljml8hBCKasArDDr6xI6/sA9qD2K0xush5zQYS8zoNmmo57t5
	4+wulNJsWjTX9BrYKRDyA1WUZJPjElS7nyeU9lRW4Rdhr9xn3pYjGqMFd
X-Received: by 2002:a05:6a21:6e8e:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cc71a89da7mr434562637.14.1786651751162;
        Thu, 13 Aug 2026 13:09:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 18/80] python3-distlib: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:32 -0700
Message-ID: <20260813200834.1302829-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128962

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
 meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb b/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
index 146803a45c..d094186236 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f40
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"

