Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69BBCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:59 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.115924.1698049853877712233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125177396"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125177396"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:30:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E105D66C3
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:30:49 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD651D9682
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:30:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 977A62FC7F7E;
	Mon, 23 Oct 2023 17:30:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.8.1 -> 2.8.2
Date: Mon, 23 Oct 2023 16:29:30 +0800
Message-Id: <1698049770-24999-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--2.676500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrPsGG+kQsvKjq3cKabNWGAEJL
	NSh4QSBdaFON7rVZ3jT9k/FBDAgpqNuV4eqNSZjfA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AZv+ggm5QAi4QFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3cuolB0xUdeGwxmyol/Tze93dmykR615oL/Wbmf0r/tWvIH
	1YuaERZ07WTwmfSZHpcFVLVCKvwP18B9MxLWhCLWhhrIZifgiwdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105651

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
 * update cibuildwheel to 2.16.1 in order to provide cp312 wheels on PyPI
 * improve error messages for masked assignment
 * simplify test collection
 * added 'pytest.ini' to allow running pytest with no additional arguments,
   see #208
 * 'util.sc_encode()': avoid writing empty blocks at end of compressed
   stream, ie. skip encoding when total population count is reached

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.8.1.bb => python3-bitarray_2.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.8.1.bb => python3-bitarray_2.8.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.8.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb
index cb94df5644..39d2b6a717 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "e68ceef35a88625d16169550768fcc8d3894913e363c24ecbf6b8c07eb02c8f3"
+SRC_URI[sha256sum] = "f90b2f44b5b23364d5fbade2c34652e15b1fcfe813c46f828e008f68a709160f"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


