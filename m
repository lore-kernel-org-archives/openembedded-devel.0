Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D49C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 05:55:25 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.53854.1702619724243737784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 21:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="122934905"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="122934905"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 14:55:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A18FD4F5A
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:55:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D48AAD968C
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:55:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 099BA20097E67;
	Fri, 15 Dec 2023 14:55:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] paho-mqtt-cpp: upgrade 1.3.1 -> 1.3.2
Date: Fri, 15 Dec 2023 13:54:45 +0800
Message-Id: <1702619685-4145-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.005
X-TMASE-Result: 10--1.352600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjVX7AOm/Vrzb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LKeTtOdjMy6gIw
	0FSZOj8RnxLctFp+qhXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7ydo
	qtBdenLXYklmhSKqBprAGfIpy73ks2Zi9DNhK7k3CZcfoKz8ZTqESZcWfH2pJqlBiiXNveFi5pR
	wQkQG/4mSeeSnZmDU6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107488

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fixed generator expression for older CMake
-Bad LWT message in async_publish.cpp sample.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{paho-mqtt-cpp_1.3.1.bb => paho-mqtt-cpp_1.3.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.3.1.bb => paho-mqtt-cpp_1.3.2.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
index 1e1e92339..97f2f3263 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
-"
-SRCREV = "4691652479bb4b398c7b81bde639482b164ae6d6"
+           "
+SRCREV = "5e0d1bf37b4826d680ec066ec42afd133851a681"
 
 DEPENDS = "openssl paho-mqtt-c"
 
-- 
2.34.1


