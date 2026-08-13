Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493ACC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:47 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27758.1786651725154197324
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UvqT1Z69;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e347638adso321619a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651724; x=1787256524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZCW+EjHMh8kescyLYdw+it/DvJIRzs8sPQHvGGuvDU=;
        b=UvqT1Z69WRmHUCXNnCrBovq1D7ES/053kYvc6qviXxdizKCBZKLfoAdLQ0HNqwcSWY
         28/J5oRStbKAz3MhOOCIriSKhdzJrvf/RlnN7eelRcVSfbozF8fY/+nYTdc6BeOww3BV
         XUUNq4uczH0IjPPa4nc2a/LG2dzGmj5HxUQkRgCtR/Py0O6wuFbxQUIlit/6/I7d4Vyh
         DesxjCPPuRN1A1qnZJrsMDygleGNDFJpUjamu+/0mDVLEkwJUtZje4nwD0pXTS7kiDnh
         8Xcv348xQkL3KusN8WjrjlCgCn5RCO92kulXhk0Ny8au6M1KPlzHM3scenEvV5YV4lcN
         Q9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651724; x=1787256524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZCW+EjHMh8kescyLYdw+it/DvJIRzs8sPQHvGGuvDU=;
        b=JG+hTgmQZ4JTVKEN1O4ZckA693ylWifa4fYXMyOpNX3MnV7puqviyksoZQkbX6pjRH
         dE27LamIClsHNQ7xmiPbGwK/tZoPaIKRMptGBHqISO4wPVGMOu9LPBpkf1aR7fYHQPSz
         jqe0y2MGzNN3l1gkSqZz9wsOn8yFkYX1yTZHR51g6FIc3YFZ9e8wFxBbrUaj65I3DfCG
         /kDJoJoUP13zyScJE656PBEA26G2OVqHljCkz5NggE4UhabYEG8y7VpxL8Imdb/hYi9C
         MyCYCTAZRIKOCx1x8QDFr+axYg49DWuSFSVRnN0DvVoyj/uKAN884yxq/SR8/gMOgudS
         i9xw==
X-Gm-Message-State: AOJu0YzKKfEiY1R0fcYoP94RrsIjGEQgGylUAoEkmp8ttwTia41KXCVS
	Z1x1kNNdstus3O8X9/rX1OGVa9hvwF0j6tggvZzQ4gKAHNpbE2h5LEohXOfrlw==
X-Gm-Gg: AR+sD11USrv0SvywSnrqjQjGETO1Ja4e9xT41K60nmJuh1/0ukC99vTDfZVxWgApKwb
	3oIfdh4C3dD0dTSrn3nANS6dM/HTuQcgR3/8aImDxb8NNE3ZIRo6dDvIAQvrd+ZAcnXWk5bYrP0
	6Cyk2HaCylbcQ7KPxTHIBCSyeqbdicoWt8r3CtgXD3Ohasn7UHQAmhk2X/SA9Zw7Luxacy8tT8m
	gypK9cDzvWXmyVUXt0CiM4FfnV96tIDm8MRqJvR7RGGHlbnwj06dqEr48CyHZhMvfFsfJCWABIl
	gYKg04LLqWpfa0cnK3kvTz2Eut7vDuVC41vREwTlJlIVa/9D+CikOB75gOehVt/tfiG2m9dBEk0
	POzX16AcozQwIicCpiMc7F/UWxvnhIqIZMFdAnO42yVCZ93XLw/a+CjjC82DuaihIE41aflKQOl
	cbbdLwyUnwHwjACDhF3kBcneqYL8BjuqkM3RA4Iw0UglxP64GWyk9pyPAZPZ+Ls7IvDVvJr1E/H
	L2md1Nc3FfC4IlahrPp4V/exVL7vjnnp/AIIEHp4QF2WvCVrd8spCs7WT1Ba2ujsAFVYxAIXfm/
	VhRrMr2NUHDGUmAdCfS4KQWELwywghOiWbqW+yciTVxEedl+QeJ36ln02HpLBkF5B7mLgkBj1za
	w875bZ1cNOTAFK9SEztKlrToxcFktDKLIkU1U/ZlsF7ouWfOIpAOZR6Vo
X-Received: by 2002:a17:90b:4a11:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3933bcd866bmr462412a91.21.1786651724420;
        Thu, 13 Aug 2026 13:08:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/80] python3-psycopg: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:17 -0700
Message-ID: <20260813200834.1302829-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128947

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
 meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
index d6df529686..7b8bdba690 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
@@ -11,4 +11,6 @@ SRC_URI[sha256sum] = "5e9a47458b3c1583326513b2556a2a9473a1001a56c9efe9e587245b43
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} = "libpq"

