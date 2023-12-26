Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAD3C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:01:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.76542.1703574053205246782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="144624503"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="144624503"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:00:42 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2552CC14A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:00:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 58E2FAB5F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:00:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA36322D934
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:00:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A29481A0072;
	Tue, 26 Dec 2023 15:00:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jasper: Fix install conflict when enable multilib.
Date: Tue, 26 Dec 2023 15:00:33 +0800
Message-Id: <1703574033-12738-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--6.403700-10.000000
X-TMASE-MatchedRID: 1TCQmSpE5OWMPz8Goa6fXdl0i+WyI+91Urr7Qc5WhKiY5nVpihxiw+K5
	fhRxt1aACC8aAmGeO6lV00+whwxVQy/7QU2czuUNA9lly13c/gGs4IQYg+G3CIAjsy+r+wvnkxO
	lHsprLcXBGBivVrAn4IAy6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHutVv/pfLSZ4DBNe
	6BpksBnm/NhUEyigwmaHAE8XR2W/iwFMlIPaIBbQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107789

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/jasper/jas_config.h conflicts between attempted installs of lib32-jasper-dev-4.1.1-r0.armv7ahf_neon and jasper-dev-4.1.1-r0.cortexa57

The differences between the two files are as follows:
@@ -44,10 +44,10 @@
 /* #undef JAS_HAVE_INT128_T */

 #define JAS_SIZEOF_INT 4
-#define JAS_SIZEOF_LONG 4
+#define JAS_SIZEOF_LONG 8
 #define JAS_SIZEOF_LLONG 8
-#define JAS_SIZEOF_SIZE_T 4
-#define JAS_SIZEOF_SSIZE_T 4
+#define JAS_SIZEOF_SIZE_T 8
+#define JAS_SIZEOF_SSIZE_T 8

 #define JAS_HAVE_FCNTL_H
 /* #undef JAS_HAVE_IO_H */

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
index 14f50d0b2..5281980ec 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -10,7 +10,7 @@ CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake multilib_header
 
 do_configure:prepend() {
 	JAS_STDC_VERSION="$(echo __STDC_VERSION__ | ${CPP} -E -P -)"
@@ -29,5 +29,6 @@ do_install:append() {
     chrpath -d ${D}${bindir}/imginfo
     chrpath -d ${D}${bindir}/imgcmp
     chrpath -d ${D}${libdir}/libjasper.so.*
+    oe_multilib_header jasper/jas_config.h
 }
 
-- 
2.34.1


