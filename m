Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509B8D46BF9
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 19:47:04 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3617.1769629622044309419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 11:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGSWw6ch;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43590777e22so151838f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 11:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769629620; x=1770234420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdT9sSx4FF/G10T+IDiN5SgVKVbP3tFnr05q409f0Bw=;
        b=KGSWw6chJMOMa3At3BTitFW/7BW7MsGvply9sJA3CgUqx/M81wJOGuFxlkdk7fWI3D
         mreir3hQQP60vWBXpt7bCj2/xASSOUn7+GQtKEP3SXy2dpL+Tq7qKYSmWZF9tlZ1aXfv
         6R4ga/Zbepwe922LeUMft8/0vPenanPTR0yNCxmj3jWaIMGFu/RZTn9R3ApQ21SehPJ1
         AzQAJYzW3ShYwSgv8lek3l+MNir0eqab4xp6eJ2dCDWr231ho0JiQhsk7rhmf4hLLw+i
         F6PBUkaRp8R8JbUKngxolSos4WlHY5B7V97SQRX8lZODE+Y64PSNUwEV291SD3olQ6/6
         xJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769629620; x=1770234420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdT9sSx4FF/G10T+IDiN5SgVKVbP3tFnr05q409f0Bw=;
        b=LhpvfZIKoNYTggcua7o56bY4P7oc7Ho0hvJMIRkl5JrYR5/i9HvnyGWLvsr2At7c3T
         MR2+spDIfYgP++KzB49FQV2EgGox0vkNbEK9NMxBqy8HnPkBQEKJhYoMnD2bUMlNHubo
         xH1CmMnrgsd+xwv4GY73kJVrAB9oQox+QyhNQA0P0sBPck2Q1bYaGP9qrsY5vK2nfxtr
         2hZRtudLFxKfxMMgDYlvmZ0cxcpxEFKoj7d/tNuaaoKrzD/y1N3+PWTPrfdG0nfh1lUJ
         Vt7OJgyMNN5D9jhH0NrjeJ1ttnG/lwH6QM01CPka1DeBtBv0l8dWttZb7eSASuve0bQO
         C6BA==
X-Gm-Message-State: AOJu0YzkZv/e2anREGqaccf/5aGAaStXnAWut9YaMyEbxjDbBElka4Iq
	urhclp8BqgtICMrzGTnOwuqXD+6RXSqeZDllFnmhvgShLmbwBix/vCzXayoo6g==
X-Gm-Gg: AZuq6aKjju87cadNIWjWaF0DvCk9z/CmaCkPMU9rovJ2mT7BU1z/qYlK5/2DJ92G4nI
	P8mchGHNn7+5ZfPDCdgDpm7hHq9sXPumCiIZ1ps18hPowqHAt0drprg5lBO0JC8Ab2sqq9p8dbh
	Vxsjv5CJWrYZv2uY5nvXvxC2aoOcRdfXFauwMg5yWLdTBkOw3XqYh3/raisFKFd7y+5QC1cWPQi
	vtnT2+0t1NBjQPFgTn5wz1+p7knNujwspnfzH2klO9ORFFM832gpuXc5n/ojd3XwuVANAbgNa+z
	TxpPvgu2tKzTl7yGuh9vvYiYMAl6vWVAtizmKLDx/PZgzJ7jR2/b3MK1cYjoEKJNkfqmtoxMSjq
	7nzXy8Zc7RNGeY1dK0Pg0Q6cYw+k00ODYzxS2+2kz7MnwHTij3FhMe4Mu3liQ3KLZ1zac35LMJ7
	Xn6aCjflv7
X-Received: by 2002:a05:6000:2012:b0:435:9612:2d3b with SMTP id ffacd0b85a97d-435dd1cc0abmr9881423f8f.44.1769629620065;
        Wed, 28 Jan 2026 11:47:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm9102173f8f.10.2026.01.28.11.46.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 11:46:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wireshark: upgrade 4.2.14 -> 4.6.3
Date: Wed, 28 Jan 2026 20:46:58 +0100
Message-ID: <20260128194658.205846-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 19:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123975

Contains fix for CVE-2025-0962.

Removed CVE-2025-9817.patch because it is included in this release.

Add a patch that allows it building for native: it is looking for iconv.h
header as a new dependency for (optional) zlib-ng support, however it
is not installed in the sysroot for native builds. Add a patch that removes
this hard dependency for native builds.

Changelogs:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.3.html
https://www.wireshark.org/docs/relnotes/wireshark-4.6.2.html
https://www.wireshark.org/docs/relnotes/wireshark-4.6.1.html
https://www.wireshark.org/docs/relnotes/wireshark-4.6.0.html

