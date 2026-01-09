Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68164D1A636
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 14:17:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10911.1767968258521787732
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 06:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WhiqGkn5;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-431048c4068so1883610f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 06:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968257; x=1768573057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mACK8HkCV54uFCrYtQfaYQVrKGlERuncp5ccPf7jnD0=;
        b=WhiqGkn5XY6pQCBCuq2zQPHEj89g3W4VTWjzSGpVVhaPe7vNGyBbxrOpZJLY5+Fpqq
         L/YLrvyIp2wHxmdPhAz/E+WWbobBoEoINHz/HYc73UssF/1Z4u/2IM3uVfRNMDwk9Yib
         ZuRJl2FUnb+JpX0wy+IUGa4tB9fjSL6aOeRKSOV6fiyXWG83brAaa3q+18zeISPcAuou
         Je1K4suPZNYbePIRoQW5UDi47rdEyD6t8t4+LYa148rZaOz7nWa1bR0QVLUCKDO8ldgk
         giBnqUyJgKMi95Mkn7ps4JAEeetOv7kKQEXenjzZFSQxR61hCM0ZnerHB5mexabsu3zE
         Ggdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968257; x=1768573057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mACK8HkCV54uFCrYtQfaYQVrKGlERuncp5ccPf7jnD0=;
        b=cwe6w3RBFUeZRzKC8p+6uuw9AxhZL6/i0MEMIlyirhKTXgj7pEso9BLK8GBlRLUygJ
         KU+hEn1d4ffGTZyaru1PKgLjUSZm8V2kSG8L4a6d5MhBMPP9dtuwBLDqXZWRIdO5MW84
         5+jpV12PQzE+32v15eoMdeU2tYFXsOEWD4yvSXgosQsAnXk4TAOyu5xAbgiFJvuAHws1
         9SoKuF5MWIDtxxa+DsLxeZkmg5AJ5jFbZ0JP8WJjhQBH2YAdBX5s3zK+UGl/5ZG7/hL0
         CufIn7Rh1odjpSYip3QSL1bRMA88YJezhwt96/hi2WPiWf18SuxtKQ2prCBgmHm+5LrB
         /UhQ==
X-Gm-Message-State: AOJu0Yz/E/xeTR67yRNzjDVC88YonGhAUk3Gagpk6otVdzmzSYDz686I
	PLMFrn4LHeaYLwqJAbj9jYvT6uhSwlu+SWN/+ln9ceMR4CAh9ZT3WFMfFNba/w==
X-Gm-Gg: AY/fxX5rByWmIMvhQbPefMLyr4pJioBCG3XQH5z4g8TDWQeqQogiZS5xvSt27eYyOL3
	r83+XOt1hqEn9smbpfGWRGUAAiKi4UbBEY9Hv1rLKh5A22GRUsoAkwrYqTLSdmYa24gYwKqo9ws
	15tfOY0FMrV9Sf9PaAZO8kYL/QjL1XNOLc3OA4XOc8cFpAnbCejFBcr3L4ib9gg8bOxacQ9c2Vs
	qNkwnW8dOSp2+UerTHHoGknut97JkyiElmGziqziFAiD1cyJfGeoaS1bSAqpb+uYYely6QV+kaH
	Ip4+iprtY105HZ6SROfFvodPgWu1TbXenF+8d8hYd3Ogx41+Dt8DWvrmtCEh/pCWlkGfAeQTZf5
	snRO9dCODrBumOx18TUrWrIVG5bRaYBuSig/m9YHgKDYYNrlhEMJe3xgI38Z3siiZnMV8t0YU14
	0vkD3yxilGTOyQErRm7TI=
X-Google-Smtp-Source: AGHT+IFafr0komUu9DQscHISU1XPebOtGvSEvPYGBRkiauCiLCka8/AGZR/Y30+/YL3EF5ACLLLGQg==
X-Received: by 2002:a05:6000:1a8f:b0:431:1c7:f967 with SMTP id ffacd0b85a97d-432c375b00dmr12536813f8f.17.1767968256671;
        Fri, 09 Jan 2026 06:17:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm22686384f8f.35.2026.01.09.06.17.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:17:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-reportlab: mark CVE-2020-28463 patched
Date: Fri,  9 Jan 2026 15:17:32 +0100
Message-ID: <20260109141734.1596725-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123303

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-28463

According to Debian[1] it has been fixed since version 3.5.55[2]
Mark is as patched.

[1]: https://security-tracker.debian.org/tracker/CVE-2020-28463
[2]: https://hg.reportlab.com/hg-public/reportlab/rev/7f2231703dc7

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
index 3ea47e355b..6386f5c3b1 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 SRC_URI[sha256sum] = "0457d642aa76df7b36b0235349904c58d8f9c606a872456ed04436aafadc1510"
 
 CVE_PRODUCT = "reportlab"
+CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
 inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"

