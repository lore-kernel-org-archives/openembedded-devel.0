Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 589006D33E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 11:22:11 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so1318146ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 04:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mQWdRpdqYckb6LOpaPiV07UBUB90WRDZOu5TZmn1Iok=;
	b=P7+5flr0QxXWqtXk15NYXqK39cR9BJxu1z9GyIbCkqdgpLBjqn7MMqAlMck7XKWtBt
	KW2iaNu/mRlwfFA0rIH1NSq/HJbgf8DZs8PI069iKEo/T/H99ZUo2GfbejXeDtsJQhK7
	D9TM82LKWesREGYHEv7cOIfD10bDQB9yyTTvDKtEZnj3T39fXPKJRulzvH4n+19uzCoC
	8zVbtjpdvGgAwzuVdGe1e841S+mXGhMFGEIqW4yiMprYkiRH3hbRbQvCHNlvIYQ+DHGF
	6NSBG5p8l/cphgCj2r4LN2jzT24dzvmHpyQ2YDhefM86oUSuR6xNqG9u86Uw3L58giO7
	4UKQ==
X-Received: by 10.14.45.70 with SMTP id o46mr2505199eeb.19.1383218532881;
	Thu, 31 Oct 2013 04:22:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id s3sm7355788eeo.3.2013.10.31.04.22.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 04:22:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2013 12:22:09 +0100
Message-Id: <1383218529-12713-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1383218529-12713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383218529-12713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] recipes: Remove PR = r0 from all recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2013 11:22:11 -0000

