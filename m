Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F79C3065C
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.167225.1719305829345417009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bC3stXRl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305829; x=1750841829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pyIH9Y2gmhIclFzmftZrthBTmUiqFbqXvRSO+HVDm9c=;
  b=bC3stXRlaYrq2jtTDTPQ4ck2SvIExhNqKJ+ttXhxqj5HDTn8an4RDwQz
   jF91hovPHj6MDNAq2NYqsCjlIl4dP7czbfX/NuwlgTwtg9VaZ7R4OGNh4
   vfnnUS8hQ3Z6MNHKMQU5CweskFW8kN34kVlxRRTXy2BoTB1I4WjdhEbT+
   T52p9ugVhfSHILczOysT25qhsAO2TDY8Dw1S4NlSijz/z7HfdU7N5032t
   jdZgbTmXrWPSo9G4JVl2F2iNUWUNNwmJJAatVo0tEB1hyWCF9sMTxqsHU
   /FI0YVtDyVZ/drdZ0AMvmar/v/qJtvzb+dMIbqCz/ieZ/dlp/u77WjmB3
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164089085"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164089085"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3745AD424E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 823B6D7740
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 192B62007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B90E11A0002;
	Tue, 25 Jun 2024 16:57:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 19/57] networkmanager-openvpn: upgrade 1.11.0 -> 1.12.0
Date: Tue, 25 Jun 2024 16:55:52 +0800
Message-Id: <1719305790-11484-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-2.137200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqwxkbalTMB83w6
	H06bMgivNCFxe2F2fwsNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2Zx2
	5js+HUUPi8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZKqtflMnr5Eyb0rtKoMVXZ2+12Q0YHR5eX/qF
	Ni3stv0eslLEwqVLw+UAmp2yIpAJ7sxAQ+7MMBrU9Itckzwqqmx8DwvfX95v5Lv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111033

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Adapt to the new way of handling the 2FA secret by the
  daemon, needed by it to fix a bug with certain clients.
  Requires NetworkManager >= 1.46.2.
* Update Slovenian and Hungarian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.11.0.bb => networkmanager-openvpn_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.11.0.bb => networkmanager-openvpn_1.12.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.11.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.11.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
index f44526ff9..2d2055ba6 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.11.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/Netw
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "2128de06f91b33c13d63cdaa6e178bc1ca57fc770cde3bc7c24891f4d9824501"
+SRC_URI[sha256sum] = "903fd4c0aebd2aa7ac70c9d8c2bed8df922655d22d764514403566ae89b7e886"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.34.1


