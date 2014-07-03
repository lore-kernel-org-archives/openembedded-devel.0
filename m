Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3EC65CC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 02:26:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s632Q2kX029733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 19:26:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 19:26:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:25:58 -0700
Message-ID: <1404354360-978-7-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
References: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 6/8] meta-oe: use BPN in SRC_URI
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
X-List-Received-Date: Thu, 03 Jul 2014 02:26:01 -0000
Content-Type: text/plain

Fixed SRC_URI:
* ${PN} -> ${BPN}, use ${BP} if it was ${PN}-${PV}
* ${P} -> ${BP}

Otherwise we would meet do_fetch errors when we do the multilib, native
or nativesdk build.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/classes/gpe.bbclass                        |    2 +-
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |    2 +-
 .../nbench-byte/nbench-byte_2.2.3.bb               |    2 +-
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |    2 +-
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |    2 +-
 meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb   |    2 +-
 .../libtorrent/libtorrent_0.13.3.bb                |    2 +-
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |    2 +-
 .../rtorrent/rtorrent_0.9.3.bb                     |    2 +-
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |    2 +-
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |    2 +-
 meta-oe/recipes-devtools/geany/geany_1.23.bb       |    2 +-
 meta-oe/recipes-devtools/python/pyrtm_0.2.bb       |    2 +-
 .../recipes-devtools/python/python-dateutil_1.5.bb |    2 +-
 .../recipes-devtools/python/python-ldap_2.3.9.bb   |    2 +-
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |    2 +-
 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb  |    2 +-
 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |    2 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |    2 +-
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb      |    2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |    2 +-
 .../mml-widget/gtkmathview_0.8.0.bb                |    2 +-
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |    2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |    2 +-
 meta-oe/recipes-graphics/babl/babl_0.1.10.bb       |    2 +-
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb      |    2 +-
 meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb        |    2 +-
 meta-oe/recipes-graphics/libsexy/libsexy.inc       |    2 +-
 .../recipes-graphics/nonworking/slim/slim_1.3.2.bb |    2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_303.bb     |    2 +-
 .../xorg-data/xorg-data-common.inc                 |    2 +-
 .../audiofile/audiofile_0.2.7.bb                   |    2 +-
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb      |    2 +-
 meta-oe/recipes-multimedia/libass/libass.inc       |    2 +-
 meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb |    2 +-
 .../nonworking/minidlna/minidlna_1.0.25.bb         |    2 +-
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |    2 +-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |    2 +-
 .../foxtrotgps/foxtrotgps_1.1.1.bb                 |    2 +-
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb     |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |    2 +-
 meta-oe/recipes-support/asio/asio.inc              |    2 +-
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    2 +-
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |    2 +-
 meta-oe/recipes-support/libol/libol_0.3.18.bb      |    2 +-
 meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb     |    2 +-
 .../nonworking/syslog-ng/syslog-ng.inc             |    2 +-
 .../recipes-support/openldap/openldap_2.4.23.bb    |    2 +-
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb  |    2 +-
 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb     |    2 +-
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb |    2 +-
 .../recipes-support/poppler/poppler-data_0.4.6.bb  |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.22.4.bb  |    2 +-
 meta-oe/recipes-support/rng-tools/rng-tools_4.bb   |    2 +-
 meta-oe/recipes-support/zile/zile_2.4.9.bb         |    2 +-
 56 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta-oe/classes/gpe.bbclass b/meta-oe/classes/gpe.bbclass
index 2adbd48..9fc1365 100644
--- a/meta-oe/classes/gpe.bbclass
+++ b/meta-oe/classes/gpe.bbclass
@@ -1,6 +1,6 @@
 DEPENDS_prepend = "virtual/libintl intltool-native "
 GPE_TARBALL_SUFFIX ?= "gz"
-SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.${GPE_TARBALL_SUFFIX}"
+SRC_URI = "${GPE_MIRROR}/${BP}.tar.${GPE_TARBALL_SUFFIX}"
 FILES_${PN} += "${datadir}/gpe ${datadir}/application-registry"
 SECTION ?= "gpe"
 
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
index a207716..1bd554b 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
-SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${PN}-${PV}.tar.gz \
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
             file://iperf-2.0.5_ManPage.patch \
           "
 
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index addb2d2..a98d507 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -6,7 +6,7 @@ LICENSE = "freely distributable"
 LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
 SECTION = "console/utils"
 
