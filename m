Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.991.1596603723739177597
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2020 22:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,436,1589212800"; 
   d="scan'208";a="97632373"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Aug 2020 13:01:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 196684CE34DE
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Aug 2020 13:01:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 5 Aug 2020 13:01:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] jsonrpc: Fix build with libmicrohttpd 0.9.71
Date: Thu, 6 Aug 2020 01:01:51 +0800
Message-ID: <1596646911-100255-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 196684CE34DE.A1F36
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-Fix-build-with-libmicrohttpd.patch   | 52 +++++++++++++++++++
 .../recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb |  5 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch
new file mode 100644
index 0000000000..a4cacb3fc0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-Fix-build-with-libmicrohttpd.patch
@@ -0,0 +1,52 @@
+From d983161415f5f5748fbdbaa5fbd168154ccf8867 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 5 Aug 2020 12:31:24 +0900
+Subject: [PATCH] Fix build with libmicrohttpd 0.9.71
+
+---
+ src/jsonrpccpp/server/connectors/httpserver.cpp | 2 +-
+ src/jsonrpccpp/server/connectors/httpserver.h   | 8 +++++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/jsonrpccpp/server/connectors/httpserver.cpp b/src/jsonrpccpp/server/connectors/httpserver.cpp
+index a849615..dd3b841 100644
+--- a/src/jsonrpccpp/server/connectors/httpserver.cpp
++++ b/src/jsonrpccpp/server/connectors/httpserver.cpp
+@@ -151,7 +151,7 @@ void HttpServer::SetUrlHandler(const string &url,
+   this->SetHandler(NULL);
+ }
+ 
+-int HttpServer::callback(void *cls, MHD_Connection *connection, const char *url,
++mhd_result HttpServer::callback(void *cls, MHD_Connection *connection, const char *url,
+                          const char *method, const char *version,
+                          const char *upload_data, size_t *upload_data_size,
+                          void **con_cls) {
+diff --git a/src/jsonrpccpp/server/connectors/httpserver.h b/src/jsonrpccpp/server/connectors/httpserver.h
+index 7785edb..0dcf032 100644
+--- a/src/jsonrpccpp/server/connectors/httpserver.h
++++ b/src/jsonrpccpp/server/connectors/httpserver.h
+@@ -32,6 +32,12 @@ typedef intptr_t ssize_t;
+ #include <map>
+ #include <microhttpd.h>
+ 
++#if MHD_VERSION >= 0x00097002
++#  define mhd_result enum MHD_Result
++#else
++#  define mhd_result int
++#endif
++
+ namespace jsonrpc {
+ /**
+  * This class provides an embedded HTTP Server, based on libmicrohttpd, to
+@@ -79,7 +85,7 @@ private:
+   std::map<std::string, IClientConnectionHandler *> urlhandler;
+   struct sockaddr_in loopback_addr;
+ 
+-  static int callback(void *cls, struct MHD_Connection *connection,
++  static mhd_result callback(void *cls, struct MHD_Connection *connection,
+                       const char *url, const char *method, const char *version,
+                       const char *upload_data, size_t *upload_data_size,
+                       void **con_cls);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
index ca9675ed64..0ae39765f2 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
@@ -9,7 +9,10 @@ SECTION = "libs"
 
 DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
-SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp"
+SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp \
+	   file://0001-Fix-build-with-libmicrohttpd.patch \
+"
+
 SRCREV = "c696f6932113b81cd20cd4a34fdb1808e773f23e"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



