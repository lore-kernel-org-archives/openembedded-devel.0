Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CA8C7EE37
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2151.1685951613482680705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="119355215"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="119355215"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:31 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD494D500B
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E923BCF7C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 29A3E2FC8688;
	Mon,  5 Jun 2023 16:53:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.2.2 -> 3.3.0
Date: Mon,  5 Jun 2023 15:53:06 +0800
Message-Id: <1685951589-29920-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10--11.401400-10.000000
X-TMASE-MatchedRID: vQr1bp/0ccWjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvNqTj+cW75OIFF2
	/ZwIHj2QTE6EVsEkSLrep7gfVTiZqz9ETA4D04a1fOaYwP8dcX5ezmeoa8MJ8/5rVOs2bw4RwjA
	is7nEkSXDtQbDbDabXpd3O8J4k5/aBbYhK/comxZIcJTn2HkqsWvaomg0i4KNS/960Jlq0wamJ5
	jCyUYfiZgvsB/iqA3KVNQgAsHni+DzhOfJXqrCRFVeGWZmxN2MZFW4zmF+QELHwEnu5JwrbVy9N
	37VihdAbO+r7poIIfi3Ur9R5VHeqJwsaabgZtY0qdwbW9Wx9tBpeZ1cXZibx/4DDXoaCqk7v4iG
	aCPo3FYzZ9MrbEN2Qw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9nu
	zdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7kQVa2
	QEPUeqKiP/1hTb0kjpoMwa4XJv2C9TY5iJTACsPpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103122

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========

    Stabilize windows tests. (#1567)
    Bump mypy 1.3.0 (#1568)
    Transport integrated in async clients. (#1541)
    Client async corrections (due to 3.1.2) (#1565)
    Server_async[udp], solve 3.1.1 problem. (#1564)
    Remove ModbusTcpDiagClient. (#1560)
    Remove old method from Python2/3 transition (#1559)
    Switch to ruff's version of bandit (#1557)
    Allow reading/writing address 0 in the simulator (#1552)
    Remove references to "defer_start". (#1548)
    Client more robust against faulty response. (#1547)
    Fix missing package_data directives for simulator web (#1544)
    Fix installation instructions (#1543)
    Solve pytest timeout problem. (#1540)
    DiagnosticStatus encode missing tuple check. (#1533)
    test SparseDataStore. (#1532)
    BinaryPayloadBuilder.to_string to BinaryPayloadBuilder.encode (#1526)
    Adding flake8-pytest-style` to ruff (#1520)
    Simplify version management. (#1522)
    pylint and pre-commit autoupdate (#1519)
    Add type hint (#1512)
    Add action to lock issues/PR. (#1508)
    New common transport layer. (#1492)
    Solve serial close raise problem.
    Remove old config values (#1503)
    Document pymodbus.simulator. (#1502)
    Refactor REPL server to reduce complexity (#1499)
    Don't catch KeyboardInterrupt twice for REPL server (#1498)
    Refactor REPL client to reduce complexity (#1489)
    pymodbus.server: listen on ID 1 by default (#1496)
    Clean framer/__init__.py (#1494)
    Duplicate transactions in UDP. (#1486)
    clean ProcessIncommingPacket. (#1491)
    Enable pyupgrade (U) rules in ruff (#1484)
    clean_workflow.yaml solve parameter problem.
    Correct wrong import in test. (#1483)
    Implement pyflakes-simplify (#1480)
    Test case for UDP duplicate msg issue (#1470)
    Test of write_coil. (#1479)
    Test reuse of client object. (#1475)
    Comment about addressing when shared=false (#1474)
    Remove old aliases to OSError (#1473)
    pymodbus.simulator fixes (#1463)
    Fix wrong error message with pymodbus console (#1456)
    update modbusrtuframer (#1435)
    Server multidrop test.: (#1451)
    mypy problem ModbusResponse.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.2.2.bb => python3-pymodbus_3.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.2.2.bb => python3-pymodbus_3.3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.2.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.3.0.bb
index 783bed821..9b84c4f88 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.3.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "6f46f55b41875e5ac41ba660f514f4bb7a732811e303f671b76f310906355089"
+SRC_URI[sha256sum] = "0816a644d0ecc74b488ba9f46f8d6662c4a7272a493f184d2c81c6717fb62355"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


