Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69526C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 08:38:53 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13727.1704271122932284201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 00:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="124418679"
X-IronPort-AV: E=Sophos;i="6.04,327,1695654000"; 
   d="scan'208";a="124418679"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 17:38:40 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3597E7FB6F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jan 2024 17:38:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6911ED3EC7
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jan 2024 17:38:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E54FF6895A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jan 2024 17:38:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D7B51A0070;
	Wed,  3 Jan 2024 16:38:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libtinyxml2: upgrade 9.0.0 -> 10.0.0
Date: Wed,  3 Jan 2024 16:38:26 +0800
Message-Id: <1704271107-17682-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28096.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28096.006
X-TMASE-Result: 10-0.514600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yRIRh9wkXSlFaZATGA5/BXiaDNlRJumzub6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AAtH/ey8zRp7RPJs/q8vyUR+X
	4fj4ypMlPvZfZHGeBcmNOqHl1hhTurWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNW9/8cJh4et51kJBZyeOovsrCFRvL8zzaa4rAgrGQ7liW4cYBRMFmlRbM++nxdh3MN6V8
	JnZL4LWVKET3VX4+8sAsqWwFPaKNKoEGG3M+VOyU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 08:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108025

From: Wang Mingyu <wangmy@fujitsu.com>

remove non-existent files from install.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtinyxml2_9.0.0.bb => libtinyxml2_10.0.0.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_9.0.0.bb => libtinyxml2_10.0.0.bb} (85%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
similarity index 85%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index 7ef4d89ce..af5a994d2 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 
-SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
+SRCREV = "321ea883b7190d4e85cae5512a12e5eaa8f8731f"
 SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
            file://run-ptest"
 
@@ -19,7 +19,6 @@ CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 do_install_ptest() {
     install -Dm 0755 ${B}/xmltest ${D}${PTEST_PATH}/xmltest
     install -d ${D}${PTEST_PATH}/resources/out
-    install -Dm 0644 ${B}/resources/*.xml ${D}${PTEST_PATH}/resources/
 }
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


