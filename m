Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E54FCAC582
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8059.1756890229088344278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qpjOAVLr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890235; x=1788426235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1vY/zjcvAGUXOVlV5gd0iQQN67dtHyA3WcvRZ58Zrfo=;
  b=qpjOAVLrNuA8U6FhM+Bo7NFCci07m2BWY3O+dwJq3X3TdI/mYqyF9o2u
   7vIlevhz3CXrEhBrGn8aDQc1w4AJOOZbB7KyxvDMsSE2jW3I/6MHYfLsY
   mwxhoqolusp0EKsDBX4i9puxf059Amhun960yBDbRlH9MaGAe5U3XKmY7
   tHntwTUWK68EHxPJT7wc/bUL45A4om8HfE/Mj94JUbtQpXl78DBm66+fz
   EqZEzkcJJjvD6a4R8dIp8xjyyD/eDzIczWJg+3KFdPazapwybTeix+cvG
   FQqoAFA1CvarXSoQNbP1KDECRFKhCF417Fl/33E/5Jem1/QceXS37Phww
   w==;
X-CSE-ConnectionGUID: U7HLkbqGRN65Okhr7uzv0g==
X-CSE-MsgGUID: vWNgeDb+SmCurFZKm0kqvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549697"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549697"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:54 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 80D68C00361
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 381B6182FD7B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 4E8CF40FF0E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 711B31A0069;
	Wed,  3 Sep 2025 17:03:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/56] python3-marshmallow: upgrade 4.0.0 -> 4.0.1
Date: Wed,  3 Sep 2025 17:02:58 +0800
Message-ID: <20250903090317.2002-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119235

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.0.0.bb => python3-marshmallow_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.0.0.bb => python3-marshmallow_4.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.0.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.0.1.bb
index 389a1b0ab6..1df1e67f10 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "3b6e80aac299a7935cfb97ed01d1854fb90b5079430969af92118ea1b12a8d55"
+SRC_URI[sha256sum] = "e1d860bd262737cb2d34e1541b84cb52c32c72c9474e3fe6f30f137ef8b0d97f"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


