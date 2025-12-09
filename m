Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFC5D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4141.1765274215864986958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cPuzGeL1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274215; x=1796810215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sat+IhAkcT9HF+VDFne4lt5yTUaTwevGHSRvv460Rdc=;
  b=cPuzGeL1SfRfeBwO5WYwX1TxtGn6ZId7tnSe4m9BwMvq+FwPcDg1LCCg
   uqcqWOhhVy5PuY/fD2vlqDUaRvQdmoQVhpgaR7rsJNgVLjnQFUu2oG97z
   Uz5N/1w0cr1tCn7Fy4xAZqMPN2t0P2aIdc+LjcnPV4sq3dY3toPlxkkC3
   CRv/rI9pmQZ9M5wVavtCTaG+Y1VXeKrQCss7gnMjfO1dTmozrZRPAe46m
   8ATRfW8xqg6zPwl/HH97WMq6eA10RTVtru9x27I/K/UYTkq0AmCOj1P2z
   2RY2MCNPQ1d4peaXhFwhHGVJXVUgJjSS51rkckhPpKmWa0sjwlLdvpduL
   A==;
X-CSE-ConnectionGUID: lTNx3i3WRhWke0krwxcRbw==
X-CSE-MsgGUID: IJli2QDASAm3rOG5JIDeTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222613702"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222613702"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5AA61C006C1
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:54 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0FBF5C00406
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 894F020002B8;
	Tue,  9 Dec 2025 09:56:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/38] python3-pyais: upgrade 2.13.3 -> 2.14.0
Date: Tue,  9 Dec 2025 17:55:40 +0800
Message-ID: <20251209095552.690-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122430

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix: Message Type 24 Part B: Detecting MMSI as auxiliary
* add support for AIS Message Type 24 Part B auxiliary craft variant
* auxiliary craft now decode mothership MMSI instead of vessel dimensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.13.3.bb => python3-pyais_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.13.3.bb => python3-pyais_2.14.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb b/meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
index 4103eb916c..800f460610 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
-SRCREV = "f0b3e06c4f1a532ba75986bdcf999ad776f81908"
+SRCREV = "04c33cdfd156bcfbb6c924f7f889e47e3c2373c6"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


