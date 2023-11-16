Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22E5C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:08:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2528.1700122133649901481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139690112"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139690112"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:08:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F281CD9D90
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:08:48 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CD90BF4CA
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:08:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09F5C2FC6FA2;
	Thu, 16 Nov 2023 17:08:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.6.6 -> 2.6.7
Date: Thu, 16 Nov 2023 16:07:40 +0800
Message-Id: <1700122060-21795-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10--12.986600-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOZKy
	Pf1j7t43tYdwot7bS63PVObWexNsYGnfobxcpArT8IK7yRWPRNFNLPQl0QAltFrDL9NbEvJiU6e
	mM+AKrjLiKSU5AJar0rGkxfAUrTOZlwt7DABrvp/4Zi3x/9WFOykDYTG6KmZa1YHpLeFUijGN+E
	vrVnBCMYMQfhWIxRKX5sVvz07dXFOVeUDoXrlJzXzmmMD/HXF+TEFC0zV7bKTmfQNim1khnYtUW
	2TdSbko/Z2Kh/D3tzkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7DrG3
	Q1PIT6gUa/alqjG2zYpB8fOwwjt1c3vw2YCM3y/dCok3ibXlQX0tCKdnhB58hYfw868k05b3PDi
	XO/tFSY6HM5rqDwqtZ0J2Zy+l8+zjze8Snx1O9QF3oU2fIsRwL2sWGBAoVpq9z48vQuZZtQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106783

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 dco: fix crash when --multihome is used with --proto tcp
 Mock openvpn_exece on win32 also for test_tls_crypt
 Add warning for the --show-groups command that some groups are missing
 Print peer temporary key details
 Add warning if a p2p NCP client connects to a p2mp server
 Remove openssl engine method for loading the key
 Remove saving initial frame code
 Double check that we do not use a freed buffer when freeing a session
 Fix using to_link buffer after freed
 GHA: do not trigger builds in openvpn-build anymore
 GHA: new workflow to submit scan to Coverity Scan service
 buffer: use memcpy in buf_catrunc
 vcpkg-ports/pkcs11-helper: Backport MinGW series from master to release/2.6
 CMake: backport CMake buildsystem from master to release/2.6
 Remove all traces of the previous MSVC build system
 doc: fix argument name in --route-delay documentation
 dns option: remove support for exclude-domains
 Warn user if INFO control command is too long
 dco-win: get driver version
 dco: warn if DATA_V1 packets are sent to userspace
 Make cert_data.h and test_cryptoapi/pkcs11.c MSVC compliant
 Log OpenSSL errors on failure to set certificate
 configure: disable engines if OPENSSL_NO_ENGINE is defined

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.6.bb => openvpn_2.6.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.6.bb => openvpn_2.6.7.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.7.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.7.bb
index 3688ce409..323abe32c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.7.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "3b074f392818b31aa529b84f76e8b5e4ad03fca764924f46d906bceaaf421034"
+SRC_URI[sha256sum] = "ee9877340b1d8de47eb5b52712c3366855fa6a4a1955bf950c68577bd2039913"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.34.1


