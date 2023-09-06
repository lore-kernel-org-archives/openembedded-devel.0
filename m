Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D915FC6165
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:06:15 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2551.1693965970420644993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118952382"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118952382"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:06:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0382FDB3CC
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:06:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DC70CF7C6
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:06:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B1D2007684B;
	Wed,  6 Sep 2023 11:06:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.82.1 -> 0.97.0
Date: Wed,  6 Sep 2023 10:05:50 +0800
Message-Id: <1693965950-15121-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-1.773900-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrR51MNKynh4+Xx4J3y+IHVLCX
	o4a9DN13nC7F+qVaTtq/H8hpjwS9DrUN8Yzp1vtfsDpn40N9M3k6rt3TPmIRUaRdYB98+/gQfFM
	IM6nuWIiqU+rI+c1zkTjzq+x6e1nv7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMog1RxwBNHJ3UCxKH1q1GRzB/SIXlNk88729OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXkCpaWVyNnaCQL4iMYuHurW48HzDsD5qzkq7s3yyPCjmbd0Xs2Keat481K
	cCZO9M6BGIwf4CT9t+t9ZQB+rC+/2dZeJv0bQFCZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104765

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Speed up answering queries (#1255) (2d3aed3)
 Optimize DNSCache.get_by_details (#1254) (ce59787)
 Speed up adding and removing RecordUpdateListeners (#1253) (22e4a29)
 Optimize cache implementation (#1252) (8d3ec79)
 No change re-release due to unrecoverable failed CI run (#1251) (730921b)
 Reduce overhead to answer questions (#1250) (7cb8da0)
 Cache construction of records used to answer queries from the service registry (#1243) (0890f62)
 Remove useless calls in ServiceInfo (#1248) (4e40fae)
 Reduce overhead to process incoming updates by avoiding the handle_response shim (#1247) (5e31f0a)
 Avoid python float conversion in listener hot path (#1245) (816ad4d)
 Reduce overhead to process incoming questions (#1244) (18b65d1)
 Speed up RecordManager with additional cython defs (#1242) (5a76fc5)
 Improve performance by adding cython pxd for RecordManager (#1241) (a7dad3d)
 Build wheels for cpython 3.12 (#1239) (58bc154)
 Use server_key when processing DNSService records (#1238) (cc8feb1)
 Simplify code to unpack properties (#1237) (68d9998)
 Context managers in ServiceBrowser and AsyncServiceBrowser (#1233) (bd8d846)
 Rebuild wheels with cython 3.0.2 (#1236) (dd637fb)
 Speed up question and answer history with a cython pxd (#1234) (703ecb2)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.82.1.bb => python3-zeroconf_0.97.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.82.1.bb => python3-zeroconf_0.97.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.82.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.97.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.82.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.97.0.bb
index 9d3d25d136..9662c3fe3d 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.82.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.97.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "bc876f8128da9baf939f7f5b7b29c8b4571b04a2036b2fa2b0c82db254a78e3e"
+SRC_URI[sha256sum] = "9a06cd21182250100df6c4f4e9de2a47a0ea927c7d5a0446035bb3dfcc17a647"
 
 inherit pypi setuptools3
 
-- 
2.34.1


