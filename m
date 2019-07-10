Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 17A367EDEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 08:13:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so1406763wrs.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0LzzRwoO8XXePUxU2dfFaG9E4gOhgoFl5zlKpH2l7+0=;
	b=ad7NgOWvx25CeHqGfqsz47JTjVM/43rsHcO2xF3jXFp5tv+PNbxnuwuZEnPlKyRW2q
	H7sY3CUsePHAkRZE93FGiYrrLqYImtCkRI3oJzvJMBeux6wjRP7VYGUIz3KxSUCeOPDb
	wfMejqwesia3qr7o7PSof3aRrcggQ5WhJ4dOawMP1uWAupSPtMzjLiRdEvVe1FlqOa27
	+j49d5Z1Rlo1OEMnke6i7LSyFaCiNEHCcMuHEeFYXdodtt3pkF6/Ftd/MRJEZNjujfp2
	oyPeOg9kZQRHeQhWlAFGFvK4SJO08x/DOQa8MfizGy3FGMRaOJYq+8oTUymFKH6nvdsi
	81Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0LzzRwoO8XXePUxU2dfFaG9E4gOhgoFl5zlKpH2l7+0=;
	b=SC2094NrKV/RNH1W8NbvssvypDDC9wcHJPFzGAaHIlcI5VdffUWtItydlbsELg3Oh8
	GtDi9J2bFZ1F/2XTGO889d0PI3G9w5USf7TzAvphlZ3OUn3zurkfGRYCrZy3O/fv23be
	RjnoS9f8Pf9GPyJSBtV5of8ALRZnZXHXtqb1t92UrEN+rao4ZasSsIZK0OBxeeH4lccl
	lPBKjPCMs7bKZhK1f7YD/iBmW9RrZj6tZzLOf3RY/ec6azmN06qQucdmRghs7cXdLdR6
	RXOEJnP6NxPYZ+cTED/VAFCahnKqqPBXao4dLoOmQ2ICjhJhnTUdBnw+96G2ts2pb9zV
	XexA==
X-Gm-Message-State: APjAAAXNr/BxBuaw9RHBt26KHWuCkPsXIbn3D/Ys91j4EhT2qkQP7UDc
	Y7G8Y69rHDPwnGfjnOUmp9RXAxEp
X-Google-Smtp-Source: APXvYqy0lUoKDsmXj55GqlgOOmQUXJeSXlcPMtwZR4uZT5jHtlz3FVfbkwsZ/AuvvEYanVRtwbl7SQ==
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr11475888wru.26.1562746412283; 
	Wed, 10 Jul 2019 01:13:32 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:5d7e:f8ec:1fa4:3da1])
	by smtp.gmail.com with ESMTPSA id o3sm1199528wrs.59.2019.07.10.01.13.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 01:13:31 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:13:28 +0200
Message-Id: <20190710081328.7199-1-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Wed, 10 Jul 2019 08:13:32 -0000

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
index 000000000..f4b553a57
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The iniParser library is a simple C library offering INI file parsing services (both reading and writing)."
+SECTION = "libs"
+HOMEPAGE = "https://github.com/ndevilla/iniparser"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e02baf71c76e0650e667d7da133379ac"
+
+DEPENDS = "doxygen-native"
+
+SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https \
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


