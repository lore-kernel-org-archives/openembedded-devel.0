Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39ECC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27829.1786651838802556436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FWV87eta;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so4121385ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651838; x=1787256638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTe3kjg22E5sO4/EceJtH7pCb3UQ20XrcPsId0LcI4I=;
        b=FWV87etaRoLtVV4nBOLIMLLyaMWlYDB0rlpDFzLi2lLMsJkH0dB3HSYR1iDPi0Pahf
         Q6MTviX6cCwLijtf1OTr3YAQ2sxyYlJ9jCD7FOef6+AORAJlOHuZcozuWArngHZ1Bovi
         Vpp0jSivQktBgqzaDUfO3OCCzGP6uhOJIbIQ6NYAlZWzE50SdPjEkhyE4Y8vj74MzHV8
         +IcRksq9ucxE+tWsJj5+OY376kgKqaYOc7aoRiFDFX5O+a5TOzIvEh39IWiPUHfKi87N
         KlDi7HiUjPE07qoMc3zslDmvUtPe3xeufi1MuX0PLgEi8gYAZVlfAODFyiZn23jxMDdG
         UaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651838; x=1787256638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTe3kjg22E5sO4/EceJtH7pCb3UQ20XrcPsId0LcI4I=;
        b=bEj53D739Nikcm063aVRr5geMuZO/ZBIz5BPu79Blk8Ira5mO3OXbEwQpoZ8uIUmvS
         XJUtcqGBR/C9zaLVxzN3ehXqW9mpKUhwwOjRdU/AEt9+KJRowFpIMHQg8uxRi7glil+E
         oduhFGVaWFT3K203eJ3EoN5p6Dr1gLlpesdZld7uc1+ZxP3KnVcYQI5DCrtwZFVMxper
         V+qkiA/orE9RBYPjZrsUlronOSiNPZqphbkOaj2Q3E2SBlvCcMgDfc0UGu0+AenjWEEr
         G+JuJ8RxKVxb4Exj3AFy23JEW6XbnebrEkvrgejcKGxo5f7SqExL0scKM/pm7jTQ4dyh
         rJVA==
X-Gm-Message-State: AOJu0YxZAIuNxxf1zcAcCiLAmqLwNFvl9X3Y7CQ4xj1tlcgmUvanVRpg
	SM1hzRVRlEtDDzEuA7I++M+sdycsjRu4aqV6v8LavIC0O4AnVxUlCRrYI8AIwyIA
X-Gm-Gg: AR+sD10twjqCYQN4YyfPGFneS8ZSpQIVU5BCkou1obVFREtLg71YaRlj+oNebadsgf0
	QQ3RZuEAEuokxPhadnodSJBh0flQx0e2/Kd7Y01s6B9UdX2MIHKqTWpHfO0f6pZp02mVppYsAuZ
	2SefaEmk6Q7wlg4yd5veMF52wNRmYNCeMNJn2mo75iQfn2+9vNxT+a0bxT1cyofCAt/UJOErfwa
	KqtFoc6K2yMajut/r8CiGS3qMZqZWmpOP1fmeneuH7XPsgBbPpTM4JcITNlU/Hets49JQ20UrOn
	4VSBsOik/bVfFB0PvMRoW3I0m9DIDvDPwjZKlO4PqyariVuH0aIwxt5BRPqPG1NinrGcxeMqaBN
	FIdYa5Qvi8GybE37IXRshs8Rn/uujRGCwg03qtjRLoQbnewRt2tdBaS9Bub7S5UPchnUGHs/tZY
	zeCw6eNeQD/ETjZRk0QPQtyf2DCT+JZr61DBqEZl505YBCeQWNHI6tPLLQLdJ9CarzRp39mk0wB
	0byeP5g8RGPCt7lPo7yLd17X2PFfEVNzoM7FaczHf1NM2+GSiCA+P8phW7xV4/bCDB2jFJGKNZ5
	ZmR2Kn0QOWZB698hiGUkM+b/SHF6Sk0s6dmvpLT87iubByT/Gr7rCOZZeZJ7lhIp2BN7NrGrShx
	BW15byQXm+YOyq/sni+80TJZbqL2Roh2mES0/aTembeZhCw==
X-Received: by 2002:a05:6a20:6a10:b0:3c3:ac5d:b6de with SMTP id adf61e73a8af0-3cc71d55406mr358409637.22.1786651838084;
        Thu, 13 Aug 2026 13:10:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 67/80] python3-simplejson: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:21 -0700
Message-ID: <20260813200834.1302829-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129011

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
 meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
index 3f7ecf7696..ad6a273a80 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "\
     python3-io \
     python3-netserver \

