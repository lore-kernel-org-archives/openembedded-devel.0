Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37942.1795594092666934235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=c1msmxsA;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so5126300eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594092; x=1796198892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKuXw9XZ4+ORzjhjaIWUfWSJMgVC6laTbS5G8GwKSgM=;
        b=c1msmxsAAtz1AfZgIcWfF0EvXgcGPQxNcNEmcpeoTKMRK18urrCRuCUE8CwxaKoNND
         QnWifqOY/Tad6+cBfUDF+Nv+U81i00VRhRvLO3Sk0Hf+on8b+Lmjl57pOF3/4IvUwPPi
         YBUpRtPljH3yDvjFxN6tEBPMTklI0PDmG74TzP/bHjgZd4VvF9oLOW+Ok7glcWwveVIR
         cENh7qdbZozy6RST3wg2/U1lRrDsqVgbE5W/E54KevF+UoHVmyC6PGdUvWZULLsNzEnx
         VIc/wvkKibV072JPkbySj4D+E+b18HykqEFxNuWhwBUEgOZs1+C+gQUmDTF4UnQOUlDZ
         7+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594092; x=1796198892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKuXw9XZ4+ORzjhjaIWUfWSJMgVC6laTbS5G8GwKSgM=;
        b=Y11DojMOcVg5n302x3GGrTsrOtVlRta+QyzXJ6j6cKhNys/IUJUoITcrtGVZftUtjC
         Xe9LJw2vc403/EnSMENPjwD7/pa1a3sMvjU4skJtCdDkFJF5dQfhglgO1RpoFd9cxnAr
         8o0wUTCxbpvhduyLCFzmPCRxnvDTfwX0mAmpQVyaZYdXMXJIvYXADOsdG0AQj52A9kof
         PuZCQ+eN5TnaNskttcbIuIwE+mxeN8/5rU8a6TsofMxCir+X/TUxK1DMtyUIcrGfHPn/
         TJn4FclAl0FxPd7yyfgE5U3jw42GRjSSaMab5EYjzpNRQbnVsX7zXNUv0QNQElP3OnMO
         nkMA==
X-Gm-Message-State: APuU4Z+dDTKxA6JxUeWWMqh/vI7mHeudlJEB+WHTRGpXeb2uF5lVxYox
	fzxLyNwg9s/S6aE3FbFn3DjOCZf7n3oGOc9E6vPTUJHvW8v012uEj5NxQ0YqhV1S
X-Gm-Gg: AZFdTZfFONetuOuEQeCfeTdJfBEtiFZIffbUkxATggmjY6sn9jy0YtucTyitXIHJTsJ
	kpCIl1sOcgeT8YEoXFqYqWk3YewExwB+P6tN9Oa4caAb5Q8hx0sxMe2oT3z99qxUFJf66F721Pl
	6fluYDXuAVmzv+CrYvKPMYXW8pgWHVZxF9Uq/ZNKTmTbpAyZWWPpbq2XiNfJcAKxBYsF1m5v7PV
	rdnDOj4z3xkGYndh5vhBPLlvC7NAgQXfCQBcZHRawcRFAwmEcIUXvKSzfxex2SLid6+IZEJOtUF
	Lu0Y9QWkn9frqFI1JiiB02S+ZJTkYFO1suRwpvk414R9kgtAw2TsAEO6/jR3pMPC5oHV96moViE
	Ivb/GST7w+x2C3aRnISfIyzpGXQvm7z06jU31dEAT6zkzuHl1XhJB7eJAujYmAL7KEOIYZ2XnC4
	UWwnSlnkVBJHioY8odhKfqFH5lbBL3/cT26gM3lE+pX5oaWPOUHPHYKpSfebWv12jSHhbxGnXAu
	d0Yxqh2cWDwiVk4MjzI2ZP7l95w9I3tNdSafv+08SRTrxrxzJmv2PUw78I1JDwazRh2AMFJFgsE
	Kly6unplk5YxI9v6qq2kvfRju6oD/Rjo7NB/DbiNodA9TFAxgmG4shkAEBUC6cCYte40y4KaB12
	GWaTLIbjWiyhaBS+aPVX84PiHYjMehbYkmQkwNec8F2imnzWRQBq5/w2HqQidVEfV22EpnK8J8u
	bHJlajnpFwexxy4NPD7YR5vNXz1oT5M2dUEged2Gk5kzLq7IkBOSHJvj/26HIJCiebvbV2EreYX
	dROywXGg2DwwqY58roRcQ0tVopoQ8sADo15OSgF90zvhCTwzJdLBk2w4pZd0Xol0NztcMijfL94
	BHJSNB91HaHjknyEybomH5+1sA==
