Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0FE770F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 08:25:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id c9-v6so2663902pgf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zjW5MbaivwV5xLbAEwMh4KUByJ+W2dBeFg68/ZA49+4=;
	b=u326utaxmYR5wn37Wz3Ou+dst5MeI1HxsgjRQYQvyC/dDRvCGfsyFUm8fcC6K73Tpn
	NqXMWmQc2McH9z8J+t8T+eufKbh0msnIM38cO5Q+M88daUgtuaPIRSvq6f7V04tX1qV+
	lX6ybmxBqMVfwsF33DF+OV+neMoS1y2D5nY2VihPg9dqLRKaeLFIxILTkbVySeO+JAK/
	atJP3dZrBwc2vk85c/l1RnOhTlRa3sI42leo5EdHi4UMH2eraoC96SSbuk6rBKvyu6vc
	zjquKT1EfCs3j6BDzRoVDScRRijYggpISRI+d5lO41KC4oWmZF2rK78uhOW/+GiUXolC
	8tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zjW5MbaivwV5xLbAEwMh4KUByJ+W2dBeFg68/ZA49+4=;
	b=nV29WGISmcgZ+3DPTg/fcCd0gHPCItzBq83tJ34Dcqfa48x0f0NuUnl2gTK1MT8CQ8
	ctkv12xxD4V06jSoA8d98eP68ZzChy+8YhdELhkD+gS+gczI6+5Cva3YM7g6fcFBr01K
	IOP+YGHqzS8LyUr1dinvSPRkCjMR5tyByD8gRY2QU8hLq3N+6RMwEEE6fuyJ1cDNl8e5
	ia6IrHVgC3bShEeyOR3bPwvO8ZD2ITyVIFOJi5jq1Fig5gfclP8nRomE+7qpPtdkUaSF
	fvh4BCZlwNrg2NEZFnLEzH+3zYh/r2wKpnzwfursfU2JsO2YHUgnMgEhDkjACh7iMmv7
	N0vw==
X-Gm-Message-State: APt69E1rdlxS0qFdAq3KEGhCQCQHXDYTvjz4dbyTU7TdaAiV99lg06za
	R6IcRcEUonkqus6hg3y8aYOl/g==
X-Google-Smtp-Source: ADUXVKL0/RbaKikLJEMJLGmhEtlC0CftGBC2W5d0hEXeg/0r02Z0rv2CMe2N8s+y9NdJZZDMywOGpw==
X-Received: by 2002:a63:9a52:: with SMTP id
	e18-v6mr1798405pgo.188.1528273525557; 
	Wed, 06 Jun 2018 01:25:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	e12-v6sm48954433pgs.42.2018.06.06.01.25.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 01:25:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Wed,  6 Jun 2018 01:25:26 -0700
Message-Id: <20180606082526.37862-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] wireshark: Update to 2.6 release
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
X-List-Received-Date: Wed, 06 Jun 2018 08:25:25 -0000

Add a native version to provide certain utilities needed during cross build
Strip rpaths which cmake seems to be enforcing for no reason

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wireshark/files/libgcrypt.patch           | 53 ------------
 .../wireshark/wireshark_2.4.6.bb              | 73 -----------------
 .../wireshark/wireshark_2.6.1.bb              | 81 +++++++++++++++++++
 3 files changed, 81 insertions(+), 126 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/files/libgcrypt.patch
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
index 0000000000..36a685d090
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
@@ -0,0 +1,81 @@
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
+SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
+#SRC_URI += "file://libgcrypt.patch"
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
+LDFLAGS_append = " -lgpg-error -lm"
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


