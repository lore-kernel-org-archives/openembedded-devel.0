Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22905C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28072.1786651722085876728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hdxE1rfZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce98cb8165so2025825ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651721; x=1787256521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnjKrE+OFd2b8I6tKTvPwlLUd1XKQk2fYONs+2WB6Jo=;
        b=hdxE1rfZ2ftSnJ8kl/K5FnpfWiHdZXKr1j7nIHjXFkKMrs1VegHqLEcfDvDFQDGmOs
         Iw7ZJ4PcyGHOQ+5FZOH+4bdXOy/Z5GJ7SLi6uasLsNdJLMp/Jvq4ELCQCFogP57ZE6Aa
         JtMObIP7g52rxrwtDsq7Y5QHO560I+lQ2EXSERc//SQ/wP/hyTUduGpB4AnO3M1FsFDM
         CU6rruXae/M7mFFSqyRKrhqWbYDfArijzGCg/XQFb9BfQUG9uN1XVdOWJqKfo7+rkT5X
         I+BWlzMU2rwSOmtJpRPGt8O5e9c/V1rZ2tQ1jlWrhfYgw32Ift1yxdTl3bdiHHUzvL9e
         +KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651721; x=1787256521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnjKrE+OFd2b8I6tKTvPwlLUd1XKQk2fYONs+2WB6Jo=;
        b=O7hWY3dE2no2QtkwzI9LvkAA+lsxyX05lej8hx24eaTqSOGdya9sJhpmA9yBn8r9fD
         oR6fHDO8jeqVg1U9H6WGsSsIloAyAnTtNrbP5MPHOOLc2r/6cK8NTC3GfL43/epgatSv
         /8zdWNPVTI0o52DDo+bpGLDpM9Efs4JTaEPuDODjg0bY9GHOY+9gnmgH68/oQFGJ0rru
         PFDpibHhpeRgcY3zYcmvOcvEKL/1UsNiaKnA3f/ndGzeLFpLBYrk/b2O7ItRNvwYT5qe
         LLECYlcTK/oDZYYL4hrp8uAc1STSDtv8I1x/QQ5BAxVsalhmv6c0b77U1/0QMFhMl4w9
         +y+Q==
X-Gm-Message-State: AOJu0YzLHFD7NYIkKLaODLIHK2uM62N3k2mc6t156zVs/7BoZPaKd1bB
	XwpZ4mKvmjuPaYpJoHRH1RBrLbg+f6qU0H9bWVoFeV/SRIjFqe8MFH101caVQzk1
X-Gm-Gg: AR+sD13t6CaI5GXl/mo8o7aAmRmkkRiInrQ7oBemnJzRo8l7iMcFDWbtnnwVcBdLg+g
	HCsKZhspu5iCvmrfH4Fr4UztwD/Or8KnR8s0KEYDT/VHluY1Vg39gckv53d2bd7h4qhyBk+c8TH
	NmBi6n5O1NGLPzEqdBjmy7qyh96s/9cvJMOyINDn67alB6LT6e1fkZ35n7kgeV3e+l3PUXLhTZu
	rtZk+BUkyF596xtPTu3qTp5yWK60liGxTeXgGTyuiqwGlAvQk2VI7WGbOBLdDuLcv4xA0+ON4yk
	6KLYeaYlW7CRsedY+SRUlva6RyhVKkNT8opVFtDo7QiuTXVpxy+LtQrs0yZk8MRNVdRWVCXImhD
	7VKGtxVSPPTXmZIk0BM2xkOOHxXcrKxI0Y6MB3Q+qcf2RmejjlmZprLQa439ByaTzOs/ENSkpB/
	rSHIYeeYXIxQzYEsfAXnm8JJyNP4YAPzY4bI9To5BaYZWCdeZs9nlhik+ZPxm3AbrsTRrjppfGR
	fykkHyUN5AZ2gwAsyDld74bu6wAxtsFk9e6uNdSXQV9B2xySfMtHPvWnMwhDhsiCqc0bY4QlxPb
	vImNCR0Sm4oOBjqSmpENlUOgIGe8247EhgVVoIyC2vBNSpMgdWVacdKp1UFv8FUZ/KhmXpQT2mj
	Rb4Tt0oUMaMJ6/2PF9Nfp5wJRHAlEpX3NthgHRTxM/wcFT+6YeWidBs+P
X-Received: by 2002:a17:903:1110:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d37f72f2eemr82000425ad.10.1786651721314;
        Thu, 13 Aug 2026 13:08:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 01/80] gpiod-sysfs-proxy: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:15 -0700
Message-ID: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128945

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
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
index 6cababfe69..57f4a7cb8f 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=b1008aa4e86ef6163fc80a22d1547bea
 
 inherit systemd update-rc.d ptest pypi python_pep517 python_setuptools_build_meta useradd
 
+DEPENDS += "python3-wheel-native"
+
 PYPI_PACKAGE = "gpiod_sysfs_proxy"
 
 SRC_URI += " \

