Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4D1C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:05:24 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.17098.1707206718318806859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JI5RHZGW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707206718; x=1738742718;
  h=from:to:cc:subject:date:message-id;
  bh=qqH8pwbSiKXqxTVtoC4jAkqQtI7NM33wzmM8CoyLwHs=;
  b=JI5RHZGWFYq5IsgBeUrPbc0gZfFBX1462NkGlvR9hqbZSWoFQu9zLH2W
   idCpLtXBleYrRnthbQFjAzKtkArJA5cT0yecBsjLi8h0KC2+CC1zOosTW
   Unc2jrmTed0I/pJgCj2hkfkdMSq9xZpSyEIApyTdm7n3zO2syCIp+ZCPE
   RkENymiAbiXeixnk1bFL3N0zQuIpBAsVN6RyIJjI8kk2uDImsrI7rivV/
   im+DIixCtXDRK9cipyJ188LDGN0aEZ4+gmtsZQXyIi+Pj81dYhbjoljQD
   hczPCz8F6zJ8S0x9WEUA8oMFYGbZJ+pVD+Lw9y7dJRwddnY4TShFupJAp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148534060"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148534060"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:05:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99760E9A27
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:05:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D3D87CF7C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:05:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DA58E20FD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:05:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E60861A006A;
	Tue,  6 Feb 2024 16:05:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iotop: upgrade 1.25 -> 1.26
Date: Tue,  6 Feb 2024 16:02:11 +0800
Message-Id: <1707206531-5245-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.408200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyc2kGz0N2bplfW
	IQC27i4vjf84k1uW53jqXvXKPBg5Bm0Xr+fj3ww/TuctSpiuWyU2ZWOmuJUS2RKve+dd8RhJeVs
	0skyEaS2BkESMI05d4qjeYGNquYUzTweK12oEGfvdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtg/xcbL3pZGAyTlhz6Dj6zj8JnPxMwTQMr9AYt8xrZb9kRN/dsJk8jKg4x
	jRIq8QQ5Vm0BJ2FmrjKTGhJ1WwTq9RFlrCNyXv1HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108603

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add clock in upper right corner

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/iotop/{iotop_1.25.bb => iotop_1.26.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.25.bb => iotop_1.26.bb} (83%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.25.bb b/meta-oe/recipes-extended/iotop/iotop_1.26.bb
similarity index 83%
rename from meta-oe/recipes-extended/iotop/iotop_1.25.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.26.bb
index 8d19c6298..9b36b57cb 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.25.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.26.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A top utility for I/O"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=72ad44c0841d1e759669d27744e39389"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=686f457fedcecd9b92d69e625291ffa2"
 
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https"
-SRCREV = "9d60bb7e262e0d41b0aa3bcfaa806fa4f42e548a"
+SRCREV = "b15743b04bb04ff1fc6e197d21ba30365349edcb"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


