Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56EEC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:30:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.15473.1741364991157531507
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZFGg5FhR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1131751f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741364989; x=1741969789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=82HFC+T6WUjK/NbtLpWWu1QeodRSchXIJy5d1X1L2l8=;
        b=ZFGg5FhRasgd0ABmI8DjqfSEG1dftBZUaZBU2e20cqL6GLNjQCg5i4IYI22oo4WGUy
         taVkOKyoNk70HoTJRepdGgeImYdlXkluRrClkq6Kv5efFCE5ZgcAbFOx1n8/QPDBvOLZ
         ZytFWxZkzHBS9criVHAeghMhOMUyesy6bVa3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364989; x=1741969789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82HFC+T6WUjK/NbtLpWWu1QeodRSchXIJy5d1X1L2l8=;
        b=XByrdQqr3mw78zSj5k0TeiY+jKRgMa4pHvpcBKqV+24/OyWbcTcvYm+BAcaTyvJr0D
         lwRt/Nuc2YSTh10LHKFaWZkzphsF5hDyxlONZw9W1RnhIJvuErE/Nx337+p9kIHhM/2+
         VyjBSF3ABaukfil8LICRK16occEtaGvvlK5cvEWhiPRGJmZzk6M4z+OvJCiG/QhYJiYE
         5fALdyzsPsx2GcsE+2CP9WU3lQVZ35bM0iphJDBTbv46VpmHvTbEysW0qQ0n9FlUxGPM
         Kj/RdatHB7tA2X5bxm1IT1pBtrqiJ/yqtOhEYpjV0TLTOSmTKceS/3nfkmv2QCXcXebI
         z/5Q==
X-Gm-Message-State: AOJu0YzcMdEmRtnv7NL4/weXLTmMYENE65ZO+jyY6mc3vWYCpzrNYbES
	1c3XjYzV2t1hm69DAcQzDSBuoI0+o9nJ/9alcL4F27kPWAHSFBxCNzGnz+qNGUFIdlJ2NXtbh2Y
	3
X-Gm-Gg: ASbGncvwNQGcVYOTREHxSXEs6NKuE0ulnEhGbBoLhtcsZEP5BQYHAvLTx5Q9sb2Tk6V
	8B4pEK3/sSVNC1XTm+kigLtX/gmcOq+9W/GYKbyLwUnYwmavAUD5a2wj1twcxujgpNZaGtLainQ
	bx2bqEAs4lKaY1nJp7z35nYEqkwJ2TJL8cxAbiUpDgEHu9DSEIMUKs5AgvG/ZFiFWeo6btBina0
	xHxWZlD41al2Rw0XDwpKz8twkuVSZ/aRY7Qs5yDgNUvpbKmpIYrb9yT0HPfFFAkjiF2nZIq2mYu
	9GVGZMn3fpF1j/3XdaJbq/az8g5AzLZykZAD8ErsAV/Sa5iDJifDL5bmC76O7wUiY9MDpM7deQ=
	=
X-Google-Smtp-Source: AGHT+IEzjKM4oHIC5Ej3pwwjd4WOoRvNUegwxqdWpvvXEIYShIR5FZ98Jv7f5UUMqCG74Geiy8hl0g==
X-Received: by 2002:a05:6000:178d:b0:390:e9ea:59a with SMTP id ffacd0b85a97d-39132d77a7emr2415717f8f.5.1741364987947;
        Fri, 07 Mar 2025 08:29:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f4ef:561a:51ad:c651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8c3d3esm55674685e9.16.2025.03.07.08.29.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:29:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] recipes: Fix variable assignment whitespace
Date: Fri,  7 Mar 2025 16:29:46 +0000
Message-ID: <20250307162946.2638478-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115793