X-Received: by 2002:a05:7301:618f:20b0:386:ad3b:a48a with SMTP id 5a478bee46e88-386ad3ba7cfmr9641487eec.5.1795594091933;
        Wed, 25 Nov 2026 00:08:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 23/55] libnfs: upgrade 6.0.2 -> 8.1.0
Date: Wed, 25 Nov 2026 00:06:39 -0800
Message-ID: <20261125080732.2419614-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133026
Content-Type: text/plain; charset="utf-8"

- 7.0.0: SONAME bump to libnfs.so.17 (struct rpc_stats grew), high/low
  priority RPC send queue; 7.0.1 renames _null_auth to
  libnfs_null_auth
- 8.0.0: SONAME libnfs.so.18, NFSv4.2 support, nfs_fallocate(),
  SEEK_DATA/SEEK_HOLE, nfs4_stat64() and named attributes
- 8.1.0: ABI compatible with 8.0.x; NFSv4.1 support, NFS over RDMA,
  RPCSEC_GSS reply verification and security fixes against malicious
  servers, including a use-after-free when a cut-short READ is resent

Drop 0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch,
CMake now installs to CMAKE_INSTALL_FULL_LIBDIR/CMAKE_INSTALL_LIBDIR.
Fetch by tag instead of a bare commit and add
UPSTREAM_CHECK_GITTAGREGEX. TLS, Kerberos and RDMA support are
autodetected by default; pin them with PACKAGECONFIGs (tls on, as
gnutls was already a dependency; krb5 and rdma off) so the build is
deterministic. Inherit pkgconfig, which the krb5-gssapi check uses.
Users (qemu, gvfs) need a rebuild for the new SONAME.

