Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB46C04A94
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.684.1689654370289941097
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="104286641"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="104286641"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:08 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CE38D3EA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55F52D3F01
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D60E020077821;
	Tue, 18 Jul 2023 13:26:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.12 -> 4.3.13
Date: Tue, 18 Jul 2023 12:25:18 +0800
Message-Id: <1689654348-30702-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-9.769900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTSz0JdEAJbSwZuykSn6+/IVg
	EoF3GYKVPSxZ1AMG53teRCP97Z3BwwAwGIAo3ShbA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZfSId5c1ojSOMhvJc3DPaC+xCE2NlBjIjcUJ52LFhfM6t3uV
	LWKVrwbQqsBOC27IfCLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbuGrPnef/I+evosJ
	UiTcljt2tmLhLIYvdZPlTowJpYOwSquAzJRzctkhtfu3y+bc78/zmm4sXwq/jJ9QZBH37rJEGYc
	TiAbDm5dWWJOM2iFMA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103907

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Has some license template updates and spelling fixes
* Adds the ability for admin connections to be advertised through MDNS
* A systemd unit file example is added

License-Update: Update GPL license file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.12.bb => ser2net_4.3.13.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.12.bb => ser2net_4.3.13.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.12.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.12.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
index e38d9edbc3..a4c244d447 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.12.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
@@ -3,13 +3,13 @@ SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/ser2net/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6101bdf937716be9b019c721b28b45d21efddd1ec19ac935aad351c55bd6f83d"
+SRC_URI[sha256sum] = "ed8b98448d535111d9a593b067601a8b53e2874814d706b2421a9490a660d265"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.34.1


