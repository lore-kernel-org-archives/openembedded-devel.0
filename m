Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FF8C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 08:19:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8712.1708503574665983787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 00:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LrAaBzgi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708503575; x=1740039575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zTm5dH8rVg209l/1tbhqsokWgf7O4JB0z0N6I8ANP28=;
  b=LrAaBzgicBUTCyyvAy5uruaLpwAZVZillg4OqF0g+ww6GrvB+OP2riF1
   ySCIZO3EsGVqOp/p82yhr0jdLjX67cNxYo0BQjc3AISFSzszZli8+QIBq
   YXiuFdvQJip+VtWVa+vj35OA31s4TR+IfmTGmGQLT35D0/Gyp+QuEn1SY
   +hyODvqDQ1deyRYz8txL1CTgVngI28m0YqoGeuBNZhWtRpknZ3bVurQkS
   ysHxfnxLchfLRsxx6fGap/DU4vGpjfwuz4ue0BwqCZuSi6AzuxqiPGePf
   pZDbm7gbTg8kgKbo3+nKwfDcdUKDjOeFgzXck/iPBv7OI+jkZDWid8ffD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="151782715"
X-IronPort-AV: E=Sophos;i="6.06,175,1705330800"; 
   d="scan'208";a="151782715"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 17:19:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A1E51D4801
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5D82D6202
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 61DAA20095793
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 16DEF1A006B;
	Wed, 21 Feb 2024 16:19:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-python] [PATCH 2/4] python3-gspread: upgrade 6.0.1 -> 6.0.2
Date: Wed, 21 Feb 2024 16:19:17 +0800
Message-Id: <1708503559-1895-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
References: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28204.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28204.005
X-TMASE-Result: 10-0.973700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa3zndiJkHFMhJcjfum7DjO6lIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzfookL6HpVwwH3C
	vEni0RQg5z7t9GZiRj/4TZAQEoALdpyMjLlhxf1Eb8D1b62hx+D80pFm3GpRr700YyL9b4J5Ccv
	OM79tcFiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108960

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixup gspread client init arguments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.0.1.bb => python3-gspread_6.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.0.1.bb => python3-gspread_6.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
index 7a27bf8db..18338df93 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "8c8bf83be676a019d3a483455d8b17b442f2acfc620172f245422ca4fc960dd0"
+SRC_URI[sha256sum] = "0982beeb07fa3ec4482a3aaa96ca13a1e6b427a0aca4058beab4cdc33c0cbb64"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.34.1


