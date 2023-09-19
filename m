Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C79EED611
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:31:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2198.1695108711990296053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111493684"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111493684"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:31:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A1C4CD29E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:31:47 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9550B4EFBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:31:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC6952FC6B2A;
	Tue, 19 Sep 2023 16:31:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] geoclue: upgrade 2.7.0 -> 2.7.1
Date: Tue, 19 Sep 2023 15:31:31 +0800
Message-Id: <1695108691-7036-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--2.381800-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqynTmJuhIfqulXR
	VdivJV8Yw/XDCZYOi1+mOgbyDjV9sPBpaT0Fx7hnKsurITpSv+ND4fIWBBkbWqE/y78rI2AYa1h
	UFYb8XBYwzuCBC6WqlXXZlJ8r5hRkXXCpH9i6ZmoD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK2NVt
	llT6qPHmhu7OI/MQXW5p98cjyQCaI2YNXUKC1G1mgws6g0ewz2RHDXTtwRFPv+Aw16GgqpOyrJt
	dE04Qwi7QHQxPxLQSSAMuqetGVetnyef22ep6XYxlblqLlYqXJYCQtczK29hfsldkvzPiWKmxUQ
	41tLzccGzZ+LtemoUq4TKCVmB/OCCc54B/TrZ7E031FH7OxHHIRIt4zVwKzK8EaUAl7eNOH+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104964

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add 'age' field to MLS locate queries
- Location updates now always have an accuracy value
- Improvements to NMEA parsing:
  - Parse NMEA timestamps with sub-second accuracy
  - Add default accuracy to NMEA RMC locations
  - Ignore locations from GGA and RMC sentences if the GNSS fix is not valid
- Prioritize GNSS sources with a recent fix over other sources, preventing location jumps
- Install D-Bus policy in /usr/share, not /etc
- Upgrade GLib / Gio dependency to version 2.68.0
- Correct gi annotations in GClueSimple
- Various small fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../geoclue/{geoclue_2.7.0.bb => geoclue_2.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.7.0.bb => geoclue_2.7.1.bb} (97%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
similarity index 97%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
index 822e3043eb..2628b77102 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
 
-SRCREV = "bbfb6289dedb88cb8155d9f6868787d5432e1f90"
+SRCREV = "8a24f60969d4c235d9918796c38a6a9c42e10131"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master \
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
-- 
2.34.1


