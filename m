Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EA3C54E8F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8732.1724833562269321686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HQd0wXRq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833562; x=1756369562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NSXgFGwa9QHm7YBdgc/PrYKnKKRJxMd4J7VGSVZmPKg=;
  b=HQd0wXRqu9aFHTDJEPtiS+6ySzXcNp9bS6izRTsswIuSq5cojNf87iMb
   T6TB1e5H0n2MjtwHIBgXK2qN7+sXspbMHg8XainhaMNL4xKtxUx59Ivtw
   Tv0tR7kKj/6aVoss7+5rkVeX1Go1cx1FFnSHaaGcecAnB5dTabnBdpDVf
   UWK5j9yn+bshDbdvMZ7lZhiN2vQx8+Udj3m/AtsLdSPD+4xZZ72aCKHKY
   ZFnKoibuLX6i0Iyfapo4Zi5nH982RGGKHxfU2iTtC/3Q058qq1WqqU90A
   rkyKEPlMhq+LInxbEuj1qpScYKcDk76GFse1dd5Dgw4yNU4YVWBu08xsT
   g==;
X-CSE-ConnectionGUID: BmCt5urKQqO3LendXQFQig==
X-CSE-MsgGUID: J8Qf4OFgSVyiJlYYod4WtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="159288824"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="159288824"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:26:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26DBCD65E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 68939E49CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F078B6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9D91A1A0002;
	Wed, 28 Aug 2024 16:25:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 46/46] unbound: upgrade 1.20.0 -> 1.21.0
Date: Wed, 28 Aug 2024 16:25:24 +0800
Message-Id: <1724833525-2162-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--2.048700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUNzONa1Rspx31vZ
	7s3YIVDI3lq3YEgY6Jt5Wt9sDpb4Fr78SC5iivxwURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTu/mSc7/GiIvs0XXSJRiGnVgSRuvn8cXU8GjuSCZX/3aHfB/kWtFdMG2QSP/XM+EBuSRDF
	gE4tsdYpz1JwnEHw3KNRBVdj1e/0PIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/NLnetLabs/unbound/releases/tag/release-1.21.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.20.0.bb => unbound_1.21.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.20.0.bb => unbound_1.21.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.20.0.bb b/meta-networking/recipes-support/unbound/unbound_1.21.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.20.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.21.0.bb
index cb4ac04dd..8c042dc5f 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.20.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.21.0.bb
@@ -9,10 +9,10 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.20.0 \
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
            file://run-ptest \
-          "
-SRCREV = "b9525c5fd47ba481a29b90109017d2253beb105d"
+           "
+SRCREV = "79e4c578518886a32475cfbb0de383ff3a905033"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-- 
2.34.1


