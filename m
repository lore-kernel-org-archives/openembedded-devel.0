Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3A3C3065D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13838.1719816255859812887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BB1FxDzW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816260; x=1751352260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6VdTy+OoIKACJ5qtVc/ixFdHnKzA8LDsSyZu07OGZX0=;
  b=BB1FxDzWn5+qBRlNXApEwvjs+/eFPGOpzfst1xfYz3YfwXSW9IuPkAbY
   6zvMclST0BFPcg6IG4noZmt2Em9/F4orfY6PPUGvU0Uxl/H2MIGEeafUx
   FIfKnNMslHpfPGWpE6NGELX7bL0CJYB76fU5uY8cod6t57nEUozKRAY0x
   MLvb8JjAMFqu+e2OCO8A7cCMRrtkTkCMAb6alZT/R3QuQdmGc+bwkYWl2
   hiMikrMD4r8uxs20L7KjC0JM8heyS2c72BDvq1QZ1g51GnPsrNLWkSJ8K
   IzX7N/67jiE9+WDFbXiFkqgpgiu4XM7xYGHj3O9brxqkcKu1swKifKeew
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144351938"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144351938"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BEB9BC932B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CC66CF7C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8524820071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33D8E1A000C;
	Mon,  1 Jul 2024 14:44:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/25] python3-dbus-fast: upgrade 2.21.3 -> 2.22.1
Date: Mon,  1 Jul 2024 14:43:48 +0800
Message-Id: <1719816242-11839-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-2.971400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfPeiLeqOhbVEtnf
	JrUSEbFD8QW+WBxJLQUF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzB2O3EJF/FRjbrO
	C1trFoTljppuU2FgoXys/o3uR1t2EV1ZEpO0q1lVDDzmcTNX1sM77uCZs3GOtmWwpCquuH8lQl9
	Q1oSRpDiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111175

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Wheel build exclude for pp37
- Build wheels for aarch64 to allow use in embedded systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.21.3.bb => python3-dbus-fast_2.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.21.3.bb => python3-dbus-fast_2.22.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.3.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.21.3.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
index a4087d647..882b7f6cb 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "8d0f0f61d007c1316ce79cde35ed52c0ce8ce229fd0f0bf8c9af2013ab4516a7"
+SRC_URI[sha256sum] = "aa75dfb5bc7ba42f53391ae503ca5a21bd133e74ebb09965013ba23bdffc9a0e"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


