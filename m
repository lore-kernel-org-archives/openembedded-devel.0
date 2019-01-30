Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 46B5D7C1EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 64so10865319pfr.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dww62jPqija/6BaPXU6v+SrLzYxF/WP4aU834gdqc1E=;
	b=KRpbs2aGQLmun3BeP1mZcdpfc+6/jCcmXtWUrrbyW3pyAk+xc04jkZ6ck1uGVhaPFV
	LTK5TPLUbAK1pPSuC8Jsasngns4RrS/x6fNl0NYo6KkfZsIzpl7k6tdu1gZ9Nc8AwZDJ
	1jzz85UPHlUfP/fbNn6C2Fr2wdYZmTFCpXeUAhlZkTQZQPmw5cpGevfxqnx7BCFk95ZG
	UaC6Xj0b991A11clD3r6lze0mkwe9+x1r9nxsEqFl3p3IAgylPMHcO+hyFWaymRV67Ny
	KXl875pxnUVYimeK8DNJIUGSmiTnXqC2fZRkHDr2DRmq+ElfOWqEO05zqeu7Xk3mu9ZN
	X+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dww62jPqija/6BaPXU6v+SrLzYxF/WP4aU834gdqc1E=;
	b=Rx5AfmUnNnoyaTvwqp8Va607u4ui4kr6iuHJgXk5Db5fZIiT8FS/w2PjXNvw+yPnxt
	9MlDK9gqQTdgn6nscCbNk0R/1kgHAoSIOeFkXPUo1AUy4LRVCI6YdmUtcDYT87Pt2zbn
	5vkAou8YA8KFjDAEEoCSYOUdQXTdvCR6uVT2tywTvn32CWtEhvGP+M1jw+bxKu7dmzV9
	YHd6wVtZ7ha6pZiIcFa/SVzp/OQot0nhZ0pen5JvtaGpeIPt0kwneCeQBpOI7dTVl1qH
	GW0DY7QUYRp9MhzDm5oDCAW85lY71KsNi42nLFSqvSlk+T7BWeF0ewxtqihmI4vYs9Dz
	j3Nw==
X-Gm-Message-State: AJcUukfl5dprDGVCkLQnek3YtUFldsxM12bZst/1sLfhgPcJRtDYLphA
	f5ELoxv0vUBh1clNqnqxMSVjARMLHq8=
X-Google-Smtp-Source: ALg8bN6RyeZf1aEvehb7TQ2bmKPBmo/FjMdGhxT3g/S3APL4FlbVPPJGBYrZCcWVFo6gOELST1TOEA==
X-Received: by 2002:a62:28c9:: with SMTP id o192mr29721278pfo.57.1548826163880;
	Tue, 29 Jan 2019 21:29:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:07 -0800
Message-Id: <20190130052911.36336-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/8] xmlrpc-c: Update to 1.51.03
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 05:29:23 -0000
Content-Transfer-Encoding: 8bit

Fix build with clang while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpile-failure-against-musl-C-library.patch | 52 -------------------
 ...rver_abyss-Fix-build-with-clang-libc.patch | 27 ++++++++++
 .../xmlrpc-c/xmlrpc-c_1.31.0.bb               | 24 ---------
 .../xmlrpc-c/xmlrpc-c_1.51.03.bb              | 49 +++++++++++++++++
 4 files changed, 76 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
 delete mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
