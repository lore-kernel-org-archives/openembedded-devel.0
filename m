Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C747C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27778.1786651766782150687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i+HpFv7C;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so2033495ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651766; x=1787256566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vN8u8vYJVCRJL0iy0C5iznKxyDBw23/zX2/NQStRuW8=;
        b=i+HpFv7CcTpjDcYCdZwTQjTrbgq/bo41X6D37Um5f5ra/dfFOWRpxDBUyRbgAIssfS
         DmY0yScwhBNbSNTNjnSGQr0QNU97kuD124owbsG7AnFYrEoVdA3CcY8HA0Hd5+rcmIZr
         0EXMTszRjMf/i6maCqVsYGYFW7+eCIAq8RogTf7/qAmA0Rn8heXkfNFfZKGhKGnk8r/b
         PvamsRGs+RD8cPtigGj50bke1H5ccE0DNSOjCoqFTe++M1PvpGxh8isHtSgZsvub8J51
         HV4GSGO8QjbniWJyEGLEpmOPClLF0TttRwaHU2C+yXwy9yH/+HJkjEDe0rjohKxCAOu2
         WUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651766; x=1787256566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vN8u8vYJVCRJL0iy0C5iznKxyDBw23/zX2/NQStRuW8=;
        b=GoiP/8X0sYwhC5PzBrqQFXPZy3dn9E6ZDSMD5sDVzvNw4cVKRScIN2grVL6PxTUPy9
         7fNtV2tg8tSMqOqfZ1FygwqJucIZ1uY1BW24ChDOWAg9BkRw1wAWQwTVTuIqWeMiu16c
         XiEI0xZQgILcJE8mdKywpiP2THqJueLTtBiRxdAUb9e+74Sa3nALWGcAAxa/0UAnebLg
         dHVaNQ1Ny5QAUEjT1k1iFYnC94dI8nJhA8S9LqjILyk4Tp7Bnm7GtN3erMDRhvNEb5aU
         et5BSdhiLnJpt1S7i7wJAbXpjxJBJQf1g00ssLuK0Yg2WyQmHuo2TF8kMf8htOdRZV0X
         jATA==
X-Gm-Message-State: AOJu0YysDK9gEDpiPQBIzTlsmy5aA4WDDi7d9CoHmKtG7wCXHsbyv5LY
	zHdavebAk8qZ+AGJLr0gXdmQBYflUk6EyGrO9V0LpQYdXlCvOdlGLNYx2pLs9vfz
X-Gm-Gg: AR+sD11J84yg3pzpVBHp+Ka2l+EdmsDGzK7vnZkPUNat/5XU1yDm61KMPA0ywo4Rn2Y
	n9JLmGiMkNxnpIQVkxiSwnEpuqxryjSXfbaTFpMV033TjW4U+09hloce9tw96/IMtBHAM0zp/uL
	njKRkTEgguT7zuECFVd3AK8/AP1U9RpMfj9xDlvOUWXgGyvz7ZYz4hOKyr1fvfK4d6zhFEjRckf
	DVVLs3soyv3+b1wMq+hNEvE1tRWLyA+l4FEw06U/63wMYTNmnvCgbnLj7WAtxTTfjp1BtASHelX
	r68W+MmFpudAFrUpxfejXTv27vQ2g4QK2Te51GCM0O/qM2ThpE/qeiJpwUkAzwA+0S3f8uJWLCd
	st4ocuUjzoZzQYaSehQ1Aa6QeiswVN/XHdPPuL6+dZ0qm29VryDexW3Akux17XpxoLyQwMrmFnu
	ymJzd76Ycid9X95FIW0D33UnaGtNYxr/EWxHo4NaILtYlrvTtQUdd+rYxxsGGOq9vlTo+RdXlAN
	pj9qnar1bP5bByMjFX5NysFCll5GEKvVafpV/QtZ1VDw1KgJHH7ufTO+zdV1SydPwwacZPjbn79
	+P2Nmk3KwG8c1icGj6+6F0DX8yeE/pl2o7ASRBzRKYgvVP1runHRGB9fyVx5gXcpnGbNugtDIAA
	RIe7ESIWlOavPOLAZDSJtUiSLH2h6FtuxKW6tNh+85ZXByQ==
X-Received: by 2002:a17:902:ccce:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d37f7c2f0emr98670405ad.14.1786651766076;
        Thu, 13 Aug 2026 13:09:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 26/80] python3-genson: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:40 -0700
Message-ID: <20260813200834.1302829-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128970

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
 meta-python/recipes-devtools/python/python3-genson_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb b/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
index 51b9c90f31..6cb4cedd9f 100644
--- a/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
@@ -12,6 +12,8 @@ SRC_URI = " \
 
 inherit python_setuptools_build_meta ptest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-core \

