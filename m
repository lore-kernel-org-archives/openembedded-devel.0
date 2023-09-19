Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59500CD5484
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:33:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2269.1695108829381909144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="112054634"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="112054634"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:33:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 67FA3DB4C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:33:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C8EAD968B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:33:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1951B6BF63;
	Tue, 19 Sep 2023 16:33:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libdeflate: upgrade 1.18 -> 1.19
Date: Tue, 19 Sep 2023 15:33:18 +0800
Message-Id: <1695108798-7183-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.006
X-TMASE-Result: 10--0.081700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yQrcxrzwsv5uXs5nqGvDCfMt3rmov76grBxq
	dt22rdOgNwUXLoow3O9MQ8GITGODLRPXzMq0J6v+GqSG/c50XgNoQA0psEk3XShbZduLiFfbESn
	P3J1Qtqdbn6tefwlpGaX5/HNyPAAxsEBAuoaUqK8/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqkHJEEn3XMkYWn2p9yKOL2tYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOe1cvPkB5vx+SneTJ9uCH4X7gvfrsvS17e1YzGzDBtLiThUi8J9Eb4g8z6RLS/NAtJwoD
	9eq2EDb4qC8ET5CbUyceu9X7OAj1gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104968

From: Wang Mingyu <wangmy@fujitsu.com>

* Added new functions 'libdeflate_alloc_compressor_ex()' and
  'libdeflate_alloc_decompressor_ex()'.  These functions allow specifying a
  custom memory allocator on a per-compressor basis.
* libdeflate now always generates Huffman codes with at least 2 codewords.  This
  fixes a compatibility issue where Windows Explorer's ZIP unpacker could not
  decompress DEFLATE streams created by libdeflate.  libdeflate's behavior was
  allowed by the DEFLATE RFC, but not all software was okay with it.  In rare
  cases, compression ratios can be slightly reduced by this change.
* Disabled the use of some compiler intrinsics on MSVC versions where they don't
  work correctly.
* libdeflate can now compress up to the exact size of the output buffer.
* Slightly improved compression performance at levels 1-9.
* Improved the compression ratio of very short inputs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdeflate/{libdeflate_1.18.bb => libdeflate_1.19.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libdeflate/{libdeflate_1.18.bb => libdeflate_1.19.bb} (88%)

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.18.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.19.bb
similarity index 88%
rename from meta-oe/recipes-extended/libdeflate/libdeflate_1.18.bb
rename to meta-oe/recipes-extended/libdeflate/libdeflate_1.19.bb
index b1c3371159..11cdb82905 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.18.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.19.bb
@@ -9,7 +9,7 @@ DEPENDS += "gzip zlib"
 SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "495fee110ebb48a5eb63b75fd67e42b2955871e2"
+SRCREV = "dd12ff2b36d603dbb7fa8838fe7e7176fcbd4f6f"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


