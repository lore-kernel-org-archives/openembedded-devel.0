Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810AACD549A
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:51:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2598.1695109915344374800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132647391"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132647391"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:51:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2083DDE6B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:51:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2434BBF3EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:51:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD99F20079116;
	Tue, 19 Sep 2023 16:51:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.5.0 -> 3.5.2
Date: Tue, 19 Sep 2023 15:51:22 +0800
Message-Id: <1695109882-8002-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--7.877900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mriK5qg1cmsr8CRZok3tr/K3G9
	8loJumsUmL8xDoNc+bw5CkhYoUAlsdFsNBaz++NMOIQ9GP2P2u8XivwflisSrNddtqaP9NTnntU
	3Lv5Rb/2g+fK6/K0AlY8ND/cNz11jsEBAuoaUqK8/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt9Ss5ONHRGPUEqg/0+4yaHdZJnGr49y8N+4jOSegYG3dfImQ3JQhneQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 server tracer example.
 sync connect missing.
 simulator future problem.
 Always close socket on error (reset_sock).
 Revert reset_socket change.
 add close_comm_on_error to example.
 Test long term (HomeAsistant problem).
 Update ruff to 0.0.287 (#1764)
 Remove references to ModbusSerialServer.start
 Readd test to get 100% coverage.
 transport: Don't raise a RunTimeError in ModbusProtocol.error_received()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.5.0.bb => python3-pymodbus_3.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.5.0.bb => python3-pymodbus_3.5.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
index 1eb25afbaa..4cd3801ee7 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6a146397c35e3d0953758ce8803de347"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "4c6fb9af3a6c5a5cba59e4c62812d911f1d5c02dc3aedaaec858990574bc6b4c"
+SRC_URI[sha256sum] = "26c1aa9919b24f2247794d5d9d80f65ec06fdfd9bd6b76b81d446b55335cabf3"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


