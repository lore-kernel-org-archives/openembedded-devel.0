Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 614696FF22
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 13:40:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m124so3081371wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 06:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aAR6YbVAZr/kouCGxz2Q9WyzE3aT6sUmh460do7A9z8=;
	b=ZiVawvd7jAEyA+B1nGgTkJ18/BgxMxjT869CUS2I+01qY5x2q2YUtB1ZKcPDmPFYJR
	5X9SHNLoPwt5O+Vsqgd8DQo1NA/Y9lFjn14QEQl6CuXpjymsREmTDoEXvzMYV6Wn4Jza
	/AQZEjEj0MoQIWKXI5EsIoP+XtkM7K2h+Zz2MExv4KQwL7TedBnWZK455hPTLliOgHhW
	2rHoCzXj7DRkyIo5INP21dDPkL8VlPknvl6FHzapKZauPP1MiSI6ElE7d/gNg4qsACgm
	b6XSDnvia1Wlo3nmcER4k2vRKbG6HC4R5TasfUJ20wKbzZwO3Bfw1itRnwsTWfjtWSEH
	9sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aAR6YbVAZr/kouCGxz2Q9WyzE3aT6sUmh460do7A9z8=;
	b=Ot+BX2QTaUw1MCipN4NmRuZSsLYwCZKfapy03rnge8BqRK0FEAEYOqjpDGZz3K2C0F
	aT/0N5buD47JdOJHqvzlcy0Pg1iB2zllex11inlFJSv5wpEVIvguVgOQ/Zzh0lj6eTXI
	9KqTbSTbBcoXJjBHrFzBFzqhjyyaTujqPS5kmJ6XDjDXMmwN7lzfzUd4cF7vJ4h87xIm
	Cg1P12R3mf2MvQbmK8qu2ikSpIOV6RxkkR8t1H2+fYDi1huf2vsHmLvP46xAZtjFRukE
	ax5H3xz/yUV65W9OybwX2kfJu7q38XxS+wH8TbviLiWGkKt2Lnb48B9K6q+c1k7Y7KWn
	+K4Q==
X-Gm-Message-State: ALyK8tLBKjozR7DA/AN/F8ytADtCUTjTxE993kr5j9dlb3TSZooFTpAcjR0nUESTumbZiw==
X-Received: by 10.28.94.194 with SMTP id s185mr5327011wmb.62.1465393248003;
	Wed, 08 Jun 2016 06:40:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r129sm2190405wmr.20.2016.06.08.06.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 06:40:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 15:39:38 +0200
Message-Id: <20160608133938.4309-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH] abiword, fbreader, tvheadend, glmark2, libqmi, modemmanager, thrift, wvdial, wvstreams, dt, collectd, gtkmathview, tcsh, glcompbench, geos, libspatialite, geis, grail, opencv, openwbem, fwts: blacklist, fails to build with gcc-6 or glibc-2.24
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
X-List-Received-Date: Wed, 08 Jun 2016 13:40:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb                | 2 ++
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb            | 3 +++
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb           | 3 +++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb                 | 3 +++
 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb             | 3 +++
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb | 2 ++
 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb              | 2 ++
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb               | 2 ++
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb           | 3 +++
 meta-oe/recipes-devtools/dt/dt_18.32.bb                          | 2 ++
 meta-oe/recipes-extended/collectd/collectd_5.5.0.bb              | 3 +++
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb         | 3 +++
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb                    | 3 +++
 meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb      | 3 +++
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb                    | 3 +++
 meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb  | 2 ++
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb      | 2 ++
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb      | 3 +++
 meta-oe/recipes-support/opencv/opencv_3.1.bb                     | 2 ++
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb               | 3 +++
 meta-oe/recipes-test/fwts/fwts_git.bb                            | 3 +++
 21 files changed, 55 insertions(+)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index e0888c1..b413722 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -122,3 +122,5 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