deleted file mode 100644
index 234d696f19..0000000000
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 950b27f8320b841490cafcb3e6e3b818c7174c0d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 20 Jul 2017 22:32:50 -0400
-Subject: [PATCH] fix compile failure against musl C library
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- test/cpp/server_abyss.cpp               |  2 +-
- tools/xmlrpc_pstream/xmlrpc_pstream.cpp | 10 +++++++---
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/test/cpp/server_abyss.cpp b/test/cpp/server_abyss.cpp
-index 2458a8f..82f91da 100644
---- a/test/cpp/server_abyss.cpp
-+++ b/test/cpp/server_abyss.cpp
-@@ -18,7 +18,7 @@
- #ifdef WIN32
-   #include <winsock2.h>
- #else
--  #include <sys/unistd.h>
-+  #include <unistd.h>
-   #include <sys/socket.h>
-   #include <arpa/inet.h>
-   #include <netinet/in.h>
-diff --git a/tools/xmlrpc_pstream/xmlrpc_pstream.cpp b/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
-index d39e105..1fd8900 100644
---- a/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
-+++ b/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
-@@ -15,11 +15,15 @@
- #include "xmlrpc-c/girerr.hpp"
- using girerr::throwf;
- 
--#include <features.h>  // for __BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
--__BEGIN_DECLS
- #include "dumpvalue.h"  /* An internal Xmlrpc-c header file ! */
--__END_DECLS
-+
-+#ifdef __cplusplus
-+}
-+#endif
- 
- 
- #include <xmlrpc-c/base.hpp>
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
new file mode 100644
index 0000000000..be83b0166c
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
@@ -0,0 +1,27 @@
+From dba3c5bf34ed530fd41ed50968825af2158f142e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 13:31:39 -0800
+Subject: [PATCH] test/cpp/server_abyss: Fix build with clang/libc++
+
+/mnt/a/yoe/workspace/sources/xmlrpc-c/test/cpp/server_abyss.cpp:87:14: error: assigning to 'int' from incompatible type '__bind<int
+&, sockaddr *, unsigned int>'
+        rc = bind(this->fd, (struct sockaddr *)&sockAddr, sizeof(sockAddr));
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/cpp/server_abyss.cpp | 56 +++++++++++++++++++--------------------
+ 1 file changed, 28 insertions(+), 28 deletions(-)
+
+--- a/test/cpp/server_abyss.cpp
++++ b/test/cpp/server_abyss.cpp
+@@ -85,7 +85,7 @@ public:
+         sockAddr.sin_port   = htons(portNumber);
+         sockAddr.sin_addr.s_addr = 0;
+ 
+-        rc = bind(this->fd, (struct sockaddr *)&sockAddr, sizeof(sockAddr));
++        rc = ::bind(this->fd, (struct sockaddr *)&sockAddr, sizeof(sockAddr));
+         
+         if (rc != 0) {
+             closesock(this->fd);
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
deleted file mode 100644
index efa58f1986..0000000000
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to help you \
-write an XML-RPC server or client in C or C++."
-
-HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
-LICENSE = "BSD & MIT"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
-
-SRC_URI = "git://github.com/ensc/xmlrpc-c.git;branch=master \
-           file://0001-fix-compile-failure-against-musl-C-library.patch \
-           file://0002-fix-formatting-issues.patch \
-"
-SRCREV = "81443a9dc234cc275449dbc17867ad77ae189124"
-S = "${WORKDIR}/git"
-
-DEPENDS = "curl libxml2"
-RDEPENDS_${PN} = "curl perl"
-
-inherit cmake
-
-EXTRA_OECMAKE = "-D_lib:STRING=${baselib}"
-
-BBCLASSEXTEND = "native"
-
-TARGET_CFLAGS += "-Wno-narrowing"
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
new file mode 100644
index 0000000000..02ea8cc5fc
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to help you \
+write an XML-RPC server or client in C or C++."
+
+HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
+
+SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
+           file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
+           file://0002-fix-formatting-issues.patch \
+           "
+#Release 1.51.03
+SRCREV = "343a3b98e54999d67edb644bcd395aa9784fb16e"
+
+S = "${WORKDIR}/git/stable"
+
+DEPENDS = "libxml2"
+RDEPENDS_${PN} = "perl"
+
+inherit autotools-brokensep pkgconfig
+
+TARGET_CFLAGS += "-Wno-narrowing"
+
+EXTRA_OEMAKE += "CC_FOR_BUILD='${BUILD_CC}' \
+                 LD_FOR_BUILD='${BUILD_LD}' \
+                 CFLAGS_FOR_BUILD='${BUILD_CFLAGS}' \
+                 LDFLAGS_FOR_BUILD='${BUILD_LDFLAGS}' \
+                 "
+
+EXTRA_OECONF += "--disable-libwww-client --disable-wininet-client"
+
+PACKAGECONFIG ??= "curl cplusplus"
+
+PACKAGECONFIG[abyss] = "--enable-abyss-server --enable-abyss-threads --enable-abyss-openssl,--disable-abyss-server --disable-abyss-threads --disable-abyss-openssl,openssl,"
+PACKAGECONFIG[cplusplus] = "--enable-cplusplus,--disable-cplusplus,,"
+PACKAGECONFIG[curl] = "--enable-curl-client,--disable-curl-client,curl,curl"
+
+do_configure() {
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+        autoconf
+        oe_runconf
+        # license is incompatible with lib/util/getoptx.*
+        rm -fv ${S}/tools/turbocharger/mod_gzip.c
+}
+
+BBCLASSEXTEND = "native"
+
+CLEANBROKEN = "1"
-- 
2.20.1


