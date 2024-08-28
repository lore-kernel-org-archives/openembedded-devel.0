Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F95C54751
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.8722.1724833546681138626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P0LsW+2y;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833549; x=1756369549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0N27JkqGfwa0aawzQSqqFA5wyAQg2EzQ5T2sXKEwQaw=;
  b=P0LsW+2yfu9Qap9QlH0mMmx/d2zXdy893HOnEPnojMCND1WYZE4XlaLl
   pSKRbwA08VqmPKIskomrBMfLF97K/cRADas70Ac0M7nVNtmCnTVTcjA9O
   mwZ8DlBqNgf6m4mMK9q27q84BV8undT+M7NGmkmLqZTb7NwrUxtG8Ntwo
   yInJXgmOF3au7uH3JHiPpIzKhHCu4Y+D/sk/eyuBuo4p2wq5cnyfV3I3p
   aLpCDzIChyuPNx/eWw0WGpqIuqF7LLc0cdLWnZ54e5OTNa9b62lL/8DxR
   agVa7riuLTrqB43EpwDT09o6mgWAi1WpLMwl4XWztmi3gFJ/vOs0l4Ce/
   Q==;
X-CSE-ConnectionGUID: XRcQ8LXNSZOI/pUNgnlyHw==
X-CSE-MsgGUID: aYRcDOf3SHyMb6mh1km5wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="159907258"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="159907258"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6F66D9231
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA3D9D4BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 82A8220079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F0F71A0002;
	Wed, 28 Aug 2024 16:25:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/46] python3-dbus-fast: upgrade 2.22.1 -> 2.24.0
Date: Wed, 28 Aug 2024 16:25:00 +0800
Message-Id: <1724833525-2162-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.800700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrgbNN0R684zMlr/X7qYoEs9nf
	JrUSEbFD8QW+WBxJLQUF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzQU9v6ONc2Tews3
	MUHhZxcx3jg9g36PX1HKwKTEVQ+WGNuIlkUhkuQkawrizBW+K2fQx8W4NG9g5qbLy84/XpSYiwY
	VGkeI+OiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111999

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Use dbus-run-session to drop X11 dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.22.1.bb => python3-dbus-fast_2.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.22.1.bb => python3-dbus-fast_2.24.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.24.0.bb
index c705b1700..a1cb537b3 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "aa75dfb5bc7ba42f53391ae503ca5a21bd133e74ebb09965013ba23bdffc9a0e"
+SRC_URI[sha256sum] = "72b59c51e882300fd7f6d5bec8fb84ae8dea58040ade1d15c62c7fd9fa546f35"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


