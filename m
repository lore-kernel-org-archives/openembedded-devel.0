Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B13C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.33830.1721034180775824157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MC6LqfCp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034181; x=1752570181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KnSPQ0Exf2Ow+GdsuXMpX8JYgtgTfcF98E56yfAyuaY=;
  b=MC6LqfCpANhfuKXaLrKL3+ClOrWHM27hBQeH/fZrkfhuuSOy086YbGCq
   gM5YEw+WWld0ZZYA9FelBumAeUlZyLhB7FJYMyVJNcx0wpDuT5AK6U7Vc
   ho8rb0jGEER2HD65MV6pAyatb0E37eaEjyUjhAphNYRY8hFErgCeCSbJx
   lm8IdSvLrUXkpP4oPtEXAGrGmDfMNEp8XR5/UK9qq5hre8vLOMMCf+9tc
   +2RjO0l0/aihFDKfvdmYvNlg4DVikppjbfSFpxwVq0wST0pduvUE5hbJz
   8v+vYmaEfIk00FQpaJgPi8MwCvW3ujbUMtH6toDc/KAlpxzm08wkbs21m
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166987410"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166987410"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89E94C68E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C5E0CD5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 54B936BE5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 046F91A000A;
	Mon, 15 Jul 2024 17:02:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/38] python3-argh: upgrade 0.31.2 -> 0.31.3
Date: Mon, 15 Jul 2024 17:02:09 +0800
Message-Id: <1721034151-540-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10-0.799400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysIUP3jxL0Uteik
	wR/RlN8a4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAeMafvYWeHVIfEMeb4IB4ULVv
	64fA2OePaAU4wPv2G+VNUSjU09UsO9yrrWZnhHPz/Hkzgxr1Gvx3C+wFAsEWQ12UYtEzAmPux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111339

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix type annotation of errors in wrap_errors
- fix: exposing func arg in CLI under a different name via deco
- fix: tests were failing under Python 3.13
- Docs update in similar.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-argh_0.31.2.bb => python3-argh_0.31.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.31.2.bb => python3-argh_0.31.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.31.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.31.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-argh_0.31.2.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.31.3.bb
index afcd7d966..82b45d5aa 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.31.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     "
 
-SRC_URI[sha256sum] = "db1c34885804f7d4646c385dc2fb19b45298561322f4c15eae1b133993f9e323"
+SRC_URI[sha256sum] = "f30023d8be14ca5ee6b1b3eeab829151d7bbda464ae07dc4dd5347919c5892f9"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


