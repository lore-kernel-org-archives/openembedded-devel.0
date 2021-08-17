Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web12.37815.1629198946867401693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Aug 2021 04:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ozlabs.org header.s=201707 header.b=GDu81iCS;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: anton@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1010)
	id 4GppNv5T2zz9sRK; Tue, 17 Aug 2021 21:15:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1629198943;
	bh=Cs8vbNbD+5oVKdQ2Ogd7TKxFiNmLwNpSEtiI6NheIao=;
	h=From:To:Subject:Date:From;
	b=GDu81iCSIllobcICmUW1sKCzF9C3YMQ+OycJbV/xJGv5nUq72paQBjokke1/INR8e
	 yrMtyMwXcdejHJllBeFKT5udf+8Yf0H7eXUSXIxy3eVqgR7LC3nZpZ777FShDvR/jL
	 h0SvbsCy4ISiQcaGTZWike+4B5tnFI9OzAyyQva6rC7ohw6IHUhT8r1r+4ywQO++aV
	 BBa4xQ6RfiAaNYnJDJnm+jMKZqOQm4zLXvnGBq1qWh8qXqO5N5RTOEZg80cFUNmYnl
	 fE/ppmrOetxzcmv2IWVcjxLD60O62bGggORMTXK63ep/SCktSpsIFiIT1dLeqsaUXu
	 ZVS2Jg10Y5ohw==
From: "Anton Blanchard" <anton@ozlabs.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] boost-url: Use GNUInstallDirs instead of hard wiring install directories
Date: Tue, 17 Aug 2021 21:15:33 +1000
Message-Id: <20210817111533.606588-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On a multilib setup cmake files should go into lib64.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 ...rs-instead-of-hard-wiring-install-di.patch | 57 +++++++++++++++++++
 .../boost-url/boost-url_git.bb                |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/boost-url/boost-url/0001-Use=
-GNUInstallDirs-instead-of-hard-wiring-install-di.patch

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url/0001-Use-GNUIns=
tallDirs-instead-of-hard-wiring-install-di.patch b/meta-oe/recipes-devtoo=
ls/boost-url/boost-url/0001-Use-GNUInstallDirs-instead-of-hard-wiring-ins=
tall-di.patch
new file mode 100644
index 000000000..4c996656c
--- /dev/null
+++ b/meta-oe/recipes-devtools/boost-url/boost-url/0001-Use-GNUInstallDir=
s-instead-of-hard-wiring-install-di.patch
@@ -0,0 +1,57 @@
+From 329e27c8ad30e76ab50c7949cc95ba8eb0efabd2 Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@ozlabs.org>
+Date: Tue, 17 Aug 2021 09:53:41 +1000
+Subject: [PATCH] Use GNUInstallDirs instead of hard wiring install direc=
tories
+
+On a multilib setup cmake files should go into lib64.
+
+Upstream-Status: Submitted [https://github.com/CPPAlliance/url/pull/38]
+---
+ CMakeLists.txt | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5b53f31..ebb7346 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,20 +109,22 @@ else()
+ endif()
+=20
+ if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR AND NOT BOOST_URL=
_IN_BOOST_TREE)
++    include(GNUInstallDirs)
++
+     set_target_properties(boost_url PROPERTIES EXPORT_NAME url)
+     install(TARGETS boost_url EXPORT boost_url_targets)
+=20
+     install(EXPORT boost_url_targets
+         FILE boost_url-targets.cmake
+         NAMESPACE Boost::
+-        DESTINATION lib/cmake/boost_url
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/boost_url
+     )
+=20
+     include(CMakePackageConfigHelpers)
+=20
+     configure_package_config_file(cmake/config.cmake.in
+         ${CMAKE_CURRENT_BINARY_DIR}/boost_url-config.cmake
+-        INSTALL_DESTINATION lib/cmake/boost_url
++        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/boost_url
+     )
+=20
+     write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/boost_=
url-config-version.cmake
+@@ -132,10 +134,10 @@ if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_=
DIR AND NOT BOOST_URL_IN_BOOST
+     install(FILES
+         ${CMAKE_CURRENT_BINARY_DIR}/boost_url-config.cmake
+         ${CMAKE_CURRENT_BINARY_DIR}/boost_url-config-version.cmake
+-        DESTINATION lib/cmake/boost_url
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/boost_url
+     )
+=20
+-    install(DIRECTORY include/ DESTINATION include)
++    install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ endif()
+=20
+ if(BOOST_URL_BUILD_TESTS)
+--=20
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-o=
e/recipes-devtools/boost-url/boost-url_git.bb
index 107a4a833..cb3664fe3 100644
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
@@ -4,7 +4,9 @@ SECTION =3D "libs"
 LICENSE =3D "BSL-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d=
31bef20d78c"
=20
-SRC_URI =3D "git://github.com/CPPAlliance/url.git;branch=3Ddevelop"
+SRC_URI =3D "git://github.com/CPPAlliance/url.git;branch=3Ddevelop \
+           file://0001-Use-GNUInstallDirs-instead-of-hard-wiring-install=
-di.patch \
+           "
=20
 SRCREV =3D "2c867fbe284ae532f1329b87a86ad3f8cd382867"
=20
--=20
2.31.1

