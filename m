Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F382EC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:44:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34609.1785912237327266958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EolJ9p2H;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so684007a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912237; x=1786517037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6lzgEl6QIzSumdR50gkLISgC8nXiSxDOroGwyDUzfI=;
        b=EolJ9p2HZpqPVYtmsMcRHPGN7CkvO88hPAuAntQBsUod/T826i2jysVacVFk1OrQOw
         IfoAp6OLQm4jtAGj7uVP8wBPNJhbMETaj/bkBy56HqJJlQpxwTNr2SKrlgDxGUO4bF6S
         YLTPnqflRx8RsPN7ig+HKcrZ5IXagVMK5/JfdcmGMn5qpj0et65us5oFVqtZJCRsIAb+
         dxTYyUJNqEGUdl6c5pIuRSNKEKRJPzj6ek1zquXCTal2m9/c1pBEiiLuTcNmAlfuwpLv
         TzUcaPy7TNGz485ShHRE3Plhz9Niw2bEkc9aIRfPo9Pc2x2ePIdVdpy/lqPa6CHJBZ4i
         JMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912237; x=1786517037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6lzgEl6QIzSumdR50gkLISgC8nXiSxDOroGwyDUzfI=;
        b=LYXOqlNMj56XCqJPIuH5okY7jpBC0iq+tlpVIxkcMucUBT4L8K+2n1Q7WG2euzJV6Q
         7bOUq3vMk1UzU2SO+FEGXJT8mtR15uZhq9EcZotcay9Az7m8NmrO0QATpljdCgno+W0p
         TiwCRVP80FNvA0w7vmNcmOzzqGy5M4lGXrv8FHixapL/wX4hl1kwHTQTSK0SHdZXbHOc
         AnmqBf9tTuSIY/qXtzYz8TGOqpnr3e1Os48GVXIUdmm9CqqSqgHZbpWM4o+FVfUkMF1d
         WRJq70EpTEeAdZy0V4J7//5sbuxix0SAYm51ptJ3CnL3ZmrlYzsMQvM7JFWt9PFv21M2
         GmiQ==
X-Gm-Message-State: AOJu0Yxbrs2M60GHamoUp2QIR0UdZHGR2z8/aaogVjBGlBNq8GCIbqZl
	ET01S5KKm5xioXXacE1fZj1CrM5U4cMBBp2s+mQIyUx9xDlol9SXuohdeB0G+pwR
X-Gm-Gg: AR+sD13a5NEhSWSB7zggIIMLDPfnkcMSPjdZ32ZkXbml/SBBTM5kRQAIhBcjEM7K8VY
	T2eNv2CsasAoxfQTiPOps++pk/WyS3+gTXWKDYWxnU0Zs2u5TLw9XdcUqsygbxbcta40bJkZCoE
	1ld33Xxez+Vb+0yG4ZKtXceT28EaZM00c59p2Oc0g+HgZ6lWta40WxG6V449FuzpbR4ktT6fjaF
	3xWZAMzoxU9nm1LBPF3YmqsApb8Eu+fT0WlVIBRHZqxqVHgn8+9AP2cVGh3vRoNuSZ4D8lDOWtG
	UtEQ/QCwLDnEdHAVcrvV1Mwq7zMaIW+gCXC0j9JDGbniFP0xw9IqkuTgRY8gHTmbhI90naBbWnb
	qgyTNp0KIpqf5TtN6BCFKmWLb/xNwVm7eNpiAg1k75mO3i5DsWgEfVa+aDhtK3Xs06hf+dY0KvY
	yenTPFJiXpOF/XbW61pBaCH3/2GycZnvSmDQEhljaN9oStI2xcBlX6p/yVvcJfOr3kXakbDXekt
	boMWVKDnxHg+4v/kQERMF4oJupmlqBfxQIbyjhuBKIT1ll9Yhp6UL2am3XtnhuUCM47B9hZuAQQ
	kdg5PfBTOUYqRb6Tryvpxv9L3tje/9KTGMTXlsk3m9mK5BSeRIDYKS8BJWB0Xs/OFDrkkFQgxAj
	J9Q==
X-Received: by 2002:a17:90b:2d84:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3903c58ece8mr4612566a91.12.1785912236562;
        Tue, 04 Aug 2026 23:43:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm9892246c88.12.2026.08.04.23.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:43:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/2] python3-cucumber-tag-expressions: Use python_uv_build and drop the uv_build upper bound
Date: Tue,  4 Aug 2026 23:43:52 -0700
Message-ID: <20260805064352.2945950-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805064352.2945950-1-khem.raj@oss.qualcomm.com>
References: <20260805064352.2945950-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 06:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128800

The 9.1.0 pyproject.toml sets build-backend = "uv_build" and lists only
uv_build in its build-system requires, but the recipe inherited
python_setuptools_build_meta and added python3-uv-build-native to DEPENDS
by hand. Inherit python_uv_build instead, which drops the unused
setuptools, wheel and setuptools-scm dependencies and the setuptools
specific do_configure[cleandirs] workaround that came with the old class.

The patch capped uv_build at <0.12.0, which the 0.11.32 -> 0.12.1
upgrade in oe-core invalidated. This bound has now broken twice, and
there is only ever one uv-build in the sysroot, so drop the upper bound
rather than raise it again.

Verified on aarch64 for qemuarm64: do_compile and do_package succeed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ts-Relax-required-version-of-uv-to-be-0.12.patch | 13 ++++++++++---
 .../python3-cucumber-tag-expressions_9.1.0.bb       |  7 +------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
index e389b99fce..7016aaa4b1 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
@@ -1,15 +1,22 @@
 From 5cf10b111d61f00db2b3d9c8c6635fc31f3ceefd Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 14 May 2026 06:43:36 -0700
-Subject: [PATCH] pyprojects: Relax required version of uv to be < 0.12
+Subject: [PATCH] pyprojects: Drop the uv_build upper version bound

-Core now has 0.11.x and it fails this check
+Core builds wheels with "pyproject-build --no-isolation" against whatever
+python3-uv-build is in the sysroot, and the build-system requirement is
+enforced:

 | * Getting build dependencies for wheel...
 |
 | ERROR Missing dependencies:
 |       uv_build<0.11.0,>=0.10.0

+Raising the bound only defers the problem to the next uv-build upgrade;
+the 0.11.32 -> 0.12.1 upgrade in oe-core has already invalidated the
+previous <0.12.0 bound. Since there is only ever one uv-build in the
+sysroot, drop the upper bound instead.
+
 Upstream-Status: Inappropriate [OE Specific]

 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
@@ -25,7 +32,7 @@ index b0f253e..b39d0fd 100644
  [build-system]
  build-backend = "uv_build"
 -requires = ["uv_build>=0.10.0,<0.11.0"]
-+requires = ["uv_build>=0.10.0,<0.12.0"]
++requires = ["uv_build>=0.10.0"]

  [project]
  name = "cucumber-tag-expressions"
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
index e26f20ebb8..fea5a6d6b1 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
@@ -7,11 +7,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=134f1026f0de92fd30
 SRC_URI += "file://0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch"
 SRC_URI[sha256sum] = "d960383d5885300ebcbcb14e41657946fde2a59d5c0f485eb291bc6a0e228acc"

-inherit pypi python_setuptools_build_meta
+inherit pypi python_uv_build

 PYPI_PACKAGE = "cucumber_tag_expressions"
-
-DEPENDS += "\
-    python3-setuptools-scm-native \
-    python3-uv-build-native \
-"

