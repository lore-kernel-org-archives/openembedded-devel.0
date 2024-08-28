Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8D5C5479B
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8719.1724833541946562947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GrMRsnrr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833551; x=1756369551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DLhnelyAGWMJw8qzTpvG1KhK1vv1MnS5aZca1skltY4=;
  b=GrMRsnrri5mqQiAr9l5WTtyKKOZtwnpbGiFrsjmgkC1whhFsAxYPf4fE
   HzRnw37L2xHrvFW2kmvt+TgLwa2mm0gtO7o6wfQqhtIG6ZfWqVzJS35fv
   13Sie6jV8zpgGVvuqMppc+mBOZDfTy1ikvuJy7MB6P+gqMwLEEzzgodY/
   JlcP6bSVNYDA/p0yf5sjliLOM9YVIV7ejNMOtxqiWfuWWKLDIXv1WgXe7
   /fix3LLFXQKiLevbqj4gE6T2I7DTXGkXb8Tpbp68pWNCPK3mK+D//YwFI
   q2EBz7JvPFoP4rX7qb/stjysoTSks/Qbb1FGbc7StXQhKK5Dkbzbbn7ps
   w==;
X-CSE-ConnectionGUID: m99z0lJtQQSByet6y/C09g==
X-CSE-MsgGUID: uKr3pvAiSQqSEVGS2PmhRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039574"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039574"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:49 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D4E77DAE08
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A100D3F14
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B15C16BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D29C1A0002;
	Wed, 28 Aug 2024 16:25:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/46] python3-importlib-metadata: upgrade 8.2.0 -> 8.4.0
Date: Wed, 28 Aug 2024 16:25:04 +0800
Message-Id: <1724833525-2162-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.570100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrZdgd9r8to+7fUZT83lbkEMHm
	cwAHIyVA+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DhKQh1LCmGBlxOQqP2lG9go8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLj4cc+POVASouH4lKsgXBvo10qNHKKLdkQ51
	cy+g+JEL9bx5uSfxeNNW2riSrPwYlkqYl1HaheMFOP2qvXxzrRG363tKOOXVj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112003

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Deferred import of inspect for import performance.
- Disallow passing of 'dist' to EntryPoints.select.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_8.2.0.bb => python3-importlib-metadata_8.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_8.2.0.bb => python3-importlib-metadata_8.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
index 3e1c7a7d6..b81d17383 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "72e8d4399996132204f9a16dcc751af254a48f8d1b20b9ff0f98d4a8f901e73d"
+SRC_URI[sha256sum] = "9a547d3bc3608b025f93d403fdd1aae741c24fbb8314df4b155675742ce303c5"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


