Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24989C54E4F
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.9271.1708419303418609252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lAAw2prw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419303; x=1739955303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6+zWBzQCTR6N2RwBzvuveRiAf7Ih68AGW4++ZOnhAgw=;
  b=lAAw2prw8RoDbvaWTUZCuLpYz4wM9cBW1ME26Bk8kCIzbvBVA9x+wUr7
   XXHYs5xvdg+27PssHXPRppcEjk9dEuy6qcjswgDLKZaY9kpw5u/epdTPc
   nqaYkBKk1KIRnUxw0PeIztjBA+JZ+SNrmppf+tcG6Br3vZ6T2QB54m88Q
   USagkWWhgyojdr1fOU2hfPLLGkPuq6wC0hJLJnDaS5VLCPeNhGFL2zbKg
   DzK5zWL56bA48/7UQGRxNEQ1pF3lCppaZ3JMNztf8/Z9l0B5S5dQ64PNa
   luLWSeRboK9CtYojcbH12JeEs1u5UydOe6SLxVWo6+dG5gLgO3b2s39hx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149905948"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149905948"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87B714DA4FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B90ED3BD86
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 453206C9D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EDB901A006B;
	Tue, 20 Feb 2024 16:54:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/26] python3-twine: upgrade 4.0.2 -> 5.0.0
Date: Tue, 20 Feb 2024 16:54:36 +0800
Message-Id: <1708419281-26047-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGNA4NqdM7aY0gyKXAUOPYkQQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzI1W7qoNqrHYA9l
	D6GE3fYS0HwOhJCkASsjD5hhBwHWibYBQsj302ulpt0MyR0l88dCgDWsygATG3gyZdaaNzZe2Ln
	xfpSHHZiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108941

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_4.0.2.bb => python3-twine_5.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_4.0.2.bb => python3-twine_5.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb b/meta-python/recipes-devtools/python/python3-twine_5.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-twine_5.0.0.bb
index 161b4b221..82bcf4954 100644
--- a/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "9e102ef5fdd5a20661eb88fad46338806c3bd32cf1db729603fe3697b1bc83c8"
+SRC_URI[sha256sum] = "89b0cc7d370a4b66421cc6102f269aa910fe0f1861c124f573cf2ddedbc10cf4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


