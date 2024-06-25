Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C19FC3065A
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.166853.1719305827118054757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lzlsZ2ts;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305827; x=1750841827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gWeYYYwKinR92+4k3up6zvrPFbff9/uJBNQ5xX4X7hQ=;
  b=lzlsZ2tsKuop5Qt5KD8oxHH8SLGOadgLYxb6Hnqkffo2jK8/IoDwQHdR
   PQg+nB8SP/eEbnZ58agISZnioNHfvlOUMoKjEID1Hn6Cz9+jKih51I9uO
   Zx9IERBZbsUmXBHZCIEcOy9NYOWISsd7h38sHAXqI26vP4lMb9YXLY1EZ
   e8rqGsbTOqnr0BXH+Bo0N82yv2/ICzspFy1fZD1FHHJ22ZsRSgOpb0206
   2pqSZGXZbigAGLwcw4N5KUnEgt/bvffH1xzjUvN8VOA12neicsRhN8ERj
   wm1MSbOKmeNAYRptUsLctj99XJNqJCVzPkN3zaSj+/+BYwpzWBx+ufcGH
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913869"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913869"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DE40ED5A47
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 321E2CFAB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B0442E2B25
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 58A4B1A0002;
	Tue, 25 Jun 2024 16:57:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 18/57] msgraph: upgrade 0.2.2 -> 0.2.3
Date: Tue, 25 Jun 2024 16:55:51 +0800
Message-Id: <1719305790-11484-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.111000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyucLgQI+sLoSA8a
	TIJcWnGP4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u089
	1mUd9JVRYPNn6POdBJTqBshiiSFCpKdFN4fct4yw5ZRbFNAl0j30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtNFYcy8xX7kTjwakl5QB5KTxfF0A3YJaqHpLmNbqRVAGZmNZkI9EwZtjkk
	Kt/8X6wXKjRKhBfI3i25VVMyFoh1QtS7+MJIDbJHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix memory leaks
* Fix logger level warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../msgraph/{msgraph_0.2.2.bb => msgraph_0.2.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/msgraph/{msgraph_0.2.2.bb => msgraph_0.2.3.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.2.bb b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/msgraph/msgraph_0.2.2.bb
rename to meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
index a4b434950..f3f66c3dc 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.2.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 inherit gnomebase gobject-introspection gi-docgen features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "12cc954f750bb137ace8500fe9355d26e6e00ef6ccaab2950e9d360e92758335"
+SRC_URI[archive.sha256sum] = "ed42e800cb7f0a07477cd9e3e744cdc1a240a6ad7ab96b8a875806267a9fddb0"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