Recipes are much more readable with whitespace around the assignment operators.
Fix various assignments in meta-openembedded recipes to show this is definitely
the preferred formatting.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/libupnp/libupnp_1.14.18.bb           | 2 +-
 .../recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb    | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb  | 2 +-
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb          | 2 +-
 meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb  | 2 +-
 meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb  | 4 ++--
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb          | 2 +-
 meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb     | 2 +-
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb | 4 ++--
 meta-networking/recipes-daemons/squid/squid_6.12.bb           | 2 +-
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb        | 4 ++--
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb     | 2 +-
 meta-networking/recipes-kernel/wireguard/wireguard.inc        | 2 +-
 .../recipes-protocols/freediameter/freediameter_1.5.0.bb      | 2 +-
 meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb  | 4 ++--
 meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb       | 4 ++--
 meta-networking/recipes-support/netperf/netperf_git.bb        | 4 ++--
 meta-networking/recipes-support/spice/spice_git.bb            | 2 +-
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb            | 2 +-
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb   | 2 +-
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb          | 2 +-
 meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb                      | 2 +-
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb                 | 2 +-
 meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb     | 2 +-
 meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb         | 2 +-
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb            | 2 +-
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb               | 2 +-
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb  | 2 +-
 meta-oe/recipes-devtools/cloc/cloc_1.98.bb                    | 2 +-
 meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb       | 2 +-
 meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb              | 2 +-
 meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb         | 2 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb                 | 2 +-
 meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb    | 2 +-
 meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb          | 2 +-
 meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb                  | 2 +-
 meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb                    | 2 +-
 meta-oe/recipes-extended/brotli/brotli_1.1.0.bb               | 2 +-
 .../recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb  | 2 +-
 meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb          | 2 +-
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 +-
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb                   | 2 +-
 meta-oe/recipes-extended/haveged/haveged_1.9.19.bb            | 2 +-
 meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb     | 2 +-
 meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb              | 2 +-
 meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb                   | 2 +-
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb       | 2 +-
 meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb              | 2 +-
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb         | 2 +-
 meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb                   | 4 ++--
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb          | 2 +-
 meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb      | 2 +-
 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb            | 2 +-
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb     | 2 +-
 meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb              | 2 +-
 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb                 | 2 +-
 meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb      | 2 +-
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb               | 2 +-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb                 | 2 +-
 meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb         | 2 +-
 meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb                 | 2 +-
 meta-oe/recipes-shells/zsh/zsh_5.9.bb                         | 2 +-
 meta-oe/recipes-support/anthy/anthy_9100h.bb                  | 2 +-
 meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb            | 2 +-
 meta-oe/recipes-support/gflags/gflags_2.2.2.bb                | 2 +-
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb   | 2 +-
 meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb        | 2 +-
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb                | 2 +-
 meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb              | 2 +-
 meta-oe/recipes-support/openct/openct_0.6.20.bb               | 2 +-
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb                      | 4 ++--
 meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb              | 4 ++--
 meta-oe/recipes-support/psutils/psutils_2.10.bb               | 2 +-
 meta-oe/recipes-support/remmina/remmina_1.4.36.bb             | 2 +-
 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb         | 2 +-
 meta-oe/recipes-support/spitools/spitools_git.bb              | 2 +-
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb                | 2 +-
 meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb        | 2 +-
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                       | 2 +-
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb               | 4 ++--
 meta-python/conf/include/ptest-packagelists-meta-python.inc   | 2 +-
 .../recipes-devtools/python/python3-colorclass_2.2.2.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb  | 2 +-
 .../recipes-devtools/python/python3-simplejson_3.20.1.bb      | 2 +-
 86 files changed, 96 insertions(+), 96 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
index 5b15d18096..326a754ce7 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
@@ -12,7 +12,7 @@ SRCREV = "c540ce2431bdeac73359029d4592b45790e1d154"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x \
           "
 
-S="${WORKDIR}/git"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
index f9115d819b..833ec2a393 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/${BPN}-3d43b280298c"
 
 inherit perlnative
 
-export enable_static="no"
+export enable_static = "no"
 
 export PERL_USE_UNSAFE_INC = "1"
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index 3a4b3aa1a0..5abfacc24b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Music Player Daemon library"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-HOMEPAGE ="http://sourceforge.net/projects/musicpd"
+HOMEPAGE = "http://sourceforge.net/projects/musicpd"
 DEPENDS = "glib-2.0"
 
 SRC_URI = "http://www.musicpd.org/download/${BPN}/${PV}/${BP}.tar.gz \
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 800fcad2c9..41166bf610 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION="SoX is the Swiss Army knife of sound processing tools. \
+DESCRIPTION = "SoX is the Swiss Army knife of sound processing tools. \
 It converts audio files among various standard audio file formats \
 and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index de7e2d3e01..4613ac61f1 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -15,7 +15,7 @@ CFLAGS:prepend = "-I${WORKDIR}/build "
 
 inherit autotools
 