* Remove all PR = "r0" from all .bb files in meta-oe repo. This was done
  with the command sed -e '/^PR.*=.*r0\"/d' meta*/recipes*/*/*.bb -i

* We've switching to the PR server, PR bumps are no longer needed and
  this saves people either accidentally bumping them or forgetting to
  remove the lines (r0 is the default anyway).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                       | 1 -
 meta-gpe/recipes-support/fbreader/fbreader_git.bb                        | 1 -
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb             | 1 -
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb            | 1 -
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb                 | 1 -
 meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb  | 1 -
 meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb        | 1 -
 meta-networking/recipes-support/aoetools/aoetools_34.bb                  | 1 -
 meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb           | 1 -
 meta-networking/recipes-support/netperf/netperf_2.6.0.bb                 | 1 -
 meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb                | 1 -
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb                      | 1 -
 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb                      | 1 -
 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb      | 1 -
 meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb                    | 1 -
 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb                         | 1 -
 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb | 1 -
 meta-oe/recipes-devtools/python/python-dateutil_1.5.bb                   | 1 -
 meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb              | 1 -
 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb               | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb           | 1 -
 meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb              | 1 -
 meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb                  | 1 -
 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb                      | 1 -
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb                        | 1 -
 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb                  | 1 -
 meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb                | 1 -
 meta-oe/recipes-support/ccid/ccid_1.4.8.bb                               | 1 -
 meta-oe/recipes-support/ckermit/ckermit_301.bb                           | 1 -
 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb                      | 1 -
 meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb                 | 1 -
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb                         | 1 -
 meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb                      | 1 -
 meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb            | 1 -
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb               | 1 -
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb               | 1 -
 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb  | 1 -
 meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb                     | 1 -
 meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb                        | 1 -
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb              | 1 -
 40 files changed, 40 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index 2307052..dcd9d0c 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -4,7 +4,6 @@ DEPENDS = "glib-2.0 dbus bluez4 libical"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
            file://ssize_t_definition.patch \
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
index ff0b5da..cb64e90 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_git.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f
 DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
 SRCREV = "2cf1ec0e306e1122dbed850bfa005cd59a6168ee"
 PV = "0.99.5+gitr${SRCPV}"
-PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
index aed9b90..134dd80 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
@@ -7,7 +7,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-PR = "r0"
 
 inherit klibc
 
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
index e3a3e4e..1a3c745 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae9e161311a5a0768c333b537a40e332"
 
 DEPENDS = "libcap"
 
-PR = "r0"
 
 SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.tar.gz \
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 9cb25f0..6978e06 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -11,7 +11,6 @@ LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
                     file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
 
-PR = "r0"
 
 SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.tar.bz2 \
            file://tftp-0.40-remap.patch \
diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
index 23babb0..907a3be 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
            libnetfilter-cthelper libnetfilter-queue"
 
-PR = "r0"
 
 SRC_URI = " \
     http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
index 036366a..9cb615b 100644
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
 SECTION = "devel/libs"
 LICENSE = "GPLv2+"
 
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
diff --git a/meta-networking/recipes-support/aoetools/aoetools_34.bb b/meta-networking/recipes-support/aoetools/aoetools_34.bb
index cf00298..1557de9 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_34.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_34.bb
@@ -9,7 +9,6 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RRECOMMENDS_${PN} = "kernel-module-aoe"
-PR = "r0"
 
 
 SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
index 8491dc0..b97e9d1 100644
--- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://www.alobbs.com/macchanger"
 LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r0"
 
 SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
 
diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index c206d56..45760ad 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "http://www.netperf.org/"
 LICENSE = "netperf"
 LICENSE_FLAGS = "non-commercial"
 
-PR = "r0"
 
 SRC_URI="ftp://ftp.netperf.org/netperf/netperf-${PV}.tar.bz2 \
          file://cpu_set.patch \
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
index c1cac1e..b993494 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
@@ -8,7 +8,6 @@ DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
 inherit update-rc.d
 INITSCRIPT_NAME = "hostapd"
 
-PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index 0302aad..f4ea800 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "\
     file://src/ptp.c;beginline=3;endline=22;md5=dafe6cfd1782f56471bb94ab06624c1f \
     file://examples/albums.c;beginline=5;endline=21;md5=84f4e55dfec49e898b7f68a828c15620 \
 "
-PR = "r0"
 
 DEPENDS += "libusb1"
 
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
index 1020fd2..7392b2a 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://README;md5=533bea47338d490e86744c6a0c5692e7"
 DEPENDS = "libpcap"
 # There are major API changes beween libnet v1.0 and libnet v1.1
 PROVIDES = "libnet-1.1"
-PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
            file://fix-endianess-test.patch"
diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
index 60a5425..c05595c 100644
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
@@ -3,7 +3,6 @@ DEPENDS = "ppp udev glib-2.0"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r0"
 
 inherit gnome gettext
 
diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
index 4f054d5..a973b9e 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "http://sourceforge.net/projects/ser2net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://INSTALL;md5=0659eb117294c490ae3853facd7a6ddd"
 
-PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "80011ac0e60bbdcb65f1d7a86251e3f3"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
index 8288dfb..78dfce6 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://fakeroot.alioth.debian.org"
 SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-PR = "r0"
 
 SRC_URI = "\
     ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
index c96723f..5baaecc 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
@@ -1,6 +1,5 @@
 require autoconf-archive.inc
 
-PR = "r0"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
index 6e10524..906fcd8 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
 SRCNAME = "${PN}"
-PR = "r0"
 
 SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
index 0d4c1e4..05479db 100644
--- a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
+++ b/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
@@ -3,4 +3,3 @@ inherit native pythonnative
 
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
-PR = "r0"
diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
index 09c9312..43b4b7e 100644
--- a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
+++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=baffc5e5f4804c92fc9be155fed70d41"
 RDEPENDS_${PN} += "python-numbers"
-PR = "r0"
 
 SRCNAME = "SQLAlchemy"
 SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 5e86180..4c11700 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "Inconsolata font - TTF Version"
 HOMEPAGE = "http://www.levien.com/type/myfonts/inconsolata.html"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://../OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed"
-PR = "r0"
 
 SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \
     file://OFL.txt"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
index 0397fb2..031cddf 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
@@ -1,6 +1,5 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- multitouch input driver"
-PR = "r0"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
index 5b0c740..bf7cdfb 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -7,7 +7,6 @@ SECTION = "libs"
 LICENSE = "LGPLv2 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r0"
 
 SRC_URI = "http://www.68k.org/~michael/audiofile/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
index 4a387b5..a0305fb 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
@@ -8,7 +8,6 @@ SECTION = "console/network"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
 
-PR = "r0"
 DEPENDS = "glib-2.0 dbus dbus-glib json-glib libsoup-2.4"
 
 inherit autotools pkgconfig gtk-doc
diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
index c31261a..c466a3d 100644
--- a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -7,7 +7,6 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "qt/app"
 
-PR = "r0"
 
 inherit qt4x11 pkgconfig
 
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
index 65a2731..2288c4f 100644
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f72405080
 
 SECTION = "qt/lib"
 
-PR = "r0"
 
 inherit qt4x11 pkgconfig
 
diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
index 617319a..201321f 100644
--- a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
+++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b866a28cda707ec714878bd933f46251"
 SECTION = "qt/libs"
 
-PR = "r0"
 
 # 1.2rc as version will sort lower then 1.2 when it's released
 REAL_PV = "1.2rc"
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
index 8576753..5524f9e 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Generic USB CCID smart card reader driver"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-PR = "r0"
 
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
diff --git a/meta-oe/recipes-support/ckermit/ckermit_301.bb b/meta-oe/recipes-support/ckermit/ckermit_301.bb
index c46369f..b255f5e 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_301.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_301.bb
@@ -8,7 +8,6 @@ SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
 SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
-PR = "r0"
 
 export CC2 = "${CC}"
 export BINDIR = "${bindir}"
diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
index 1dbac29..f82991b 100644
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Replacement syslog API"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
-PR = "r0"
 
 SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/3.2.2/source/${PN}_${PV}.tar.gz"
 
diff --git a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
index 97bc3ea..ce30bea 100644
--- a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
+++ b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
@@ -1,6 +1,5 @@
 require ${PN}.inc
 
-PR = "r0"
 
 SRC_URI[md5sum] = "4de79b323162a5a7652b65b608eca6cd"
 SRC_URI[sha256sum] = "4ab9944398ce769c0deeb64d2f73555c67bc25ccd2ade1ccf552226c7b2acf72"
diff --git a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
index 5626097..93a4f4e 100644
--- a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
+++ b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
@@ -7,7 +7,6 @@ LICENSE = "MPL-1.1"
 SECTION = "libs"
 DEPENDS = ""
 PROVIDES = "virtual/libiconv"
-PR = "r0"
 LIC_FILES_CHKSUM = "file://iconv.c;beginline=1;endline=6;md5=35af9d9924327fe8a0a1fe3a2cb454c8"
 SRC_URI = "http://mirror.meleeweb.net/pub/linux/gentoo/distfiles/mini-iconv.tar.bz2"
 SRC_URI[md5sum] = "84412221e26505a2b3855d4a1cdcd0e0"
diff --git a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
index 678f17c..1178e90 100644
--- a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
+++ b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "mysql5"
 
-PR = "r0"
 SRCNAME = "MySQL-python"
 
 SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip \
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
index a0dbef4..168395f 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
@@ -5,7 +5,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://gpio-s3c6410.c;endline=12;md5=060cda1be945ad9194593f11d56d55c7"
 SRCREV = "4949"
 PV = "1.0+svnr${SRCPV}"
-PR = "r0"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
 S = "${WORKDIR}/gpio"
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index ed87a14..5d89b64 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/network"
 SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
-PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
 S = "${WORKDIR}/git/tools/serial_forward"
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 240597c..9d7b990 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/devel"
 SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
-PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
 S = "${WORKDIR}/git/tools/serial_forward"
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index 06db8c4..c31eae1 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aa
 # start-stop-daemon is usually shipped by dpkg
 DEPENDS = "ncurses"
 RCONFLICS_${PN} = "dpkg" 
-PR = "r0"
 
 SRC_URI = "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
 SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
diff --git a/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
index 98c9c4a..9828d03 100644
--- a/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
+++ b/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
@@ -6,7 +6,6 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=c33cccf72cc1603e8a72a84811ae3ac8"
 
-PR = "r0"
 
 SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
            file://tcpreplay-3.4.4-cross-compile.patch \
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
index 3e9c982..e57783b 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
 
 DEPENDS = "modphp"
 
-PR = "r0"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
index 0ee6da3..8f03ddd 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
@@ -4,7 +4,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib"
 
-PR = "r0"
 
 inherit xfce-app
 
-- 
1.8.4.2


