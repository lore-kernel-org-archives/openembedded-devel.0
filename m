Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0uYj-0001k2-M2
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 14:52:10 +0100
Received: from mail-ea0-f199.google.com ([209.85.215.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 05:36:25 -0800
Received: by mail-ea0-f199.google.com with SMTP id j10so3143193eaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=iCF8hOuVjQlj7KqEDWTCa+vEhw3DZg3a7I1tLt31C7g=;
	b=PhaCL9LtV5PMKMO+X0B/vWZuKuQsEVeZJt7NXkCZMPqTeWozcP+t0gBAED0VSLMtD5
	Zc9wQTpmMO1TKVdDT50svoxPERD1T1oBs/+oHaUXF+hfcuxOnFZ+ogewHt7LY2nBXYh3
	XMLkyYpJn2J56RPCTpSdO3IXSrOpQRqPgGiWRow5sZMixUl3EtZFYaTau2OEJyDFWnsC
	lohfaTN+FuspL32qzYRdgWn7gfoOVETpOz2GE/DPdKDQFtsTz51I4v9m1E0VYYCElCQO
	uPvMbVjKKZYLuZjYrMbgp5oW1yL1C3dVh17QnISnmWMc3M9iztzDjWNO+2ZEN8lrqjgy
	pLzQ==
X-Received: by 10.194.76.165 with SMTP id l5mr15501635wjw.14.1359639381511;
	Thu, 31 Jan 2013 05:36:21 -0800 (PST)
X-Received: by 10.194.76.165 with SMTP id l5mr15501626wjw.14.1359639381424;
	Thu, 31 Jan 2013 05:36:21 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9346319wid.3.2013.01.31.05.36.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:36:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jan 2013 13:34:14 +0000
Message-Id: <8368232e3997a3553addd705aacd0d1c56177682.1359639067.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359639067.git.ross.burton@intel.com>
References: <cover.1359639067.git.ross.burton@intel.com>
In-Reply-To: <cover.1359639067.git.ross.burton@intel.com>
References: <cover.1359639067.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQklMfDJlcYEIkp3LLQiYJ7IvFPV8v1pjQHZPVRfYCA4PRJJ2a8u7wqMKbrAedIR2c7Jognp7mVjNcz8P9Wn4V+bcZTe+K7jxf/BzQfnGmzYCIdbWkLWPrS6uUtH3TZr+Z4a1QBE+ajHNvItZdrYSRTc7RWKwSIWJg1GIFcp9GGOME1WBfDkdlTfD5tbuj1YBELUZYsv
Subject: [meta-multimedia][PATCH 1/1] libmusicbrainz: add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 13:52:14 -0000

Moved from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../musicbrainz/files/allow-libdir-override.patch  |   21 +++++++++++
 .../musicbrainz/libmusicbrainz_git.bb              |   38 ++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch b/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
new file mode 100644
index 0000000..d59d12e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
@@ -0,0 +1,21 @@
+Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  We dont
+easily have a way of determining something that patches ${LIB_SUFFIX} so we'll
+set LIB_INSTALL_DIR.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+
+Index: libmusicbrainz-3.0.3/CMakeLists.txt
+===================================================================
+--- libmusicbrainz-3.0.3.orig/CMakeLists.txt
++++ libmusicbrainz-3.0.3/CMakeLists.txt
+@@ -26,7 +26,7 @@ FIND_PACKAGE(DiscId)
+ SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
+ SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installation prefix for executables and object code libraries" FORCE)
+ SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation prefix for user executables" FORCE)
+-SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries" FORCE)
++SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries")
+ SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Installation prefix for C header files" FORCE)
+ 
+ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz3.pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz3.pc)
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
new file mode 100644
index 0000000..051db7b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "MusicBrainz client library"
+DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs.  The library allows you to access the data held on the MusicBrainz server."
+HOMEPAGE = "http://musicbrainz.org"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "expat neon"
+
+PV = "5.0.1+git${SRCPV}"
+PR = "r0"
+
+SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
+SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
+           file://allow-libdir-override.patch "
+
+S = "${WORKDIR}/git"
+
+LDFLAGS_prepend_libc-uclibc = " -lpthread "
+
+
+inherit cmake pkgconfig
+
+do_configure_prepend() {
+    # The native build really doesn't like being rebuilt, so delete
+    # it if it's already present.
+    rm -rf build-native
+    mkdir build-native
+    cd build-native
+    cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
+          -DCMAKE_C_COMPILER=${BUILD_CC} \
+          -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
+          -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
+          ..
+    make make-c-interface
+    cd ..
+}
+
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
+                 -DIMPORT_EXECUTABLES=build-native/ImportExecutables.cmake"
-- 
1.7.10.4