-SRC_URI = "http://www.tux.org/~mayer/linux/${PN}-${PV}.tar.gz \
+SRC_URI = "http://www.tux.org/~mayer/linux/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index af6c53c..3267de2 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 PR = "r1"
 
 SRC_URI = "\
-    http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${P}.tar.gz \
+    http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${BP}.tar.gz \
     file://tiobench-makefile.patch \
     file://avoid-glibc-clashes.patch \
 "
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index 714aa50..d123d38 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 HOMEPAGE = "http://www.gammu.org/"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.bz2 \
     file://gammurc \
     file://gammu-smsdrc \
 "
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
index 6d39a0a..49b8917 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
@@ -10,7 +10,7 @@ inherit autotools binconfig perlnative
 PNBLACKLIST[krb5] = "BROKEN: doesn't build with B!=S"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${SHRT_VER}/${P}-signed.tar \
+SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar \
            file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
 "
 SRC_URI[md5sum] = "56f0ae274b285320b8a597cb89442449"
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
index 124b8ca..4af3a6a 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libsigc++-2.0 openssl cppunit"
 
-SRC_URI = "http://libtorrent.rakshasa.no/downloads/${PN}-${PV}.tar.gz \
+SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
     file://don-t-run-code-while-configuring-package.patch \
 "
 
diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index 62634c2..a9f523c 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
 PR = "r1"
 
-SRC_URI = "http://wireless.kernel.org/download/${PN}/${P}.tar.bz2 \
+SRC_URI = "http://wireless.kernel.org/download/${BPN}/${BP}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
            file://dont.call.git.rev-parse.on.parent.dir.patch"
 
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
index d1b64fb..3addf92 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libsigc++-2.0 curl cppunit libtorrent"
 
-SRC_URI = "http://libtorrent.rakshasa.no/downloads/${PN}-${PV}.tar.gz \
+SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
     file://don-t-run-code-while-configuring-package.patch \
 "
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index af1ebf3..f7adf4c 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "wvstreams"
 RDEPENDS_${PN} = "ppp"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.bz2 \
+SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.bz2 \
            file://typo_pon.wvdial.1.patch \
           "
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 00df2b8..bb4d72c 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "zlib openssl (>= 0.9.8)"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz \
+SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://04_signed_request.diff \
            file://05_gcc.diff \
            file://06_gcc-4.7.diff \
diff --git a/meta-oe/recipes-devtools/geany/geany_1.23.bb b/meta-oe/recipes-devtools/geany/geany_1.23.bb
index 4e0d4bf..593ba66 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.23.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.23.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+"
 inherit autotools pkgconfig perlnative
 
 SRC_URI = " \
-    http://download.geany.org/${PN}-${PV}.tar.bz2 \
+    http://download.geany.org/${BP}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
 SRC_URI[md5sum] = "4290e8c32305e916f57bb0f0233bbec2"
diff --git a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb b/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
index ee7b6d0..706515b 100644
--- a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
+++ b/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
@@ -7,6 +7,6 @@ DEPENDS = "python-native"
 
 inherit distutils
 
-SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${P}.tar.gz"
+SRC_URI = "http://pypi.python.org/packages/source/p/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "34423f39caf7df8a9db8e243be9cf1a0"
 SRC_URI[sha256sum] = "d9d46d096a38cb692b55f4ee9f364d54348298e9497b11c1ef057539b5de1567"
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
index 784f560..37f19a8 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://labix.org/python-dateutil"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
-SRCNAME = "${PN}"
+SRCNAME = "${BPN}"
 
 SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
index dfe1522..bc4993b 100644
--- a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
+++ b/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
 HOMEPAGE = "http://www.python-ldap.org/" 
 DEPENDS = "python openldap" 
 
-SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${PN}-${PV}.tar.gz \ 
+SRC_URI = "http://pypi.python.org/packages/source/p/${BPN}/${BP}.tar.gz \
            file://setup.cfg.patch"
 SRC_URI[md5sum] = "a9f9f16338288d118a1ae6266c993247"
 SRC_URI[sha256sum] = "62f75b21c5ee744408c9d8b59878328b3bdf47899d30e8abf0c09b3ffb893ed4"
diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
index 50202c1..a36c250 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://main_common.cc;beginline=5;endline=16;md5=b5a59150a33658cc1ffc31b1a4ffb9f2"
 
-SRC_URI = "${GNU_MIRROR}/${PN}/${P}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "57b67407e882c6418531d48a2f20d16b"
 SRC_URI[sha256sum] = "76b3f2e5fb0306d24f2632c3e168cccb73dc0a348e3a7089cd9230748ff23de6"
 
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
index 8a5bca9..3f694a0 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
@@ -1,6 +1,6 @@
 require gnuplot.inc
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${PN}-${PV}.tar.gz;name=archive \
+SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
     http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
     file://subdirs.patch \
     file://lua-loadlibs-configure-in-fix.patch \
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
index d0658db..afc947f 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
@@ -6,7 +6,7 @@ DEPENDS = "ncurses"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://rigaux.org/${PN}-${PV}.src.tgz \
+SRC_URI = "http://rigaux.org/${BP}.src.tgz \
     file://0001-don-t-strip-when-installing.patch "
 
 SRC_URI[md5sum] = "a5af1378d028512a9cad27a5ba3e15f9"
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 655f907..f597a4f 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=442bb3cbbeeb60643a87325718b8a8ee"
 
 PR = "r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://setup-add-sleep-after-cups-reset.patch \
            file://fix-libusb-paths.patch \
            file://cups-1.6.patch \
diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
index 14d2ee5..111b072 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
@@ -9,7 +9,7 @@ PR = "r1"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI = "http://guichaz.free.fr/iotop/files/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://guichaz.free.fr/iotop/files/${BP}.tar.bz2"
 SRC_URI[md5sum] = "cdd38b276cbf238676f5d2bcf098ba9c"
 SRC_URI[sha256sum] = "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d686483df0b0"
 
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
index 91329d8..d7e333a 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README;beginline=60;md5=637e042cdd3671ba00e78b58ede45d3b"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lcdproc/${P}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcdproc/${BP}.tar.gz"
 
 inherit autotools update-rc.d
 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 95deb37..90d54cd 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 PR = "r3"
 
-SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
+SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${BP}.tar.gz \
            file://mathview-gcc43x.diff \
            file://mathview-gcc47x.diff \
            file://qualify-lookup.diff \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 1af1fa6..eadec11 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = " \
-    http://ftp.mozilla.org/pub/mozilla.org/js/${PN}${PV}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
     file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
 "
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index 298cfa5..1148aeb 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=8685b4455330a940fab
 
 DEPENDS = "ncurses libevent sed-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${BP}.tar.gz"
 SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
 SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
 
diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
index 702419d..7901fa5 100644
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://gtkextra.sourceforge.net/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gtkextra/${P}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/gtkextra/${BP}.tar.gz \
            file://remove-tutorial.patch \
 "
 
diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
index 3fc4c44..4892021 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 inherit gnomebase
 
-SRC_URI = "http://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
 SRC_URI[md5sum] = "9e1542ab5c0b12ea3af076a9a2f02d79"
 SRC_URI[sha256sum] = "943fc36ceac7dd25bc928256bc7b535a42989c6b971578146869eee5fe5955f4"
 
diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
index 48edc2c..725707c 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
 SECTION = "console/utils"
 DEPENDS = "libpng zlib"
-SRC_URI = "http://fbgrab.monells.se/${P}.tar.gz"
+SRC_URI = "http://fbgrab.monells.se/${BP}.tar.gz"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
index bd40946..849fe9f 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
 PACKAGECONFIG[avformat] = "--with-libavformat,--without-libavformat,libav"
 
-SRC_URI = "http://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.2/${BP}.tar.bz2"
 SRC_URI[md5sum] = "32b00002f1f1e316115c4ed922e1dec8"
 SRC_URI[sha256sum] = "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9b1d9a6480dd8d426"
 
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy.inc b/meta-oe/recipes-graphics/libsexy/libsexy.inc
index 49c46cd..5a11ca0 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy.inc
+++ b/meta-oe/recipes-graphics/libsexy/libsexy.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "gtk+ enchant libxml2"
 
-SRC_URI = "http://releases.chipx86.com/libsexy/${PN}/${PN}-${PV}.tar.gz \
+SRC_URI = "http://releases.chipx86.com/libsexy/${BPN}/${BP}.tar.gz \
            file://libsexy-pkgconfig-fixes.patch"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
