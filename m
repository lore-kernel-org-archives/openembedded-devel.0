Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F62CCA0FED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15383.1755679203411207527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e6MoqNFi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679205; x=1787215205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2B3HR4wR8HWtGoGZc2PWiXEhMgMGpl1cj7LeNVpU6EQ=;
  b=e6MoqNFi3TYOVs08vNxpuL77Nf8FSA9LMQAOw61Qf+jtBiCztqXewQp4
   mihHAIR9pWC2Xuprv0oEPLnp27GqB2Syhxwb1QewYigcmpfdAuQANj4Hg
   LLdm7bZ4ML+HAZl4wjZtdCQgQgmfd+nPgu6EixYvGuEVDgxy3CVkcm3yi
   kNmmz8TiY4fuSkRxl4Ys2DmTpH0qLG/jzaF1qvtNlUglJVP90vLvZHIcz
   NGCI5fyqGtLLX90fBSozAsXscCMVsO/tYDBx2QiudEIKya1qRBAFe8vVn
   xq/pMJz8IF9RZ5hZ9RDtE+NudoOA287lNfZ0zgKOyJlUDDjsyXKMlr/St
   Q==;
X-CSE-ConnectionGUID: XzpxuVjKQeOcjC7oOyC76g==
X-CSE-MsgGUID: B0abyoW5T9SekqURUNGqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="198519917"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="198519917"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EF8241C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A991B1803228
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 9E62E1803F9E
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 97D9B1A0071;
	Wed, 20 Aug 2025 16:39:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/26] python3-bitarray: upgrade 3.6.0 -> 3.6.1
Date: Wed, 20 Aug 2025 16:39:36 +0800
Message-ID: <20250820083945.802-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* add development files for statistical tests in 'devel/random/'
* optimize 'util.sum_indices()'
* fix RecursionError in 'util.random_k()', see #239
* add 'devel/test_sum_indices.py'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.6.0.bb => python3-bitarray_3.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.6.0.bb => python3-bitarray_3.6.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.6.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.6.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.6.1.bb
index 83062317e8..5a119f412f 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.6.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "20febc849a1f858e6a57a7d47b323fe9e727c579ddd526d317ad8831748a66a8"
+SRC_URI[sha256sum] = "4255bff37b01562b8e6adcf9db256029765985b0790c5ff76bbe1837edcd53ea"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


