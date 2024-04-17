Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E78EC04FF6
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2726.1713318103627840586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gWpCH/1W;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318105; x=1744854105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g5yMPNmzRBF5qE6ZwHwZCSl6erQvf7HKCTWfy/cNEfI=;
  b=gWpCH/1WX5r7wRoisNFlysid1+bo6KrjkzzgCEPIvYQmYevT9iKJXPH/
   kOZV3aRsPBDGkS5nAsDQix1/6YdXCZ5PRxDInpWJYrM8VKypmgR8oiaFr
   7E1KODfSfv0YVY5x5lA628fc2omnfjG+jAiQ5qlMqB088TJ3H/wky8ob2
   OFPgpfBCO2PUgp0lNRL1T1yqLmWNZiGKh44gnoap+mvLamGUPlBiV6K6q
   i4kS27GSuMLhDCiKEZ1wI0NAw8fREwzlbpnDK0sZugBf7oL5pgQ2zmsVw
   Ts/MjTEpxTUIwoq3bSU4eNwFT05SeGQVXTKrJ6UnoGl1DaWepdJ0+HKVV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135076063"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135076063"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66254E9604
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A30601CFF9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 097BB2007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA72D1A0002;
	Wed, 17 Apr 2024 09:41:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/49] python3-zeroconf: upgrade 0.131.0 -> 0.132.2
Date: Wed, 17 Apr 2024 09:40:52 +0800
Message-Id: <1713318061-17128-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.063800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrC//1TMV5chNqTj+cW75OIFYM
	JR3dIrh2zIVGiRcEkmnt3TILcCafvgqbmS3v1dsx5dgjTPgwOPTX4KnRCDcFnpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLMcCn41ZpD1Dtt6D
	JMoKUUy42uYeGMFk/kglKlbsQNmoilaX3/fSNTh4i37jk9IbAnMLFM4NEgLJTd+1PWkUoKJAYWb
	Fz+7aK2IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Update references to minimum-supported python version of 3.8
-Bump cibuildwheel to fix wheel builds
-Set change during iteration when dispatching listeners
-Make async_get_service_info available on the Zeroconf object
-Drop python 3.7 support
-Avoid including scope_id in IPv6Address object if its zero

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.131.0.bb => python3-zeroconf_0.132.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.131.0.bb => python3-zeroconf_0.132.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
index 4c7bebe76..41b295abb 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "90c431e99192a044a5e0217afd7ca0ca9824af93190332e6f7baf4da5375f331"
+SRC_URI[sha256sum] = "9ad8bc6e3f168fe8c164634c762d3265c775643defff10e26273623a12d73ae1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


