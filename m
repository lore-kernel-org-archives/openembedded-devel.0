Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEEFC3271F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.13839.1719816257193245370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pUohrpkd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816256; x=1751352256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=465H0L9DywYRmU0hFNvcSks3hsFTdj/r8DkoJ39DBTM=;
  b=pUohrpkdRszi7y+vO8eJhu8LgSL4B+ou4j6eCDZvxFuLkFjhKwKW2UD7
   lJDei4vUQdmdGMU/BhLYoCs4k5bZLfIxtvYow2kOHPmg8eqDBCRrlE3QD
   OjfX6ybswMUGWkY7n5fXaOklmWZkQtqGxQyMrijKTDAuOOwKS4ZfXK9nB
   /y7LAGENJ50XKqjLCKF4hFWw+a6SC/e/K0m3hX3MkeHYIfIdlI2h3l4Hg
   DkT8yDlyRZUYPq/k5vXw1udpdTFEhxLclw4/EJvolD/mgXMcfdsGmxaNz
   7H3/LmWrvDrzdpgyemndFk7HjFUtm7lWgBWu+ApL8Ty3nTI6+/JTCb4pM
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165457049"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165457049"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 033B4C68E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4990BD968C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9586E206A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88F191A000A;
	Mon,  1 Jul 2024 14:44:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/25] libndp: upgrade 1.8 -> 1.9
Date: Mon,  1 Jul 2024 14:43:42 +0800
Message-Id: <1719816242-11839-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--3.039300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwAYdq1VTXo88h
	GvSwOoPV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6Vgw
	lHd0iuHYJ2N6lvoKB0qwnY0RVRjvrHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Wjp
	38HvaQho9RhBL4N2Nmm0lCBHZBvGvxjOust5U4+8onWMcFafxBd8GcHMF9wBNtUVtPbH1jcG4/e
	0GU4U8318Vr5S/bD7KCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111171

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- ndptool: add support for PREF64 option
- libndp: add support for PREF64 option
- libndp: valid route information option length
- SubmittingPatches: update mailing list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libndp/{libndp_1.8.bb => libndp_1.9.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libndp/{libndp_1.8.bb => libndp_1.9.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
rename to meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
index 80946317e..69eecdd9f 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/jpirko/libndp;branch=master;protocol=https \
            file://0001-libndp-Fix-signature-of-sendto-API.patch \
            "
 # tag for v1.8
-SRCREV = "009ce9cd9b950ffa1f4f94c9436027b936850d0c"
+SRCREV = "2730638bf88984b09531813974f9bd14e1a50165"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.34.1


