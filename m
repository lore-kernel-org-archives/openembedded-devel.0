Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A334C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.61111.1742893337893207711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W8ss5aOy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893338; x=1774429338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4seGtd8/Iq36+5k34kbp1bCz0N4k5nWD3aaEwG2KfUw=;
  b=W8ss5aOyHN6zsgmDloLP+W0Yf9GnIn5FhwX6QJjrcrCQiicjysr40vem
   HBT9kahvxE5KV73rvv8s7IrRE5Yg8KAnwb+I3xR8csYfXcQpfnpKBbGp2
   sfhXkPNu2BfKltZMsErxLnZ/VuUzqrWedaPcSnh/V8wGWGcMLqYcGTJQV
   DHrgjjOVjzGqPPEkbiefZGx6yOK/w9miyj1P+5E+uZ5S/vOBqcbhFMQII
   7b4xfQokfG8lQmIopnyC+YfQlELfIP9Y1fg0Xmimerfv/+DVkielb1KUa
   9LmPtN1lwQsElYjyIx8/7aHZWJAoqHdAnVo59hRI7OxzJN6TQo07p4v5e
   Q==;
X-CSE-ConnectionGUID: xHTlDjt6S3ubkIM8ZHBwiQ==
X-CSE-MsgGUID: bNdLZX1TSj2AXPg2bE+31A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="193368454"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="193368454"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:16 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C6808D481F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A656BDCB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2514B1A0078;
	Tue, 25 Mar 2025 17:02:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 14/45] libpanel: upgrade 1.8.1 -> 1.10.0
Date: Tue, 25 Mar 2025 17:01:21 +0800
Message-Id: <1742893312-3809-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116239

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- OmniBar has received a fix for changes to AdwClamp
- Updated translations
- Various style improvements to match libadwaita
- Various drag-n-drop improvements
- Remove some deprecated API use

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpanel/{libpanel_1.8.1.bb => libpanel_1.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libpanel/{libpanel_1.8.1.bb => libpanel_1.10.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libpanel/libpanel_1.8.1.bb b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libpanel/libpanel_1.8.1.bb
rename to meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
index 9786acb38c..da47288cf8 100644
--- a/meta-gnome/recipes-gnome/libpanel/libpanel_1.8.1.bb
+++ b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
     libadwaita \
 "
 
-SRC_URI[archive.sha256sum] = "b87b8fa9b79768cc704243793f0158a040a1e46d37b9889188545a7f7dcaa6fb"
+SRC_URI[archive.sha256sum] = "578ce512278ff2bb5eeebb55099392c52537a5abd9bd0629567f102532b38b25"
 
 PACKAGECONFIG ?= ""
 #EXTRA_OEMESON += "-Ddocs=disabled"
-- 
2.43.0


