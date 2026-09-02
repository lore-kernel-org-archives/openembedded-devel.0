Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789B9C624DB
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9741.1788344993138296469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=glbNuYYp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344993; x=1819880993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iOEgxYRUvPHPiBUzpqCnLbP8zi6UeFIzJQkiJ1AUM2c=;
  b=glbNuYYpiUyrBGc0sNML4jisovr3UYRphIp6xkPQjoId/dxtnBJ96viA
   Yw8R6rAlyuiMQUuZ8sa9Atyj2suR6RvTDIRqXv3ITpqnyi+u8CNZCYKxL
   29pW7ygO/XA6KbV0/OwGEAhJb3MWwVrT4eInZC3Ev4+8P0eVhO8bIGgeO
   TbkaYM0Grcmn81UFPtddrRxIn3WAGgKZ83jS7JCCdJkt/O4PCwfC5H5XU
   qrqX62TRdNcr1YMxQc4VwpT8VlfxD+xPofp1cXgDoit62PBSo9oh7Gw7Q
   6Ot5mmogoyzuqKIxKTOVygjnrbFiZ5fuq4UjXS3+eecJlGJvc5uJOuihf
   w==;
X-CSE-ConnectionGUID: +4rk+qhxT8CWBZRa2MGHIw==
X-CSE-MsgGUID: YaqB8+/VRaCKfNR8PWVBzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="251759843"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="251759843"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7817B1C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:51 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2B7511800261
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2CC74200076B;
	Wed,  2 Sep 2026 10:29:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/34] python3-regex: upgrade 2026.7.19 -> 2026.8.31
Date: Wed,  2 Sep 2026 18:28:50 +0800
Message-ID: <20260902102900.1296-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129683

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.7.19.bb => python3-regex_2026.8.31.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.7.19.bb => python3-regex_2026.8.31.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.7.19.bb b/meta-python/recipes-devtools/python/python3-regex_2026.8.31.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.7.19.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.8.31.bb
index 0b1f3fe486..2889b14fd0 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.7.19.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.8.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7e77b324909c1617cbb4c668677e2c6ae13f44d7c1de0d4f15f2e3c10f3315b5"
+SRC_URI[sha256sum] = "9350fd448a6442ae27853ab9d4b8d5a0bcb6d7774923a4fdfddd104c4458b35f"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


