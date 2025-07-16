Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1090C83F2D
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.15677.1752648079852454607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WTUGcWzT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648082; x=1784184082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BIy0CKwyzGybrF8+mmCHJkz7iZ1ilk+ptqXYrdBiGZc=;
  b=WTUGcWzT6xZ1mQm6S+FDgzFJZQxaTdSX2TfwFnjIR9mumi5cwG/vR3Dw
   TEqJzUJFfFSKorwV5cM0bnBS7sDTRKGunUB010Un7a5rGsVKEchezdzny
   9niHCBlt02t2+0gQ0EUHONv6qNx1rd4bWsDrgVJ8Kxo5zTbCfs9gRvL4b
   YNMDvFUG2ZShVknRwPXiowS/+THekQvLl9v7o9lnUHaSK4SvldZEQQ1j4
   3ZuGC5gzv6hkHHjF/zAkN1ctmJf9NQMgs+eynd6wFMQjBo6+H8g6KFMvN
   FKxv0FHIthR6P9wkeh1wn6VmnO9lfbRku1VFuOwy67NdzPsJetrxAczP1
   w==;
X-CSE-ConnectionGUID: EJNd2cbQRvG+9Ymc967FMg==
X-CSE-MsgGUID: ZYNFqeJYRE6awGomOpE3Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="206430596"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="206430596"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:21 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7FA1F8203C6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DCB041800272
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A2A91A0078;
	Wed, 16 Jul 2025 14:41:16 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/14] python3-freezegun: upgrade 1.5.2 -> 1.5.3
Date: Wed, 16 Jul 2025 14:40:59 +0800
Message-ID: <20250716064102.1813-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118581

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix compatibility with pytest 8.4.0 when using fixtures
* Add (back) class-decorator overload to guarantee Pytype understands it

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-freezegun_1.5.2.bb => python3-freezegun_1.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-freezegun_1.5.2.bb => python3-freezegun_1.5.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.2.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-freezegun_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-freezegun_1.5.3.bb
index 56674c448b..26b14fc8ce 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/spulec/freezegun"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
-SRC_URI[sha256sum] = "a54ae1d2f9c02dbf42e02c18a3ab95ab4295818b549a34dac55592d72a905181"
+SRC_URI[sha256sum] = "d7c6204e33a50affd7c7aa284f4f92e04e96f72d63313b89ceaaf60d9c64bc5e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


