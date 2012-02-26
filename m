Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1mCt-00045I-OS
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 23:04:39 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so211326eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 13:56:16 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.20.145 as permitted sender) client-ip=10.213.20.145; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.20.145 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.20.145])
	by 10.213.20.145 with SMTP id f17mr3245877ebb.131.1330293376720
	(num_hops = 1); Sun, 26 Feb 2012 13:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3rXp0tbPAb3VUvEOv32b2edQmwvk4HGIbsq4rXLuds8=;
	b=V3yFiAWQk5TByflM8pu2l45iE+YG09atLXFpMGITG5ghDOzV0liHcmuxqs34Xc1nhP
	FIP8l3tk7aXm/ggAEE60xuuI6k+xtkAVluqLVOdktWlnFtUJUpo3gYqIIaj2vdCYc9i4
	CUi3/C1eDnuqp9BnN7s4l1FZ0tucKNpvdUVqc=
Received: by 10.213.20.145 with SMTP id f17mr2429718ebb.131.1330293376320;
	Sun, 26 Feb 2012 13:56:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm49961540eem.11.2012.02.26.13.56.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 13:56:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:56:00 +0100
Message-Id: <1330293360-14909-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <1330293360-14909-1-git-send-email-Martin.Jansa@gmail.com>
References: <1330293360-14909-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] Quoting fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 22:04:39 -0000

* We have various variables which are either not quoted at all or are
* half quoted. This patch fixes the bad exmaples so everything is consistent.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../uhd/uhd-firmware_003.003.001.bb                |    2 +-
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     |    2 +-
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |    2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb    |    2 +-
 meta-oe/recipes-devtools/vala/vala.inc             |    2 +-
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |    2 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    2 +-
 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb     |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.3.bb       |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
index 97dab1c..1d7817d 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
@@ -23,5 +23,5 @@ do_install() {
 }
 
 PACKAGES = "${PN}"
-FILES_${PN} = ${datadir}/uhd/images
+FILES_${PN} = "${datadir}/uhd/images"
 
diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index d6e3b03..76e2da4 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -5,7 +5,7 @@ LICENSE ="BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
                     file://jpeglib.h;endline=14;md5=7bb9a39828a1b1e84acd4e8aec1e5532 \
                     file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
-
+"
 PV = "8c+1.2.0"
 SRCREV = "733"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk"
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index c2c451b..82dd157 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -23,7 +23,7 @@ PR = "r45"
 # which will be next minor release and so on.
 
 BINV = "${PV}.4"
-SRCREV = 181733
+SRCREV = "181733"
 BRANCH = "gcc-4_5-branch"
 PR_append = "+svnr${SRCPV}"
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
index 9555c48..109bf82 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 PR = "r4"
 
 # ltrace is not ported to sh3/sh4 targets at this time
-COMPATIBLE_TARGET_SYS = (?!sh[34])
+COMPATIBLE_TARGET_SYS = "(?!sh[34])"
 
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
diff --git a/meta-oe/recipes-devtools/vala/vala.inc b/meta-oe/recipes-devtools/vala/vala.inc
index b63cdfa..0815c66 100644
--- a/meta-oe/recipes-devtools/vala/vala.inc
+++ b/meta-oe/recipes-devtools/vala/vala.inc
@@ -22,4 +22,4 @@ inherit autotools
 
 EXTRA_OECONF = "--disable-vapigen"
 
-FILES_${PN}-doc += ${datadir}/devhelp
+FILES_${PN}-doc += "${datadir}/devhelp"
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
index 66dac43..1a51e75 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -44,7 +44,7 @@ FILES_${PN}-mibs = "${datadir}/snmp/mibs"
 FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
-FILES_${PN}-dev += ${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}/mib2c-update"
+FILES_${PN}-dev += "${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}/mib2c-update"
 
 CONFFILES_${PN}-server = "${sysconfdir}/snmp/snmpd.conf \
                           ${sysconfdir}/snmp/snmptrapd.conf"
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 99edf21..98025d3 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
            file://gplv2-license.patch \
 "
-S = ${WORKDIR}
+S = "${WORKDIR}"
 
 inherit allarch
 
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb b/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
index 5229312..9656358 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
@@ -1,6 +1,6 @@
 require ${PN}_${PV}.inc
 
-DEPENDS += mysql5-native
+DEPENDS += "mysql5-native"
 
 SRC_URI[md5sum] = "32e7373c16271606007374396e6742ad"
 SRC_URI[sha256sum] = "2b0737b84e7b42c9e54c9658d23bfaee1189cd5955f26b10bdb862761d0f0432"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.3.bb b/meta-oe/recipes-support/opencv/opencv_2.3.bb
index 0716e0f..1a4bb4f 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.3.bb
@@ -65,7 +65,7 @@ FILES_${PN}-doc = "${datadir}/OpenCV/doc"
 
 ALLOW_EMPTY_${PN} = "1"
 
-INSANE_SKIP_python-opencv = True
+INSANE_SKIP_python-opencv = "True"
 DESCRIPTION_python-opencv = "Python bindings to opencv"
 FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core python-numpy"
-- 
1.7.8.4



