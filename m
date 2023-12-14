Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E67C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:48:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.17712.1702543707042841444
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="131708868"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="131708868"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:48:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 000D4CA240
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:48:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 27677D94BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:48:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 57328353853;
	Thu, 14 Dec 2023 17:48:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.8.3 -> 2.8.5
Date: Thu, 14 Dec 2023 16:48:12 +0800
Message-Id: <1702543692-27565-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-2.385600-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrJ4cwIYL6KudGMe+tDjQ3FgHi
	0UCzUuKoBjIbat56EnmbE+bj+sUM9CfdCFu+J/OIEhGH3CRdKUW2W1+oaHtP/ZTx+2LIqNmtaSy
	KmhYVvOoZjaV2LTHs/QXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZmOZ1aYocYsPhjJ
	yg2kElYHp5QGOMb8EgeTjw/FyRX6QfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDmaVi
	vB5mC3kany4ZiVtYNFAWcgyPJmVrEuwrL7bkQetfHFhX6CWoWmW+SdBapooTavXYeRB3v+RNjnO
	jsqEX3Jthhj/LxTerIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107426

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* speedup unaligned copies by always using word shifts (in combination
  with builtin byte swap 64 when available) when bit-endianness and
  machine byte-order are opposite
* add 'HAVE_BUILTIN_BSWAP64' to header
* avoid misaligned pointers when casting to '(uint64_t *)'
* add tests
* simplify 'copy_n()' (remove special cases), see #d2d6fd53
* add [word shift example C program](../examples/shift_r8.c),
  and simplify 'shift_r8()'
* improve documentation and testing
* add [roadmap](https://github.com/ilanschnell/bitarray#roadmap)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.8.3.bb => python3-bitarray_2.8.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.8.3.bb => python3-bitarray_2.8.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.8.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.8.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.8.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.8.5.bb
index acacdab6d..5047784ab 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.8.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "e15587b2bdf18d32eb3ba25f5f5a51bedd0dc06b3112a4c53dab5e7753bc6588"
+SRC_URI[sha256sum] = "b7564fd218cc4479f7f0106d341e096f78907b47865aeeff702c807df1927c01"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


