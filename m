Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55047CA0FE8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4722.1755766811378409643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RWrixyeR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766811; x=1787302811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0vSTyUOVtpdQcwYSnW0pgWBpIbYX2FxI3xF+TG0VEnw=;
  b=RWrixyeRWCT8g80zI+dqOOOjJeuMIkQc8DlQV7Nl76Gglg5CJCnr7rx3
   vll+Ut8yWfuW07gIqqI8ldPpo4mOYGb9laMKz8wC3qDHJOKK8AtOpgzyt
   D/ElYCU+oSeahhq9KgDFu8qIL+Zjl1DQOgw6gw3LaAbhGO23OBmEQa/GG
   JBKEulhJDUSq4EfmKle6+8tiBtjLBvE+X6qzK+Z1x++zCliwKZ3RUrX8S
   cO9543NiiK5AD6ouFxrhId/gAkDoLMD+YMS/GhmDCbrmXhVIkEKMUhcsL
   +oclwRo2ITEXWTKq6zcmkDxNa/Gxql3Utnh6qIE06l4cjY1lPllO3C0c5
   g==;
X-CSE-ConnectionGUID: 0zwWAYSIS2qdulbKcwZ1Ig==
X-CSE-MsgGUID: wy9ykJ6zTImyRBK6aMprFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="197565110"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="197565110"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:09 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C77CB1C000BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 80A02101B146
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 5E2BC1400BFE
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D65711A0078;
	Thu, 21 Aug 2025 17:00:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 03/21] python3-greenlet: upgrade 3.2.3 -> 3.2.4
Date: Thu, 21 Aug 2025 16:59:36 +0800
Message-ID: <20250821085954.2056-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119053

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Various small build/test changes for less common configurations
- Fix an assertion error on debug builds of Python 3.14 when using the experimental JIT.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.2.3.bb => python3-greenlet_3.2.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.3.bb => python3-greenlet_3.2.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.2.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
index 47ebd641df..1657be2b2a 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "8b0dd8ae4c0d6f5e54ee55ba935eeb3d735a9b58a8a1e5b5cbab64e01a39f365"
+SRC_URI[sha256sum] = "0dca0d95ff849f9a364385f36ab49f50065d76964944638be9691e1832e9f86d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


