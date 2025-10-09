Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA2CCD188
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5582.1759990130016683476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kQYnSfaI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990131; x=1791526131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TgOdAZNaV+1vYv0CbKaqSjw5L+sDAbtlwcCbZccyOKw=;
  b=kQYnSfaItcUcgOetYopg3uyupbhSg2ee3UXQ3ZH6EarZwMR8dmxZpdKU
   PyXT6FCR08C/x20HHI7lnBKUJRvaXRc1vneY2ZAzH1APyQXv+JQDiuoOU
   Zk1F4DvkNMwdgBYL8rNmybsf6GP/HkZ5ehi35iubGer4fd0WyhnYkD5Gz
   1Pca5YIQRWvPb29RDCRu9Jx/7kYUb0zvA8ZcbZn+xghzEbluPE6UBDVEa
   +BnOSi81Pi4EuTNCgXkVOptHEGqM7t4oy/6eyAMfSzjZnq4kkwo+7gKpj
   vcyaNRQOyMGtYUpLEAgwAANitP6Y1CBqgPi6MvLhFpfz6TYKjO0y63A+z
   g==;
X-CSE-ConnectionGUID: HkUOWy6mSzac0ZlTHGQ2xg==
X-CSE-MsgGUID: ZP+jM3/QQ5ax/XsFx3Q0KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="214800401"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="214800401"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:51 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6A65BC00577
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:50 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 27840C00216
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D0FCA1001CFD;
	Thu,  9 Oct 2025 06:08:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/22] python3-simplejson: upgrade 3.20.1 -> 3.20.2
Date: Thu,  9 Oct 2025 14:08:06 +0800
Message-ID: <20251009060809.445-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120416

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simplejson_3.20.1.bb => python3-simplejson_3.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.20.1.bb => python3-simplejson_3.20.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
index 82f83f1b58..bc93da225a 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "e64139b4ec4f1f24c142ff7dcafe55a22b811a74d86d66560c8815687143037d"
+SRC_URI[sha256sum] = "5fe7a6ce14d1c300d80d08695b7f7e633de6cd72c80644021874d985b3393649"
 
 inherit pypi setuptools3
 
-- 
2.43.0


