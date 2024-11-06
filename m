Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A537D29F84
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.40024.1730874673696626450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QKDIkpZG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874673; x=1762410673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pkRhp6SxJKKk/DiLn6DyYCPA8hN3klEO0KDkeNMSNmI=;
  b=QKDIkpZGjt6XCBL0q1/jUVuf8hEYD0zfBCGzrPyIxhPsi5znR3t8cLKq
   ELOXvMbrWg4CmdsB9qy1cg/Rj2J3Uel0nVriHgb5/0Uz+mpjR111h47GP
   Q2ZGk1kMWuvqXnikt57DcFXi9h3LDw7jdW2OG/zYDYLPkO60TVq3PSVFQ
   YqRMhg2xVP1cj6PGsNHiu7pHaFwnv2nPuwYmGzh0cUYihUMwM/pDi9bu2
   l9go7AWr2U/M/mNXpht3tthVoKoYh9vWVALeufi5TEFESdFMo2GzZEFM2
   HcXzGLBsXlEiQdDH0xbREKAiH2LvqTMiTX6qDg1g0uqv+uTWgdP5zfC3E
   g==;
X-CSE-ConnectionGUID: Nf6x+wgXTXCTOn1bs0TvAw==
X-CSE-MsgGUID: 6GhrQnOYQBGLIqpV2rdecw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179294500"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179294500"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59375C6841
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A6B9D3F08
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36A5220071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D98AC1A000A;
	Wed,  6 Nov 2024 14:31:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 07/46] libdbd-sqlite-perl: upgrade 1.74 -> 1.76
Date: Wed,  6 Nov 2024 14:30:21 +0800
Message-Id: <1730874660-2364-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--3.581900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrC//1TMV5chMeZzJlaRLGxb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BzNCdGumZsSdW0pkpPR1Da4nP
	T8jZv1NHi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHIqzET/dJ25Hodi0Ndy/XO1rL
	+Wp5hnGMxNi460+aKdbLbIJGTj92VwFcwfR2qCQGF5TysyO5WjYh/YjHQ/C8Kpcze0GxJfG+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113692

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Switched to a production version
- Upgraded SQLite to 3.46.1
- Fix for Windows quadmath builds
- Omit load_extension if static build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libdbd-sqlite-perl_1.74.bb => libdbd-sqlite-perl_1.76.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.74.bb => libdbd-sqlite-perl_1.76.bb} (94%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.74.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
similarity index 94%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.74.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
index e5483e8c2..8425607ee 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.74.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
@@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[sha256sum] = "8994997d84b9feb4547795f78746c661fb72e3cb6a25dbdd789b731f5688a4dd"
+SRC_URI[sha256sum] = "0a33a7a935be63371071dbe600cfaefa67cd971b67580a917bbf6ebaf723c584"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


