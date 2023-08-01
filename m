Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B1C04FE1
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7628.1690875731007171006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126412269"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126412269"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06915CD7E6
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 34C0FD8B78
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A3B229F74B;
	Tue,  1 Aug 2023 16:42:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gnupg: upgrade 0.5.0 -> 0.5.1
Date: Tue,  1 Aug 2023 15:41:44 +0800
Message-Id: <1690875717-21608-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--10.946500-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrkg40k3K8nNS3CLdtdG1oCLsV
	j+wJQ/DT8SxiFvswXE9gdVoWika+5FnGEjlsas2yHWRJEfGP5nl2obWrEHJxThKJYyvGmjopO5q
	b2pxZguZSk47Q0+cWaiZCw7Wlcf9Wm90svbBgsaZNsVUJg8FOpj8V/kIRFnizmDpXcJ/vTKi+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AEITY2UGMiNwpeqaZhManGJ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76v88W2ZCKzlb1n2x01qgGP+jgh/3rFLqXpwgdz
	kz4cMoae/rjJKKx1GA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104185

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Added TRUST_EXPIRED to trust_keys. Thanks to Leif Liddy for the patch.
-Fix #206: Remove deprecated --always-trust in favour of --trust-model always
-Fix #208: Add status_detail attribute to result objects which is populated when
 the status is 'invalid recipient' (encryption/decryption) or 'invalid signer'
 (signing). 
-Add scan_keys_mem() function to scan keys in a string. Thanks to Sky Moore
 for the patch.
-Fix #214: Handle multiple signatures when one of them is invalid or unverified.
-A problems attribute was added which holds problems reported by gpg
 during verification. 
-Fix #217: Use machine-readable interface to query the gpg version. Thanks to Justus
 Winter for the patch.
-Added the ability to export keys to a file. Thanks to Leif Liddy for the patch.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gnupg_0.5.0.bb => python3-gnupg_0.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.0.bb => python3-gnupg_0.5.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.0.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.1.bb
index b97c4f3f5d..7510625dbd 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "70758e387fc0e0c4badbcb394f61acbe68b34970a8fed7e0f7c89469fe17912a"
+SRC_URI[sha256sum] = "5674bad4e93876c0b0d3197e314d7f942d39018bf31e2b833f6788a6813c3fb8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


