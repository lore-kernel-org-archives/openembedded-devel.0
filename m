Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49941C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28096.1786651756302297604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OXx0Xju5;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso2833145ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651756; x=1787256556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S53nlUm/EkCqqJKIrXVdbgAiPFd44ysKNV9dpbCpdeo=;
        b=OXx0Xju5rgk/p1uaVP7XzitXJxnwVCwa9yGfOnpdq2Hkurm4Pr+x9+QGXm7FCT955B
         IePXRblK4zyOLIpev0U5bql1MnNmM4R9Nmxb1A7Dt2ocSGFdKUlFKa/GGPj99t8I694V
         biEkgPblb3Ekr1805epFWRKK68ji3vm3RVs9Kr/X3Hg2f02fbm5j+DYea07dWCgBSYxj
         Nb6QKoGGwAjruBfxYPD4AdM0VMS8wc0qS/YGwlDgixW6LfC2hu3I7v1JsEvZlkb/Ldqp
         M1RX7P5IWiky7313+FTTM/eWin0hBCj5p3SihxWHvXALee/V1TBKSJc4jr/3mjjwV75l
         66mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651756; x=1787256556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S53nlUm/EkCqqJKIrXVdbgAiPFd44ysKNV9dpbCpdeo=;
        b=YqiMilMYnYU2nM4X/jkKuTbez4YL8wxUc3/VpIk0Gul/8FBE+6RAcqih4eJsO1ons1
         2jv9B8NfnHo0fwpZK+9PFtnYrFmsVuUJlBtGQRn9urxTAHgsIJdBswLYULRqon48ygNS
         m5To+s/IWbB3CJhYTNwQDpckSAk4+CCHI+STOpeLyoC6tCfF0sF+DO1KIk2/cSh3YPEJ
         MtAaJE9/7KX+S7t3NcznvjceS0J5daBJr1SCjlwLv49I2izWpImyicfkOPSb0bf3ZzBb
         MAwKt5JnIZnuKrciKit6Yiz/+uEDXo5p2zdoNZQlH/nrVksWVWKnRPzGBIC/YzvqCLZI
         SnPw==
X-Gm-Message-State: AOJu0YxIFvtgFOODHEz67AHeC5CWTn0Lr7p6uAGcRjawGo89ZFDxDlRl
	6yqaXP+KbUCnu4Cdf4gyScLM5oG6/wNLXvHmmFZIQ6Mtqvf88jCsFrD3LrGi2F9S
X-Gm-Gg: AR+sD12D/VspVMddtGaG9F4aBNvZ/EaCanokCNJu1ISMVm2OcNulwcs73hegSePkdEy
	lTTnDUBK+TRSErWXUJZkvxv1GLM3X40VaJdDUsLCuTo4HzGlqnlP5TddXMXwsMhdivyuPXn1fnk
	c/PwiqUgNjlE6jmaDPAnScyu5z72JCLioh/OrwnEAqyyAex2vSv8fbKGK52zM/wZaarvRyy/a5c
	HwKCVgOJJjPfuJ9R5MtQE9iRksG7qttM/2WNcDW/+Q7oXd7nZDaynlJYO0WX1sQnTO5iC2/qOwt
	bxRHO5CONEQOYJqKOTcxSRLGd95PC0Ho0I+h5qAOx7J2cNnCO2sRWFUJXB4FjQpp6flVgMkPBVV
	E5hCZtcDoPNxFKs/pfQGAmUIMJEcoHNUwA+06Rcqib4gqq03dTCFIosrUVPqc4c7CiHsoXFBReJ
	VNt5jYMe+MZdrIkrjR23BbCJ3bGzVSrRBgaEGOrTqUAyNnBm2VkNLRPCc5XVlsf/w1tCwtpE++/
	imlw4NxXo4OglQXaZeF8sbxAnPu7N06rawcfTFmka3DG7SbXSB9mxK7zow55opOIDObB+KdWEo2
	f95V+jPdystodX9Ap7jcVSzxk5paKY6Ie0uEwc7maWKp/+8PyfhHZLVUhHxfrXrRwr1ro9wYuK/
	pK8hBm14Oe6olNn8oiwCYuOpqzebOj5CIpt9+jx02BYtw3w==
X-Received: by 2002:a17:902:cecf:b0:2cf:7ea3:7cf1 with SMTP id d9443c01a7336-2d37f62b91emr95489115ad.5.1786651755471;
        Thu, 13 Aug 2026 13:09:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 20/80] python3-fasteners: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:34 -0700
Message-ID: <20260813200834.1302829-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128964

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
 meta-python/recipes-devtools/python/python3-fasteners_0.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.20.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.20.bb
index 05cf1e09cf..ace821c79a 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.20.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "55dce8792a41b56f727ba6e123fcaee77fd87e638a6863cec00007bfea
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "\
 	python3-logging \
 	python3-fcntl \

