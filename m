Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E132A74705
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l201so15652596wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=r3Ao0jJ7vXeyg+RcGEAHcnUla9ezmp6WAxRgXJsNSBA=;
	b=hoLC8RC0EUAEnTdpLvJBB7YKK8Fnj6/Kimg5HXulc+OBuuXXL8Rl1kKgFYqKBpwnMo
	jrkxW1t25dvOtHFgWFQBADINitTfdkQJhaCx1tNz1NcXhXr7babSZxY7YJmjqmEQrczP
	if1UA6mqNwnCKWVobRarVfy7DLcQcpwodRRXnjMyO+fJkBYDlSdHk0CYVDEFzuJw90ay
	QWaxfqhV91nQx8VAIHKlCNFYuEkuMllkk8SFewSgAZCBoaPmpXlogx8nkfhhx0hsRIoR
	suaQeXNplAAr7q38HWh35h7DaloNw1fpukN6eaArLV8E/zAU9bEK+3KCXjhMENO6Iw2+
	N3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r3Ao0jJ7vXeyg+RcGEAHcnUla9ezmp6WAxRgXJsNSBA=;
	b=XisCZaBlu1HeGWte9HCKeYeFAdB7OqCsIpLqtVxM4yF+K1fHP1TaGvgeGklRYQVCn9
	WGNDfGuZd3OIbxE8IqnEjxlEOkgSLBDhFMQi2ekmhxU+GWCHkXX4KizxzOn2ky5bGbTV
	TlZcdlsTpAdEsqcFVES3eSRyKI6/AieTuSEm+DTooiRVhq+RNbDlePlHmpatpMEQ6nA7
	F0W0yy5ayEhuvO+sj4tOu96+PZsr5YBzmSrLQ8XJPvTOm7/RlYcP5wR1N+RSG0IEgsYE
	fDTW55ni0cGU+Fw3VBcE6fmp6ZwbpuLchxC9fUmivyelXUlEyLDA+bcglMrRPAme1VsH
	NoCw==
X-Gm-Message-State: AElRT7FyjZap3lT+pqnZsdGqU/I4i25OLiD08NNwP2z3i8rfAOAQkY18
	XoTlfc2BprZAgB+jqVG5nL9TgQ==
X-Google-Smtp-Source: AIpwx4++n/O8OkmBKhpYn3gSmmtDk3GSjTQ147FP+c6icO5RcMimYCMHjIyruYgLYIqiLrKFvr6bTg==
X-Received: by 10.28.228.131 with SMTP id b125mr2178155wmh.153.1522416735044; 
	Fri, 30 Mar 2018 06:32:15 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:22 +0200
Message-Id: <20180330133151.25882-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/39] mariadb(-native): refresh fix-mysqlclient-r-version.patch
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mysql/mariadb/fix-mysqlclient-r-version.patch   | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
index 7516619eb..a519e4292 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
@@ -25,9 +25,8 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 ---
  cmake/install_macros.cmake | 25 +++++++++++++++----------
- cmake/mysql_version.cmake  |  3 ++-
- libmysql/CMakeLists.txt    | 36 ++++++++++++++++++++++++++++--------
- 3 files changed, 45 insertions(+), 19 deletions(-)
+ libmysql/CMakeLists.txt    | 34 +++++++++++++++++++++++++++-------
+ 2 files changed, 42 insertions(+), 17 deletions(-)
 
 diff --git a/cmake/install_macros.cmake b/cmake/install_macros.cmake
 index b8efdf8..a0d0e68 100644
@@ -39,8 +38,8 @@ index b8efdf8..a0d0e68 100644
  # 
  # This program is free software; you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
-@@ -111,28 +111,33 @@ FUNCTION(INSTALL_SCRIPT)
- ENDFUNCTION()
+@@ -167,28 +167,33 @@ ENDFUNCTION()
+ 
  
  # Install symbolic link to CMake target. 
 -# the link is created in the same directory as target
@@ -86,8 +85,8 @@ diff --git a/libmysql/CMakeLists.txt b/libmysql/CMakeLists.txt
 index be5760f..96286ff 100644
 --- a/libmysql/CMakeLists.txt
 +++ b/libmysql/CMakeLists.txt
-@@ -180,6 +180,12 @@ IF(MSVC)
-  INSTALL_DEBUG_TARGET(mysqlclient DESTINATION ${INSTALL_LIBDIR}/debug)
+@@ -433,6 +433,12 @@ IF(MSVC)
+  INSTALL_DEBUG_TARGET(clientlib DESTINATION ${INSTALL_LIBDIR}/debug)
  ENDIF()
  
 +MACRO(GET_TARGET_NAME target out_name)
@@ -99,7 +98,7 @@ index be5760f..96286ff 100644
  IF(UNIX)
    MACRO(GET_VERSIONED_LIBNAME LIBNAME EXTENSION VERSION OUTNAME)
      SET(DOT_VERSION ".${VERSION}")
-@@ -192,7 +198,13 @@ IF(UNIX)
+@@ -445,7 +451,13 @@ IF(UNIX)
        SET(${OUTNAME} ${LIBNAME}${EXTENSION}${DOT_VERSION})
      ENDIF() 
    ENDMACRO()
@@ -114,7 +113,7 @@ index be5760f..96286ff 100644
  ENDIF()
  
  IF(NOT DISABLE_SHARED)
-@@ -205,10 +217,9 @@ IF(NOT DISABLE_SHARED)
+@@ -456,10 +468,9 @@ IF(NOT DISABLE_SHARED)
      # libtool compatability
      IF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR APPLE)
        SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}")
@@ -127,7 +126,7 @@ index be5760f..96286ff 100644
      ENDIF()
      # Name of shared library is mysqlclient on Unix
      SET_TARGET_PROPERTIES(libmysql PROPERTIES 
-@@ -239,8 +250,13 @@ IF(NOT DISABLE_SHARED)
+@@ -482,8 +493,13 @@ IF(NOT DISABLE_SHARED)
        "${CMAKE_SHARED_LIBRARY_SUFFIX}"
        ""
        linkname)
@@ -143,7 +142,7 @@ index be5760f..96286ff 100644
      LIST(REMOVE_DUPLICATES OS_SHARED_LIB_SYMLINKS)
      FOREACH(ver ${OS_SHARED_LIB_SYMLINKS})
        GET_VERSIONED_LIBNAME(
-@@ -248,7 +264,11 @@ IF(NOT DISABLE_SHARED)
+@@ -491,7 +507,11 @@ IF(NOT DISABLE_SHARED)
          "${CMAKE_SHARED_LIBRARY_SUFFIX}"
          "${ver}"
          linkname)
-- 
2.14.3