Overall changelogs (including 4.4 also): https://www.wireshark.org/docs/relnotes/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/wireshark/README          | 45 ------------------
 ...-t-look-for-iconv.h-for-native-build.patch | 46 +++++++++++++++++++
 .../0002-flex-Remove-line-directives.patch    |  6 +--
 .../0004-lemon-Remove-line-directives.patch   |  6 +--
 .../wireshark/files/CVE-2025-9817.patch       | 32 -------------
 ...wireshark_4.2.14.bb => wireshark_4.6.3.bb} | 14 ++++--
 6 files changed, 61 insertions(+), 88 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/README
 create mode 100644 meta-networking/recipes-support/wireshark/files/0001-don-t-look-for-iconv.h-for-native-build.patch
 delete mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.14.bb => wireshark_4.6.3.bb} (87%)

diff --git a/meta-networking/recipes-support/wireshark/README b/meta-networking/recipes-support/wireshark/README
deleted file mode 100644
index f5e4d04777..0000000000
--- a/meta-networking/recipes-support/wireshark/README
+++ /dev/null
@@ -1,45 +0,0 @@
-#
-Wireshark - Notes
-
-URL: http://www.wireshark.org/
-User Guide: http://www.wireshark.org/docs/wsug_html_chunked/
-Secruity advisories: http://www.wireshark.org/security/
-
-Wireshark is slowly moving away from gtk and towards QT as their graphical stack.
-Currently gtk is supported with this release and I plan on integrating QT. 
-
-
-
-Adding the wireshark to your build
-========================================
-
-via local.conf
-IMAGE_INSTALL:append = " wireshark"
-
-Adding the wireshark to your graphical build
-========================================
-via local.conf
-IMAGE_INSTALL:append = " wireshark"
-
-and one of:
-
-EXTRA_IMAGE_FEATURES += "x11-base"
-
-or use the "core-image-x11"
-
-
-Maintenance
------------
-
-Send patches, comments or questions to openembedded-devel@lists.openembedded.org
-
-When sending single patches, please use something like:
-
-   git send-email -1 -M \
-       --to openembedded-devel@lists.openembedded.org \
-       --cc akuster@mvista.com \
-       --subject-prefix=meta-networking][PATCH
-
-Maintainer:    Armin Kuster <akuster@mvista.com>
-
-
diff --git a/meta-networking/recipes-support/wireshark/files/0001-don-t-look-for-iconv.h-for-native-build.patch b/meta-networking/recipes-support/wireshark/files/0001-don-t-look-for-iconv.h-for-native-build.patch
new file mode 100644
index 0000000000..5cc16459ce
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0001-don-t-look-for-iconv.h-for-native-build.patch
@@ -0,0 +1,46 @@
+From 9a9d99fb57caa38c4bc045f544429ec919ec6158 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 26 Jan 2026 21:26:49 +0100
+Subject: [PATCH] don't look for iconv.h for native build
+
+iconv.h is not installed in the sysroot for native builds, and cmake
+only searches for it in the sysroot.
+
+It seems to be only required for zlib-ng support (based on the
+commit[1] that introduced this dependency), which is currently not
+enabled in the recipe.
+
+To avoid build failure due to not finding this header during configuration,
+remove this dependency from native builds
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cmake/modules/FindLibXml2.cmake | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
+index d36b390..f3e4762 100644
+--- a/cmake/modules/FindLibXml2.cmake
++++ b/cmake/modules/FindLibXml2.cmake
+@@ -66,11 +66,6 @@ find_path(LIBXML2_INCLUDE_DIR NAMES libxml/xpath.h
+    PATH_SUFFIXES libxml2
+    )
+ 
+-find_path(ICONV_INCLUDE_DIR  NAMES iconv.h
+-   HINTS
+-   ${LIBXML2_HINTS}/include
+-   )
+-
+ # CMake 3.9 and below used 'LIBXML2_LIBRARIES' as the name of
+ # the cache entry storing the find_library result.  Use the
+ # value if it was set by the project or user.
+@@ -103,7 +98,7 @@ elseif(LIBXML2_INCLUDE_DIR AND EXISTS "${LIBXML2_INCLUDE_DIR}/libxml/xmlversion.
+     unset(libxml2_version_str)
+ endif()
+ 
+-set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR} ${PC_LIBXML_INCLUDE_DIRS} ${ICONV_INCLUDE_DIR})
++set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR} ${PC_LIBXML_INCLUDE_DIRS})
+ set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
+ 
+ include(FindPackageHandleStandardArgs)
diff --git a/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
index 0e6249c939..c6f5909cc9 100644
--- a/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
+++ b/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
@@ -23,19 +23,19 @@ index 20caa09..174f452 100644
  
 -      ADD_CUSTOM_COMMAND(
 -        OUTPUT ${_outc} ${_outh}
--        COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> -o${_outc} --header-file=${_outh} ${_in}
+-        COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> --outfile=${_outc} --header-file=${_outh} ${_in}
 -        DEPENDS ${_in}
 -      )
 +      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
 +        ADD_CUSTOM_COMMAND(
 +          OUTPUT ${_outc} ${_outh}
-+          COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> --noline -o${_outc} --header-file=${_outh} ${_in}
++          COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> --noline --outfile=${_outc} --header-file=${_outh} ${_in}
 +          DEPENDS ${_in}
 +        )
 +      ELSE ()
 +        ADD_CUSTOM_COMMAND(
 +          OUTPUT ${_outc} ${_outh}
-+          COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> -o${_outc} --header-file=${_outh} ${_in}
++          COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> --ooutfile=${_outc} --header-file=${_outh} ${_in}
 +          DEPENDS ${_in}
 +        )
 +      ENDIF ()
