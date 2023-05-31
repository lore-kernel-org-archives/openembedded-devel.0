Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB66AC83003
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8605.1685518841175940890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118834787"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118834787"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 81A9BCA1E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B13D1D94B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 377CC68957;
	Wed, 31 May 2023 16:40:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.7.3 -> 2.7.4
Date: Wed, 31 May 2023 15:40:05 +0800
Message-Id: <1685518820-20028-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-0.443700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrXLILvyEBT84R34ro7k23nT/5
	Ty6Xj9rg/Hfa6GFG5NXov4MY2WSEP+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4Dj/0XMJYfpi/YX7AlQI2uSF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNa9Ut/tFox/MeWBq436tDAZ2WewconSBvDw1ifivIWbXY6yDBS35VEy6I1xZcKbUeVsRS
	iv68r2LLWlsnURv6pl7P02GYP3IZZltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102911

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  * register 'bitarray' as 'abc.MutableSequence', see #196
  * cibuildwheel: update macOS version to 11 from unsupported 10.15, see
    https://github.com/actions/runner-images/issues/5583
  * improve documentation regarding type when indexing single
    bitarray items, #192

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.7.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.7.4.bb
index f766692a0..1cfaf3e9e 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.7.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f71256a32609b036adad932e1228b66a6b4e2cae6be397e588ddc0babd9a78b9"
+SRC_URI[sha256sum] = "143d4f65e1f45a533e13521be1dc557a782317ecf76520eabd5a903b26ecb187"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


