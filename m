Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4835C02199
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.32745.1737360861831978250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RgGCUXvY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4QiIhdtJpQPI/LWhmx1UwZnF+elAOhCU/WHzm7GhAlI=;
  b=RgGCUXvYqbsijLQanftft4d55Xs6uBDWu0O+6fNnDw1mnupw2BR2frjJ
   EETV+umbxVTPKwV20ZrJjTxm7sp4V+JFii7W8rGL24HOglwqW9O8YAEdl
   r7UmxhJwGNW6deYScPi3PykJw69hTYpsnKPI70PeC+XzhtsDBtB8+NulT
   cqAfdom02FkamqxqUCxzTQA2393AQcTzWmcDvZUGnamlJSUN2UO+bf9f4
   QG6z43guEk2fahwdOYS4WtEQieD6mfM52InMNR08U+aDGu5Cb1aF+p2FJ
   xgxGgk19jZMzieCFTRxRxyBS4GyeHtSz9nQG+w+m+Cl2lwj4IVat+kDh6
   Q==;
X-CSE-ConnectionGUID: fxc33G/uQ8yFgLf98nz7Uw==
X-CSE-MsgGUID: DNTHNXXGT86s49dsQwqppQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="186303495"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="186303495"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 862E1C2266
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 575E1D4C11
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F16FC20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9F74A1A0071;
	Mon, 20 Jan 2025 16:14:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/32] python3-dbus-fast: upgrade 2.28.0 -> 2.30.2
Date: Mon, 20 Jan 2025 16:13:52 +0800
Message-Id: <1737360846-4824-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-6.505600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt5eyhu4TpIq34I
	TrKeMNGNKqrQ7lLcMnygKELwwYMNFm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4g1UuEJlsPFUkfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2FR9
	Hau8GO7pzPtM5+sFTWdiLPTblOlpOKw7xuQU82Mx+fXEEMCcrMFONadUsS5sGNxWYw68HnNiO0K
	w1mKRFfrISGr54uat7abx04d4iUk77rweoAIK8o
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114980

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix
-----
Fetching release tag during build
Void validate arguments/properties name
Wheel builds on aarch64

Feature
---------
Migrate to using native arm runners for wheel builds
introspect: Implement annotations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.28.0.bb => python3-dbus-fast_2.30.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.28.0.bb => python3-dbus-fast_2.30.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.28.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.30.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.28.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.30.2.bb
index 0a08feb27f..8031023465 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.30.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "ed2612392a7df775256c67bfad8727607e8862541b3984585b016e464b020b23"
+SRC_URI[sha256sum] = "87296315f4a2f2416d495f48cca019ba901d046989e94df2adda84c3170da7b3"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


