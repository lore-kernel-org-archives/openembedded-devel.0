Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05D8CFC52C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.50347.1728896175671201865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ApITmsc9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896176; x=1760432176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G5cESFxVssu8yM1NMDDGs52UbJft1/xcrEz94rcXD3w=;
  b=ApITmsc9aQr1pPwpKos9XIi6sVXk4jxN0iW5yfiauCMZuD+Nj19al4pZ
   MDBswY+Nei8XT9ciWXjtQCJepe8VRunRGwWjuzul+u0/bOoo7QLl0EDPE
   iq324nQWCeIyOSDohkzwIcp+PnBdpuG0Ag0g7JlPwGc8/3vQ541epJktJ
   qrJYrayjuwT6MNtbNoVUDe5vjuSJq7g+lQM5GVXCZXZPBwbJOUB+MfF1D
   PUl1z05XflpTuxg9TOlCpKGWkW0CaJK/cqebiqdV47rFV4bRsE0XTk8Uu
   mEGQTtCr79Sc+4kYH7AQcv0cP+gGNJpDHP5bqizXMlxdFWp1gzPnWtQka
   w==;
X-CSE-ConnectionGUID: ESJNuyNZQdGjYsuw221qCg==
X-CSE-MsgGUID: d1I2GwfjQJy5v8EMUeSH8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176669417"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176669417"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:13 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F9F3D648E
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D81EDD7758
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 748F320071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 23BA71A01E9;
	Mon, 14 Oct 2024 16:56:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/54] python3-sh: upgrade 2.0.7 -> 2.1.0
Date: Mon, 14 Oct 2024 16:55:01 +0800
Message-Id: <1728896115-2944-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.275300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqysyZtMIIHe576p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFCd6WEk+eO/Cx1CuwF7BVWnOEr
	DZIIWoRZ5g3ol03RbSar4JQupRNYuJySyhI0UmLNwK/jV7sVEdrwEpcw+bHHia3NCtYGW5ZOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112892

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add contrib command sh.contrib.bash

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sh_2.0.7.bb => python3-sh_2.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.0.7.bb => python3-sh_2.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.0.7.bb b/meta-python/recipes-devtools/python/python3-sh_2.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sh_2.0.7.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.1.0.bb
index 8f8d970a9..948235fd7 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "029d45198902bfb967391eccfd13a88d92f7cebd200411e93f99ebacc6afbb35"
+SRC_URI[sha256sum] = "7e27301c574bec8ca5bf6f211851357526455ee97cd27a7c4c6cc5e2375399cb"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.34.1


