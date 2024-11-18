Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A120D43FFE
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.37267.1731922213179768646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uCIwa2qX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922215; x=1763458215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=upQyyqT4P4v9pCByEYDMuWt22ZWTjPaLlSTk2WV1vVg=;
  b=uCIwa2qX6Ur6K3qQjViOG2IwjYKc7W/+shIX/r6NiU3WZX0Er3vQGsNf
   vZZRa6Z90RrWhSeg/qXEcdNN5zCEiWrUWSaDausS82N31/Y7vMJ6HMJsx
   ZIgtYhUbkMS2JPq8CemHgwc3wOrUGDEffzCeqnwzOLzW67XWqYwlOHZRv
   cp4qjkXKWpYH80YElKRa5xvlDvjFFsI2oyaTUI9gNYlse8e3LEOTtluAM
   LVKQfs7xx5/mxl+kBbl8Cxvaeokn4cVbCdAYuIhWdpMrlSiWFZ89mfhd9
   dHQTjJvpVr1agMFBML0dMal6Y0RRvXXioG8Jc7/e1Y/pa+m1iEKSSCMMc
   Q==;
X-CSE-ConnectionGUID: ZkTCt9DXRzarN+d/s66OoA==
X-CSE-MsgGUID: 5w6x0r9JQp2BIs0gFNG2Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168136712"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168136712"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:14 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7821E3E0F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39BA1F87F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B720520071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 677B01A000B;
	Mon, 18 Nov 2024 17:30:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/32] python3-dbus-fast: upgrade 2.24.3 -> 2.24.4
Date: Mon, 18 Nov 2024 17:29:38 +0800
Message-Id: <1731922195-5266-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-2.285500-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrEITY2UGMiNw7frB/dYje8dnf
	JrUSEbFD8QW+WBxJLQUF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0540yMkq5fGHu2aRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFKzwrwLWn6gy/YdOc5pjoThb1J
	HYD8tEmlsuVsJ15xZ4SPdq5Gn1J8rcg0SeZukdaRRSkoBdcMCuY18uvmNp2nNquEPkZa3bEex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113880

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Exclude .c files from being shipped

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.24.3.bb => python3-dbus-fast_2.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.24.3.bb => python3-dbus-fast_2.24.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
index bf267ed86..9aa88b4e2 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "9042a1b565ecac4f8e04df79376de1d1d31e4c82eddb6e71e8b8d82d0c94dd3d"
+SRC_URI[sha256sum] = "58f97e8342d6cd11ebb2c8ac959c5bb342eb83e29180528690b323a5a5def41c"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