index 57b47f6..5519b0e 100644
--- a/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
+++ b/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
@@ -8,7 +8,7 @@ PR = "r1"
 DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = " \
-    http://download.berlios.de/${PN}/${P}.tar.gz \
+    http://download.berlios.de/${BPN}/${BP}.tar.gz \
     file://0002-Fix-image-handling-integer-overflows.patch \
     file://0003-Fix-build-failure-with-ld-as-needed.patch \
     file://0004-Add-support-libpng15.patch \
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
index 52e77b7..61890ab 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
@@ -4,7 +4,7 @@ DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=540cf18ccc16bc3c5fea40d2ab5d8d51"
 
-SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
+SRC_URI = "ftp://invisible-island.net/xterm/${BP}.tgz"
 
 SRC_URI[md5sum] = "48f6d49b2b6b6933d501d767cbed9254"
 SRC_URI[sha256sum] = "8af29987bda9b77205ebf6233aaa5c347e5f2407310b62ac9ba92a658257f058"
diff --git a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
index e128763..1bcfd5a 100644
--- a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
+++ b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
@@ -4,7 +4,7 @@ LICENSE = "MIT-X"
 
 XORG_PN = "${PN}"
 
-SRC_URI = "${XORG_MIRROR}/individual/data/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/data/${BP}.tar.bz2"
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
index bf7cdfb..ecfc988 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://www.68k.org/~michael/audiofile/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.68k.org/~michael/audiofile/${BP}.tar.gz"
 SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
 SRC_URI[sha256sum] = "a61c4036c2600a645843f16bec4be166093a9df5f15b02c85291213aa9cf15a2"
 
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
index 3723f8d..63e590c 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -8,7 +8,7 @@ PR = "r1"
 
 inherit autotools
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${PN}-${PV}.tar.bz2;name=faad2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${BP}.tar.bz2;name=faad2 \
 "
 
 SRC_URI[faad2.md5sum] = "4c332fa23febc0e4648064685a3d4332"
diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index 64405ff..328cd14 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -9,7 +9,7 @@ DEPENDS = "enca fontconfig freetype libpng fribidi"
 
 INC_PR = "r1"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
+SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
 
 inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
index 64f3e5d..8cf393d 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "${GNU_MIRROR}/${PN}/${P}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "1c29b18e01ab2b966162bc727bf3c360"
 SRC_URI[sha256sum] = "1acb3de8e0927906ade7a34c5853173d3068b87b02dfba80d0bf11e47f0b5d39"
 
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
index 7ceab7b..9264bc2 100644
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
+++ b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1a795ac1a06805cf8fd74920bc46b5c"
 
 DEPENDS = "flac libav jpeg sqlite3 libexif libogg libid3tag"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}_${PV}_src.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \
     file://search-for-headers-in-staging-dir.patch \
     file://fix-makefile.patch \
 "
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index 4a1379d..e05ac5e 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -5,7 +5,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=db043791349ba57ad1169e1c92477cb6"
 
-SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${PN}/${PN}_${PV}.tar.gz \
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${BPN}/${BPN}_${PV}.tar.gz \
            file://auxdir.patch;striplevel=0"
 S = "${WORKDIR}/xpext-1.0"
 
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 22d92ca..968d342 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -3,7 +3,7 @@ SUMMARY = "X Server Nokia 770 extensions library"
 SECTION = "x11/libs"
 DEPENDS = "virtual/libx11 libxext xpext"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2bda168c508c7cd8afa567b2fcc549"
-SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${PN}_${PV}.tar.gz \
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${BPN}_${PV}.tar.gz \
            file://xsp-fix-pc.patch"
 S = "${WORKDIR}/Xsp"
 
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 7ed3bf2..2050dd0 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4"
 
-SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
+SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
 SRC_URI[sha256sum] = "ae9706285510554cc0813ac92522e0d1672b0ddb065307bfacfcff3c328f6adb"
 
diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 4fa6de1..6a6e62f 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
 
 DEPENDS = "proj sqlite3 tiff"
 
-SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
+SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
 SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index c82aadc..8c6a6f7 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -9,7 +9,7 @@ EXTRANATIVEPATH += "chrpath-native"
 
 PR = "r14"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/${PN}/${P}.tar.gz \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
     file://0004-SConstruct-remove-rpath.patch \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
