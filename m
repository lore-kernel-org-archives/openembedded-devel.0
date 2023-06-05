Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB6FC7EE43
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2111.1685951607497013933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="118957786"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="118957786"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C89BC3F8B
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:22 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA92FCFA5F
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 05E442FC85E5;
	Mon,  5 Jun 2023 16:53:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tree: upgrade 2.1.0 -> 2.1.1
Date: Mon,  5 Jun 2023 15:52:56 +0800
Message-Id: <1685951589-29920-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10--4.560300-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrbiVzMTheSbB4YeSlHZYFokSb
	VvK2okrW/OJ6YHhsA+27wwgceoudGFZ8MmR+Mj88iV0ptmwZhq3YUDvAr2Y/188jvrgttXWzRK7
	LDEHcSOTMORbesNww61TCdHF1LG2D6k5u/mZf6RW9/kMM+y0cUTeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2SL637QCIVpi8vc3EUpCmrXDiZmOF0V5FTsKXyzHgcEba/fioJ9l4HjHwEnu5Jwrbe+2s
	n1Sd7+GkzpHopPQfRoBp4d1K/boSq1i/8UCZ5uOngIgpj8eDcBpkajQR5gb3vxXvvKElGCj32mP
	O5tnascnRE+fI6etkrAJbPIORwpQbonQZn2l+yaLRM++4hots/BiZrHfM/ugo4HNhRwSUZOiS7Q
	zqEYnT9ASEOQR5rKes/34oWGoXZ8FogI4t5gpNEu/kTKv9giuqwOHO1Fdn0Kb4tj0DvxRUIs9ro
	6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103112

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
  - Various spelling corrections.
  - Fix issue where following links while doing JSON output would lead to
    incorrect JSON output.
  - Fix issue where .info patterns relative to the .info file that did not use
    a wildcard for matching the prefix were not matching files properly.
  - Added support for making trees from tab indented files (--fromtabfile)
  - Fix buffer overflow in listdir() when file names are allowed to be longer
    than 256 characters (like when using fromfile.)
  - If when attempting to open a .gitignore or .info file from a top level
    directory and failing, recursively check the parents for such a file.  This
    stops when successful at opening such a file. This behavior might in the
    future be modified to open all such files in all parents to until root is
    reached.
  - Fix issue where tree would never descend (-l) a symbolic link when a full
    tree is gathered (--du/matchdirs/prune)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.1.0.bb => tree_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.1.0.bb => tree_2.1.1.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.1.0.bb b/meta-oe/recipes-support/tree/tree_2.1.1.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.1.0.bb
rename to meta-oe/recipes-support/tree/tree_2.1.1.bb
index c867a3a7d8..0b61149609 100644
--- a/meta-oe/recipes-support/tree/tree_2.1.0.bb
+++ b/meta-oe/recipes-support/tree/tree_2.1.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[sha256sum] = "0160c535bff2b0dc6a830b9944e981e3427380f63e748da96ced7071faebabf6"
+SRC_URI[sha256sum] = "d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab60a49d8367ab90d5"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.34.1


