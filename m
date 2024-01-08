Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4015AC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:56:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.7157.1704722211538049471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="133099581"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="133099581"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:56:48 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DA48ED433D
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:56:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 16CE4D6458
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:56:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA51F6CB32
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:56:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 667811A0072;
	Mon,  8 Jan 2024 21:56:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.14.0 -> 5.14.1
Date: Mon,  8 Jan 2024 21:56:37 +0800
Message-Id: <1704722197-31049-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--0.532100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyspItvvrTT/t76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXdPm
	6Zo4+L6tTuonBMFFbQLpJuB6d/2tKza+iC7GCXIe5Qh+YCV6Lzskve414D25Iw107AsVn68axwl
	bCswz9xbeO5hf4NMUbyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108162

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-FIX: map - to _ for environement variable prefix.
-chore: update pre-commit hooks
-Update ruff config

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-traitlets_5.14.0.bb => python3-traitlets_5.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.14.0.bb => python3-traitlets_5.14.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.14.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
index 19ea0113a..0089d6c6e 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "fcdaa8ac49c04dfa0ed3ee3384ef6dfdb5d6f3741502be247279407679296772"
+SRC_URI[sha256sum] = "8585105b371a04b8316a43d5ce29c098575c2e477850b62b848b964f1444527e"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


