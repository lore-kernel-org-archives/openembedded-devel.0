Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FC4C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:20:45 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.13670.1700634043688755169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128536763"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128536763"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:20:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 24215A7C4B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:20:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59AD672865
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:20:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EEBE2235C3;
	Wed, 22 Nov 2023 15:20:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libwebsockets: upgrade 4.3.2 -> 4.3.3
Date: Wed, 22 Nov 2023 14:19:55 +0800
Message-Id: <1700633995-7871-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.005
X-TMASE-Result: 10--11.870000-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/ySrLqyE6Ur/jN7FjQ+zMUh5/iZ1aNsYG7v44
	pYPD16CLKqrQ7lLcMnwt/DPtuO0OwdzZGrP764sO/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW40gGvDuBPXdC//MlDRqI8m9R7dwXny/bejC9ni38xhbgT2OEnoCt48ZTIyPE4mis/W4O
	3MwU4rIDobpFbj0H3sfJL38u1VtO4MPDZrnvcM97NE9DxPih7lwEM6ofA+CGPfc2Xd6VJ+yk893
	SeL1XuDfwBiuMCJwTJ5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8PCGBkYUHBmzdB2F
	vO58XhStegAso1Ksi8Oe4NHzk19IAKqL34WGEvg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106995

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
removed since it's included in 4.3.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...int-mismatch-in-lws_tls_server_abort.patch | 32 -------------------
 ...ockets_4.3.2.bb => libwebsockets_4.3.3.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.3.2.bb => libwebsockets_4.3.3.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
deleted file mode 100644
index 41d004d9f..000000000
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 722e44cb5b74cae206f47a6dc0d985eba8ed1b2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 17:17:49 -0800
-Subject: [PATCH] Fix -Werror=enum-int-mismatch in
- lws_tls_server_abort_connection()
-
-GCC 13 is findinf this function signature mismatch.
-
-../git/lib/tls/openssl/openssl-server.c:713:1: error: conflicting types for 'lws_tls_server_abort_connection' due to enum/integer mismatch; have 'int(struct lws *)' [-Werror=enum-int-mismatch]
-
-Upstream-Status: Submitted [https://github.com/warmcat/libwebsockets/pull/2824]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/tls/openssl/openssl-server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/tls/openssl/openssl-server.c b/lib/tls/openssl/openssl-server.c
-index f2e77324f..43d65e030 100644
---- a/lib/tls/openssl/openssl-server.c
-+++ b/lib/tls/openssl/openssl-server.c
-@@ -699,7 +699,7 @@ lws_tls_server_new_nonblocking(struct lws *wsi, lws_sockfd_type accept_fd)
- 	return 0;
- }
- 
--int
-+enum lws_ssl_capable_status
- lws_tls_server_abort_connection(struct lws *wsi)
- {
- 	if (wsi->tls.use_ssl)
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 95c2854fa..4518e2faa 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -7,9 +7,8 @@ DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
 S = "${WORKDIR}/git"
-SRCREV = "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable \
-           file://0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch"
+SRCREV = "4415e84c095857629863804e941b9e1c2e9347ef"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


