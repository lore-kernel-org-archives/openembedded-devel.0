Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB33C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:20:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.13663.1700633999640191202
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="142083270"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="142083270"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:19:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EECA6D63DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:19:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35094E67B0
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:19:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7455E2005932A;
	Wed, 22 Nov 2023 15:19:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libextutils-cppguess-perl: upgrade 0.26 -> 0.27
Date: Wed, 22 Nov 2023 14:19:02 +0800
Message-Id: <1700633942-7833-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.005
X-TMASE-Result: 10--1.875800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrfrTt+hmA5bKYOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DzWEMQjooUzToUdFbHYUawpE0
	UftPg/VN6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ9tfrAvTU7fK03J+8ot89TRoi+aO9JSS34LlHjqiNme5zJhUYOR4iyMij3nrHGoLgz3tg
	ZLWos1mDo7BU/TC7NpK1YYY1DTKR/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106994

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 support C++20 and C++23 standards, and vendored version output

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-cppguess-perl_0.26.bb => libextutils-cppguess-perl_0.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.26.bb => libextutils-cppguess-perl_0.27.bb} (92%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
similarity index 92%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
index 04a29fdc2..45b772650 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
@@ -12,7 +12,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c8b362b860172a4076acee00438f52b86464f2c500702cfcf7527811ff9a683e"
+SRC_URI[sha256sum] = "b2c7b581901054a32dfcea12536fda8626457ed0bfbc02600bd354bde7e2a9b4"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.34.1


