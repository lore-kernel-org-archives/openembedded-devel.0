Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B02C64EC4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:39:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.7773.1676702371021607124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WLEJ9ST7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702369; i=@fujitsu.com;
	bh=nhR+ZLqcotRIdpDE8ZeSxqkX5g3tDnN/rEOn9BuEn5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WLEJ9ST7mZdPHRW/IyjFRzJkkvs6Z+ysNZL9NWiXTkG4OWkmyu1XbYHw0g2DqiUha
	 awUx8KaE6QwUrjX5ILoKYRBNvnK4BA29t8zDRU8t6pU69fDGWVgnnwEuWka47fsfig
	 fxSoe20sYwyoAg2IW/gqlZJTqP1iW1taCGret/rZQb0UR0z0BlZbD4rEylLFTTzdTe
	 dSEENr0Rtz52NdgmIFF8gXlPst5KMdnhoaUjIoL1l57fdc/IjRvyH9kO+0JuooNXcq
	 hA4Ym+d184QyfRFnecZUJNjqHl1+wFei7zf1pJS6NTOzoXy9D5f5nd1ZEgYYaExi/X
	 YfjW1WfNee5Ig==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSXd+0Yd
  kg61bLSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy5M36wF/xUrGg8epGlgXG1bBcjF4eQwBNG
  iSmnDrNCODeYJPr3HmKEcPYySpxs2sHUxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAvcSMu9vA4iwCqhJTnv0Gs3kFnCSe3pgDViMhoCAx5eF7sDingLPEsserwWYKAdVsO3
  KGFaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSnR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNZcWpRWWqRrpleUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg+KYUJzzewTiv76/eIUZJDiYlUd7P294nC/El5adUZiQWZ8QXleakFh9ilOHgUJLg/
  VnwIVlIsCg1PbUiLTMHGEswaQkOHiUR3tPpQGne4oLE3OLMdIjUKUZdjqtXruxlFmLJy89LlR
  LnZUgFKhIAKcoozYMbAYvrS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZeCXMKTmVcCt+k
  V0BFMQEcsYH4LckRJIkJKqoFpferZPqcdOpO0AxdePpaw1ez292t6C5XC8u7FLp9aIfM1PiRC
  +MppGXUZlsOFfunPPxhJTH9UtsP79art/3z1Ntb9NFk450j8xKyaff9s1/7/vyDjZfDUswfaV
  PaxeH/5vlFTp7rQsGDW+uaGH9onvEQDsjmezri7PcBW3OCLZUvDyWvBArtSN29q5M3asvhB27
  ctUab2j+bobY35xXeNV2+qwewP19/ulLn3OXK96w3+gIY1/1IcuY/sVBY6dko4IkHZucLywfH
  Ghwaf+M74SKzRjOeXCpyineIyNUy6NGBJUX1C89RZhxbeCFi+1ihopRr3vgaLzuVGVyOqzSZL
  Rds6pUrN2pPK9bktSne2EktxRqKhFnNRcSIAEMX4MmYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1676702367!305009!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8401 invoked from network); 18 Feb 2023 06:39:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:39:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 505D71000DB
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:27 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 43F681000D2
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:39:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jsonrpc: upgrade 1.3.0 -> 1.4.1
Date: Sat, 18 Feb 2023 14:39:00 +0800
Message-ID: <1676702342-30766-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
References: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101135

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-with-libmicrohttpd.patch
removed since it's included in 1.4.1

Changelog:
===========
- Fedora CI build by updating to Catch v2.13.7
- Typo in README (#313)
- Deprecation warnings for Jsoncpp (#312)
- Compatibility with newer libmicrohttpd versions (>= 0.9.71) (#298 #299)
- Typo in diagram (#293)
- File descriptor leaks in connectors

- Vendoring catch library instead of downloading from github
- Moved from travis-ci to circleci (#311)
- Use '.empty()' checks instead of '.size() == 0'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-build-with-libmicrohttpd.patch   | 52 -------------------
 .../{jsonrpc_1.3.0.bb => jsonrpc_1.4.1.bb}    |  6 +--
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch
 rename meta-oe/recipes-devtools/jsonrpc/{jsonrpc_1.3.0.bb => jsonrpc_1.4.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch
deleted file mode 100644
index a4cacb3fc..000000000
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d983161415f5f5748fbdbaa5fbd168154ccf8867 Mon Sep 17 00:00:00 2001
-From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-Date: Wed, 5 Aug 2020 12:31:24 +0900
-Subject: [PATCH] Fix build with libmicrohttpd 0.9.71
-
----
- src/jsonrpccpp/server/connectors/httpserver.cpp | 2 +-
- src/jsonrpccpp/server/connectors/httpserver.h   | 8 +++++++-
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/jsonrpccpp/server/connectors/httpserver.cpp b/src/jsonrpccpp/server/connectors/httpserver.cpp
-index a849615..dd3b841 100644
---- a/src/jsonrpccpp/server/connectors/httpserver.cpp
-+++ b/src/jsonrpccpp/server/connectors/httpserver.cpp
-@@ -151,7 +151,7 @@ void HttpServer::SetUrlHandler(const string &url,
-   this->SetHandler(NULL);
- }
- 
--int HttpServer::callback(void *cls, MHD_Connection *connection, const char *url,
-+mhd_result HttpServer::callback(void *cls, MHD_Connection *connection, const char *url,
-                          const char *method, const char *version,
-                          const char *upload_data, size_t *upload_data_size,
-                          void **con_cls) {
-diff --git a/src/jsonrpccpp/server/connectors/httpserver.h b/src/jsonrpccpp/server/connectors/httpserver.h
-index 7785edb..0dcf032 100644
---- a/src/jsonrpccpp/server/connectors/httpserver.h
-+++ b/src/jsonrpccpp/server/connectors/httpserver.h
-@@ -32,6 +32,12 @@ typedef intptr_t ssize_t;
- #include <map>
- #include <microhttpd.h>
- 
-+#if MHD_VERSION >= 0x00097002
-+#  define mhd_result enum MHD_Result
-+#else
-+#  define mhd_result int
-+#endif
-+
- namespace jsonrpc {
- /**
-  * This class provides an embedded HTTP Server, based on libmicrohttpd, to
-@@ -79,7 +85,7 @@ private:
-   std::map<std::string, IClientConnectionHandler *> urlhandler;
-   struct sockaddr_in loopback_addr;
- 
--  static int callback(void *cls, struct MHD_Connection *connection,
-+  static mhd_result callback(void *cls, struct MHD_Connection *connection,
-                       const char *url, const char *method, const char *version,
-                       const char *upload_data, size_t *upload_data_size,
-                       void **con_cls);
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
rename to meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
index 43dc2e36a..544922f05 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
@@ -9,11 +9,9 @@ SECTION = "libs"
 
 DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
-SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp;branch=master;protocol=https \
-	   file://0001-Fix-build-with-libmicrohttpd.patch \
-"
+SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp;branch=master;protocol=https"
 
-SRCREV = "c696f6932113b81cd20cd4a34fdb1808e773f23e"
+SRCREV = "ec5ce12fc9c0299e1454cc002c70218b5a6f005b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


