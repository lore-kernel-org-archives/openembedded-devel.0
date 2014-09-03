Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 348E86A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 06:48:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s836mvmY022879
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Sep 2014 23:48:57 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 23:48:56 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Sep 2014 14:48:55 +0800
Message-ID: <1409726935-6212-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-virtualization][PATCH V2] lxc: fix RDEPENDS on bash
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
X-List-Received-Date: Wed, 03 Sep 2014 06:49:06 -0000
Content-Type: text/plain

Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
${datadir}/lxc/hooks/*

Bash scripts:
lxc/usr/share/lxc/hooks/mountcgroups:#!/bin/bash
lxc/usr/share/lxc/hooks/ubuntu-cloud-prep:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-debian:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-openmandriva:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-archlinux:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-centos:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-plamo:1:#!/bin/bash -eu
lxc/usr/share/lxc/templates/lxc-ubuntu-cloud:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-opensuse:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-gentoo:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-altlinux:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-sshd:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-ubuntu:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-cirros:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-busybox:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-fedora:1:#!/bin/bash

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 recipes-containers/lxc/lxc_1.0.5.bb |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
index bea1ad0..c0603ee 100644
--- a/recipes-containers/lxc/lxc_1.0.5.bb
+++ b/recipes-containers/lxc/lxc_1.0.5.bb
@@ -37,10 +37,11 @@ S = "${WORKDIR}/${BPN}-${PV}"
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
 EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "templates"
 PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 
 inherit autotools pkgconfig ptest
 
@@ -48,6 +49,9 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+PACKAGES =+ "${PN}-templates"
+FILES_${PN}-templates += "${datadir}/lxc/templates"
+RDEPENDS_${PN}-templates += "bash"
 
 PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
 
@@ -57,8 +61,11 @@ do_install_append() {
 	rm -rf ${D}${localstatedir}/cache
 	install -d ${D}${sysconfdir}/default/volatiles
 	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_lxc
+	    > ${D}${sysconfdir}/default/volatiles/99_lxc
 
+	# The checkbashisms shows there are no bashism, so use /bin/sh.
+	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
+	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
 }
 
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-- 
1.7.9.5


