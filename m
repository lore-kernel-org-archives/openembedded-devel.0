Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FB9CF64A2
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.48956.1727682227416337757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NcGtl4fm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682229; x=1759218229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XdbvoWxdmaZ+Yvfb5BvR4IBMOtwNt+A6Pjuz5DGJKmM=;
  b=NcGtl4fmXDNp9V5jPZA5HuYKZVYdUDt2muCXcS+Nl7x6JrRgwPCv5+jU
   Z3NpppnyI6uVQDTRO6DBTRZ54CSuthHOX4E3mb3iHITkV8+7Yr3TURoUI
   UgBE1ulaNOAZp/pSuMcjA6inz+ShxOr7s9IMGfT5nMq0fzCL2IEuc6Jbc
   efVCsYhaZCqKsAmYrQPSKVUg2TXxYVWbkmN0v2wH/rUeIi86bktrUbKUv
   +Jwr2qW7sb8Iahw6cTzqQBX6wr7kISI27R2rrM764KZCT9VkCqVBalAX7
   i1He097c9qgTMVkoVtuevSC++A0KJbKtH/GrMXJse/pDEkHXFJZWsNz9J
   Q==;
X-CSE-ConnectionGUID: rq0LfRokQA2GfOV7VxFqsg==
X-CSE-MsgGUID: /cMQJvtLT7C3t59TfGciow==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602040"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602040"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29609C932F
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 608D1D5072
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFD946B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A24ED1A000A;
	Mon, 30 Sep 2024 15:43:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/40] python3-anyio: upgrade 4.4.0 -> 4.6.0
Date: Mon, 30 Sep 2024 15:42:38 +0800
Message-Id: <1727682185-12664-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--0.613800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj9ryLINaEcBjSJ
	2POnb5leFzn/S92d86XJEgNnnn4noC8oE1Ngob6ls/Hes76OTZBWNh52V409tfgdwtmc9GdT4dO
	sNKuqfazdw/FG3ILzbQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMtiAKnpuMCBqgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyaHrNh/K4hSQxqYO4/Js1KauCN
	bxD5bTrP4LHH15R70viHKSabgXicmWhomTLcM8C/iqiFtoO6JnX/bw/g/Gz0OkZj5Koti9n/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112578

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Dropped support for Python 3.8
- Fixed 100% CPU use on asyncio while waiting for an exiting task group to
  finish while said task group is within a cancelled cancel scope
- Fixed cancel scopes on asyncio not propagating CancelledError on exit when
  the enclosing cancel scope has been effectively cancelled
- Fixed asyncio task groups not yielding control to the event loop at exit if
  there were no child tasks to wait on
- Fixed inconsistent task uncancellation with asyncio cancel scopes belonging
  to a task group when said task group has child tasks running

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.4.0.bb => python3-anyio_4.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.4.0.bb => python3-anyio_4.6.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.4.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.6.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.6.0.bb
index 28c76cbf5..57f071251 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94"
+SRC_URI[sha256sum] = "137b4559cbb034c477165047febb6ff83f390fc3b20bf181c1fc0a728cb8beeb"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.34.1


