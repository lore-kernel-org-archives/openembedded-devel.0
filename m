Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id C48467450D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:35:15 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 6-v6so382512plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=em5iKpDQBcYBS+s6MBt/hbPn/4hc5wG0Gn5chDY+9go=;
	b=s58iOpc1IgwCm0YhPuNBt2SinMEcLv5IAwLVoToEjlMYA94vUsz/5b3NLqzl8qywVC
	uzcoc8MKYH0EEIh6pqwnUuYiZthj+zsoIk0kRABk8Ek5Izsfo7a4cjH61HoX/WiJKaDU
	AJJ1I2MP38vOfyVCNPG6nIlJJBPO6HiKPMY4XZ0ib/sld6UpK2T4FFRCd0TAMcSos1ew
	RPPxRhmk9/NjNtSs7vz51RNcnr1fzrmy7HygXQItj8S28wmIPUTHb3Wa5pUmVIgNtbMF
	XnOZacEQWs1YzzhGP8feQML2EXxN4fkfcAV1yqE4dwO0YP4Xguc4Zca7ygyuxfIFPRR8
	3a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=em5iKpDQBcYBS+s6MBt/hbPn/4hc5wG0Gn5chDY+9go=;
	b=edINJua4fHRCLOB2nWet84qBdURsbtZ4Vb8QNHwpmq/QRLgGD2aqvf2kLFzd9xEJv1
	WH8UkeA7l22DDrBLDP8qkejPGsmtUCoUhuuuec3Z64QXATWmqRtNKIAxGFxmqTYndOzG
	UV0qg9f7+zdqoSfFnQiCcISZCeNj2oQQl9ZvsvRY8uhylyK1cpVjmgtLK8GIA2JRgkuP
	kcBLogSmKN4TYUZmXogD66pTMV7LXtQdMjy1E5P1Z8xYp3PcJx8GqPTiW7mVX08F22Sc
	1E9H+1Wu8sT34NCJndXhHpDbJNyUgjz2pmI/hE8fTlUZMN4wxCzKTSl1mABCNfpZWwHS
	WYjw==
X-Gm-Message-State: APt69E1AhW/H7rlw203+nynYHSqtiMhpi9ZoGpO0TZnn9K6PkYIsJzCk
	cRHFXzofOsQEOGqbVDItU4LVsQ==
X-Google-Smtp-Source: ADUXVKKL7W4RSSnGc94EL4Eat05rKZ0aSgULjXfJbAiK1qfX0rF/tCkVuunwagYkLOBnNQz579kiVg==
X-Received: by 2002:a17:902:b28c:: with SMTP id
	u12-v6mr3744523plr.68.1528871716365; 
	Tue, 12 Jun 2018 23:35:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	b83-v6sm3525707pfe.159.2018.06.12.23.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 23:35:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 23:35:12 -0700
Message-Id: <20180613063512.1755-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613063512.1755-1-raj.khem@gmail.com>
References: <20180613063512.1755-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 5/5] wireshark: Update to 2.6 release
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
X-List-Received-Date: Wed, 13 Jun 2018 06:35:15 -0000

Add a native version to provide certain utilities needed during cross build
Strip rpaths which cmake seems to be enforcing for no reason

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wireshark/files/libgcrypt.patch           | 53 ------------
 .../0001-Add-libm-to-link-for-fmod-API.patch  | 29 +++++++
 .../wireshark/wireshark_2.4.6.bb              | 73 -----------------
 .../wireshark/wireshark_2.6.1.bb              | 80 +++++++++++++++++++
 4 files changed, 109 insertions(+), 126 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/files/libgcrypt.patch
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
 delete mode 100644 meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb

