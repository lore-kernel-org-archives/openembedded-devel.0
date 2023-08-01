Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C82BC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7614.1690875746271688824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="127862327"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="127862327"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ABC2CD7E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42F48BF49B
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1C3F10232;
	Tue,  1 Aug 2023 16:42:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.56.0 -> 1.56.2
Date: Tue,  1 Aug 2023 15:41:46 +0800
Message-Id: <1690875717-21608-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--0.111500-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon19XH94Jsw6Ojf3A4DTYuETSViWU/kT833EU5zPdmxVnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBHfiELslblbbiQ4eCtBiJg3/m
	y00y6dmhuzlNDFRAfY54dd/DOIxC9fVrrHK8PTK7wJfjUG1ejXAok1JcYevxy5wiX0lpJSN+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104187

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
[WRR] backport (#33694) to 1.56
[backport][iomgr][EventEngine] Improve server handling of file descriptor exhaustion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.56.0.bb => python3-grpcio_1.56.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.56.0.bb => python3-grpcio_1.56.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb
index fc871adec4..c34391dd67 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://0001-direct_mmap-Use-off_t-on-linux.patch;patchdir=third_party/abseil-cpp \
                                 file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
 "
-SRC_URI[sha256sum] = "4c08ee21b3d10315b8dc26f6c13917b20ed574cdbed2d2d80c53d5508fdcc0f2"
+SRC_URI[sha256sum] = "0ff789ae7d8ddd76d2ac02e7d13bfef6fc4928ac01e1dcaa182be51b6bcc0aaa"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.34.1


