Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C589C25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.12705.1716861019070421634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uGh+d2Xh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861023; x=1748397023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GVyEkHEJYEqXp9YomaTDFH0hk/rLlDdBlyQ5HPNhApc=;
  b=uGh+d2XhaHXszZOg8T15nT2rHnUomGDZOU31rwvsFG9zlqVFArcYltMY
   5S1QgAd7wMWFSzYoe+iAbXFjCx7ZPg59rtLCmE9l7b5E0ZdtUJf1RtvxL
   2+P2KN550ig8i+vvn0kAU2x46ZJ+PyuTUYJAKfKto6GYkHX1TKY4MbV+H
   3c+AA0OdjaQW/1eyy/z8Lri4DLirIk/PU9x5MZfiEn7DUfs2Iv/9/mXEv
   yxNMrrhWdCxX4fpqVMgGVtlN4Qk+lnqigdHxOaE4eBMiirDbLwHtu35Bu
   VSn3GVFv/+4qbm4a8hv2/W2bljY35JZtpyaDMIh6kLEJy9utWgPsMjFHz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160573594"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160573594"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0CEDD424D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E52F3D73C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 65E942007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1392F1A000A;
	Tue, 28 May 2024 09:50:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/40] python3-twine: upgrade 5.0.0 -> 5.1.0
Date: Tue, 28 May 2024 09:48:09 +0800
Message-Id: <1716860901-863-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--2.534300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzTQqRbCv7WC76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AGAD6h6FZmEV42zm1Zi+MJlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNS6bZneGxthyXlk+FLZXcvju6AkkdzF9dECe8mUOaxyx+uJSXMuU4AbgXffB6wChdrBOe
	TGGJ120oXzXcwoMoY8K3ZREKIH9eY4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110562

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add the experimental --attestations flag

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_5.0.0.bb => python3-twine_5.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_5.0.0.bb => python3-twine_5.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_5.0.0.bb b/meta-python/recipes-devtools/python/python3-twine_5.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twine_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_5.1.0.bb
index cb4507481..6a79d45d4 100644
--- a/meta-python/recipes-devtools/python/python3-twine_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_5.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "89b0cc7d370a4b66421cc6102f269aa910fe0f1861c124f573cf2ddedbc10cf4"
+SRC_URI[sha256sum] = "4d74770c88c4fcaf8134d2a6a9d863e40f08255ff7d8e2acb3cbbd57d25f6e9d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