The CMake build writes the absolute path of the GnuTLS library into
libnfs.pc; add a patch that turns it into -lgnutls (buildpaths QA).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...espect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 61 -------------------
 ...te-absolute-library-paths-into-libnf.patch | 48 +++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    | 17 ------
 .../libnfs/libnfs_8.1.0.bb                    | 22 +++++++
 4 files changed, 70 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Do-not-write-absolute-library-paths-into-libnf.patch
 delete mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs_8.1.0.bb

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
deleted file mode 100644
index ffb6bfbea8..0000000000
--- a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 0d5d6a14f6e9c2ff8998ebb3acbefcad6221952f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 3 May 2023 22:27:10 +0200
-Subject: [PATCH] CMakeLists.txt: respect ${CMAKE_INSTALL_LIBDIR} for multilib
-
-* fixes:
-  ERROR: libnfs-5.0.2-r0 do_package: QA Issue: libnfs: Files/directories were installed but not shipped in any package:
-    /usr/lib/libnfs.so
-    /usr/lib/libnfs.so.11.1.0
-    /usr/lib/libnfs.so.5.0.2
-    /usr/lib/pkgconfig
-    /usr/lib/cmake
-    /usr/lib/pkgconfig/libnfs.pc
-    /usr/lib/cmake/libnfs
-    /usr/lib/cmake/libnfs/libnfs-config-version.cmake
-    /usr/lib/cmake/libnfs/libnfs-config.cmake
-    /usr/lib/cmake/libnfs/libnfs-config-noconfig.cmake
-    /usr/lib/cmake/libnfs/FindNFS.cmake
-  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
-  libnfs: 11 installed and not shipped files. [installed-vs-shipped]
-
-  when libdir is /usr/lib64 with multilib
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Pending
----
- CMakeLists.txt     | 6 +++---
- lib/CMakeLists.txt | 4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1b94d2e..a295403 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,11 +7,11 @@ project(libnfs
- set(SOVERSION 16.2.0 CACHE STRING "" FORCE)
- 
- set(INSTALL_BIN_DIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installation directory for binaries")
--set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installation directory for libraries")
-+set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}" CACHE PATH "Installation directory for libraries")
- set(INSTALL_INC_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
- set(INSTALL_MAN_DIR "${CMAKE_INSTALL_PREFIX}/share/man" CACHE PATH "Installation directory for manual pages")
--set(INSTALL_PKGCONFIG_DIR "${INSTALL_LIB_DIR}/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
--set(INSTALL_CMAKE_DIR "${INSTALL_LIB_DIR}/cmake/libnfs" CACHE PATH "Installation directory for cmake (.cmake) files")
-+set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
-+set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/libnfs" CACHE PATH "Installation directory for cmake (.cmake) files")
- 
- option(BUILD_SHARED_LIBS "Build shared libraries" ON)
- option(ENABLE_TESTS "Build and run test programs" OFF)
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 987b735..9b2032f 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -24,5 +24,5 @@ set_target_properties(nfs PROPERTIES
- 
- install(TARGETS nfs EXPORT libnfs
-                     RUNTIME DESTINATION bin
--                    ARCHIVE DESTINATION lib
--                    LIBRARY DESTINATION lib)
-+                    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+                    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Do-not-write-absolute-library-paths-into-libnf.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Do-not-write-absolute-library-paths-into-libnf.patch
new file mode 100644
index 0000000000..47b8d0c4b8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Do-not-write-absolute-library-paths-into-libnf.patch
@@ -0,0 +1,48 @@
+From a0a24106214fc7be8cc1321d8c4f27091cfceb2c Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 24 Nov 2026 22:41:43 -0800
+Subject: [PATCH] cmake: do not write absolute library paths into libnfs.pc
+
+find_library() and find_package() return absolute paths, such as
+/usr/lib/libgnutls.so for GnuTLS or the GSSAPI library, and these went
+verbatim into Libs.private. That leaks the build machine's library
+directory (a cross-compile sysroot, for example) into the installed
+libnfs.pc, where it is wrong for every other consumer. Turn such paths
+into -l<name> by dropping the directory, a leading "lib" and the
+library suffix along with any version after it.
+
+Libs.private was also written with the CMake list separator, e.g.
+"/usr/lib/libgnutls.so;-ldl;/usr/lib/libgssapi_krb5.so" with TLS and
+Kerberos enabled, which pkg-config passes on as a single argument, so
+"pkg-config --static --libs libnfs" did not link. Separate the entries
+with spaces.
+
+Upstream-Status: Submitted [https://github.com/sahlberg/libnfs/pull/641]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 237ac86..2b8b9d8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -306,11 +306,16 @@ foreach(LIB ${SYSTEM_LIBRARIES})
+   if(LIB MATCHES "/([^/]+)\\.framework$")
+     list(APPEND PKG_LIBLIST "-framework ${CMAKE_MATCH_1}")
+   elseif(IS_ABSOLUTE ${LIB} AND EXISTS ${LIB})
+-    list(APPEND PKG_LIBLIST "${LIB}")
++    # find_library() paths are only valid on the build machine, use -l<name>
++    get_filename_component(LIBNAME ${LIB} NAME)
++    string(REGEX REPLACE "^lib" "" LIBNAME ${LIBNAME})
++    string(REGEX REPLACE "\\.(so|a|dylib|tbd|lib|dll\\.a)(\\..*)?$" "" LIBNAME ${LIBNAME})
++    list(APPEND PKG_LIBLIST "-l${LIBNAME}")
+   else()
+     list(APPEND PKG_LIBLIST "-l${LIB}")
+   endif()
+ endforeach()
++string(REPLACE ";" " " PKG_LIBLIST "${PKG_LIBLIST}")
+ configure_file(cmake/libnfs.pc.cmake
+                ${CMAKE_CURRENT_BINARY_DIR}/libnfs.pc @ONLY)
+ 
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
deleted file mode 100644
index 49617eaa29..0000000000
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "NFS client library"
-HOMEPAGE = "https://github.com/sahlberg/libnfs"
-LICENSE = "BSD-2-Clause AND GPL-3.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
-
-SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
-           file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
-           "
-SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
-
-DEPENDS += "gnutls"
-
-inherit cmake
-
-do_install:append() {
-	rm -f ${D}${libdir}/cmake/libnfs/libnfs-config.cmake
-}
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_8.1.0.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_8.1.0.bb
new file mode 100644
index 0000000000..4a11b6d42d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_8.1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "NFS client library"
+HOMEPAGE = "https://github.com/sahlberg/libnfs"
+LICENSE = "BSD-2-Clause AND GPL-3.0-only AND LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
+
+SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master;tag=libnfs-${PV} \
+           file://0001-cmake-Do-not-write-absolute-library-paths-into-libnf.patch \
+           "
+SRCREV = "5c48d277783073a1be5aa3ce8ff1ca9a690c20a0"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^libnfs-(?P<pver>\d+(\.\d+)+)$"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ??= "tls"
+PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF,krb5"
+PACKAGECONFIG[rdma] = "-DENABLE_RDMA=ON,-DENABLE_RDMA=OFF,rdma-core"
+PACKAGECONFIG[tls] = "-DENABLE_TLS=ON,-DENABLE_TLS=OFF,gnutls"
+
+do_install:append() {
+	rm -f ${D}${libdir}/cmake/libnfs/libnfs-config.cmake
+}
