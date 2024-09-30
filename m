Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B032CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.48968.1727682257106305140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tBbp++Pl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682256; x=1759218256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0Tz2Wz/F9jZN+ZdDsCisMFS5WADW0IK5VH+Gh6z7vD8=;
  b=tBbp++PlP0aph5/bLnW+r4tDjq42LecR39YpCBJfZy3bi78J7H6Z4VUQ
   WPTbyb6GqYLE9UPVZvzBQ6dD6XU1AavB3nSLCyeGN+Ydiyq20m5C2X8hs
   1gDCb4Niq9CVeJZMvpkDLiGQIDz80Cq4K77x9XT4SCeExrflFLxeCG+VW
   XL0gC/kUzRcm/B3nYMaGsZ2XDMVvoVRozfcg6jh2MdP7U7Em3S25JftjA
   oNmoPBrzsRweTUSdb3A7xgUrw3nlfVYRNVaEQCpjisL5v3eEA4pW/sGUg
   g+l26PhXPuGRJyGNTX9BBwSJHEuBrnl48ySxMf8IVHTVRnEGawJULz2uk
   Q==;
X-CSE-ConnectionGUID: BjGhSBWZSA+P86i5QLyzHg==
X-CSE-MsgGUID: bHE38WoVQsqwoqi3EOySUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175401428"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175401428"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:14 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8EC2C2AA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C9D9D506B
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BD7356BC7E
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D4A21A000A;
	Mon, 30 Sep 2024 15:44:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 39/40] squashfs-tools-ng: upgrade 1.3.1 -> 1.3.2
Date: Mon, 30 Sep 2024 15:43:04 +0800
Message-Id: <1727682185-12664-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-1.428000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt2HZGDrssVUv4Q
	R/7oUDJy4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOKOOhPFo74Dn+pTB3iVvkxyHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7da4
	QaH8DSZVEFj7ljGvDGBEqAbD/F6cAnjGBqyeAO6WWn0XsdCltiD0H/3PAef/PgA7K0C4VJuBXL7
	MRqjrNgUJIcksTaWT6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112599

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 - Fix prefix path for file globing
 - Missing '--no-pad' option in 'gensquashfs', 'sqfs2tar'
 - Fix version substitution in release script

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{squashfs-tools-ng_1.3.1.bb => squashfs-tools-ng_1.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/squashfs-tools-ng/{squashfs-tools-ng_1.3.1.bb => squashfs-tools-ng_1.3.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.1.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.1.bb
rename to meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
index a542396d4..10e0e27a2 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.1.bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=a709b68f1ce8a9f10aeea6401446c1f4 \
                     file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8 \
                     "
 
-SRCREV = "8f9966c8ea3ea8a854941d041e7fcb9eb4f772fb"
+SRCREV = "667faf69cc35215e33e747b4bffdcba3643c2629"
 SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=fixes-1.3.0"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


