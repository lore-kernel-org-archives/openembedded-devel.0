Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id DFC50786DA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:31:15 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id i6so8115173plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PgePBjoUlBlc9ECBlnwNzYVt6gefNmhKMdNrqaJ7GiI=;
	b=GfTfqD1dMl8KiA2ORWCaAMJNDGKxyLVnEEBc2rQzmNQTpQ5P6n/io71f5euk2pwqo3
	RuC0GHBfZ9j8ePI79AjTzb4lzVvzsSUSE/xAUlAfaTXqavHIiBs9C5f5MZwsvXrEm/zr
	EFW4bCIAp4WEwLgBrIrgTG5pTcfHl0Y4ApEVrLA8LCZ5jshl8rK0u2JKC5u5U/t68Ggb
	XsJISMv8AbkG+4jNrjfaI5omJdWYMZM56iK/ltji0YCIMrPQrB1zcGV0G7Iz/+sIP4TC
	T4I3+po/X614zmB9amPs14ySvhSeYBH/FxL5Z829WLfMAGHfjUrL9EE2BtM3znyMrVjR
	q6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PgePBjoUlBlc9ECBlnwNzYVt6gefNmhKMdNrqaJ7GiI=;
	b=iUG2qymWxMzYRq7z5jrTMu3jHh5Thmxp2s8xYgZcukHTJF5h4ZCIy+Oj8FB15zLq4Y
	IxXVWXj2RPoXgdw4VmHPILlM7BbhmTo+py195G7H5y76ng9BrId6hk3G+FSby/k5qkgt
	70deBD2qLWWAmLtQFC5RzUqOcj4bTWQXcBvbh3Tb5aEOyMr8cip1Z/45zewjWchIiGmA
	v5n2CFcR+HYd631MnqoxwY4CTKdhbN3BL2ZMi/bQb9ctT+OivKbL0TVtfdJXtdfOQ6dc
	flDsB4oiDU3FlK0hXdyfeKaN7SedO3xBbp9llBn8kHIbnAhsvWd+soFL9O+4Ri3lURxP
	mCwA==
X-Gm-Message-State: APf1xPDrCxZ7VJTIH0eNuHDMSfH7pLAODdBpGxc2Q1vuAHbuSDyS/+qp
	563xraeoivotG7HRSNtITOn6Rg==
X-Google-Smtp-Source: AH8x227Q4p01YwQzD5vh7LmGlz7Dtkwhdo/JNiXeD2+RN+ymiJSFIEnKDCF6dniq4x+Ban5CRuvLxA==
X-Received: by 2002:a17:902:5482:: with SMTP id
	e2-v6mr8417386pli.65.1519594276954; 
	Sun, 25 Feb 2018 13:31:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id f3sm12467918pgn.9.2018.02.25.13.31.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:31:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:31:11 -0800
Message-Id: <1519594272-24403-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 1/2] wireshark: update to new 2.4.5 series
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
X-List-Received-Date: Sun, 25 Feb 2018 21:31:16 -0000

[v2]
Fix epan/.libs/libwireshark.so: error: undefined reference to 'gpg_strerror'

and update to 2.4.5.

includes:
wnpa-sec-2018-05
The IEEE 802.11 dissector could crash. Bug 14442, CVE-2018-7335

wnpa-sec-2018-06
Multiple dissectors could go into large infinite loops. All ASN.1 BER dissectors (Bug 14444), along with the DICOM (Bug 14411), DMP (Bug 14408), LLTD (Bug 14419), OpenFlow (Bug 14420), RELOAD (Bug 14445), RPCoRDMA (Bug 14449), RPKI-Router (Bug 14414), S7COMM (Bug 14423), SCCP (Bug 14413), Thread (Bug 14428), Thrift (Bug 14379), USB (Bug 14421), and WCCP (Bug 14412) dissectors were susceptible.

wnpa-sec-2018-07
The UMTS MAC dissector could crash. Bug 14339, CVE-2018-7334

wnpa-sec-2018-08
The DOCSIS dissector could crash. Bug 14446, CVE-2018-7337

wnpa-sec-2018-09
The FCP dissector could crash. Bug 14374, CVE-2018-7336

wnpa-sec-2018-10
The SIGCOMP dissector could crash. Bug 14398, CVE-2018-7320

wnpa-sec-2018-11
The pcapng file parser could crash. Bug 14403, CVE-2018-7420

wnpa-sec-2018-12
The IPMI dissector could crash. Bug 14409, CVE-2018-7417

wnpa-sec-2018-13
The SIGCOMP dissector could crash. Bug 14410, CVE-2018-7418

wnpa-sec-2018-14
The NBAP disssector could crash. Bug 14443, CVE-2018-7419

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/files/libgcrypt.patch                | 53 ++++++++++++++++++++++
 .../{wireshark_2.2.12.bb => wireshark_2.4.5.bb}    | 26 +++++------
 2 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/libgcrypt.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.12.bb => wireshark_2.4.5.bb} (73%)

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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
similarity index 73%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
index 6c0b644..e330b99 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
@@ -4,14 +4,15 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error"
 
-SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
+SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
+SRC_URI += "file://libgcrypt.patch"
 
-PE = "1"
+SRC_URI[md5sum] = "2b6f1f37c72fa15a0a1863016a0abcc0"
+SRC_URI[sha256sum] = "b3b2ec29fba0f4a3a590438abe4054e56f19108d440fc2d61492db9d8ff16fd7"
 
-SRC_URI[md5sum] = "ebf3d4230d7a13408758cdf037c42d66"
-SRC_URI[sha256sum] = "3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc"
+PE = "1"
 
 inherit autotools pkgconfig perlnative
 
@@ -19,10 +20,9 @@ ARM_INSTRUCTION_SET = "arm"
 
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
-#PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
 
-PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
-PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
+PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_DIR_HOST}/usr, --with-libcap=no --enable-pcap-ng-default , libcap"
+PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_DIR_HOST}/usr --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
 PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
 PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
 PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
@@ -30,7 +30,6 @@ PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
 PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
 PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
-PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
 PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
@@ -38,14 +37,15 @@ PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
 PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
-
-PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_LIBDIR}, --with-libssh=no, libssh2"
-
+PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_DIR_HOST}/usr, --with-libssh=no, libssh2"
+PACKAGECONFIG[lz4] = "--with-lz4=${STAGING_DIR_HOST}/usr, --with-lz4=no, lz4"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
-EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
+EXTRA_OECONF += "--with-libgcrypt-prefix=${PKG_CONFIG_DIR} --with-qt=no --enable-tshark --enable-rawshark"
+
+LDFLAGS_append = " -lgpg-error"
 
 # Currently wireshark does not install header files
 do_install_append () {
-- 
2.7.4


