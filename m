Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8877C7E908
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:25:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g135so6659995wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BjuPDU9ox1/YwTLiM14Xs4HXUxU4mALC9L8ccnFgVtY=;
	b=kEb25Toe4ByO9+6Zp/GFnM+tx/LaNIWgGpBbZ0cd6fz0hRXOHvBMpnFOdVfTzokY4Q
	csjYzjXF8k9pv81q9LvMKmi05toTG0vMYsBvotcmgQ+Eu3pQRGSOOWT5DRhtHddBom7a
	7hpW58R/guat6UxXtQEBMU1+LyF0xafvQjzBSrzYGO4IotUv/VEFmj34SImFMUY0uTIg
	p9e7Ucld7BgNLgwG2fAJdJk2B/NexrF/FyIXdRMETeZlnMHLPDIyIcVt1LNiSWaN5NYQ
	wFAXxCkb9OZpwncPPKzxCvaHpq0NBR49MoAsgBm7FP8wcHJPCFmV1LCCCUV+cAjP/zmw
	bOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BjuPDU9ox1/YwTLiM14Xs4HXUxU4mALC9L8ccnFgVtY=;
	b=jXTWjXQmT1mrL1I1mdqLn4vmwfuCCLASCPbhkmYoKbRJaTPzY3t+M2GUBqtfUpfvoS
	ESwmb7iKh3qJvVkIGwpIfrzBu7ocumGiy7aX+sdWlxaNAc6JZJI3P/UrrddsdPIND6Lu
	uspeNQTc4zwcAKwIrSNATnPMa/YJQ9F5PiqJjw6vlFKBF30+DFaiLFax/Gk+LZIcTn4M
	CVeCBHBCcy4oCDOiPN3Yj3zpKrMskNjaNtRwl7vOekm0UHTyB44bVUH36Jg22dtcEbDr
	XXk1G1hz4LPrKw5e9tMUZVKtnc+53uuTMPjJj3KeWtnFQAmzUAVl5b5WDR80kxWOK31L
	7S4w==
X-Gm-Message-State: APjAAAVwo1ay+7cepiWE/QeKtmDO07+HdzfntDwKuVifTQRcigJXeAiu
	Dt4V8TGmBdl8/lGtf+5fcqJ7XdPl
X-Google-Smtp-Source: APXvYqzb/pPrbKQf/dXbe1HvwZirvVcipdOS+695DMc7IvrMQFPbIBaGSRPcMP3rzCAbgRk+C/mfdg==
X-Received: by 2002:a1c:4803:: with SMTP id v3mr4206102wma.49.1561659944896;
	Thu, 27 Jun 2019 11:25:44 -0700 (PDT)
Received: from localhost.localdomain ([31.159.168.44])
	by smtp.gmail.com with ESMTPSA id n1sm2186505wrx.39.2019.06.27.11.25.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 11:25:44 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 20:25:40 +0200
Message-Id: <20190627182540.3212-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] iniparser: add initial recipe
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
X-List-Received-Date: Thu, 27 Jun 2019 18:25:44 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 .../iniparser/Add-CMake-support.patch         | 63 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                | 17 +++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser_4.1.bb

diff --git a/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch b/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
new file mode 100644
index 000000000..b666f00f7
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
@@ -0,0 +1,63 @@
+Origin: Debian packaging
+From: Klee Dienes <klee@mit.edu>
+Date: Thu, 13 Feb 2014 07:03:26 -0500
+Subject: Add CMake support.
+
+---
+ CMakeLists.txt | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 44 insertions(+)
+ create mode 100644 CMakeLists.txt
+
+--- /dev/null
++++ b/CMakeLists.txt
+@@ -0,0 +1,50 @@
++cmake_minimum_required (VERSION 2.8.8)
++
++project (iniparser)
++include (GNUInstallDirs)
++
++include_directories (src)
++
++set(INIPARSER_SRCS src/dictionary.c src/iniparser.c)
++set(INIPARSER_HDRS src/dictionary.h src/iniparser.h)
++
++add_library(iniparser-shared SHARED ${INIPARSER_SRCS} ${INIPARSER_HDRS})
++add_library(iniparser-static STATIC ${INIPARSER_SRCS} ${INIPARSER_HDRS})
++
++set_target_properties(iniparser-shared PROPERTIES SOVERSION 1)
++set_target_properties(iniparser-shared PROPERTIES OUTPUT_NAME iniparser)
++set_target_properties(iniparser-static PROPERTIES OUTPUT_NAME iniparser)
++
++install (TARGETS iniparser-shared
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++
++install (TARGETS iniparser-static
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++
++find_package(Doxygen)
++if (NOT DOXYGEN_FOUND)
++message(FATAL_ERROR "Doxygen is needed to build the documentation. Please install it correctly")
++endif()
++
++file (WRITE ${CMAKE_CURRENT_BINARY_DIR}/iniparser.dox
++  "@INCLUDE = ${CMAKE_CURRENT_SOURCE_DIR}/doc/iniparser.dox\n"
++  "OUTPUT_DIRECTORY = ${CMAKE_CURRENT_BINARY_DIR}\n"
++  )
++
++add_custom_target (doc ALL 
++  COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/iniparser.dox
++  SOURCES doc/iniparser.dox)
++
++enable_testing()
++
++add_test(NAME testsuite
++  COMMAND make
++  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/test)
++
++install (FILES ${INIPARSER_HDRS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/iniparser)
++
++install (DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html DESTINATION ${CMAKE_INSTALL_DOCDIR})
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
new file mode 100644
index 000000000..491298506
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The iniParser library is a simple C library offering INI file parsing services (both reading and writing)."
+SECTION = "libs"
+HOMEPAGE = "https://github.com/ndevilla/iniparser"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e02baf71c76e0650e667d7da133379ac"
+
+DEPENDS = "doxygen-native"
+
+SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
+	   file://Add-CMake-support.patch"
+
+# tag 4.1
+SRCREV= "0a38e85c9cde1e099ca3bf70083bd00f89c3e5b6"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.17.1