diff --git a/meta-networking/recipes-support/wireshark/files/libgcrypt.patch b/meta-networking/recipes-support/wireshark/files/libgcrypt.patch
deleted file mode 100644
index 2aa58f73c2..0000000000
--- a/meta-networking/recipes-support/wireshark/files/libgcrypt.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-use OR PKG_CONFIG scheme for libgcrypt
-
-Upstream-Status: Inappropriate OE specific
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
-Index: wireshark-2.4.4/m4/libgcrypt.m4
-===================================================================
---- wireshark-2.4.4.orig/m4/libgcrypt.m4
-+++ wireshark-2.4.4/m4/libgcrypt.m4
-@@ -27,11 +27,11 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-      libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
-   if test x$libgcrypt_config_prefix != x ; then
-      if test x${LIBGCRYPT_CONFIG+set} != xset ; then
--        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
-+        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/libgcrypt.pc
-      fi
-   fi
- 
--  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
-+  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt.pc, no)
-   tmp=ifelse([$1], ,1:1.2.0,$1)
-   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -50,7 +50,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
-     req_micro=`echo $min_libgcrypt_version | \
-                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
--    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
-+    libgcrypt_config_version=`$PKG_CONFIG --modversion libgcrypt`
-     major=`echo $libgcrypt_config_version | \
-                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
-     minor=`echo $libgcrypt_config_version | \
-@@ -82,7 +82,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-      # If we have a recent libgcrypt, we should also check that the
-      # API is compatible
-      if test "$req_libgcrypt_api" -gt 0 ; then
--        tmp=`$LIBGCRYPT_CONFIG --api-version 2>/dev/null || echo 0`
-+        tmp=`$PKG_CONFIG --api-version libgcrypt 2>/dev/null || echo 0`
-         if test "$tmp" -gt 0 ; then
-            AC_MSG_CHECKING([LIBGCRYPT API version])
-            if test "$req_libgcrypt_api" -eq "$tmp" ; then
-@@ -95,8 +95,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-      fi
-   fi
-   if test $ok = yes; then
--    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
--    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
-+    LIBGCRYPT_CFLAGS=`$PKG_CONFIG --cflags libgcrypt`
-+    LIBGCRYPT_LIBS=`$PKG_CONFIG --libs libgcrypt`
-     ifelse([$2], , :, [$2])
-   else
-     LIBGCRYPT_CFLAGS=""
diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
new file mode 100644
index 0000000000..e65ef9b10c
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
@@ -0,0 +1,29 @@
+From 1a6a5d2bcb1adec9ba138c2ebee7bbc994620aff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Jun 2018 23:23:44 -0700
+Subject: [PATCH] Add libm to link for fmod() API
+
+fixes
+ld: CMakeFiles/tshark.dir/ui/cli/tap-comparestat.c.o: undefined reference to symbol 'fmod@@GLIBC_2.2.5'
+| /mnt/a/oe/build/tmp/work/core2-64-bec-linux/wireshark/1_2.6.1-r0/recipe-sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7950e85..acee140 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2494,6 +2494,7 @@ if(BUILD_tshark)
+ 		${LIBEPAN_LIBS}
+ 		${APPLE_CORE_FOUNDATION_LIBRARY}
+ 		${APPLE_SYSTEM_CONFIGURATION_LIBRARY}
++		m
+ 	)
+ 	set(tshark_FILES
+ 		capture_opts.c
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
deleted file mode 100644
index 3da0a7bafc..0000000000
--- a/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-DESCRIPTION = "wireshark - a popular network protocol analyzer"
-HOMEPAGE = "http://www.wireshark.org"
-SECTION = "net"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
-
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error"
-
-SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
-SRC_URI += "file://libgcrypt.patch"
-
-UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-
-SRC_URI[md5sum] = "8cfb73e286dd6427ca4405e6e802d13e"
-SRC_URI[sha256sum] = "8e965fd282bc0c09e7c4eba5f08a555d0ccf40a7d1544b939e01b90bc893d5fe"
-
-PE = "1"
-
-inherit autotools pkgconfig perlnative upstream-version-is-even
-
-ARM_INSTRUCTION_SET = "arm"
-
-PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
-PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
-
-PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_DIR_HOST}/usr, --with-libcap=no --enable-pcap-ng-default , libcap"
-PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_DIR_HOST}/usr --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
-PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
-PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
-PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
-PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
-PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
-PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
-PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
-PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
-PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
-PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
-PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
-PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
-PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
-PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
-PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_DIR_HOST}/usr, --with-libssh=no, libssh2"
-PACKAGECONFIG[lz4] = "--with-lz4=${STAGING_DIR_HOST}/usr, --with-lz4=no, lz4"
-
-# these next two options require addional layers
-PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
-
-EXTRA_OECONF += "--with-libgcrypt-prefix=${PKG_CONFIG_DIR} --with-qt=no --enable-tshark --enable-rawshark"
-
-LDFLAGS_append = " -lgpg-error"
-
-# Currently wireshark does not install header files
-do_install_append () {
-
-	install -d ${D}/${includedir}/${BPN}
-	install -d ${D}/${includedir}/${BPN}/epan
-	install -d ${D}/${includedir}/${BPN}/epan/crypt
-	install -d ${D}/${includedir}/${BPN}/epan/dfilter
-	install -d ${D}/${includedir}/${BPN}/epan/dissectors
-	install -d ${D}/${includedir}/${BPN}/epan/ftypes
-	install -d ${D}/${includedir}/${BPN}/epan/wmem
-
-	install config.h ${D}/${includedir}/${BPN}
-	install ${S}/register.h ${D}/${includedir}/${BPN}
-	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
-	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
-	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
-	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/dissectors
-	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
-	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
-}
-
-FILES_${PN} += "${datadir}*"
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
new file mode 100644
index 0000000000..91c5e96bb0
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
@@ -0,0 +1,80 @@
+DESCRIPTION = "wireshark - a popular network protocol analyzer"
+HOMEPAGE = "http://www.wireshark.org"
+SECTION = "net"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
+
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2"
+
+DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
+
+SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
+           file://0001-Add-libm-to-link-for-fmod-API.patch \
+          "
+
+UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
+
+SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
+SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
+
+PE = "1"
+
+inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
+
+ARM_INSTRUCTION_SET = "arm"
+
+PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
+PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk3 graphics ", "", d)}"
+
+PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
+
+PACKAGECONFIG[libcap] = "-DENABLE_CAP=ON,-DENABLE_CAP=OFF -DENABLE_PCAP_NG_DEFAULT=ON, libcap"
+PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DEFAULT=ON , libpcap"
+PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
+PACKAGECONFIG[libnl] = ",,libnl"
+PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
+PACKAGECONFIG[gtk2] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF, gtk+"
+PACKAGECONFIG[gtk3] = "-DENABLE_GTK3=ON,-DENABLE_GTK3=OFF, gtk+3"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
+PACKAGECONFIG[graphics] = ",-DENABLE_GTK=OFF,"
+PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
+PACKAGECONFIG[ssl] = ",,openssl"
+PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
+PACKAGECONFIG[lua] = "-DENABLE_LUA=ON,-DENABLE_LUA=OFF, lua"
+PACKAGECONFIG[zlib] = "-DENABLE_ZLIB=ON,-DENABLE_ZLIB=OFF, zlib"
+PACKAGECONFIG[geoip] = ",, geoip"
+PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
+PACKAGECONFIG[sbc] = "-DENABLE_SBC=ON,-DENABLE_SBC=OFF, sbc"
+PACKAGECONFIG[libssh] = ",,libssh2"
+PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
+
+# these next two options require addional layers
+PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
+
+EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
+                  -DENABLE_NETLINK=ON \
+                  -DBUILD_mmdbresolve=OFF \
+                  -DBUILD_randpktdump=OFF \
+                  -DBUILD_androiddump=OFF \
+                  -DBUILD_dcerpcidl2wrs=OFF \
+                  -DM_INCLUDE_DIR=${includedir} \
+                  -DM_LIBRARY=${libdir} \
+                 "
+do_install_append_class-native() {
+	install -d ${D}${bindir}
+	for f in make-dissectors lemon make-taps
+	do
+		install -m 0755 ${B}/run/$f ${D}${bindir}
+	done
+}
+
+do_install_append_class-target() {
+	for f in `find ${D}${libdir} ${D}${bindir} -type f -executable`
+	do
+		chrpath --delete $f
+	done
+}
+
+FILES_${PN} += "${datadir}*"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


