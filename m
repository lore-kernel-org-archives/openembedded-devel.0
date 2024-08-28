Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF379C54799
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8719.1724833541946562947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=euyRZy+E;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833541; x=1756369541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Yl3WrXP0JX55CZ9JZIgIokpOKyKIAeuTeXw4jiv1OWQ=;
  b=euyRZy+E8wJuB6MxB+Hd3jtkibEjqO5cOBq7E91LsGWxZ9rGoOjHLise
   ojGj+tGix40AAGBUv0B+fKtZlmtMMDQi0wSrv6xg/65h7zH7L0stiNMHi
   fNvQUFZ2EucTlzF2+A2ALATtCSd8sJ405/8VBMzh6QAsO/eIA3NYZrKX+
   wB4HXiUGWaI0NhXoVhaIy//Yup7K9+aC8lGjT/DWBwlLri+S4arUuL6fk
   7DlBAH3QluAEXrmkU10guTe38NkjROcH1oZFEXmUJCEr//zUYJBA/pjwy
   uQcYw0j8a8Edih8hdybSRLy1TT2H0iBIDMGXU9+aSUPRQGc3udZmCDJJU
   g==;
X-CSE-ConnectionGUID: W4qm+pNlRAeMEMH88By7Pg==
X-CSE-MsgGUID: ww60ZO/9RAyA+SlrIw/Pag==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039564"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039564"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84C38D29FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA49BE49CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60E726BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0854D1A0002;
	Wed, 28 Aug 2024 16:25:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/46] libtest-harness-perl: upgrade 3.48 -> 3.50
Date: Wed, 28 Aug 2024 16:24:49 +0800
Message-Id: <1724833525-2162-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--1.780900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr2FA7wK9mP9dOeMm3G6m0TZ8h
	bkc0rqFcCeertVoXp2gNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl7SwC3zqzycUeVs
	0skyEaS2YL1X4qntgDsw+fYpRV+8EOa6H92+M9FR1e7Xbb6Im2n0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtZ64ovLBGhUz15ag0U4qBuP7cueJk5eDs3CKlG3F9Vb9lwH9o0eT9XuyJt
	sru+yfpeAmQgsLcaayL1VckYPKJOfEcqjFjkoycHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Simplify runtests for easier extension
- Prevent double summary on bail-out
- Prevent bail_out summary when no handler for it is defined
- Tidy up core dump file
- Simplify injecting of @INC paths
- Better check for t/ directory in Perl handler

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibtest-harness-perl_3.48.bb => libtest-harness-perl_3.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.48.bb => libtest-harness-perl_3.50.bb} (98%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.48.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
similarity index 98%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.48.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
index b14fc95f1..24b6806bc 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.48.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
@@ -26,7 +26,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e73ff89c81c1a53f6baeef6816841b89d3384403ad97422a7da9d1eeb20ef9c5"
+SRC_URI[sha256sum] = "79b6acdc444f1924cd4c2e9ed868bdc6e09580021aca8ff078ede2ffef8a6f54"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


