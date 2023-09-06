Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B75ACCFA11
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:58:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2429.1693965514264524511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130902670"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130902670"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:58:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51B98DDC66
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:58:30 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FD01D614F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:58:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 94FC62FC7C3F;
	Wed,  6 Sep 2023 10:58:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.1.0 -> 4.1.1
Date: Wed,  6 Sep 2023 09:58:19 +0800
Message-Id: <1693965499-14376-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10--3.787100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrGeIujupKDm+AI7Mvq/sL5yia
	SqRpkfBtiqRl77vP0uwCUqugZvm+eS8oE1Ngob6lL7p//vLv4bNUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw65x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkpwHCyF81Ie4sHHEHEVRUw8pExB4ERekUBU2p
	nRkBix2ipGCu+1f401FEDNiCEgTYBqsHnUKqiAYeFro2chvN54Guyi9B8tg6Uu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104746

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
 bitarray dependency now pinned to ">=2.8.0, <3.0.0" rather than a specific version. Bug #283.
 Fix for using numpy integers as integer parameters. Bug #286.
 Removed ability to extend an Array with the '+' operator. Use the 'extend' method instead.
 Improvements when pretty-printing the Array.
 Array.count() can now count 'nan' values for floating point types.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.1.0.bb => python3-bitstring_4.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.0.bb => python3-bitstring_4.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.0.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.1.bb
index 8a70f60db5..f45bfc0efd 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "b1672fb31721dbb6c809e76a3a19ac76a608e1f8fcacce9349ae2b72b1917b20"
+SRC_URI[sha256sum] = "a9c97fdf9fe38f27ea0ac2b4cf2a3f5bce5ccc23b863082582b9f48b22274528"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


