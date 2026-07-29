Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C005C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:29:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4907.1785302947411298830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mQUZQvMg;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so660224a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785302947; x=1785907747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMMlXB6RoZnoWYiMFR1ZPLx3yCgqgrs+micLK1hYNZQ=;
        b=mQUZQvMgz79qOeqsr/YF1VSzj8Sp5c3ADH18aje75GgTT4dlZxNzTrQ6ZDdH2srq6V
         nEJzMMQH3AGp2/sOrE83ZvYHYXLJ099lZYgdZ30rBGY9Zhiiiwy1lSGio89KP9EBJt5A
         W6Rwr208MUZb3wQMge7z8fdtv9r0zgXBoYMuHmMdvDkA8eyI4uCrPwO2KsKM2xiGz+D8
         pWqmEjk55oTu0evM5NECIRwFzAwpRswvg5ZLvklmOWp58lRVrrS6tBI4J7iE6BHm4d7l
         J4rSCqcg67b5qPgpS9xIcfO1SQfFyIQphs9MmKjJr/YKISku1R1s6Ngm5DPXr0yp4t7p
         Xw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302947; x=1785907747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMMlXB6RoZnoWYiMFR1ZPLx3yCgqgrs+micLK1hYNZQ=;
        b=k93ADwrH9PzPKk5Ovve1D3my8fxoSJE/vSQkrXYviMFKUg2EUygbeaCP8lbB7BPlnX
         FzE3/lzw7b9k+mliFgtad+ykMnZEtPo3qdC88tr9Mv88ZRAVmLr18g7FRK5mLaSwNfo3
         EayaimJS2vim5WRO8kIcPvOFlJoFV90/r5lDEb7MxjOEULvK1OYrQbyluWdqqEyuvP+z
         gdpDROVBlNimjyvVGu1fXSP+mHVCrNQq5wzBs0ipXI6KQHOWZsBKSt4Ru9TlpNK8yANE
         9xSHNCxcsh6wsvtydOMWYap2gfc10Odsi9STDoCMgmTwaWNZh0R2yru1LseKmfrwyhAk
         2Vtw==
X-Gm-Message-State: AOJu0YxQeg7Hui+xYsd4j453aStVL4ybL8NVAUGlc5HEG6gJZeAmRb4B
	R0+mo5mJAxWbZj0j2XmT7fAfWL6j47j6s+BHPRwsWWvgasN8J5GPH7jPDi6e1w==
X-Gm-Gg: AR+sD12ubFZs1tp0IoWdjl6AYAtPueDSGcCj9oPgJp80FV1MScK8HCt+f6nd8cX0s57
	/Ahequ8l9+v3MRSsD5G95TToIfBAUW42b5z0mryl3LDd64Bej35MKCyx+UL0LO+Djjl/+cadOsH
	U8ZNSynvG+sdmQwRRCUN6v+hei6ys4Y/cvWyqhxr9QSArrxTAZx0pJZVSmD8rHBbDR/oteAVy7z
	EKXL331qidO9/Nf9l5TFLD3inHdRi5iTXgo31Iv5tf3bX20jbo9xnOQtxYEYEB6bOpgSq1iWFO4
	4PxnqdKHMJttUAzYVPrVWBiOpLoCjVPNBdH3YNGVHF7vdIAW3AyGuHY1ZKWlkHV8JuMw7X4DDdI
	Whl1BVSSRD2diNj7oJzTjnpWhkzV9Le9zIM6Kq547/NriLvihHQ+4r8lzJE2ETv4cdGWtwgbfcz
	61thdkZ+N51lsnHep8DeWBMbF7r4AFpALo/MUaoA1OcbReJ3C/McovIgXoFxMg1x3QpHiRPrJsw
	19TWKpZs7hgME3j5/RWwHivOjE9mOlkAmQcQhnaBrAacp2c1xEdT60GmH0FUV9d2RW061ElFpur
	RcrI5u+QRe1hCiYslAaZ+OOLRqU3Q/nOm2TO5FYFo1SBI7eScj0wXizWZfiLELvGCLjwNorrFwQ
	NLQ==
X-Received: by 2002:a17:90b:2b48:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38f6a4e2861mr5713833a91.25.1785302946811;
        Tue, 28 Jul 2026 22:29:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm6097316c88.9.2026.07.28.22.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:29:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/5] python3-uefi-firmware: Switch to python_setuptools_build_meta
Date: Tue, 28 Jul 2026 22:28:58 -0700
Message-ID: <20260729052901.2147056-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
References: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128537

From: Khem Raj <raj.khem@gmail.com>

uefi-firmware-parser's pyproject.toml declares setuptools.build_meta as its
build backend, so setuptools3 is the wrong class and do_check_backend warns:

  QA Issue: inherits setuptools3 but has pyproject.toml with
  setuptools.build_meta, use the correct class [pep517-backend]

Unlike setup.py, pyproject-build honours the declared build requirements, so
the setuptools_scm dependency has to be provided explicitly, otherwise
do_compile fails with:

  ERROR Unmet dependencies ...
	setuptools-scm>=8.0
		wanted: >=8.0
		found: not installed

setup.py passes use_scm_version to setup(), which was silently discarded
before ("Unknown distribution option: 'use_scm_version'"), so the package used
to ship its metadata as uefi_firmware-0.0.0.dist-info. Pin the version to
${PV} so the directory is now correctly named uefi_firmware-1.16.dist-info.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-uefi-firmware_1.16.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
index 8ad195d7ae..a5d9011094 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
@@ -11,7 +11,13 @@ SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch

 SRCREV = "e202e576cefd1fefb3f510237bbd0aea8aedca07"

-inherit setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit python_setuptools_build_meta
+
+# The tarball is built from a git tag, so let setuptools_scm use ${PV}
+# instead of deriving a version from the checkout.
+export SETUPTOOLS_SCM_PRETEND_VERSION = "${PV}"

 RDEPENDS:${PN} += " \
     python3-ctypes \

