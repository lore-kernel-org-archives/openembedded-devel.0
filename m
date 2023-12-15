Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04B0C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:35:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.46307.1702600506376816273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143428007"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143428007"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:35:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D40ED9DA8
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:35:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42B18D3F3E
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:35:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7050B202D3292;
	Fri, 15 Dec 2023 09:34:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.127.0 -> 0.128.4
Date: Fri, 15 Dec 2023 08:31:19 +0800
Message-Id: <1702600279-1939-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.003
X-TMASE-Result: 10-1.474700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrC//1TMV5chPqFRQsrMdGBNMp
	V5DMzfm+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedli+
	BaqMwTNrVuPnsbKmJliiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVbrT+ifGfdteACZaBGkZx0N/a1lasJuad3EpVRas0D5UHRVBmdOq/OCwwDacBXh9cgV2
	F95PrMypG9HHl3uHv+5k5lTLhQknFLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107478

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Re-expose ServiceInfo._set_properties for backwards compat
-Correct nsec record writing
-Timestamps missing double precision
-Match cython version for dev deps to build deps
-Correct handling of IPv6 addresses with scope_id in ServiceInfo
-Speed up unpacking TXT record data in ServiceInfo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.127.0.bb => python3-zeroconf_0.128.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.127.0.bb => python3-zeroconf_0.128.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.127.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.128.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.127.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.128.4.bb
index 45df13eec..bb3a163c8 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.127.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.128.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "1ec001989666be7f76630d6bb8b07fb3928d655fa79a1484674a776778c9a1b3"
+SRC_URI[sha256sum] = "57590a48e36897a04ea4b1a41ba6bbf833637b99ac6fa9530a2f70783d916c39"
 
 inherit pypi setuptools3
 
-- 
2.34.1


