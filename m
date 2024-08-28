Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555F7C54753
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8728.1724833559099070937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VJ5iVUvb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833559; x=1756369559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ugW6U55jiXMjlsdK050lXGVGl77JOI8WqX8JxNt2zss=;
  b=VJ5iVUvbVpaEJu6GZGPbVOeACuN4VBx+uxFD8q6TdoaC/H1GNtBCKDjK
   3nKPbnSYRCGVhyud2Fd7iullAqUdD0FgBKrnNEtYPax+iZteFfR9B8Pcz
   Drvid8/wGS7MjjU3qyw2k2InuwFSZsT5/tCPKKEfI1SfbFVaAVtIh6KjS
   JtUCWLjfQa7dokJAQkpBlzidMbxmxTJNT4MOmyaApAuLQptW2otgEHXZr
   2gsKrNbcu8fZdZF3UVc2m4mCaqZEZ7P0SQJL6f/21LwDaUZyvBFqZ4/QW
   wnNLDI1LnWyzTnkv+2vDWtaWodvneyi/ZfhnpPJec1qztaPCW46066KjO
   Q==;
X-CSE-ConnectionGUID: D2Z4Kmc8RG6AyUmM0QnrrA==
X-CSE-MsgGUID: dp2l3lXCQt2jqab0y54T0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039585"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039585"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE8D7DB3BD
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 12212F30C
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99E7520079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 453EC1A0002;
	Wed, 28 Aug 2024 16:25:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/46] python3-typer: upgrade 0.12.3 -> 0.12.5
Date: Wed, 28 Aug 2024 16:25:17 +0800
Message-Id: <1724833525-2162-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJIEBPqHzCowKNFNp0k+Kh3JGDCMrCPsjx5HT
	XBiFhQY4z+HdGFoY3co5HvRTLmLxWUiP40u7FdlnGQqwxIbbr6YnaOikJW+Pn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://github.com/fastapi/typer/releases/tag/0.12.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.12.3.bb => python3-typer_0.12.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.12.3.bb => python3-typer_0.12.5.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb b/meta-python/recipes-devtools/python/python3-typer_0.12.5.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.12.5.bb
index cc8669c37..e175b5420 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.12.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "49e73131481d804288ef62598d97a1ceef3058905aa536a1134f90891ba35482"
+SRC_URI[sha256sum] = "f592f089bedcc8ec1b974125d64851029c3b1af145f04aca64d69410f0c9b722"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


