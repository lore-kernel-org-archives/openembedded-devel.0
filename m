Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38581C47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:42:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6829.1704721334972974918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145719590"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145719590"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:42:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 63D0BD66C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:42:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 953A89A97F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:42:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D4036BC71
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:42:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D6D1D1A0072;
	Mon,  8 Jan 2024 21:42:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argh: upgrade 0.30.5 -> 0.31.0
Date: Mon,  8 Jan 2024 21:41:55 +0800
Message-Id: <1704721315-30488-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-4.591700-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yb/HywF9D+dAe7Z0UyQO5TN4YeSlHZYFomd0
	HV8HOsLWNijPhbt+TiCes2l9sEMcdPrU6jp6y3lQbTdhrAcm88JxXefgn/TNQw3H/quqvfm40Bh
	ZSjgdIiTjq/Cgs3YVRZwCzlUmqhVlnFrnXQej7Jl5deF6OSK9lwznuvL4vzkkWAuSz3ewb23jKL
	wKUXtOneArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtlRXsXSRyV+gtb2e
	7N2CFQyenlAY4xvwSAua2HxxNDjveVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzUkFf
	XXMJj/LiGITdJ5MxDAKQmp7oBxcsEjrAo8VuxzM2nAhFHRlzaSw1IiRlbbaBB4CfXPTalwmKVjM
	FG+DAiEKJtZ/0ak/CiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108149

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
-update feature emphasis in README
-cleanup/enhance README
-fix outdated examples
-fix README (PyPI-friendly ReST)

Changelog:
============
-The typing hints introspection feature is automatically enabled for any command
 (function) which does not have any arguments specified via @arg decorator.
-A small change in the legacy argument mapping policy BY_NAME_IF_HAS_DEFAULT
 concerning the order of variadic positional vs. keyword-only arguments.
-Removed the previously deprecated decorator @expects_obj.
-Type hints: basic usage to infer argument types (fixes #203)
-Support realtime output through a pipe (fixes #145)
-High-level functions argh.dispatch_command() and argh.dispatch_commands()
-now accept a new parameter old_name_mapping_policy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-argh_0.30.5.bb => python3-argh_0.31.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.30.5.bb => python3-argh_0.31.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.30.5.bb b/meta-python/recipes-devtools/python/python3-argh_0.31.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-argh_0.30.5.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.31.0.bb
index 78e614964..24a579fb9 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.30.5.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.31.0.bb
@@ -12,10 +12,10 @@ tool; Argh just makes it easy to use."
 
 LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
-                    file://README.rst;beginline=261;endline=275;md5=39ec83a704aed9f33618c5d04e478a08 \
+                    file://README.rst;beginline=261;endline=275;md5=ba124578a6853962d5038eabef535d12 \
                     "
 
-SRC_URI[sha256sum] = "b37dfd617a09d19a4a7bcaed0e060b288bc7ac8dfdc0facf886a49a25ff33728"
+SRC_URI[sha256sum] = "b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


