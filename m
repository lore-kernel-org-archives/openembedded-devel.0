Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA8AE69EB9
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8203.1733185015403613953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZOhRyvpk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185026; x=1764721026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2whT6RHuIpkbRmABY3DZSkvrAdtb4jYPrsJpEWoKRZE=;
  b=ZOhRyvpkA4E7xAULBGIEBRaOGf5gky7xhfj9YjjJJn0x54mvtyUTQDgU
   70roJPdP3+MFEOePW5sCivh7kJSY0tDUeGqAfEylAvqNyt8/n4/wQ8YtR
   WmiNzy2Mv7Vxn1dC4jhRwggO5loXjSMLSWi/MlDtFiinV18R5cIeTlfip
   rvOHg/GVxudA5Gxcmrz7aBijxrEXMa/qX0SrUxRtg+qP+WmYFnyuv7qyt
   qGx4zOmU8r1BzvYD0Boo27u37bwoJQYhQQhQHTwMtqaNUy6JvdlmnTeXw
   B+PUKtVOAsyIQ8pFNiGpErRt1BXM1LC2XyWc0G+XheGq9DBDTP1Zx/8Li
   g==;
X-CSE-ConnectionGUID: iPY5Pl/bS4KLR7rWIN+ccg==
X-CSE-MsgGUID: MkkwH56fSje3HmBCus5hGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170368343"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170368343"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8301D501A
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AFB9CD5085
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 453CD6CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA94D1A0003;
	Tue,  3 Dec 2024 08:17:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/34] python3-tomli: upgrade 2.1.0 -> 2.2.1
Date: Tue,  3 Dec 2024 08:16:33 +0800
Message-Id: <1733184999-27041-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--0.437600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiAI7Mvq/sL5zb/
	gK3zzUOa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFM7MphpKXzghTb6CyZQ5VhHx8c
	ocl7+ruTPcE/1344jKBahoqy20kEbXPNrhgu4v1fM4oUrPDn6y1sSRxQ5fOqbJscAsHm8sYOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114170

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixed:
 Don't attempt to compile binary wheels for Python 3.8, 3.9 and 3.10 where
 cibuildwheel depends on a conflicting Tomli version
Added:
 mypyc generated binary wheels for common platforms

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-tomli_2.1.0.bb => python3-tomli_2.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli_2.1.0.bb => python3-tomli_2.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.1.0.bb b/meta-python/recipes-devtools/python/python3-tomli_2.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tomli_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-tomli_2.2.1.bb
index 9f27bed9bc..a3af5302ed 100644
--- a/meta-python/recipes-devtools/python/python3-tomli_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "3f646cae2aec94e17d04973e4249548320197cfabdf130015d023de4b74d8ab8"
+SRC_URI[sha256sum] = "cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


