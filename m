Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1BCC1746D
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.13982.1713777372459214114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oQEJmF0R;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777372; x=1745313372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Pk93c2IVYHWViz9W6gqGYrX7OrmJGhqMHe7/szOVHgM=;
  b=oQEJmF0RVdzWT0nNhWE88/bTEva1tfd9e1Q2FRM9x4yJ69NdG8FRHKcz
   XsC3k1ClolU2qlWdPAAW3PuH5wcY6G4iLjk9kcTI5IGTxyT/BalKgIusz
   2ODFA6jAgmiEV1yAqxZu+ZX1Wuoimo2VuFlTS1dgb+Y39Zej6eG3cxPfU
   nMKOo54wQ9Y82q2s6b2GbeHIvy1OJ+g7vufBijTUfC4pmg2igspVtKVyx
   XfdhWRpo35ndEZYLlbQElr3/W6dHQyxfOz2lIMwOrhX2tDeFwxnz0qBiT
   fdb2f4yHwNb8yLtsXJ9Y5+GeSU0hm/bRF9SFPmrjAI/V8xZgRJtQcFbLz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="156298019"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="156298019"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39B5CD9DB9
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6427DD4BD3
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBE2A20093278
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 865F81A000B;
	Mon, 22 Apr 2024 17:16:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/15] python3-pycups: upgrade 2.0.1 -> 2.0.4
Date: Mon, 22 Apr 2024 17:15:39 +0800
Message-Id: <1713777345-29264-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-3.677700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRv4qCLIu0mtIEBc8PVt3SwwlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSze29eV9PfpAroe0
	EoTuTYeRiqe5nrwuJnO5R5afOOW7DVe37OUF8eTNjEassYfphzeNB42fVhBhGIx3kp+7vUtyxkL
	QOY1rrziB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110092

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  removes install_requires from setup.py, which is used for generating OS requirements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pycups_2.0.1.bb => python3-pycups_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycups_2.0.1.bb => python3-pycups_2.0.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pycups_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pycups_2.0.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pycups_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pycups_2.0.4.bb
index 150827300..b7071fa4f 100644
--- a/meta-python/recipes-devtools/python/python3-pycups_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycups_2.0.4.bb
@@ -14,6 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS += "cups"
 
 # See https://pypi.org/project/pycups/ for data
-SRC_URI[sha256sum] = "57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13471dce350e380c90"
+SRC_URI[sha256sum] = "843e385c1dbf694996ca84ef02a7f30c28376035588f5fbeacd6bae005cf7c8d"
 
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


