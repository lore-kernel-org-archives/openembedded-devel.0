Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56520C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 23:50:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.30163.1702857001384588222
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Dec 2023 15:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="143183131"
X-IronPort-AV: E=Sophos;i="6.04,284,1695654000"; 
   d="scan'208";a="143183131"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 08:49:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57BE2D9DA8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 08:49:56 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F7BDCFBB5
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 08:49:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 48CA92FC6437;
	Mon, 18 Dec 2023 08:49:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH V2] paho-mqtt-cpp: upgrade 1.3.1 -> 1.3.2
Date: Mon, 18 Dec 2023 07:49:44 +0800
Message-Id: <1702856984-27455-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28064.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28064.003
X-TMASE-Result: 10--1.282400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjVX7AOm/Vrzb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUGeK
	Aa5WpyDstETqHKPvni4GhSwd7yg+v5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbfjawAA/rpgbmJm1Yj6OzdKtvmz9mg+HGhohb1pjnIOwiWxTDtZQH/valK1uhDhWa03gw
	Qnqoev/Pu5JzaI5kJAdgKsBlNAyr/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 23:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107539

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fixed generator expression for older CMake
-Bad LWT message in async_publish.cpp sample.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{paho-mqtt-cpp_1.3.1.bb => paho-mqtt-cpp_1.3.2.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.3.1.bb => paho-mqtt-cpp_1.3.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
index 1e1e92339..1b2e51c3a 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = " \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master \
+SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.3.x \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
-"
-SRCREV = "4691652479bb4b398c7b81bde639482b164ae6d6"
+           "
+SRCREV = "5e0d1bf37b4826d680ec066ec42afd133851a681"
 
 DEPENDS = "openssl paho-mqtt-c"
 
-- 
2.34.1


