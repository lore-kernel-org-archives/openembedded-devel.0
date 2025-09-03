Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F815CAC592
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7937.1756890230863763325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gm+exKcX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890230; x=1788426230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+PLBZh6IiNLLQS5H6CfFjwIYkNJboNkZYXJrUdDo2zk=;
  b=Gm+exKcX9RC1Rln9z1ns1x+mCfE83rola3WxLmCMmVWSKPFRfxGr4eN6
   ieYiuwNGarEgAdYMouMi1PYxuw1EFsP4UFYL2/SJJlGFxO1ZOPdtChZvo
   mGbUUFkpaKZ7bnov6FZ4jPGFKUm2E7o72W57DnLf4dMA20JrY7KzCoV3z
   kmRITomcocAmQMVvYfsnGk9XcLwf5W3le7twR83GgLryDf+4jYVi1CBtP
   v4Q7fa1LVBAjdoNbiXoeEiaDIApOxchShx1sqaoQun0+2+NppCAXYf2ip
   lSbQvh0wVr7DwIwBO8DFIAKDDPDSyQOaERM7u+gFE26ykzb8NDP0m4P29
   g==;
X-CSE-ConnectionGUID: 8SHxzipxTvGGxZMEe/2yvw==
X-CSE-MsgGUID: vDPSPiLKRu2U+VzTH7DKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="212051791"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="212051791"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4E91E820718
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0AECF1479244
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id E74A02005D20
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C90A31A0086;
	Wed,  3 Sep 2025 17:03:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/56] python3-bitarray: upgrade 3.6.1 -> 3.7.1
Date: Wed,  3 Sep 2025 17:02:44 +0800
Message-ID: <20250903090317.2002-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119222

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.6.1.bb => python3-bitarray_3.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.6.1.bb => python3-bitarray_3.7.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.6.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.7.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.7.1.bb
index 5a119f412f..a197414962 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "4255bff37b01562b8e6adcf9db256029765985b0790c5ff76bbe1837edcd53ea"
+SRC_URI[sha256sum] = "795b1760418ab750826420ae24f06f392c08e21dc234f0a369a69cc00444f8ec"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


