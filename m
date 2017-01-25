Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 97AD56093C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 23:32:06 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id f144so61409078pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DwCWYWopZBCMLu61LRlgIe1HqHeDugyU/NnhypXC1SE=;
	b=bJFUiXzD4/pZVvyM/6dGa7ZAg6a/k6jsmELkm1DcXTl4nEwoYaWJZQdxr6HCGcfgkX
	QESwbMDdY0QpAgp/vD5xd99b49lL0CCibpm3qEDGsqOyPvT17iAZA6W8eGKCAIXWPKPY
	Bso+NdZmi2c4gXxQUzhS6VVvFinkjREU0Ob6BSDLBCHIqZfzqgSOQtrFwnVibDDqrjOI
	mXDy3AYF1/Ron13LCKE28+da1oOcR+81Urj3QIFsCxwfjwY74iejR9SIjTyfMB54/ora
	p7TUB0C3LTGkwblT3b7/jsD4KS0MZHMOvpi7Q0NVfT5RfrBIb7bGNq9p2pPd1jSItPPq
	Veyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DwCWYWopZBCMLu61LRlgIe1HqHeDugyU/NnhypXC1SE=;
	b=IlwVZx7Adc1fhQ+CiBb4ARvUNGAn1xzk6JSyA+BhZLlj/xg9YshcFVv0R9RG6a92Co
	Vw5+gPaxz9LoXihTxKc2/Esyl1xtwfHiPWkM7zdTHUbHzDaBBTcBwIADdDMWm0aYM7Lp
	WAYX7Nq1fMjDx0kj22kw3A4wEaHDBi8ZCUxNO6l5EHiB9XfUHoWaBAD1tiamyg9VNZpt
	3ni0uCLYtVwXqgMWpiiEXwYU+4zEu06L+3o5ya9l/Npnc5nVP+HqeXdj7oN56kTRRqPq
	6RPCVbiKbgM11haZTe5B0Sx4xvfyBJ5/XwVaHV0WKvMI7TF2mjlz88KXjQMeNacYe+6n
	mXDw==
X-Gm-Message-State: AIkVDXJ3zqbtvq9S325JGLBZapM13CqE9VCcq3d3xGYbfnfbWfK+59Nk//aSwh2YthiGmA==
X-Received: by 10.84.176.1 with SMTP id u1mr7293765plb.71.1485387126655;
	Wed, 25 Jan 2017 15:32:06 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id p1sm3568320pgc.29.2017.01.25.15.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 15:32:05 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 15:31:59 -0800
Message-Id: <1485387119-8583-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] remove some more True options to getVar calls
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
X-List-Received-Date: Wed, 25 Jan 2017 23:32:07 -0000

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls. Fix a small number of cases not addressed
by the original patch:

  http://git.openembedded.org/meta-openembedded/commit/?id=efd3696e70a6603f1a45faa4a172433514f0a487

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb           | 2 +-
 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb      | 2 +-
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb | 2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb           | 2 +-
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb          | 2 +-
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc         | 2 +-
 meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb              | 2 +-
 meta-oe/recipes-core/libxml/libxml++_2.38.1.bb              | 2 +-
 meta-oe/recipes-core/meta/distro-feed-configs.bb            | 4 ++--
 meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb            | 2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb            | 2 +-
 meta-oe/recipes-multimedia/live555/live555.inc              | 2 +-
 meta-oe/recipes-support/nano/nano.inc                       | 2 +-
 meta-oe/recipes-support/openldap/openldap_2.4.44.bb         | 2 +-
 meta-oe/recipes-support/vim/vim_8.0.0022.bb                 | 2 +-
 15 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index ec17c75..07b4831 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -22,7 +22,7 @@ SRC_URI[md5sum] = "f3f8052e7b4979a43b75775a381e6cb8"
 SRC_URI[sha256sum] = "e094f6fbf0afc5c5538b4894888e7c346f8ee8f49c9d24821dd696d0734865c6"
 
 #want 3.x from 3.x.y for the installation directory
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 inherit autotools-brokensep pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
index d391bba..7e684c8 100644
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
@@ -5,7 +5,7 @@ DEPENDS = "gtk+ gnome-doc-utils"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
index dfc1775..01da347 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -10,7 +10,7 @@ inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
 
 BPN = "gnome-menus"
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BPN}-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "6db025e79e2b69f39fc7aa0753f43081"
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index 1afcd49..f9af2ee 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome/libs"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_NAME = "ORBit2"
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = " \
     ${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
     file://configure-lossage.patch \
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index f6aaee0..622db5f 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -15,7 +15,7 @@ inherit autotools systemd
 # return something like '1.2.3' or '1.2.3/rc1'
 #
 def get_sub(d):
-    parts = d.getVar('PV',True).split('-')
+    parts = d.getVar('PV').split('-')
     try:
         return parts[0] + '/' + parts[1]
     except:
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 9ef54fe..424a06b 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
 #at least versions 2.15 and prior are moved to the archive folder on the server
-SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
+SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
index ebe7747..9479de9 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
 inherit autotools pkgconfig
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
index 70965f3..2cb9548 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 
-SHRT_VER = "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
     file://libxml++_ptest.patch \
     file://run-ptest \
diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index ea5ca38..2a8de54 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -22,8 +22,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 #def distro_feed_configs(d):
 #    import bb
-#    parchs = d.getVar( "PACKAGE_EXTRA_ARCHS", 1 ).split()
-#    march = d.getVar( "MACHINE_ARCH", 1 ).split()
+#    parchs = d.getVar("PACKAGE_EXTRA_ARCHS").split()
+#    march = d.getVar("MACHINE_ARCH").split()
 #    archs = [ "all" ] + parchs + march
 #    confs = [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in archs ]
 #    return " ".join( confs )
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb b/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
index 3fa9d9f..6386f1f 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
@@ -18,7 +18,7 @@ do_configure_prepend() {
     done
 }
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
 SRC_URI[md5sum] = "29ea6125e653d7e60b49a9a9544abc96"
 SRC_URI[sha256sum] = "4ad99ef937d071b4883c061df40bfe233f7649d50c354cf81235f180b4244399"
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
index 7ff7b20..02bb1cc 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "mm-common cairomm glibmm pango"
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
 SRC_URI[md5sum] = "874eadd9434613dbacf0272c82c3ac23"
diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 0d11de9..710dbde 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -9,7 +9,7 @@ SECTION = "devel"
 
 INC_PR = "r1"
 
-URLV = "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVar('PV',1)[6:8]}"
+URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 0f31c6c..9dc9cc9 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 INC_PR = "r3"
 
-PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+PV_MAJOR = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
 
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 645a517..e8e0c85 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c933fba6d89fda89f58df1e086e3f2e7 \
 "
 SECTION = "libs"
 
-LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
+LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-m4-pthread.patch \
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0022.bb b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
index 112ae80..126fe61 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0022.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
@@ -14,7 +14,7 @@ SRCREV = "ec68a99464055029c01082762517e97245ddae0c"
 
 S = "${WORKDIR}/git/src"
 
-VIMDIR = "vim${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
+VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
 inherit autotools update-alternatives
 inherit autotools-brokensep
-- 
1.9.1


