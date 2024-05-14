Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24BDC27C50
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.10791.1715677840073324735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KOe1QgvA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677844; x=1747213844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GNdjDNXbQV9EAW5/9+oeTpbU3MjHwSGrXdL5SYPfc+I=;
  b=KOe1QgvA5hXS8z34FJ5zDIEC0KJbK2/pwn2ftBZNv6Ny9Gz/DhsxjZ4x
   aau1RBo2730+owbt29Afv48Fp8hfk/Gq5iF+ZgThg+EiYP0HMStapPjks
   v49Y9xoPGTNiqKKmccVF0bhyEAjDXwVoCVa7JOv0Mw9geyaL/rGKQWlB9
   DMeXIZK+Bg9rjt2k9sX9YZ70tEwTOEwJyV0qGYdqVulhrqJzq/EmTnd5z
   LajgnQYlylZBSvoznsVp0lbmL08MrHCWlPmUEUn1lH5+tJtmZQu3Es75A
   mJIDMtZ7kfg/FJcNPxd886kYtZJk5vRBWJY4RP8KMtEgRRyZ4b/8AGxNB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158143152"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158143152"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99636D9048
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC0CED5936
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 721DA20076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1FA3B1A000B;
	Tue, 14 May 2024 17:10:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/44] python3-web3: upgrade 6.17.2 -> 6.18.0
Date: Tue, 14 May 2024 17:10:13 +0800
Message-Id: <1715677817-2223-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-3.787600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr8boZEVitthg1Y73PdzvXZKOV
	nJm7BXhK/u3mAgC/fMcXKqBAcaFmVRLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKEs/iryZdLSdDDQmoSzLIQR9hZlHlxJZIcf2xz2wLLo1XQt
	Byve16DhYoXaBt9cABc36Wk5viWxotfh+uSYbVgDnqCJFrTBC5Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110384

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Disable doctest in docs/web3.eth.account.rst due to eth-account deprecation
  of messageHash for message_hash
- Deprecate the geth.personal namespace methods. These will be removed in web3.py v7.
- Internal Changes - for web3.py Contributors
- Increase pytest-asyncio dependency to be >=0.21.2,<0.23

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.17.2.bb => python3-web3_6.18.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.17.2.bb => python3-web3_6.18.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.17.2.bb b/meta-python/recipes-devtools/python/python3-web3_6.18.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.17.2.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.18.0.bb
index e695bc27a..dab37c870 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.18.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "8ed8b7184eba5b00d0849efb95c8ec6f3220aa8886e740182bb1e4f1247cca3e"
+SRC_URI[sha256sum] = "2e626a4bf151171f5dc8ad7f30c373f0416dc2aca9d8d102a63578a2413efa26"
 
 inherit pypi setuptools3
 
-- 
2.34.1


