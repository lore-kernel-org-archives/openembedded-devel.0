Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03433C001DE
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.7504.1687850058802055788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122376654"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122376654"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:17 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C276CA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:14 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BBE3CD5017
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E873688C9E;
	Tue, 27 Jun 2023 16:14:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openfortivpn: upgrade 1.20.3 -> 1.20.5
Date: Tue, 27 Jun 2023 15:12:05 +0800
Message-Id: <1687849939-19941-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--1.355200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLP85tlrdTfE3uDhljfG03rOwpfLMeBwRvAQzqh8D4IY2N4e0micDVelIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzQG6i6UTwKQz4UN
	4mmpZXgrgWEvkxeNxRXPu06/QYQnCwn9pF19cB9NfVvjcjElbHkuncvw2orV0JqT3NnGfrxfHMq
	TGmV9DPiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103599

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{openfortivpn_1.20.3.bb => openfortivpn_1.20.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.20.3.bb => openfortivpn_1.20.5.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.3.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.5.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.3.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.5.bb
index bfd51f7f70..bcfe646913 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.3.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.5.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "45cb8e0f9984f1d54b648e499bda637d96568908"
+SRCREV = "1ccb8ee682af255ae85fecd5fcbab6497ccb6b38"
 
 DEPENDS = "openssl"
 
-- 
2.34.1


