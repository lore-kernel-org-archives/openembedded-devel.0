Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F89DCF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.48952.1727682214049941115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X6gbC6ZN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682217; x=1759218217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IG6aKqLkBTcE35Fg5F9GbelGQzhE7rlcPcUyGHAZEYc=;
  b=X6gbC6ZNRflUPzk/q/M5vRh/PuR1UCHR4EkUa6xTSUqYry4cfOdtGuUQ
   jyW0tOzPdG4eYX7/WXo56FhKVIQa1ZuV+0O5s1B7mwbAsQwZVniKnYBP9
   xggsPEOktvBkDgLogKM/1fi9HtV9gB8I0dqHD+yWYaNMeceuKABNnT9tL
   IDIwX/4kNgi67MVK16thJnKPDdwqzAig+O19J0aEAts52fMlAlJKeFe91
   ZUMdpluo+cz8hDW8DmCyjd3uDoOn/7NKopbih8fWyn9khSQJY2af9xM6/
   jqYmc8JQHT/t+9ehnbK/QiBDQr0Rgps+oTvHzHgfuVf7Pa1+E6h8MOvUr
   g==;
X-CSE-ConnectionGUID: j3Rjdd2NQxGsg13FKxs8JA==
X-CSE-MsgGUID: 1vrnTZTORqSJLy2cML7bzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163553652"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163553652"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9C30D8011
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19F56D4C2A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99EC320076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4AC781A000A;
	Mon, 30 Sep 2024 15:43:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/40] python3-astroid: upgrade 3.3.2 -> 3.3.4
Date: Mon, 30 Sep 2024 15:42:39 +0800
Message-Id: <1727682185-12664-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--0.453500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytYfsHHDgAMIznu
	QWM5MjklOizVMXf88OonNfn+HYbeuR2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcafH94OWijJgUzo8q1JmkTNUYmDYOKE3QFBsX7NQ6atKZKeeLstp6QMuKbd41RM58PvH
	0AdwtYHPkQ2t3CMmiHEIeFOScvJR2OCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112570

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix regression with f-string inference.
- Fix bug with manager.clear_cache() not fully clearing cache
- Fix a crash from inferring empty format specs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.3.2.bb => python3-astroid_3.3.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.2.bb => python3-astroid_3.3.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.2.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.4.bb
index e5f05bd0e..3ba9f7aa6 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "99e9b5b602cbb005434084309213d6af32bf7a9b743c836749168b8e2b330cbd"
+SRC_URI[sha256sum] = "e73d0b62dd680a7c07cb2cd0ce3c22570b044dd01bd994bc3a2dd16c6cbba162"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


