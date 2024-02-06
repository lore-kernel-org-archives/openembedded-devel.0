Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3E1C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:42:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.17417.1707208957940540311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D8eqBWt7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707208958; x=1738744958;
  h=from:to:cc:subject:date:message-id;
  bh=92EXoUSFygke5qCLMmMw7S21tU3UMv8itbbYsJUFP6A=;
  b=D8eqBWt7ZGKI0dlwdkfBsBh7opxWDn8kMJkbx3XhwSuJs7RPmpsmQfEr
   jNiuwcTniZhIUzu1mXoz4G93i5OlA7oSNuChueiC9fRD2E+PSECAsSkA3
   dFJOcb3ynpKJ5XQB3cZwU3MAEq7d8PG0kh2G0JWTR0RsXLhQGrnFf0ADA
   agR5SAgkoVep2yfAWaoOMNOm9iLYzf9q6IrcR4QawBHpE3Cg4KLn8lPZd
   6Qu28SgVLld5u1rpG+cFssVnvaQnIX8J1nhJI0Lb8g+Futda6qsPOhXj0
   qVLX3LR3+V4AggrP8rcvyxm2DErzzX8KCqRSuiTvCTSVGie0fwm9oNTA3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148394409"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148394409"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:42:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 16CE2D772D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:42:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E6A5D5624
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:42:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D3612200968F7
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:42:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71FC61A006A;
	Tue,  6 Feb 2024 16:42:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 3.0.1 -> 3.0.2
Date: Tue,  6 Feb 2024 16:41:28 +0800
Message-Id: <1707208888-5826-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-3.975600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvimKcLRvsB1T/4
	0Ae7LpB/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0540yMkq5fGHu2Eok
	GD3z/g2eESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KlUae33G83uu4JQxN/PfvF/7yhPuEX5L2BhKOb5X72qkb7TLR696Ujt/IhJ9dM/QgMXtn
	AVHj2xZlSvoSNv1pMZ0OoKcl+vm0vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108614

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Correct type for jinja_loader property.
-Fix error with --extra-files and --exclude-patterns CLI options.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_3.0.1.bb => python3-flask_3.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.0.1.bb => python3-flask_3.0.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.1.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-flask_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
index 0c6128c65..7692eb116 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "6489f51bb3666def6f314e15f19d50a1869a19ae0e8c9a3641ffe66c77d42403"
+SRC_URI[sha256sum] = "822c03f4b799204250a7ee84b1eddc40665395333973dfb9deebfe425fefcb7d"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
 UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.34.1


