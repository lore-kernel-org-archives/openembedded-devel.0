Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00D9C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:19:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16692.1707203942550777552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lnISwxz0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707203940; x=1738739940;
  h=from:to:cc:subject:date:message-id;
  bh=hx8TQLcwnQJXtsMPFyM725cAS7l4DrfLi5fA7BqV4OA=;
  b=lnISwxz0j9SXghkzzlxl5juyoKQULH+6oQjaNQR5B4vCgFgjDV15241Z
   C9+Qiw7IzKSinrD7E82M5rOyP7q4JbR+p5guoHEf0M+v32n10X+TQSj69
   sIkeRT41psE45gS2jySPruWQ8KrI2jp5n0GYSU5c8mA7bYe5kPt7GB3W9
   ywHSfaRRJdlkdlM5fRncJxjTQKYwypkyznPYOlhQoroyRM8JYpFBKWm5O
   h442ePuw3M8bZhxHfdl4xZOphcr1nNdk1h1NAzN8ocBS2nJhrtCeEbckr
   0g9ub+Pxu3p1y8GRzBjDGlegNVuFjyJXP8dwBRwA1CKXp5+ht5Oh3+UlI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148815259"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148815259"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:18:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7ABFB181FEC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:18:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C7453F3695
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:18:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 500A32007912F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:18:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0BDC61A009A;
	Tue,  6 Feb 2024 15:18:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.084 -> 2.085
Date: Tue,  6 Feb 2024 15:18:24 +0800
Message-Id: <1707203904-4481-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--5.183200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuHJC/JOD1QlZeq
	6qF1hgJ+pPkgFEQ0YZkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkj80Za3RRg8IPvhbvFnMJ30Gfj0yGsTsX4pn
	VAeLiB2WjQxpVvxJTOniZITemnmdM=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108593

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- #147 fix test which failed due to behavior changes in OpenSSL 3.2
- update PublicSuffix
- add examples for TLS JA3/JA4 fingerprinting to tls_fingerprint/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.084.bb => libio-socket-ssl-perl_2.085.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.084.bb => libio-socket-ssl-perl_2.085.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.084.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.085.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.084.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.085.bb
index c4fcc5eb8..f7b3d416d 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.084.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.085.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a60d1e04e192363155329560498abd3412c3044295dae092d27fb6e445c71ce1"
+SRC_URI[sha256sum] = "95b2f7c0628a7e246a159665fbf0620d0d7835e3a940f22d3fdd47c3aa799c2e"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.34.1


