Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E36CC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:50:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2435.1700121039548590812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="118687459"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="118687459"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:50:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AB32ED4F5A
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:50:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC5DAD9786
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:50:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2640270B02;
	Thu, 16 Nov 2023 16:50:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.19 -> 3.20
Date: Thu, 16 Nov 2023 15:48:13 +0800
Message-Id: <1700120893-21503-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--0.157700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRUjspoiX02F++n
	eLQgWN7l+HFUiys+kAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl7SwC3zqzycUeVs
	0skyEaS2BkESMI05d4g1UuEJlsPFUYwDOL7t3RyFvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLHc5Xsis/cLPv/jrzkyP7nijYe8cYdRUnx2nV7PkJBN7PbR
	ea2n/+UhxrPoOwJ3u1oFopf/FLR+uuFhRFZFgJLkI8JCdXmMxVLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 07:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106778

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix indirect syntax accordingly to (but not by pulling)
-enc2xs: Fix indirect syntax
-encguess: remove duplicate "the"
-Fix spelling in comment
-fix gsm0338 test compatibility with perl < 5.8.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libencode-perl_3.19.bb => libencode-perl_3.20.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.19.bb => libencode-perl_3.20.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb
index fd47543a7..6a083420a 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb
@@ -14,7 +14,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9163f848eef69e4d4cc8838397f0861fd9ea7ede001117dbd9694f8d95052ef5"
+SRC_URI[sha256sum] = "ced8fc06c54c05f227bfd9db38c1ed48a5a295db89f497d42b335afbf1f73517"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


