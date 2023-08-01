Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA95C41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7614.1690875746271688824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="127862330"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="127862330"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47B9AC68E7
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B7AED9680
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1218410211;
	Tue,  1 Aug 2023 16:42:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.3.2 -> 3.4.1
Date: Tue,  1 Aug 2023 15:41:50 +0800
Message-Id: <1690875717-21608-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--25.674400-10.000000
X-TMASE-MatchedRID: aJfGYVVmw3ijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytq4lKsiqqiRCSD
	VKe738VfsTNOGx4oLUGlQlL/Jg+w8HyHDxbVF+88qh+piAXo1X+fmd9HsjZ0U9WM2x6EZ/S97kO
	yZefHxfcPjCtZ8NM+7BcqoEBxoWZVOa6H92+M9FTObCmYAW3uRXtHqqR5EeXTeLP71KYc7ooIyZ
	Ynq1RP51+fcb09MlU5MraLmL79ve7eTqYM1g96ozw5UYkflSHKNi8L88UV9IDTOHAZDnXUbhrSo
	lPzVnAArEUEZtC+KH+9zXLdyVICyIALX2fTNBeIfOaYwP8dcX4bVzFi+tzvL054ybcbqbRN/qmp
	2YC1otBuMzPm5yoolVTdr6jAw79qfDPEC/yQgPTvdQQaH57xxlQQ0EgzIoPRB/FMznsE8cPu/Qy
	UVIt+aU0NCZDxtvO/5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFjJ
	EFr+olwXCBO/GKkVqOhzOa6g8KrZRMZUCEHkRt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104189

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Fix serial startup problems. (#1701)
  pass source_address in tcp client. (#1700)
  serial server use source_address[0]. (#1699)
  Examples coverage nearly 100%. (#1694)
  new async serial (#1681)
  Docker is not supported (lack of maintainer). (#1693)
  Forwarder write_coil --> write_coil. (#1691)
  Change default source_address to (0.0.0.0, 502) (#1690)
  Update ruff to 0.0.277 (#1689)
  Fix dict comprehension (#1687)
  Removed requests dependency from contrib/explain.py (#1688)
  Fix broken test (#1685)
  Fix readme badges (#1682)
  Bump aiohttp from 3.8.3 to 3.8.5 (#1680)
  pygments from 2.14.0 to 2.15.0 (#1677)
  Handle partial local echo. (#1675)
  clarify handle_local_echo. (#1674)
  async_client: add retries/reconnect. (#1672)
  Fix 3.11 problem. (#1673)
  Add new example simulator server/client. (#1671)
  examples/contrib/explain.py leveraging Rapid SCADA (#1665)
  _logger missed basicConfig. (#1670)
  Bug fix for #1662 (#1663)
  Bug fix for #1661 (#1664)
  Fix typo in config.rst (#1660)
  test action_increment. (#1659)
  test codeql (#1655)
  mypy complaints. (#1656)
  Remove self.params from async client (#1640)
  Drop test of pypy with python 3.8.
  repair server_async.py (#1644)
  move common framer to base. (#1639)
  Restrict Return diag call to bytes. (#1638)
  use slave= in diag requests. (#1636)
  transport listen in server. (#1628)
  CI test.
  Integrate transport in server. (#1617)
  fix getFrameStart for ExceptionResponse (#1627)
  Add min/min to simulator actions.
  Change to "sync client" in forwarder example (#1625)
  Remove docker (lack of maintenance). (#1623)
  Clean defaults (#1618)
  Reduce CI log with no debug. (#1616)
  prepare server to use transport. (#1607)
  Fix RemoteSlaveContext (#1599)
  Combine stale and lock. (#1608)
  update pytest + extensions. (#1610)
  Change version follow PEP 440. (#1609)
  Fix regression with REPL server not listening (#1604)
  Remove handler= for server classes. (#1602)
  Fix write function codes (#1598)
  transport nullmodem (#1591)
  move test of examples to subdirectory. (#1592)
  transport as object, not base class. (#1572)
  Simple examples. (#1590)
  transport_connect as bool. (#1587)
  Prepare dev (#1588)
  Release corrections. (#1586)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.3.2.bb => python3-pymodbus_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.3.2.bb => python3-pymodbus_3.4.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.3.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.4.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.4.1.bb
index 2b7dfd7741..ecc56781a3 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.4.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "33f427f39189567600ea1f8f6ebd7e5f26caf50ef330798792679fcae80ef339"
+SRC_URI[sha256sum] = "2a95a311669f6734f94535332984474e4b4815de1500c74e6b94432a8bd9820a"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


