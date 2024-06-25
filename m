Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D640DC3271E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.167215.1719305816461089847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Svk3mqjB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305819; x=1750841819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GGbW84GxNCH3Bk0b3wNe9zmUxmcMnKHXj7deX+sQ9Oc=;
  b=Svk3mqjBSCOFK/tCJKKbNOOoCX9mF8zdLvHG0bog3CMTer3hNPrYOoQL
   VXGwqEz40ROj6hrGb0K7bPec2hVHeb6fLQT5/w/jgJuG2hm47NUTrHt6/
   uJQCjnrxngn/ic17iMBCtaSZUCfZkEmsw591xLfQGmYBkU3BoN+/xwSg+
   t6a53DKL4k82j8w6iO30L9widhg71I9aN7mjCCVd427RxS3cHr5tBH4gR
   i1NDuPAMCQ8559VYJOfrDl1UBdb+B1D4/YaMptvMM39VwdKZvuUBkEmZz
   Vdcc7MIlIQ8E7xQM09RVSnJWQWICSKsRYYKqNPNHJcYdQz1JnVZk/kAJQ
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869251"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869251"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0349CD8003
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55054D52BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC1932007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A3C71A0002;
	Tue, 25 Jun 2024 16:56:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/57] iniparser: upgrade 4.2.2 -> 4.2.4
Date: Tue, 25 Jun 2024 16:55:42 +0800
Message-Id: <1719305790-11484-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-2.715300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3HztJgOULF9rREf
	fVh/puQ7zflyoTkWhRYAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzbtLE5alrZ3VVvX
	ZtBLjQ6tSAVz79wOPIYmDdh734fcBZ/yAdV4leCNUM+ZEUD6oYPdHFN/NVnky67A8spmc63re1S
	qaWg9pCiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111019

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix paths in generated pkgconfig file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iniparser/{iniparser_4.2.2.bb => iniparser_4.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/iniparser/{iniparser_4.2.2.bb => iniparser_4.2.4.bb} (91%)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.4.bb
similarity index 91%
rename from meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
rename to meta-oe/recipes-support/iniparser/iniparser_4.2.4.bb
index 8c6c60a79..aeac9c30b 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/iniparser/iniparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 SRCBRANCH = "main"
-SRCREV = "762715ca6cdba9dcf31a5af9297b444f3b5b8c00"
+SRCREV = "4e5d1cc10215ce328c61bb5fd7839746e47375f9"
 
 SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
 S = "${WORKDIR}/git"
-- 
2.34.1


