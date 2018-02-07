Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8243665D00
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 01:59:45 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id f6so1882742pgs.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Feb 2018 17:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=uhxbm4vvwoeo8ke7jR8+WEI90OLqemOttzNWYgX+mtg=;
	b=Nxu9xGehbXJNp2O617QhRZs85M97gwf60c9jinTpxndSMEXm3nZQx3kaG7+MJ4VME9
	aencWvH5h5xYKoIKbakua298uM85WqyP4T6Gx6SJ4Aq2UVM7SZicVdKXHii3g2/UIVeK
	0xubKwj6e8MgeeOhKLi1jSf2IOHwKhiTqxOjpgvGhZMgBKlwHlsdWf6vywQPUGhfthlU
	OSKN6gozA1EGUlWwMVRzJSaNuFlfemE1fBy1gCeCQBoamWhv6mkuME7KgylKu9pIBXox
	lZUYZ9nnljZZZaSPnSW3h98UeU5rlTZs2N//qp/iBv5ZrWxrO64IsARd8M9m142H9hcr
	TSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uhxbm4vvwoeo8ke7jR8+WEI90OLqemOttzNWYgX+mtg=;
	b=dKtd2mPvpq+pZMsRe1EqxkKn68sy3SaEevX2Ncl523dZAQx+5TpHhFat+XiBTvxZdP
	sqAR295fDJrlJ6O4Vfjf2kNzRQ0pI6iYhuu4DeF7SzQQyjWnlF3zXR7IIp1IKxK3Eq9b
	wGXiCRt6nU8Ii48q3hx9Ud1E40IQGyjbJDIX0nWus7n92/jzrqoElXzk84uG6HAHbFSQ
	6Oqu+y/jhD3J+Qm+PaHk8fn15rkEbMgy8ftteHaZpWVMAJAmM7JAHWtWRUjBzb9MpqJM
	AQ3OgGDN0RGELdklBbMKj+apEkYwIvjPlDYwgq8UUvPIifO0IrUlzQbsgzcaEemDQlot
	ny5w==
X-Gm-Message-State: APf1xPATUa3cngJuahA40QcIXKXkgVYUCUOw/cBs6Ei1SoPJNGvLR6l5
	5b/R8/dp08n4qHHIArLUD08/zA==
X-Google-Smtp-Source: AH8x224CNNlbBCP3Y07jx3wJIjUjEslf556YWc+nKPpLGykd3zFgQChqrVXqFlT02Iyu3ArtHUF5Tw==
X-Received: by 10.98.195.2 with SMTP id v2mr4223333pfg.141.1517968784997;
	Tue, 06 Feb 2018 17:59:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	m83sm565823pfk.107.2018.02.06.17.59.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Feb 2018 17:59:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 07:29:40 +0530
Message-Id: <1517968780-16074-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to new 2.4 series
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
X-List-Received-Date: Wed, 07 Feb 2018 01:59:45 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/files/libgcrypt.patch                | 53 ++++++++++++++++++++++
 .../{wireshark_2.2.12.bb => wireshark_2.4.4.bb}    | 17 ++++---
 2 files changed, 61 insertions(+), 9 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/libgcrypt.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.12.bb => wireshark_2.4.4.bb} (84%)

diff --git a/meta-networking/recipes-support/wireshark/files/libgcrypt.patch b/meta-networking/recipes-support/wireshark/files/libgcrypt.patch
new file mode 100644
index 0000000..2aa58f7
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/libgcrypt.patch
@@ -0,0 +1,53 @@
+use OR PKG_CONFIG scheme for libgcrypt
+
+Upstream-Status: Inappropriate OE specific
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: wireshark-2.4.4/m4/libgcrypt.m4
+===================================================================
+--- wireshark-2.4.4.orig/m4/libgcrypt.m4
++++ wireshark-2.4.4/m4/libgcrypt.m4
+@@ -27,11 +27,11 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+      libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
+   if test x$libgcrypt_config_prefix != x ; then
+      if test x${LIBGCRYPT_CONFIG+set} != xset ; then
+-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
++        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/libgcrypt.pc
+      fi
+   fi
+ 
+-  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
++  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt.pc, no)
+   tmp=ifelse([$1], ,1:1.2.0,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -50,7 +50,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+     req_micro=`echo $min_libgcrypt_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
++    libgcrypt_config_version=`$PKG_CONFIG --modversion libgcrypt`
+     major=`echo $libgcrypt_config_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+     minor=`echo $libgcrypt_config_version | \
+@@ -82,7 +82,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+      # If we have a recent libgcrypt, we should also check that the
+      # API is compatible
+      if test "$req_libgcrypt_api" -gt 0 ; then
+-        tmp=`$LIBGCRYPT_CONFIG --api-version 2>/dev/null || echo 0`
++        tmp=`$PKG_CONFIG --api-version libgcrypt 2>/dev/null || echo 0`
+         if test "$tmp" -gt 0 ; then
+            AC_MSG_CHECKING([LIBGCRYPT API version])
+            if test "$req_libgcrypt_api" -eq "$tmp" ; then
+@@ -95,8 +95,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+      fi
+   fi
+   if test $ok = yes; then
+-    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
+-    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
++    LIBGCRYPT_CFLAGS=`$PKG_CONFIG --cflags libgcrypt`
++    LIBGCRYPT_LIBS=`$PKG_CONFIG --libs libgcrypt`
+     ifelse([$2], , :, [$2])
+   else
+     LIBGCRYPT_CFLAGS=""
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.4.bb
similarity index 84%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.4.4.bb
index 6c0b644..4a2336e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.4.bb
@@ -4,14 +4,16 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt"
 
-SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
+SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
+SRC_URI += "file://libgcrypt.patch"
+
+SRC_URI[md5sum] = "660db152b7d6974c0e2ff12aa8a4fce6"
++SRC_URI[sha256sum] = "049a758e39422dcd536d7f75cebbfaa44e4f305d602bf22964d6459821126f58"
 
 PE = "1"
 
-SRC_URI[md5sum] = "ebf3d4230d7a13408758cdf037c42d66"
-SRC_URI[sha256sum] = "3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc"
 
 inherit autotools pkgconfig perlnative
 
@@ -19,7 +21,6 @@ ARM_INSTRUCTION_SET = "arm"
 
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
-#PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
 
 PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
 PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
@@ -30,7 +31,6 @@ PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
 PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
 PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
-PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
 PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
@@ -38,14 +38,13 @@ PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
 PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
-
 PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_LIBDIR}, --with-libssh=no, libssh2"
-
+PACKAGECONFIG[lz4] = "--with-lz4=${STAGING_LIBDIR}, --with-lz4=no, lz4"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
-EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
+EXTRA_OECONF += "--with-libgcrypt-prefix=${PKG_CONFIG_DIR} --with-qt=no --enable-tshark --enable-rawshark"
 
 # Currently wireshark does not install header files
 do_install_append () {
-- 
2.7.4


