Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3FEC52CD8
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.33829.1721034180490857910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gOEHmPQK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034180; x=1752570180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GSQmfED4v8J/B2apyYfT9ZDMLSIuZTyEPtQNX5mmQFs=;
  b=gOEHmPQKsqH5X+QE4551bn67tK5RGvztWVOEZOcvxpdI3c1fWZavql3C
   hhZPSBcjBo6sIweQQg0gBqOOGyncGYNuRQtw9j9VnGj9jjrx7Q3M5LpR2
   hUYYlzh4vFYiB7h0zAWXnBq+wR+R/Z6hC6tfiOX4rd0lCSwmckvDgjaCO
   3wCosBYYoe7y7zTuuLB7yEJWfIgHVC8BSr5XEmgoU9D2fh23o1FKaOfN8
   8633N2Zybg2NkwJCYaxhkd8mnukP7nz4VEtvqG5KAVohyoTCsbT43tW3P
   gB/Q9qSg9kgTHZhtyqwSfVgQ60VU2u8V1xKdb/Gy/boKXAUbMz3Ga6FoC
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="154321096"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="154321096"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2951C68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0753AD5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 757C220071A33
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 255C51A000C;
	Mon, 15 Jul 2024 17:02:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/38] mpich: upgrade 4.2.1 -> 4.2.2
Date: Mon, 15 Jul 2024 17:02:05 +0800
Message-Id: <1721034151-540-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-9.035800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOcEj
	oFgm7EFKOxjOtLGgvTjibJ+fLMes5VlJA1K0pMp/OyPKih4RyshMkOX0UoduuTBwx50fHFEC0yO
	PBv1B9XaUdUf9QcMH0eaffHI8kAmikZmKVOLxy1I7Cl8sx4HBG2v34qCfZeB4S6QizeDUeN5wGG
	/7bb9w4OLzNWBegCW2U9w4XVXDWCYLbigRnpKlKWxlRJiH4397RVSBM1WcM3oVPMNXjIq845tij
	Ch/7FKICsT5MRBleJniZ41BAnyIhwaQVBoqVaEd54iKS5bLRlcxfmnngSqiTIGUieSWZmM7
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
# Update embedded libfabric to v1.20.1 and fix compilation with GCC 14.
# Fix dataloop support for MPIX_Type_iov routines
# Fix crash in Hydra when system has many local ip addresses
# Fix RMA fallback check in ch4:ofi netmod
# Fix MPI_UNDEFINED handling in mpi_f08 module
# Fix Slurm environment variable inheritance in Hydra
# Fix multiple issues with large count support in ROMIO
# Fix potential hang in init using PMIx client and nonstandard keys
# Fix crash if PMIx client cannot get appnum from server during init
# Fix other build errors and warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.2.1.bb => mpich_4.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.2.1.bb => mpich_4.2.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.2.1.bb b/meta-oe/recipes-devtools/mpich/mpich_4.2.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_4.2.1.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.2.2.bb
index 9fd8c3bb7..f9ff07740 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.2.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.2.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7a88f0d96d0d7396a7c66bf353235b62"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "23331b2299f287c3419727edc2df8922d7e7abbb9fd0ac74e03b9966f9ad42d7"
+SRC_URI[sha256sum] = "883f5bb3aeabf627cb8492ca02a03b191d09836bbe0f599d8508351179781d41"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.34.1


