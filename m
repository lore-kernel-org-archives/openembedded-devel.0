Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.2851.1587723094710657046
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 03:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,311,1583164800"; 
   d="scan'208";a="90117603"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Apr 2020 18:11:33 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1FF7250A9984
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:00:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Apr 2020 18:11:28 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 24 Apr 2020 18:11:29 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] websocketpp: upgrade 0.8.1 -> 0.8.2
Date: Fri, 24 Apr 2020 11:11:09 -0700
Message-ID: <20200424181111.21063-2-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
References: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1FF7250A9984.A3BF3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-Replace-make_shared-with-new-in-some-cases.patch
0002-Fix-missed-entries-fix-testing.patch
771.patch
842.patch
removed since they are included in 0.8.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...e-make_shared-with-new-in-some-cases.patch | 78 -------------------
 .../0002-Fix-missed-entries-fix-testing.patch | 66 ----------------
 .../websocketpp/websocketpp-0.8.1/771.patch   | 22 ------
 .../websocketpp/websocketpp-0.8.1/842.patch   | 30 -------
 .../0001-Correct-clang-compiler-flags.patch   |  0
 .../0001-cmake-Use-GNUInstallDirs.patch       |  0
 .../855.patch                                 |  0
 .../857.patch                                 |  0
 ...socketpp_0.8.1.bb => websocketpp_0.8.2.bb} |  8 +-
 9 files changed, 2 insertions(+), 202 deletions(-)
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.8.1 => websocketpp-0.8.2}/0001-Correct-clang-compiler-flags.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.8.1 => websocketpp-0.8.2}/0001-cmake-Use-GNUInstallDirs.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.8.1 => websocketpp-0.8.2}/855.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.8.1 => websocketpp-0.8.2}/857.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp_0.8.1.bb => websocketpp_0.8.2.bb} (81%)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch
deleted file mode 100644
index 0c8285df9..000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 080fc37949114184d4832f7acffe2613745833f3 Mon Sep 17 00:00:00 2001
-From: Stefan Floeren <42731906+stefan-floeren@users.noreply.github.com>
-Date: Tue, 16 Apr 2019 08:38:01 +0200
-Subject: [PATCH 1/2] Replace make_shared with new in some cases
-
-Replace make_shared for asio types that take a lib::ref as a parameter.
-This should fix the ASIO change (boostorg/asio@59066d8) for 1.70,
-while keeping it backwards compatible to older boost versions.
----
- websocketpp/transport/asio/connection.hpp    | 7 ++++---
- websocketpp/transport/asio/endpoint.hpp      | 3 +--
- websocketpp/transport/asio/security/none.hpp | 3 +--
- websocketpp/transport/asio/security/tls.hpp  | 3 +--
- 4 files changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/websocketpp/transport/asio/connection.hpp b/websocketpp/transport/asio/connection.hpp
-index 60f88a7..1ccda8f 100644
---- a/websocketpp/transport/asio/connection.hpp
-+++ b/websocketpp/transport/asio/connection.hpp
-@@ -311,9 +311,10 @@ public:
-      * needed.
-      */
-     timer_ptr set_timer(long duration, timer_handler callback) {
--        timer_ptr new_timer = lib::make_shared<lib::asio::steady_timer>(
--            lib::ref(*m_io_service),
--            lib::asio::milliseconds(duration)
-+        timer_ptr new_timer(
-+            new lib::asio::steady_timer(
-+                *m_io_service,
-+                lib::asio::milliseconds(duration))
-         );
- 
-         if (config::enable_multithreading) {
-diff --git a/websocketpp/transport/asio/endpoint.hpp b/websocketpp/transport/asio/endpoint.hpp
-index ddab2c7..4b719a9 100644
---- a/websocketpp/transport/asio/endpoint.hpp
-+++ b/websocketpp/transport/asio/endpoint.hpp
-@@ -195,8 +195,7 @@ public:
- 
-         m_io_service = ptr;
-         m_external_io_service = true;
--        m_acceptor = lib::make_shared<lib::asio::ip::tcp::acceptor>(
--            lib::ref(*m_io_service));
-+        m_acceptor.reset(new lib::asio::ip::tcp::acceptor(*m_io_service));
- 
-         m_state = READY;
-         ec = lib::error_code();
-diff --git a/websocketpp/transport/asio/security/none.hpp b/websocketpp/transport/asio/security/none.hpp
-index 5c8293d..6c7d352 100644
---- a/websocketpp/transport/asio/security/none.hpp
-+++ b/websocketpp/transport/asio/security/none.hpp
-@@ -168,8 +168,7 @@ protected:
-             return socket::make_error_code(socket::error::invalid_state);
-         }
- 
--        m_socket = lib::make_shared<lib::asio::ip::tcp::socket>(
--            lib::ref(*service));
-+        m_socket.reset(new lib::asio::ip::tcp::socket(*service));
- 
-         if (m_socket_init_handler) {
-             m_socket_init_handler(m_hdl, *m_socket);
-diff --git a/websocketpp/transport/asio/security/tls.hpp b/websocketpp/transport/asio/security/tls.hpp
-index c76fd9a..04ac379 100644
---- a/websocketpp/transport/asio/security/tls.hpp
-+++ b/websocketpp/transport/asio/security/tls.hpp
-@@ -193,8 +193,7 @@ protected:
-         if (!m_context) {
-             return socket::make_error_code(socket::error::invalid_tls_context);
-         }
--        m_socket = lib::make_shared<socket_type>(
--            _WEBSOCKETPP_REF(*service),lib::ref(*m_context));
-+        m_socket.reset(new socket_type(*service, *m_context));
- 
-         if (m_socket_init_handler) {
-             m_socket_init_handler(m_hdl, get_socket());
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch
deleted file mode 100644
index 962d08967..000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 12ab603ca962e83591985a585451d33544d75d56 Mon Sep 17 00:00:00 2001
-From: Stefan Floeren <42731906+stefan-floeren@users.noreply.github.com>
-Date: Wed, 17 Apr 2019 10:06:18 +0000
-Subject: [PATCH 2/2] Fix missed entries; fix testing
-
----
- CMakeLists.txt                            | 2 +-
- websocketpp/transport/asio/connection.hpp | 3 +--
- websocketpp/transport/asio/endpoint.hpp   | 7 ++-----
- 3 files changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2786aba..951de97 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -202,7 +202,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
- 	endif ()
- 
-     if (NOT Boost_USE_STATIC_LIBS)
--        add_definitions (/DBOOST_TEST_DYN_LINK)
-+        add_definitions (-DBOOST_TEST_DYN_LINK)
-     endif ()
- 
-     set (Boost_FIND_REQUIRED TRUE)
-diff --git a/websocketpp/transport/asio/connection.hpp b/websocketpp/transport/asio/connection.hpp
-index 1ccda8f..57dda74 100644
---- a/websocketpp/transport/asio/connection.hpp
-+++ b/websocketpp/transport/asio/connection.hpp
-@@ -462,8 +462,7 @@ protected:
-         m_io_service = io_service;
- 
-         if (config::enable_multithreading) {
--            m_strand = lib::make_shared<lib::asio::io_service::strand>(
--                lib::ref(*io_service));
-+            m_strand.reset(new lib::asio::io_service::strand(*io_service));
-         }
- 
-         lib::error_code ec = socket_con_type::init_asio(io_service, m_strand,
-diff --git a/websocketpp/transport/asio/endpoint.hpp b/websocketpp/transport/asio/endpoint.hpp
-index 4b719a9..94509ad 100644
---- a/websocketpp/transport/asio/endpoint.hpp
-+++ b/websocketpp/transport/asio/endpoint.hpp
-@@ -687,9 +687,7 @@ public:
-      * @since 0.3.0
-      */
-     void start_perpetual() {
--        m_work = lib::make_shared<lib::asio::io_service::work>(
--            lib::ref(*m_io_service)
--        );
-+        m_work.reset(new lib::asio::io_service::work(*m_io_service));
-     }
- 
-     /// Clears the endpoint's perpetual flag, allowing it to exit when empty
-@@ -853,8 +851,7 @@ protected:
- 
-         // Create a resolver
-         if (!m_resolver) {
--            m_resolver = lib::make_shared<lib::asio::ip::tcp::resolver>(
--                lib::ref(*m_io_service));
-+            m_resolver.reset(new lib::asio::ip::tcp::resolver(*m_io_service));
-         }
- 
-         tcon->set_uri(u);
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
deleted file mode 100644
index bc65efb7d..000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 4bccfb04a264704ec9b80ba332ee1cf113ce7f1b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
-Date: Thu, 1 Nov 2018 20:58:10 +0100
-Subject: [PATCH] Update version number in CMakeLists.txt to 0.8.1
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2786aba9..2d13117b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -24,7 +24,7 @@ endif ()
- ############ Project name and version
- set (WEBSOCKETPP_MAJOR_VERSION 0)
- set (WEBSOCKETPP_MINOR_VERSION 8)
--set (WEBSOCKETPP_PATCH_VERSION 0)
-+set (WEBSOCKETPP_PATCH_VERSION 1)
- set (WEBSOCKETPP_VERSION ${WEBSOCKETPP_MAJOR_VERSION}.${WEBSOCKETPP_MINOR_VERSION}.${WEBSOCKETPP_PATCH_VERSION})
- 
- if(POLICY CMP0048)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
deleted file mode 100644
index c3651e94a..000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7f7e2be01b4fa6580ce27f668e61adf37853ad67 Mon Sep 17 00:00:00 2001
-From: Schrijvers Luc <begasus@gmail.com>
-Date: Wed, 18 Sep 2019 11:35:43 +0200
-Subject: [PATCH] Fix "include" directory installation. the variable
- INSTALL_INCLUDE_DIR already exists, and defaults to include if not
- specificied otherwise. Using it allows people to customize the installation
- from outside, fixing issues with other OS like Haiku
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
----
- cmake/CMakeHelpers.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/CMakeHelpers.cmake b/cmake/CMakeHelpers.cmake
-index 1478f4b..f603632 100644
---- a/cmake/CMakeHelpers.cmake
-+++ b/cmake/CMakeHelpers.cmake
-@@ -80,7 +80,7 @@ macro (final_target)
-     endif ()
- 
-     install (DIRECTORY ${CMAKE_SOURCE_DIR}/${TARGET_NAME}
--             DESTINATION include/
-+             DESTINATION ${INSTALL_INCLUDE_DIR}/
-              FILES_MATCHING PATTERN "*.hpp*")
- endmacro ()
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-cmake-Use-GNUInstallDirs.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-cmake-Use-GNUInstallDirs.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
similarity index 81%
rename from meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
rename to meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
index af6d30a28..79a5ac5c4 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
@@ -7,11 +7,7 @@ LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
 DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'openssl boost zlib', '', d)} "
 
 SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
-           file://0001-Replace-make_shared-with-new-in-some-cases.patch \
-           file://0002-Fix-missed-entries-fix-testing.patch \
            file://0001-cmake-Use-GNUInstallDirs.patch \
-           file://842.patch \
-           file://771.patch \
            file://855.patch \
            file://857.patch \
            file://0001-Correct-clang-compiler-flags.patch \
@@ -25,8 +21,8 @@ RDEPENDS_${PN}-dev = ""
 # to add this package to an SDK, since it isn't a reverse-dependency of anything, just use something like this:
 # TOOLCHAIN_TARGET_TASK_append = " websocketpp-dev"
 
-# tag 0.8.1
-SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
+# tag 0.8.2
+SRCREV= "56123c87598f8b1dd471be83ca841ceae07f95ba"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



