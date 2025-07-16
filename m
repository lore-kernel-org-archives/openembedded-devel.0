Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF955C83F34
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.15851.1752648080692686881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MQzWExym;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648080; x=1784184080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ycfDovIU1ouJ7x43sOey7XXzfMp2a6q8LNbmX/7tvvw=;
  b=MQzWExym9iBVQcRJiseWubV6zO4455bcQXw6mTLoIy4MRnAI9LHRw9b1
   HKnrPs1aAIbu+GWIzeKllAIRb3+9K1y7pu05Cl9w6TMdX4wrm7sJYQDdw
   r9vvFKvrJ2GPJ5AzBd8KVnrK83Q5QNMUCLr/Dq9HEpmbIq7wH4ZTsq1PN
   lLowt+Lg+4IlIjddlcj15/gw/+j7clPpFxAzS/mG3IqMaPEpG2Fnhp0GT
   ycojUPumLByXdv55xyTcz6sCcQT676OGanxOe05JxbjIbWGZyGmWtL4aB
   UDHtW2c5JR3yCKzocHITNrftvjO0tTHGnhDTkUgy+Ef2FTdD5YiISIqHz
   A==;
X-CSE-ConnectionGUID: 9xrx7ff4SCmAuHC1T7AtLw==
X-CSE-MsgGUID: QN0Kr0YFRCO+JKeov9PzGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="194951651"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="194951651"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:19 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D2808203CE
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 99BFF1800244
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 46F791A0073;
	Wed, 16 Jul 2025 14:41:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/14] python3-bitarray: upgrade 3.4.3 -> 3.5.1
Date: Wed, 16 Jul 2025 14:40:57 +0800
Message-ID: <20250716064102.1813-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118580

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* optimize 'util.random_p()' for 'n < 100'
* add [Random Bitarrays](random_p.rst) documentation
* add [statistical tests for random functions](../examples/test_random.py)
* add 'util.random_p()'
* improve sparse compression testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.4.3.bb => python3-bitarray_3.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.4.3.bb => python3-bitarray_3.5.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.4.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.5.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.4.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.5.1.bb
index b7da117451..3cf1751f32 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.5.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "dddfb2bf086b66aec1c0110dc46642b7161f587a6441cfe74da9e323975f62f0"
+SRC_URI[sha256sum] = "b03c49d1a2eb753cc6090053f1c675ada71e1c3ea02011f1996cf4c2b6e9d6d6"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


