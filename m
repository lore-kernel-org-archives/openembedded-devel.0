Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A61AC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:32:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.6588.1704720762311445010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145455995"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145455995"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:32:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9FAED7AC6
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:32:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE236BDA54
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:32:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 699706B4CC
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:32:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 213521A0072;
	Mon,  8 Jan 2024 21:32:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lapack: upgrade 3.10.1 -> 3.12.0
Date: Mon,  8 Jan 2024 21:31:19 +0800
Message-Id: <1704720679-30293-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--1.259100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuW77/y896shr9+Kgn2XgeEukIs3g1Hje1vZ
	7s3YIVDI6NmtdFz2VVFqMpD0v8cWt+/CYwUsia6FvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFAautWAPg0yaFqQ4RSWdcp+T2eGFAF7NIQJEI
	5z3e555d8+J+C2IzWHd91phas548IVU/8VbJiRErkqEwdnWQbrjwsqF1bpDf+x9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108143

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lapack/{lapack_3.10.1.bb => lapack_3.12.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/lapack/{lapack_3.10.1.bb => lapack_3.12.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
rename to meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index 787ace440..fef9d3a80 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linear Algebra PACKage"
 URL = "http://www.netlib.org/lapack"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a32c99f24d097c72d1857e533b55642b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d0e7a458f9fcbf0a3ba97cef3128b85d"
 
 # Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
 # Enabling FORTRAN
@@ -16,7 +16,7 @@ DEPENDS = "libgfortran \
           "
 RDEPENDS:${PN}-ptest += "cmake"
 
-SRCREV = "32b062a33352e05771dcc01b981ebe961bf2e42f"
+SRCREV = "04b044e020a3560ccfa9988c8a80a1fb7083fc2e"
 SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
           "
-- 
2.34.1


