Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3313BC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:43:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6727.1704721378424731053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="124769356"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124769356"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:42:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 08F04D6186
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:42:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3886EF470
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:42:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B6984202D4B74
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:42:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D8F31A0072;
	Mon,  8 Jan 2024 21:42:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cvxopt: upgrade 1.2.7 -> 1.3.2
Date: Mon,  8 Jan 2024 21:42:34 +0800
Message-Id: <1704721354-30543-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.002100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrG24YVeuZGmP5UUyIMY0GrZtX
	hf4dcLJZGJHAl8RgcXD5fIu2trOcXe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKKfVlYfNnNxJAhBeNJICtc+eBzEkCCpnRloMLOoNHsM9q4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKbdB/CxWTRRu+rAZ8KTspSz2vsTce2FiShSyTlcZhv7hYdXD
	TBv1LDYF9XciaSlHuWatcptOlJB0VGb0QN3KO5ZvEn29rDlldyuP7WJg71QGW2o+gmW4IppiB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108150

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixes line search issue in solvers.cp() solvers.cpl()

License-Update:
 CVXOPT version updated to 1.3
 Copyright updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cvxopt_1.2.7.bb => python3-cvxopt_1.3.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cvxopt_1.2.7.bb => python3-cvxopt_1.3.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
rename to meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
index 70e983177..d7d4b22fb 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Convex optimization package"
 HOMEPAGE = "http://cvxopt.org"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=66ec4f8e53d3e733a8c26d5ca3830fba"
 
 SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
 
-SRCREV = "d5a21cf1da62e4269176384b1ff62edac5579f94"
+SRCREV = "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