diff --git a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
index 1a6fe8d39e..5b4d5aaa82 100644
--- a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
+++ b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
@@ -17,7 +17,7 @@ diff --git a/cmake/modules/UseLemon.cmake b/cmake/modules/UseLemon.cmake
 index e419de1..fa4034e 100644
 --- a/cmake/modules/UseLemon.cmake
 +++ b/cmake/modules/UseLemon.cmake
-@@ -12,6 +12,7 @@ if(LEMON_EXECUTABLE)
+@@ -17,6 +17,7 @@ if(LEMON_EXECUTABLE)
  				${_out}.h
  				${_out}.out
  			COMMAND ${LEMON_EXECUTABLE}
@@ -25,11 +25,11 @@ index e419de1..fa4034e 100644
  				-T/usr/share/lemon/lempar.c
  				-d.
  				${_in}
-@@ -30,6 +31,7 @@ else()
+@@ -35,6 +36,7 @@ else()
  				${_out}.h
  				${_out}.out
  			COMMAND $<TARGET_FILE:lemon>
 +				-l
  				-T${CMAKE_SOURCE_DIR}/tools/lemon/lempar.c
  				-d.
- 				${_in}
+ 				--
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
deleted file mode 100644
index 034c51778e..0000000000
--- a/meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 39daba5e247ea495f88b0be82f0b7ebbdbf50fba Mon Sep 17 00:00:00 2001
-From: John Thacker <johnthacker@gmail.com>
-Date: Sat, 26 Jul 2025 07:10:28 -0400
-Subject: [PATCH] ssh: Add a null check
-
-Fix #20642
-
-Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/39daba5e247ea495f88b0be82f0b7ebbdbf50fba]
-CVE: CVE-2025-9817
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- epan/dissectors/packet-ssh.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/epan/dissectors/packet-ssh.c b/epan/dissectors/packet-ssh.c
-index 4f2b0ff..9b3b904 100644
---- a/epan/dissectors/packet-ssh.c
-+++ b/epan/dissectors/packet-ssh.c
-@@ -2359,6 +2359,10 @@ ssh_kex_shared_secret(gint kex_type, ssh_bignum *pub, ssh_bignum *priv, ssh_bign
-     }
- 
-     if(kex_type==SSH_KEX_DH_GEX){
-+	if (modulo == NULL) {
-+	    ws_debug("Missing group modulo");
-+	    return NULL;
-+	}
-         gcry_mpi_t b = NULL;
-         gcry_mpi_scan(&b, GCRYMPI_FMT_USG, pub->data, pub->length, NULL);
-         gcry_mpi_t d = NULL, e = NULL, m = NULL;
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
similarity index 87%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
index bd014055a9..2cf9693f5c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
-DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares speexdsp"
+DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares speexdsp virtual/libiconv"
 
 DEPENDS:append:class-target = " wireshark-native chrpath-replacement-native "
 
@@ -13,12 +13,13 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
-           file://CVE-2025-9817.patch \
            "
 
+SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-build.patch"
+
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166"
+SRC_URI[sha256sum] = "9fa6a745df8540899dc9d433e4634d6755371ff87bd722ce04c7d7b0132d9af3"
 
 PE = "1"
 
@@ -59,16 +60,19 @@ EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DM_INCLUDE_DIR=${includedir} \
                   -DM_LIBRARY=${libdir} \
                  "
+
+# use lemon from ${PN}-native, instead of cross-compiled or host versions
+EXTRA_OECMAKE:append:class-target = " -DLEMON_EXECUTABLE=${STAGING_BINDIR_NATIVE}/lemon"
 CFLAGS:append = " -lm"
 
 do_compile:append:class-target() {
     # Fix TMPDIR, these are in the comments section
     sed -i -e "s:** source file.*::g"  ${B}/wiretap/ascend_parser.c
-    sed -i -e "s:** source file.*::g"  ${B}/wiretap/candump_parser.c
     sed -i -e "s:** source file.*::g"  ${B}/wiretap/busmaster_parser.c
     sed -i -e "s:** source file.*::g"  ${B}/epan/protobuf_lang_parser.c
-    sed -i -e "s:** source file.*::g"  ${B}/epan/dtd_grammar.c
     sed -i -e "s:** source file.*::g"  ${B}/epan/dfilter/grammar.c
+    test -e ${B}/plugins/epan/mate/mate_grammar.c && \
+        sed -i -e "s:** source file.*::g"  ${B}/plugins/epan/mate/mate_grammar.c
 }
 
 do_install:append:class-native() {

