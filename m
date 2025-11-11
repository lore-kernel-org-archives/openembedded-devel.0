Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB96CCCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:56:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12761.1762847759005399555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JpyM6n+0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847759; x=1794383759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xi55Bru+o6d3pN3EiF6493xQZLD5HsKj9gfWKTAoDlE=;
  b=JpyM6n+0iuvtQSvAarB2pHqpG3n2zWNTB3ICN5wd7w4x/lZXxWh9hws8
   NXx9UE+3c8s8uI22+9xiVJ8eIczIwdBnW55CZ0NCuZK+1HKztAmy86Hhm
   ol+X43WHheRdzfi1VNsn+b0p9sY+hcaskECYaJe7ZRuUyekR20ZGUKveo
   +fvxxb3WVD3VLmQ4Yt2GRKud+VNGm/su4ckuDhvBRASgumeT8EOva3ub0
   747RrKJhpd/8UUA6fSLSIcfivJgcHmbX2FlOn1SyDlfRGaQRNGilcex0j
   RdtB8SGHEZxsvHrXosNEkMr5xc1Yd9YrlLQTDD3PaDf1wWPGbahnQL0b4
   A==;
X-CSE-ConnectionGUID: JUStV9wGTqCU91D3lXA3Rg==
X-CSE-MsgGUID: DV2+IZ5jR9iDCOGhIo2eFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="197652962"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="197652962"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:57 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 462E8306B
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:57 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ED00D1C0017E
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 95E791800D75;
	Tue, 11 Nov 2025 07:55:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/23] python3-pyroute2: upgrade 0.9.4 -> 0.9.5
Date: Tue, 11 Nov 2025 15:55:12 +0800
Message-ID: <20251111075517.1650-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121497

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- async: AsyncIPSet, AsyncIPVS, AsyncWiSet
- ndb: fix snapshot cleanup
- wirouting: initial version
- process: use poll instead of select

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.9.4.bb => python3-pyroute2_0.9.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.9.4.bb => python3-pyroute2_0.9.5.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.4.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.9.4.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb
index 2925ebbd5a..8005d1275b 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "3cbccbe1af0c2b2aeae81b327e0e91aa94c81ab19f851e74b26bef70202f3070"
+SRC_URI[sha256sum] = "a198ccbe545b031b00b10da4b44df33d548db04af944be8107c05a215ba03872"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
-- 
2.43.0


