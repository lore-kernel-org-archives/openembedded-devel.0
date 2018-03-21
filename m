Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0DC78997
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 21:00:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f125so12282916wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=r3Ao0jJ7vXeyg+RcGEAHcnUla9ezmp6WAxRgXJsNSBA=;
	b=LEFPvwtW3fX9hiX9HfMpoKGGNrZkS8MFKgFBwnXpzeg86YyLnOPmm1it0ybUBDiShS
	wlebWuwKM7v0voSPUCuIo4hWoJ1q7advQqtNZ4LObgmYpdyEtX1PQwn8ygGXF5FqoHZ2
	CWTxIpQuG4CuC77SJENikyDPo1tgT/n9NJgsr34b1gVz57kwZ5b34T7BRZW/nbOExXf+
	HO4qrfJ45TqbinJl2JhBaYx68geA/d/r3qT1Y934bc0AApw5n1tzWmzGsnU9VYV7Gmry
	91d71lJUfCgjDmWLN38VtqYDnoWfF/Cx+puEOJ2D21PiAm+/ED8cXr+QwpuqECAYjF4M
	+Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r3Ao0jJ7vXeyg+RcGEAHcnUla9ezmp6WAxRgXJsNSBA=;
	b=s2Tn369+KSh2uwde/mXfWIQkYF46o2cFMlNvgJMbSnApx2Az/SXCF5PJrtGD90SL9Y
	MACqx7yhuX6EC29MnxM6100QjEW/AMk5s4CgmPQILdxqi8webeofTCmDynQwjy8/UFxQ
	aveMSuPnuBRwYpCI9brlSf/xd1JMrMb5qjF0soCEvmCUFQbeofUAy2tD2SL2PnJF3bgC
	AeEafNCLLqKa6d56x6/MEE1pf2nP++WTi6opoZZB1oA43rp6lLK/XQJzRQ3WTK2DM2r6
	48Q+h91P/lIr/zU8D+4VvyZpDBNG2yGZAxARb1WVLSk7cEE4cs31p0f5qIourTnbIhxK
	bXUw==
X-Gm-Message-State: AElRT7FTI+nGUtW1c18E84adLugimeePq1nDybtwT8DJbF459fpUF/6k
	guoQxgTaIl4bcLZnMRjbYdVJgA==
X-Google-Smtp-Source: AG47ELu4nYDM0tQzMzIEJWVG4B04q9rgkbKSp8cIpibljM9SLm8SYnv/csYpxA0IXmH42zkJudl7ZA==
X-Received: by 10.28.166.206 with SMTP id p197mr3521039wme.81.1521666037129;
	Wed, 21 Mar 2018 14:00:37 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111801E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1180:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	q21sm5916339wmd.12.2018.03.21.14.00.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 14:00:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 22:00:22 +0100
Message-Id: <20180321210022.4682-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180321210022.4682-1-schnitzeltony@gmail.com>
References: <20180321210022.4682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] mariadb(-native): refresh fix-mysqlclient-r-version.patch
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
X-List-Received-Date: Wed, 21 Mar 2018 21:00:37 -0000
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


