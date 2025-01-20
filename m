Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88454C0218E
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.32642.1737360860401631548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KFqHkk5v;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360864; x=1768896864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Bj1gnR5el0K7PDfMg3Y4rqi9nZW1bXKrsoU1e4E/jVU=;
  b=KFqHkk5vCwHAng2x4fLF7fGrIO5y7EzhahHxyjlLoOkXd7njd+j5PSs3
   dYpuP8onlAhjEXJvfx7dJY1M+hTdrukx3nC1KTfvaiUaOlUyl283cI3eO
   i2mVVNpD05/cncHe6ai84wbEaEb4YFEWoLtM52dqJdYsTPBrDGqMRd9W8
   xeUdZC5J/J6klm8xWxd3+pHrRKrnCSuMZSS9mkPBi/ogRPeEBhIf2/kG1
   yuVy7FR8lidK7hZeSgDW/Uke73E7qGjQ4+v4Ti96wunA7/XsplaesZNYG
   /w4fmf67HTbRj2R21h33JRGkO4HOL6NonyX8JouRzmdRvisieb6Ns4gdp
   w==;
X-CSE-ConnectionGUID: rDzdHOb6QJKZKp7UucteFA==
X-CSE-MsgGUID: 7j1S7tyFQO2Jwmi3cY2iPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187132069"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187132069"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE610DCFC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BC1DDD7866
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 598076BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0098C1A0071;
	Mon, 20 Jan 2025 16:14:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/32] python3-zeroconf: upgrade 0.139.0 -> 0.140.1
Date: Mon, 20 Jan 2025 16:14:05 +0800
Message-Id: <1737360846-4824-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-4.020200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRUjspoiX02Fxby
	bvGKB00gdv3Gh5XGj9rWSVH9Vt1Vje1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFLMuWyTDieh+eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDuwlvt0XdyJMmxMJPFud/tHGH8peIqlzkBLJXChwnTPtZ16InTDDuDmL3ToK0Pbwy+Oso
	zci97EraEUBjQ3YFxkM6nu/i6E+2IK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: wheel builds for aarch64
- fix(docs): remove repetition of words
- feat: small performance improvement to writing outgoing packets
- feat: migrate to native types

License-Update: remove Home-page from PKG-INFO

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zeroconf_0.139.0.bb => python3-zeroconf_0.140.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.139.0.bb => python3-zeroconf_0.140.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.139.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.140.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.139.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.140.1.bb
index 3a45061da8..ced5e31f49 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.139.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.140.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=e77986dc8e2ee22d44a7c863e96852ae"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=93e84222c4bfa3e70c20bb48ae9893b1"
 
-SRC_URI[sha256sum] = "2cfb4ef130aac602c9ed428a52243597ed248cf0d22ac4e2b21d90541de90684"
+SRC_URI[sha256sum] = "477d396cb712247aa5859e59249aabdad3fab1139097794e70b2e4b1625047bf"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


