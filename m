Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4181.1624603890776505253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 23:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: chikazawa.akifu@fujitsu.com)
IronPort-SDR: dntE/K2breD1O2SijiZ4Zdi+G/3eNbBQ3iqDja8HO1KDy56+/nw4HTcBzH6hbcPlQN+24zrztU
 B5srOr9Lnw9+F2Y7KnvqPrPm56SVV9J0ieYXLA8rAOgt0yaGjDfqwlz2bPVf+2mhyVfZStNnRq
 ZYESsk0vkx5sYeSTTsq2QHyia/tuVCq5lJRMGnHLlpOtojdBzzdBdxTlaoM3MzAurHUEL1ba68
 HuW7Ih2NcF5S9WyzJxQJjLtBGXpwI95GHSasTCQSal8qncXjO1CrZxoZ336KlhjmYdE9/5Du8s
 vVQ=
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="22302369"
X-IronPort-AV: E=Sophos;i="5.83,298,1616425200"; 
   d="scan'208";a="22302369"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 25 Jun 2021 15:51:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E7E4EE6159
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jun 2021 15:51:26 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F729216AEC
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jun 2021 15:51:26 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id F3C59405733F3
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jun 2021 15:51:25 +0900 (JST)
From: "Akifumi Chikazawa" <chikazawa.akifu@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
Date: Fri, 25 Jun 2021 15:51:23 +0900
Message-Id: <20210625065123.776264-1-chikazawa.akifu@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client,
not for openvpn.

Signed-off-by: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
index 20f971a3b..7f4cc189c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[md5sum] = "08895fd1142f25fdd94a98315632e1bf"
 SRC_URI[sha256sum] = "75f0044df449430555ca7b995a2b77ab24f2946fdc3668301b8edc23986a5f7e"
 
+# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
+CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
+
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.25.1