-EXTRA_OECONF="--with-ssh=/usr/bin/ssh"
+EXTRA_OECONF = "--with-ssh=/usr/bin/ssh"
 
 do_compile:append() {
         cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}/build
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
index 4e3c157713..faaf393529 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
@@ -15,8 +15,8 @@ SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6a
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 
-EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
-              KERNEL_DIR=${STAGING_KERNEL_DIR} "
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
+                KERNEL_DIR=${STAGING_KERNEL_DIR} "
 
 do_compile:prepend () {
     oe_runmake clean
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 90e7814a0f..ede4491309 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -83,7 +83,7 @@ FILES:${PN}-test = "/opt/${BPN}"
 # needs tcl to run tests
 RDEPENDS:${PN}-test += "tcl ${BPN}"
 
-PPPD_VERSION="${@get_ppp_version(d)}"
+PPPD_VERSION = "${@get_ppp_version(d)}"
 
 def get_ppp_version(d):
     import re
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
index d426b0fe83..89502d5044 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
@@ -4,7 +4,7 @@ IBM research as an alternative to the widely-used Sendmail program. \
 Postfix attempts to be fast, easy to administer, and secure. The outsidei \
 has a definite Sendmail-ish flavor, but the inside is completely different."
 
-HOMEPAGE= "http://www.postfix.org"
+HOMEPAGE = "http://www.postfix.org"
 SECTION = "mail"
 DEPENDS = "db icu libpcre libnsl2 m4-native openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
index 8a56ad5078..c5c9c87c7f 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
@@ -17,5 +17,5 @@ inherit autotools
 
 EXTRA_AUTORECONF += "-I m4"
 
-PACKAGECONFIG[libsodium] ="ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
-                           ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
+PACKAGECONFIG[libsodium] = "ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
+                            ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
diff --git a/meta-networking/recipes-daemons/squid/squid_6.12.bb b/meta-networking/recipes-daemons/squid/squid_6.12.bb
index a697f21836..87144fb049 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.12.bb
@@ -75,7 +75,7 @@ EXTRA_OECONF += "--with-default-user=squid \
 # Upstream issue closed as invalid : https://bugs.squid-cache.org/show_bug.cgi?id=5376
 BUILD_CXXFLAGS += "-std=c++17"
 
-export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
+export BUILDCXXFLAGS = "${BUILD_CXXFLAGS}"
 
 TESTDIR = "test-suite"
 
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 4a843bd800..9b2be6236b 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -39,12 +39,12 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
 PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
 WRAPLIB = "${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '-lwrap', '', d)}"
-NOPAM_SRC ="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
+NOPAM_SRC = "${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
 
 inherit update-rc.d useradd systemd
 
 CONFFILES:${PN} = "${sysconfdir}/vsftpd.conf"
-LDFLAGS:append =" -lcrypt -lcap"
+LDFLAGS:append = " -lcrypt -lcap"
 CFLAGS:append:libc-musl = " -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -include fcntl.h"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 8a114411fa..604fec8072 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -43,7 +43,7 @@ python () {
         d.setVar('DISABLE_STATIC', '')
 }
 
-export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
+export SGML_CATALOG_FILES = "file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
 do_compile:prepend() {
     oe_runmake update-map-file
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 6fac24e3bd..5659a20bd2 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -1,5 +1,5 @@
 SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
-DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3, \
+DESCRIPTION = "WireGuard is a secure network tunnel, operating at layer 3, \
 implemented as a kernel virtual network interface for Linux, which aims to \
 replace both IPsec for most use cases, as well as popular user space and/or \
 TLS-based solutions like OpenVPN, while being more secure, more performant, \
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index cf50a92afb..c9756c941e 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -65,7 +65,7 @@ EXTRA_OECMAKE = " \
 
 # -DALL_EXTENSIONS=ON will enable all
 
-FD_KEY ?="${BPN}.key"
+FD_KEY ?= "${BPN}.key"
 FD_PEM ?= "${BPN}.pem"
 FD_CA ?= "${BPN}.pem"
 FD_DH_PEM ?= "${BPN}-dh.pem"
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
index e20a6a4b14..c7f6f1fb31 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
                     file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
                     "
 
-export PYTHONHASHSEED="1"
+export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
@@ -34,7 +34,7 @@ S = "${WORKDIR}/talloc-${PV}"
 
 # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
 # to cross Popen
-export WAF_NO_PREFORK="yes"
+export WAF_NO_PREFORK = "yes"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
index 6342459154..2f8be7fe61 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c98f48018c4 \
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
-export PYTHONHASHSEED="1"
+export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
@@ -34,7 +34,7 @@ inherit waf-samba pkgconfig ptest
 
 # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
 # to cross Popen
-export WAF_NO_PREFORK="yes"
+export WAF_NO_PREFORK = "yes"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index fa73548d83..3110237804 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -64,6 +64,6 @@ do_install() {
 
 RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sctp', 'kernel-module-sctp', '', d)}"
 
-INITSCRIPT_NAME="netperf"
-INITSCRIPT_PARAMS="defaults"
+INITSCRIPT_NAME = "netperf"
+INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE:${PN} = "netserver.service"
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 7900a7dea5..fc83be415e 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -30,7 +30,7 @@ inherit meson gettext python3native python3-dir pkgconfig
 DEPENDS = "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4 orc python3-pyparsing-native python3-six-native glib-2.0-native zlib"
 DEPENDS:append:class-nativesdk = " nativesdk-openssl"
 
-export PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
+export PYTHON = "${STAGING_BINDIR_NATIVE}/python3-native/python3"
 
 do_configure:prepend() {
 	echo ${PV} > ${S}/.tarball-version
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index b4864defb7..cacf211034 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -37,7 +37,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
            "
-SRC_URI:append:libc-musl ="\
+SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
            file://0002-Fix-default-stack-size-to-256K.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index afed3b4a81..ccc0b71c04 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -42,7 +42,7 @@ EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
-export HUGETLB_LDSCRIPT_PATH="${S}/ldscripts"
+export HUGETLB_LDSCRIPT_PATH = "${S}/ldscripts"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
index ea8a433877..fa80236022 100644
--- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Whetstone benchmark is a synthetic benchmark for evaluating the p
 SUMMARY = "CPU benchmark to measure floating point performance"
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM ="file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
 
 SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
 SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
index 9d3d7d8060..63b94e9d6e 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
@@ -2,7 +2,7 @@ SUMMARY = "The lsscsi command lists information about SCSI devices in Linux"
 HOMEPAGE = "http://sg.danny.cz/scsi/lsscsi.html"
 LICENSE = "GPL-2.0-only"
 SECTION = "base"
-LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index 2f3121e5a6..4d3f210778 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -22,7 +22,7 @@ COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/ACE_wrappers"
 B = "${WORKDIR}/ACE_wrappers/ace"
-export ACE_ROOT="${WORKDIR}/ACE_wrappers"
+export ACE_ROOT = "${WORKDIR}/ACE_wrappers"
 
 inherit pkgconfig
 
diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
index 1fdb76eeb4..979199a1fa 100644
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Gammu bindings for Python"
-DESCRIPTION ="Python bindings for the Gammu library."
+DESCRIPTION = "Python bindings for the Gammu library."
 HOMEPAGE = "https://wammu.eu/python-gammu/"
 BUGRACKER = "https://github.com/gammu/python-gammu/issues"
 LICENSE = "GPL-2.0-or-later"
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb
index 84b3af8c56..421113cdfc 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb
@@ -17,7 +17,7 @@ inherit systemd
 EXTRA_OEMAKE = "CC='${CC}' EXTRA_CFLAGS='${CFLAGS}' mandir='${mandir}' \
     sbindir='${sbindir}'"
 
-export KBUILD_OUTPUT="${RECIPE_SYSROOT}"
+export KBUILD_OUTPUT = "${RECIPE_SYSROOT}"
 
 LINUXPTP_SYSTEMD_SERVICES = "phc2sys@.service ptp4l@.service"
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 70a4f7c003..165872e2b1 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -21,7 +21,7 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 
 COMPATIBLE_HOST:libc-musl = "null"
 EXTRA_OEMAKE = ""
-export WVLINK="${LD}"
+export WVLINK = "${LD}"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index d4f693d8cc..05bce6b903 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -46,4 +46,4 @@ FILES:${PN}-uv-dev = "${includedir}/dbus-cxx-uv-2.0/* \
   ${libdir}/libdbus-cxx-uv.so \
   "
 
-BBCLASSEXTEND="native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
index 19d628f735..6fbe4d4a8b 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
@@ -49,7 +49,7 @@ bindir_progs += "${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'chcon runcon'
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
 
-sbindir_progs= "chroot"
+sbindir_progs = "chroot"
 
 inherit update-alternatives
 
diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.98.bb b/meta-oe/recipes-devtools/cloc/cloc_1.98.bb
index acf882cc76..6d349c1e58 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.98.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.98.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Count blank lines, comment lines, and physical lines of source code \
 in many programming languages."
 
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
index 0d7bdc83dc..961c94205f 100644
--- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
+++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-BBCLASSEXTEND="native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
index 8fdbe21737..36614ca19d 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "cpuid dumps detailed information about the CPU(s) gathered \
 from the CPUID instruction, and also determines the exact model of CPU(s). \
 It supports Intel, AMD, and VIA CPUs, as well as older Transmeta, Cyrix, \
 UMC, NexGen, Rise, and SiS CPUs"
-HOMEPAGE="http://www.etallen.com/cpuid.html"
+HOMEPAGE = "http://www.etallen.com/cpuid.html"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
index 395a330790..9331cd16fe 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/mercurial-${PV}"
 
 BBCLASSEXTEND = "native"
 
-export LDSHARED="${CCLD} -shared"
+export LDSHARED = "${CCLD} -shared"
 
 EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
     PREFIX=${prefix}"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index d2a6fbe654..5a5d4de899 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -44,7 +44,7 @@ SRCREV_libunwind = "419b03c0b8f20d6da9ddcb0d661a94a97cdd7dad"
 SRCREV_zlib = "6d3f6aa0f87c9791ca7724c279ef61384f331dfd"
 SRCREV_zstd = "77211fcc5e08c781734a386402ada93d0d18d093"
 
-SRCREV_FORMAT .="_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_libbase_libcxx_libcxxabi_libunwind_zlib_zstd"
+SRCREV_FORMAT .= "_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_libbase_libcxx_libcxxabi_libunwind_zlib_zstd"
 
 SRC_URI[gn.sha256sum] = "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd"
 
diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
index 74a09e7bf8..21e46f5521 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
@@ -25,4 +25,4 @@ do_install:append() {
            -e "/use strict;/ause warnings;" ${D}${bindir}/use-devel-checklib
 }
 
-BBCLASSEXTEND="native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
index ff1552a99b..1bdb332a75 100644
--- a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
+++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
@@ -21,4 +21,4 @@ DEPENDS += "pcsc-lite"
 
 RDEPENDS:${PN} += "perl-module-carp"
 
-BBCLASSEXTEND="native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
index 9474f3e897..8518fb8dfe 100644
--- a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
@@ -51,7 +51,7 @@ EXTRA_OECONF = "\
     --libdir=${libdir} \
 "
 
-export TK_LIBRARY='${libdir}/tk${VER}'
+export TK_LIBRARY = '${libdir}/tk${VER}'
 
 do_install:append() {
     ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
index b898e047b0..8701686b11 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
@@ -46,7 +46,7 @@ EXTRA_OECONF = "\
     --libdir=${libdir} \
 "
 
-export TK_LIBRARY='${libdir}/tk${VER}'
+export TK_LIBRARY = '${libdir}/tk${VER}'
 
 do_install:append() {
     ln -sf wish${VER} ${D}${bindir}/wish
diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
index 32524094c6..58214ea59c 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV= "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
+SRCREV = "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
index 3dc468fe0d..1baacac03d 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
@@ -29,7 +29,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools
 
-export EXPLICIT_VERSION="${PV}"
+export EXPLICIT_VERSION = "${PV}"
 
 EXTRA_OECONF = "--prefix=${datadir}/cfengine"
 
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
index 490f735fca..de20f585b0 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "911778ddb0a4e03a3ddfc8fc0f033136e1551849ea2dcbdb3f0f14359d
 
 inherit autotools-brokensep systemd
 
-export EXPLICIT_VERSION="${PV}"
+export EXPLICIT_VERSION = "${PV}"
 
 SYSTEMD_SERVICE:${PN} = "cfengine3.service cf-apache.service cf-hub.service cf-postgres.service \
                          cf-runalerts.service cf-execd.service \
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 5bfa311128..541a360765 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -29,7 +29,7 @@ EXTRA_OECMAKE = "-DLIB='${baselib}' \
 # ninja: error: build.ninja:282: bad $-escape (literal $ must be written as $$)
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-FILES:${PN} =+"${libdir}/cmpi/libpy3CmpiProvider.so ${PYTHON_SITEPACKAGES_DIR}/*"
+FILES:${PN} =+ "${libdir}/cmpi/libpy3CmpiProvider.so ${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dbg =+ "${libdir}/cmpi/.debug/libpyCmpiProvider.so"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index 49fbf40ab7..d665357702 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN}-dev = " \
     bash \
 "
 
-export GO111MODULE="on"
+export GO111MODULE = "on"
 
 inherit go systemd pkgconfig features_check
 
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
index ba897cc71f..7dcc36080a 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The haveged project is an attempt to provide an easy-to-use, unpr
 HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index 5a685fc74a..b98942379e 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -38,4 +38,4 @@ PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
 PACKAGECONFIG[smart] = "--with-smart,--without-smart,libatasmart"
 PACKAGECONFIG[smartmontools] = "--with-smartmontools,--without-smartmontools,json-glib,smartmontools"
 
-export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
+export GIR_EXTRA_LIBS_PATH = "${B}/src/utils/.libs"
diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
index 50a540e460..6633656cea 100644
--- a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
+++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
 SRC_URI = "git://github.com/FreeRADIUS/pam_radius.git;protocol=https;branch=master"
-SRCREV="b6442c3e0147f1019990520483fa3a30e4ccf059"
+SRCREV = "b6442c3e0147f1019990520483fa3a30e4ccf059"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
index 1bafad96b9..39b92e3f86 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
@@ -45,4 +45,4 @@ FILES:${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/* /usr/*/i
 FILES:${PN} += "/usr/etc"
 FILES:${PN} += "/usr/share"
 
-COMPATIBLE_HOST='(x86_64).*'
+COMPATIBLE_HOST = '(x86_64).*'
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 4aa3668e29..733cddc88b 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV
 
 SRC_URI[sha256sum] = "1b8f187583bc6c6b0a63aae0165ca37892a2a3bd4bb0682cd76b56268b42c3d6"
 
-UPSTREAM_CHECK_URI="https://sourceforge.net/projects/sblim/files/sblim-sfcc/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sblim/files/sblim-sfcc/"
 
 LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index e814120ee6..e9aa48da54 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sys
            file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
           "
 SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
-SRCREV_falco= "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
+SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
 SRCREV_FORMAT = "sysdig_falco"
 
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 2ddda142e9..71e2a60e0c 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV= "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
+SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
index c49859afc5..1f84c5e20a 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
@@ -18,8 +18,8 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OECONF += "--enable-largefile"
 
-export ac_cv_have_iconv_detect_h="yes"
-export ac_cv_sys_file_offset_bits="64"
+export ac_cv_have_iconv_detect_h = "yes"
+export ac_cv_sys_file_offset_bits = "64"
 
 do_configure:append () {
     cp ${UNPACKDIR}/iconv-detect.h ${S}
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
index ca737e48ba..9c83fa1b34 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
@@ -34,7 +34,7 @@ SRC_URI[xorg.sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd7
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
-XSERVER_SOURCE_DIR="${S}/unix/xserver"
+XSERVER_SOURCE_DIR = "${S}/unix/xserver"
 AUTOTOOLS_SCRIPT_PATH = "${XSERVER_SOURCE_DIR}"
 
 do_patch[postfuncs] += "do_patch_xserver"
diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb b/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
index ba1fbdbe0b..45defe82d6 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd34
 
 EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir} WITHOUT_RPATH_FIX=1"
 
-UPSTREAM_CHECK_URI="https://github.com/jordansissel/xdotool/tags"
+UPSTREAM_CHECK_URI = "https://github.com/jordansissel/xdotool/tags"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+\.\d{8}\.\d+)"
 
 do_install() {
diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
index 0c2749dbd4..39dcb28146 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
     elfutils \
     "
 
-DEPENDS:append:toolchain-clang:class-target ="\
+DEPENDS:append:toolchain-clang:class-target = "\
     openmp \
     "
 
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index f83b07dd9b..606df285ef 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -142,7 +142,7 @@ do_configure[dirs] = "${S}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_PACKAGE_DEBUG_SPLIT="1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 FILES:${PN} += "/usr/kernel-selftest"
 
 RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
index 88c70ae82a..037e30abc4 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 #   - CONFIG_FUNCTION_TRACER=y
 #   - CONFIG_FUNCTION_GRAPH_TRACER=y
 
-COMPATIBLE_HOST='(i.86|x86_64).*'
+COMPATIBLE_HOST = '(i.86|x86_64).*'
 EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${libdir} BASELIB=${baselib}"
 
 do_install() {
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
index bfdf26ed46..da92a80ce0 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
@@ -24,6 +24,6 @@ EXTRA_OEMESON = "-Db_lto=false"
 
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-export LINKFLAGS="${LDFLAGS}"
+export LINKFLAGS = "${LDFLAGS}"
 
 FILES:${PN} += "${datadir}/dbus-1/services"
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
index aaeaad1455..8fed859d64 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -1,4 +1,4 @@
-SUMMARY ="Reusable library for GPU-accelerated video/image rendering primitives"
+SUMMARY = "Reusable library for GPU-accelerated video/image rendering primitives"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index f6d6bebc5b..3d100b870c 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -1,4 +1,4 @@
-LICENSE= "MIT"
+LICENSE = "MIT"
 SUMMARY = "X Server Nokia 770 extensions library"
 SECTION = "x11/libs"
 DEPENDS = "virtual/libx11 libxext"
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 437e346fde..124db55d13 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -1,4 +1,4 @@
-LICENSE= "MIT"
+LICENSE =  "MIT"
 SUMMARY = "X Server Nokia 770 extensions library"
 SECTION = "x11/libs"
 DEPENDS = "virtual/libx11 libxext xpext"
diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
index 4bf62006f4..81fdf2a7fb 100644
--- a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -7,7 +7,7 @@ DEPENDS = "cups polkit glib-2.0"
 
 inherit meson pkgconfig gettext features_check
 
-REQUIRED_DISTRO_FEATURES ="polkit"
+REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = " \
     https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-${PV}.tar.xz \
diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
index 2437d3bd20..a82303d455 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
@@ -20,7 +20,7 @@ EXTRA_OECMAKE = ' \
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
-S="${WORKDIR}/git"
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= "gnutls"
 PACKAGECONFIG[gnutls] = "-DREQUIRE_CRYPTO_GNUTLS=ON,-DREQUIRE_CRYPTO_OPENSSL=ON"
diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.bb b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
index dd960856e0..c03dfc2f83 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF = " \
 "
 
 # Configure respects --bindir from EXTRA_OECONF, but then Src/Makefile will read bindir from environment
-export bindir="${base_bindir}"
+export bindir = "${base_bindir}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index e9f8464e0e..1826e91697 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -1,4 +1,4 @@
-DESCRIPTION="Anthy is a system for Japanese input method. It converts Hiragana text to Kana Kanji mixed text."
+DESCRIPTION = "Anthy is a system for Japanese input method. It converts Hiragana text to Kana Kanji mixed text."
 HOMEPAGE = "http://anthy.sourceforge.jp"
 
 LICENSE = "LGPL-2.1-only & GPL-2.0-only"
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
index 4085e61c3b..1444974b44 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-outside-tests.patch "
 
 # tag 2.10.19
-SRCREV= "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
+SRCREV = "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
index a9a867b575..15efc8cb00 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
 
 PACKAGES =+ "${PN}-bash-completion"
 FILES:${PN}-bash-completion += "${bindir}/gflags_completions.sh"
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 779bc1fd31..9932cf01db 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -18,7 +18,7 @@ SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-alternatives
-export ac_cv_sys_file_offset_bits="64"
+export ac_cv_sys_file_offset_bits = "64"
 
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --enable-largefile"
 
diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
index 422d96359c..d47bcc3a58 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
 "
 S = "${WORKDIR}/git"
 
-DEPENDS= "openssl lua libpcre2"
+DEPENDS = "openssl lua libpcre2"
 
 EXTRA_OEMAKE:append = " PREFIX=${prefix}"
 
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index 24dc5b2288..0284ad7e22 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -4,7 +4,7 @@ including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM= "\
+LIC_FILES_CHKSUM = "\
     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 "
diff --git a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
index a52ca25da4..5fe3006524 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Locking devices library"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM="file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 PE = "1"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz \
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 73cf9d0775..c7b0d0d56d 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -32,7 +32,7 @@ inherit systemd
 SYSTEMD_SERVICE:${PN} += "openct.service "
 SYSTEMD_AUTO_ENABLE = "enable"
 
-EXTRA_OECONF=" \
+EXTRA_OECONF = " \
     --disable-static \
     --enable-usb \
     --enable-pcsc \
diff --git a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
index f6f2a65752..ce8957714e 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
@@ -15,8 +15,8 @@ SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
             file://fix_parallel_make.patch \
            "
 
-export PCP_DIR="${RECIPE_SYSROOT_NATIVE}"
-#export PCP_RUN_DIR="${RECIPE_SYSROOT_NATIVE}"
+export PCP_DIR = "${RECIPE_SYSROOT_NATIVE}"
+#export PCP_RUN_DIR = "${RECIPE_SYSROOT_NATIVE}"
 EXTRA_OEMAKE = "CC="${CC}" LD="${LD}""
 inherit useradd systemd features_check python3targetconfig
 
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
index ac62863f5c..ba7bbc52ff 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
@@ -60,8 +60,8 @@ do_configure:append() {
     sed -i -e "/CONFIG_ARGS/s|${WORKDIR}|\$WORKDIR|g" ${B}/config.h
 }
 
-OE_LT_RPATH_ALLOW=":${libdir}/purple-2:"
-OE_LT_RPATH_ALLOW[export]="1"
+OE_LT_RPATH_ALLOW = ":${libdir}/purple-2:"
+OE_LT_RPATH_ALLOW[export] = "1"
 
 PACKAGES =+ "libpurple-dev libpurple finch finch-dev ${PN}-data"
 
diff --git a/meta-oe/recipes-support/psutils/psutils_2.10.bb b/meta-oe/recipes-support/psutils/psutils_2.10.bb
index 1f1894a5f2..14792acaa5 100644
--- a/meta-oe/recipes-support/psutils/psutils_2.10.bb
+++ b/meta-oe/recipes-support/psutils/psutils_2.10.bb
@@ -6,7 +6,7 @@ SRC_URI[sha256sum] = "6f8339fd5322df5c782bfb355d9f89e513353220fca0700a5a28775404
 
 inherit perlnative autotools
 
-export PERL="/usr/bin/env perl"
+export PERL = "/usr/bin/env perl"
 
 DEPENDS += "libpaper-native"
 
diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
index 62e7d58116..9d0b676386 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
@@ -44,7 +44,7 @@ do_configure:append() {
 
 RDEPENDS:${PN} = "bash"
 
-FILES:${PN}+= " \
+FILES:${PN} += " \
     ${datadir}/metainfo \
     ${datadir}/mime \
 "
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 3f87fb789f..1bded9f6d1 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "This is the set of GNU shar utilities."
 HOMEPAGE = "http://www.gnu.org/software/sharutils/"
 SECTION = "console/utils"
-LICENSE="GPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit gettext autotools update-alternatives
diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index 1e3d6beaf4..929721b27d 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "This package contains some simple command line tools to help using Linux spidev devices"
 HOMEPAGE = "https://github.com/cpb-/spi-tools"
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
 PV = "1.0.2"
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index 6a6c184e36..613a2199ca 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
            "
 SRC_URI[sha256sum] = "59daab29363d6e9f07c524029c4239653cfbbee6b0e57fd75df62499728dad8a"
 
-S ="${WORKDIR}/${BPN}.${PV}"
+S = "${WORKDIR}/${BPN}.${PV}"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index 61eeaaa095..80fbe537e5 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed
 inherit autotools
 
 # doc build: requires (native) xstlproc, fop, pdf2ps
-EXTRA_OECONF="--disable-build-docs \
+EXTRA_OECONF = "--disable-build-docs \
   --with-libxml-prefix=${STAGING_LIBDIR}/.. \
   --with-libxslt-prefix=${STAGING_LIBDIR}/.."
 
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index fc21e6192e..b108218297 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -63,7 +63,7 @@ do_install () {
         install -m 0755 $script ${D}${bindir}/${script_basename}
     done
 }
-RDEPENDS:${PN} +="bash"
+RDEPENDS:${PN} += "bash"
 
 # http://errors.yoctoproject.org/Errors/Details/186956/
 COMPATIBLE_HOST:libc-musl = 'null'
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
index ef76a37891..b2b0f7ae9e 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -24,8 +24,8 @@ B = "${S}/src/${GO_IMPORT}/bin"
 
 GO_EXTRA_LDFLAGS += ' -X ${GO_IMPORT}/prog.GitRevision=${SRCREV}'
 
-export GOHOSTFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
-export GOTARGETFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
+export GOHOSTFLAGS = "${GO_LINKSHARED} ${GOBUILDFLAGS}"
+export GOTARGETFLAGS = "${GO_LINKSHARED} ${GOBUILDFLAGS}"
 export TARGETOS = '${GOOS}'
 export TARGETARCH = '${GOARCH}'
 export TARGETVMARCH = '${GOARCH}'
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ee8f957cca..fca568ec80 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -111,7 +111,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-yappi \
 "
 
-PTESTS_PROBLEMS_META_PYTHON ="\
+PTESTS_PROBLEMS_META_PYTHON = "\
     python3-betamax \
     python3-dnspython \
     python3-fastjsonschema \
diff --git a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
index ff72f4c2f6..e605b459ce 100644
--- a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "6d4fe287766166a98ca7bc6f6312daf04a0481b1eda43e7173484051c0ab4366"
 
-PYPI_PACKAGE="colorclass"
+PYPI_PACKAGE = "colorclass"
 
 RDEPENDS:${PN} += "\
     python3-ctypes \
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index e64a62bd36..69cf86530a 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -36,7 +36,7 @@ export USE_X11
 KIVY_GRAPHICS = "gles"
 export KIVY_GRAPHICS
 
-KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
+KIVY_CROSS_SYSROOT = "${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT
 
 REQUIRED_DISTRO_FEATURES += "opengl gobject-introspection-data"
diff --git a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
index 3b54e36199..310366325e 100644
--- a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Pure-Python implementation of HSS/LMS Digital Signatures (RFC 8554)"
-HOMEPAGE ="https://pypi.org/project/pyhsslms"
+HOMEPAGE = "https://pypi.org/project/pyhsslms"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bbc59ef8bf238c2902ca816b87b58571"
 
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
index 02f1da8f59..4cbc4c06c4 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Bindings for the scrypt key derivation function library"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=05b5ac2824a7ae7489193b0f6a6f2cd1"
-HOMEPAGE="https://github.com/holgern/py-scrypt"
+HOMEPAGE = "https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
index b623673104..188dfd6efd 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
@@ -16,7 +16,7 @@ RDEPENDS:${PN} += "\
 
 PACKAGES =+ "${PN}-tests"
 RDEPENDS:${PN}-tests = "${PN} python3-unittest"
-FILES:${PN}-tests+= " \
+FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
 "

