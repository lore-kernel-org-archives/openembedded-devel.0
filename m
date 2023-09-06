Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F479CCFA0E
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:57:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2404.1693965448103656604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132253514"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="132253514"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:57:26 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19920D3EA9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:57:23 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 688C0D3F27
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:57:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 840072FC7C3F;
	Wed,  6 Sep 2023 10:57:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.4.1 -> 3.5.0
Date: Wed,  6 Sep 2023 09:57:07 +0800
Message-Id: <1693965427-14266-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10--7.442400-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yRIRh9wkXSlFUtw/YGMOdn/9wRnyxuPjhD7C
	2zi5xdOE59thHEq0AZ3QiPkh3igW2vmEPaHBc5dLGXGu0jdPFGRgSkbYPaRxGsy2i0a2kXlWaxZ
	lX1gwMFtGyQcPp8nxAZXX/zcIXxHo7M/D8JRnBg3GL//8mlodA1rhZu06i+HhT2QlW88/4CSK6p
	2E8ZFRSn23wlO0m+lODcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4IxtuZ60
	9qxqlF+DVHHAE0cndQGFBbDeVn4hTsE6PWVyEks3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0YzpbdT4ued/i5SbMje0pwqKwyRozYsPEAq6plhxhAzwZrk2lUVrIK
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104743

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Remove Copyright from LICENSE: xdist loadscope (test is not split). (#1708)

Changelog:
============
 Async retry (#1752)
 test_client: Fix test_client_protocol_execute() (#1751)
 Use enums for constants (#1743)
 Local Echo Broadcast with Async Clients (#1744)
 Fix #1746 . Return missing result (#1748)
 Document nullmodem. (#1739)
 Add system health check to all tests. (#1736)
 Handle partial message in ReadDeviceInformationResponse (#1738)
 Broadcast with Handle Local Echo (#1737)
 transport_emulator, part II. (#1710)
 Added file AUTHORS, to list all Volunteers. (#1734)
 Fix #1702 and #1728 (#1733)
 Clear retry count when success. (#1732)
 RFC: Reduce parameters for REPL server classes (#1714)
 retries=1, solved. (#1731)
 Impoved the example "server_updating.py" (#1720)
 pylint 3.11 (#1730)
 Correct retry loop. (#1729)
 Fix faulty not check (#1725)
 bugfix local echo handling on sync clients (#1723)
 Updated copyright in LICENSE.
 Correct README pre-commit.
 Fix custom message parsing in RTU framer (#1716)
 Request tracer (#1715)
 pymodbus.server: allow strings for "-p" paramter (#1713)
 New nullmodem and transport. (#1696)
 xdist loadscope (test is not split). (#1708)
 Add client performance example. (#1707)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.4.1.bb => python3-pymodbus_3.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.4.1.bb => python3-pymodbus_3.5.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.4.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.5.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.5.0.bb
index ecc56781a3..1eb25afbaa 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.5.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A fully featured modbus protocol stack in python"
 HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a146397c35e3d0953758ce8803de347"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "2a95a311669f6734f94535332984474e4b4815de1500c74e6b94432a8bd9820a"
+SRC_URI[sha256sum] = "4c6fb9af3a6c5a5cba59e4c62812d911f1d5c02dc3aedaaec858990574bc6b4c"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


