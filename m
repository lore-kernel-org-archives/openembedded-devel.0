Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2569BC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:35:14 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.16812.1707204909785359396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i8jpB/uC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707204909; x=1738740909;
  h=from:to:cc:subject:date:message-id;
  bh=Ct3L0mqSepIPMvjnMleHMMdPkRrWp5GUZdUzJ6gjEF8=;
  b=i8jpB/uCbY6nuADhrE+JpKa8/+RgsqbORn3yGGgFIIkL/niAuRK3Krex
   wOiBUT2xF3c/5BNAJOGBPYQr1MlugB8pE1Tnu3Vy1FUY2ycb9wzRUpG7F
   Vts7wPeirYVx7Sk2fJFrPHIz1zDkz3MCHiRgOOeI+bwj36gwpUrPx5Qst
   Lic0OuPeOxNvH4x7kafv5jzd5nuEuZy+T491fwAHEhsvCve1dx4k6OcZw
   DRUEQ03uLFsUFOahfH2+amEMeeWAjbsk9Pt4thc2j013kWDlX4LqzzUCv
   4Vhrszawb4SZZgTi6OMq5pvFCuBy9+sqZZD807Mi1FcfvGTv+7yXshowy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148551254"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148551254"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:35:07 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 871ABD4800
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:35:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8419426E7B6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:35:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0805E200936B3
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:35:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 97B171A006A;
	Tue,  6 Feb 2024 15:35:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] network-manager-applet: upgrade 1.34.0 -> 1.36.0
Date: Tue,  6 Feb 2024 15:31:32 +0800
Message-Id: <1707204692-4771-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--1.709800-10.000000
X-TMASE-MatchedRID: hjMKqWyETKidsbtv2+OMzH1zro62qhdCpxAd6mi1Ga2W9tPSYe27VBjt
	A5XNwkHabaFo1bdWCGbvzMxx4HdirmmVAlNV7gkX/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ3JB
	1YIf9iAqWqc7iWjI8pWRGSnUqeCO9oc50oBUFVx+eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDtNwAkxbujCN63luATGCovDlcNbLUdZ/Ewx6rla0x4Olg/SyZGYl4clQaiNZls91l+Fpb
	8+g99sSN5MaNUYlA9U8ye82fNFxPYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108599

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Support WiFi's cloned-mac "stable-ssid"
* Update translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...anager-applet_1.34.0.bb => network-manager-applet_1.36.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.34.0.bb => network-manager-applet_1.36.0.bb} (91%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
similarity index 91%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
index 312d759db..5f1f05cb2 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
@@ -10,7 +10,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[archive.sha256sum] = "ab368e470f6b161fc8b834bc97912b7e79af92b8cd7ea399c2d400ce89aba5a8"
+SRC_URI[archive.sha256sum] = "a84704487ea3afe1485c47fb2ab598b8f779f540ae0dcbf0a1c5f85e64a7e253"
 
 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON = "-Dappindicator=no"
-- 
2.34.1


