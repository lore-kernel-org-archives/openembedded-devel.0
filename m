Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297B4C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27838.1786651849292814353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U6W07J/q;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso2853765ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651849; x=1787256649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D98Bm8yVo4rYp5z+kixI2cpTUTtBCU8lvfALZrTKoyA=;
        b=U6W07J/qRS3kTs6/60KlaFQ2GwJFBdaU9o++K1Xblju16b9/Qv2ay3gAWpqqhYEO6d
         YJ/Ch8AJWpZsBhicJ6zzcdQtQU+a/ZihYNPGg1RED4m6t5HEmVDHjyMjB3wjMMNrB6JE
         WgqEZ6sjaTcx/hBiVDZ4XR8s6iFX7bTdT+ZtKSrGdu9yCpUIwc1heSuBMJxNfORB9C5+
         ra3LSlVGqaEz1cJcJY0GJ44xwPmnlNCdAopwVFeG0g1JT9UR8JGV9z69pbgDOsaTB6R5
         FFKMDlhh20Xp3foXYmuqGhdIQZZftazrPUHguvQElZjX8a0QF0W63ThgeoCz/rfMrsZ2
         Eo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651849; x=1787256649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D98Bm8yVo4rYp5z+kixI2cpTUTtBCU8lvfALZrTKoyA=;
        b=LzIWSNomfxDTbO4vtZYPtE+qPdAc7mJ5I5uoJVqUePKU4vcY3vEV8o3XRnA8N5YS5X
         AUgCp69Q8YZgnXv2IxCjCpwAQheNQEft9RJIw1eLzvmBq9WsDDboeltId2HpEotnK8np
         5qhH/8XxAP7bGGHXs1LZ6kyGvjY7kT/gUfhpM1H+rZOzgWCD7fMHMWAC/+807u3U9xV6
         Ho4stJRsnOQAK3PWKMcM75aqk30l8n0sqVaOs2yiCGJhsn1FfSWlHY2fNe6VfNWxnde/
         OP7PDwZ8VVu7E12foar79OOo4ilCxj4w0XyBRGOjXbD12G1Iu121+k+MbCcaC4BYId9y
         GQZQ==
X-Gm-Message-State: AOJu0Ywr5n/0vWPc0/JJXZxSJJ9dN0qYCU5XqheLU4fgFE9o6yfnEsrb
	HXz8Dqf5+MBf/33R//mdVhOKehkjY8OjuUgHnJcgMyrnFrbsHIUfmQZ9dRR9Bnqu
X-Gm-Gg: AR+sD10lls0c1b8CI1smBdgivTG7AlADHOUKQDISERZJGnv6l4o6tlOBMX3ZM1mRTRZ
	r4pG5yFmMCL1to+8gtBtJ/HvHSvUUUuiw8xmSL2PxrLU2xMet0z9SMyba0zS+aFLVMW3txjwYXm
	/RfOADQjB3iiniKp6NkVbpfkjJ3F1gqiMiioIRWcXZlwawvXwNcYnXj6bf05kTSOsMlEklAQ/Ff
	Dbf2DBw0Ow+woiYZmNfR1ckZ9jYSXE0+zNJUS5AMTg25zU5ksvq0aczE7nA0UF/wQZmiv0e6IHZ
	fbPRNCOPepuRq/0iOc8Qe9fdRHiX16TDC8PKkoy659DBXjZWWtO3qX5VUUuMdXMbYLGEPyP/3+E
	ywHpOFOhRb2Q4zk+BtvsUSxK/89SJ31sYgVjM/r1IXvk8xpKlus1CzzJydYslpb7nph6i/7e/r2
	GFxOCXtWPWFA5TLZfuLH6VkTr6Ld254HIgxO4w516y2YbwPnGsvh6oZodsidY1yrBB8YV8M3dM8
	7XJe/oCUMSig0Sfk/YQCFstyc5O/Yaa2/8jRw/yPCtUVvctYPbOsCMscOA+BnHO6lKr4G7iX6mC
	2/k3UjCR9sMpdMDaJb9r62ai6346jbalwx5tDQRBqHcodzc1oUB2VvNXubsfikbmvoAAHldhNXt
	ebCzT7NjturPAItVSkla7xs8rC9I65kxQDze+VuNpQdW/cw==
X-Received: by 2002:a17:903:22cb:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d37f72fad4mr93855015ad.9.1786651848482;
        Thu, 13 Aug 2026 13:10:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 74/80] python3-wheezy-template: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:28 -0700
Message-ID: <20260813200834.1302829-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129018

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
 .../recipes-devtools/python/python3-wheezy-template_3.2.5.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
index a2125a0a0c..612b3ff106 100644
--- a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
@@ -10,4 +10,6 @@ SRC_URI[sha256sum] = "c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392aa17bea0d885dcba735
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 BBCLASSEXTEND = "native"

