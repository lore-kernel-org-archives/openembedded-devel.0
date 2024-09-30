Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5E1CF64A4
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.48952.1727682214049941115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pVfVEXqX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682214; x=1759218214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=K88g/h5aIZqco7/oIyhTfT8yjn0UhjKK/wdoQWVZGhI=;
  b=pVfVEXqXLfIVF6wxujIcB3EMsI3VDpeVX2/Nsa2WUw7w8S6/d0q8TvZ7
   EpMkomPK8RkXcSkffz300E9ppucySP88A3xH44fxu+IEx/rlx5q38coSU
   LXQj9kUjB4aO6X+1qeFKJlyWVbYwayxbbaJXASZcFbu45A9HyqWBDx2FW
   zv8Q4L14pwaM2v8aDjSNM+5ZGxydGPg3m9a4sg2XtlK8JjaDPsWMOj9RT
   l6dZ2GNFF0vxe+cMC+W9iMYC20cS1QIjPv7wKHuyw8GxDJ9rfQlGrmYBL
   DW5CIMU/YOvoLSmCMfaCNGfdoWdHo4hXo9xoyrhClOfux0/faHTpEHksl
   A==;
X-CSE-ConnectionGUID: GGuX/hIqS9KjzAHCtgZ6Dg==
X-CSE-MsgGUID: F/2jqKvAT/OEUZ6v6GfoKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163553631"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163553631"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FC5FCA1E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C9A14BF3C5
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45BFC6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB94B1A01E9;
	Mon, 30 Sep 2024 15:43:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 05/40] libnet-dns-perl: upgrade 1.46 -> 1.47
Date: Mon, 30 Sep 2024 15:42:30 +0800
Message-Id: <1727682185-12664-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--0.811600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svLymF
	OYJJbPqp5/gG8CUYdisNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt77Fo
	gUQ0vV9jGMmVk8JGuBtKJ0pgfCEbo7DLY2FGw/JueAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62ScXjkl+cdO1jy6bmZsy+aLPYAaJ55XRlrUSuFJ0+3OKH8x7U6HadxVSLjn
	tGm3vjgVouPGmT1lsYRmRXSTOxK6wjbS6nIXQclS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Restore current domain name following $INCLUDE in zone file.
- Update RFC and other document referneces.
- Fix rt.cpan.org for issue with parallel run of TSIG tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.46.bb => libnet-dns-perl_1.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.46.bb => libnet-dns-perl_1.47.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.46.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.46.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
index 18ba6336f..7b411f09a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.46.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "91b65cd0f12461802c61ca5474f87b3e29f5182d2e1b3a2ea70702a3efb4a743"
+SRC_URI[sha256sum] = "fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


