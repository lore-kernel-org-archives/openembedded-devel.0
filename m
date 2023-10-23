Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282ACC25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:35:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.136337.1698104113295661274
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137244585"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137244585"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:35:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3115CCA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:35:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 529FED6373
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:35:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 936402005A580;
	Tue, 24 Oct 2023 08:35:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-stack-data: upgrade 0.6.2 -> 0.6.3
Date: Tue, 24 Oct 2023 07:34:38 +0800
Message-Id: <1698104078-31736-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-2.262200-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkG5n+Qp6wEW9Mj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrY0ofApdNjNWQb3DAmjTuvBBXPArjknHtXSTf3DFYy58jTK7NCtKVlTP5A
	bdqxTFgDdzVukNfkvpbYcVarzByAucq6buPO22vR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 handle weird six import error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-stack-data_0.6.2.bb => python3-stack-data_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stack-data_0.6.2.bb => python3-stack-data_0.6.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
index 21e4b77378..55ddff383f 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "stack_data"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815"
+SRC_URI[sha256sum] = "836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9"
 
 RDEPENDS:${PN} = " \
     python3-asttokens \
-- 
2.34.1