diff --git a/meta-oe/recipes-support/asio/asio.inc b/meta-oe/recipes-support/asio/asio.inc
index c2a6b1b..9cea824 100644
--- a/meta-oe/recipes-support/asio/asio.inc
+++ b/meta-oe/recipes-support/asio/asio.inc
@@ -8,7 +8,7 @@ LICENSE = "BSL-1.0"
 
 DEPENDS = "boost"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${PN}-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index a1029b3..beb6108 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
 HOMEPAGE = "http://farsight.sf.net"
-SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
+SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BP}.tar.gz"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
index c7de2f4..6d2abf7 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "gnutls"
 
 PR = "r1"
 
-SRC_URI = "http://iksemel.googlecode.com/files/${P}.tar.gz;name=archive \
+SRC_URI = "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=archive \
            file://r25.diff"
 SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
 SRC_URI[archive.sha256sum] = "458c1b8fb3349076a6cecf26c29db1d561315d84e16bfcfba419f327f502e244"
diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index 60e2205..d2d7c26 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "http://www.balabit.com/downloads/files/libol/0.3/${P}.tar.gz"
+SRC_URI = "http://www.balabit.com/downloads/files/libol/0.3/${BP}.tar.gz"
 SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
 SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
 
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
index b21d9db..2b036f9 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
@@ -3,7 +3,7 @@ SUMMARY = "A Library to Access SMI MIB Information"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
 
-SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/${P}.tar.gz"
+SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "760b6b1070738158708649ed2c63425e"
 SRC_URI[sha256sum] = "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaaa87c462f49d74849"
diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
index 8484658..e0c9055 100644
--- a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
@@ -11,7 +11,7 @@ INC_PR = "r12"
 
 inherit autotools systemd
 
-SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${BPN}_${PV}.tar.gz"
 
 noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
 
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 306a786..b2693b5 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 
 LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
-SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz \
+SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-m4-pthread.patch \
     file://kill-icu.patch \
     file://0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch \
diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
index 67c2c00..e0ebe7d 100644
--- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
+++ b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
@@ -6,7 +6,7 @@ inherit autotools gettext pkgconfig
 
 DEPENDS = "libtasn1 libffi"
 
-SRC_URI = "http://p11-glue.freedesktop.org/releases/${PN}-${PV}.tar.gz"
+SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
 SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
 
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
index 7396efd..a312841 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
 DEPENDS = "libgcrypt libgpg-error"
 
-SRC_URI = "http://www.cypherpunks.ca/otr/${P}.tar.gz \
+SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://fix_qa-issue_include.patch \
 "
 
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
index cf3c680..94ab363 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
 DEPENDS = "libgcrypt libotr pidgin"
 
-SRC_URI = "http://www.cypherpunks.ca/otr/${P}.tar.gz \
+SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://ignore_extra-portability_warnings.patch \
 "
 
diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
index 644e318..014ba7c 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
 
 inherit allarch
 
-SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
+SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz"
 SRC_URI[md5sum] = "a8a7ca808827dd674faba6e4fc73b471"
 SRC_URI[sha256sum] = "f306901dfa5bda90cd6663d4eedb1c773c3c709de78018c79f1282b2c8f90afa"
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
index 7aa0dfc..e14a442 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = " \
-    http://poppler.freedesktop.org/${PN}-${PV}.tar.gz \
+    http://poppler.freedesktop.org/${BP}.tar.gz \
 "
 SRC_URI[md5sum] = "49d55921ce795778c7231fe9f2fe923b"
 SRC_URI[sha256sum] = "4f438f34e63265e2da8427f3423f940ff41c26088922a9f5d976f795c1dce13b"
diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
index f620d8a..f10fad1 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS_append_libc-uclibc = " argp-standalone"
 
-SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \
+SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
            file://init \
            file://default"
 
diff --git a/meta-oe/recipes-support/zile/zile_2.4.9.bb b/meta-oe/recipes-support/zile/zile_2.4.9.bb
index 0421ff7..dea9f6c 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.9.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.9.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses libgc"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://ftp.gnu.org/gnu/zile/${P}.tar.gz \
+SRC_URI = "http://ftp.gnu.org/gnu/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-- 
1.7.9.5