+
+PNBLACKLIST[abiword] ?= "Depends on broken gtkmathview"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index 1487f11..7a9de86 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -41,3 +41,6 @@ do_install() {
 
 SRC_URI[md5sum] = "da9ec4721efdb0ec0aaa182bff16ad82"
 SRC_URI[sha256sum] = "328aec454db80e225aa0b5c31adef74bf62a14357482947e87e9731686b3c624"
+
+# http://errors.yoctoproject.org/Errors/Details/68618/
+PNBLACKLIST[fbreader] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 65d43c6..2df8537 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 FILES_${PN} += "${datadir}/${BPN}"
+
+# http://errors.yoctoproject.org/Errors/Details/68628/
+PNBLACKLIST[tvheadend] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index e29921b..9c5ef18 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -50,3 +50,6 @@ python __anonymous() {
     if flavors:
         d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
 }
+
+# http://errors.yoctoproject.org/Errors/Details/68626/
+PNBLACKLIST[glmark2] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
index 7a15527..937fafc 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
@@ -14,3 +14,6 @@ inherit autotools pkgconfig
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "24c9eb300662ba6cff0152de89bd9ec0"
 SRC_URI[sha256sum] = "0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780"
+
+# http://errors.yoctoproject.org/Errors/Details/68616/
+PNBLACKLIST[libqmi] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index a173e69..00b85ff 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
+PNBLACKLIST[modemmanager] ?= "Depends on broken libqmi"
+
 PACKAGECONFIG ??= "mbim qmi polkit \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 "
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index b6b73ad..e1413b0 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -33,3 +33,5 @@ do_install_append () {
 	ln -sf thrift ${D}/${bindir}/thrift-compiler
 }
 
+# http://errors.yoctoproject.org/Errors/Details/68622/
+PNBLACKLIST[thrift] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index f7adf4c..65617fa 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -28,3 +28,5 @@ do_configure() {
 do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
+
+PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 6199a2f..8d86448 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -46,3 +46,6 @@ FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
 
 FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
 RDEPENDS_${PN} += "perl"
+
+# http://errors.yoctoproject.org/Errors/Details/68614/
+PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-devtools/dt/dt_18.32.bb b/meta-oe/recipes-devtools/dt/dt_18.32.bb
index 9688d02..d472fab 100644
--- a/meta-oe/recipes-devtools/dt/dt_18.32.bb
+++ b/meta-oe/recipes-devtools/dt/dt_18.32.bb
@@ -45,3 +45,5 @@ do_install() {
 }
 
 RDEPENDS_${PN} += "tcsh"
+
+PNBLACKLIST[dt] ?= "Rdepends on broken tcsh"
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index 6a3476f..b95f6e3 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -82,3 +82,6 @@ INITSCRIPT_PARAMS = "defaults"
 # threshold.so load.so are also provided by gegl
 # disk.so is also provided by libgphoto2-camlibs
 PRIVATE_LIBS = "threshold.so load.so disk.so"
+
+# http://errors.yoctoproject.org/Errors/Details/68629/
+PNBLACKLIST[collectd] ?= "BROKEN: fails to build with glibc-2.24"
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 3edbeed..9c6af16 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -21,3 +21,6 @@ do_configure_append() {
     # avoid host polution inf pkg-config files
     sed -i "s:${STAGING_DIR_HOST}::g" `find -name '*.pc'`
 }
+
+# http://errors.yoctoproject.org/Errors/Details/68615/
+PNBLACKLIST[gtkmathview] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
index 1dd4cb5..5a6f190 100644
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
@@ -47,3 +47,6 @@ pkg_postinst_${PN} () {
 #!/bin/sh -e
 echo /usr/bin/tcsh >> $D/etc/shells
 }
+
+# http://errors.yoctoproject.org/Errors/Details/68619/
+PNBLACKLIST[tcsh] ?= "BROKEN: fails to build with glibc-2.24"
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
index d0f4494..0c5d7b5 100644
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -14,3 +14,6 @@ SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b037
 inherit pkgconfig waf distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
+
+# http://errors.yoctoproject.org/Errors/Details/68631/
+PNBLACKLIST[glcompbench] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
index 3a9a028..a0c43f3 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
@@ -4,3 +4,6 @@ SRC_URI += "file://geos-config-Add-includedir-variable.patch"
 
 SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
 SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
+
+# http://errors.yoctoproject.org/Errors/Details/68613/
+PNBLACKLIST[geos] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
index d66dc87..fff195a 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
@@ -21,3 +21,5 @@ SRC_URI[md5sum] = "83305ed694a77152120d1f74c5151779"
 SRC_URI[sha256sum] = "9f138a6854740c7827fdee53845eb1485fce3e805a7aa9fc9151f8046ebd312d"
 
 SRC_URI += "file://geos-config.patch"
+
+PNBLACKLIST[libspatialite] ?= "Depends on broken geos"
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index bc88143..f7898ba 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -52,3 +52,5 @@ FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
 FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/site-packages/_*.la"
 
 FILES_${PN}-staticdev += "${libdir}/${PYTHON_DIR}/site-packages/_*.a"
+
+PNBLACKLIST[geis] ?= "Depends on broken grail"
diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
index 6ea10d6..6c8f295 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
@@ -21,3 +21,6 @@ PACKAGECONFIG[x11] = "--with-x11, --without-x11, libxi"
 
 PACKAGE_BEFORE_PN += "${PN}-test"
 FILES_${PN}-test = "${bindir}/grail-test*"
+
+# http://errors.yoctoproject.org/Errors/Details/68611/
+PNBLACKLIST[grail] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 36876da..c41baec 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -146,3 +146,5 @@ do_install_append() {
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
 
+# http://errors.yoctoproject.org/Errors/Details/68617/
+PNBLACKLIST[opencv] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
index ed8ef26..93cbdd7 100644
--- a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
+++ b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
@@ -110,3 +110,6 @@ FILES_${PN}-dev = " \
     ${includedir} \
     ${datadir}/aclocal/openwbem.m4 \
 "
+
+# http://errors.yoctoproject.org/Errors/Details/68630/
+PNBLACKLIST[openwbem] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index b943d6d..cad2ae0 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -22,3 +22,6 @@ FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
 FILES_${PN}-dbg += "${libdir}/fwts/.debug"
+
+# http://errors.yoctoproject.org/Errors/Details/68633/
+PNBLACKLIST[fwts] ?= "BROKEN: fails to build with gcc-6"
-- 
2.8.4


