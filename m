Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D8CC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 07:07:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6309.1715152016795020280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 00:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wkw0Nki4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5858e9fd0b=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4484qdXs032647;
	Wed, 8 May 2024 00:06:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=uJiFkX9edncNtP50Z/hXpzm3s0hnK6kYLDIIxtMLPmY=; b=
	Wkw0Nki4aWMyRMZ3L8Jt46wUYysfCDlp0vJaszdReFhmmebYpYO26/kxgPfvxUhQ
	2fMrkxDDc5uBIejIYqm59qgXfK9NznNEwh32Xw0DL8QQe9suC6kV/dpCJWmbvuNL
	ecRVF6rSvRUadw1/vJcb3Z0X0muNpvDXnAcxSlHFz6eMP0oENx3HUccnE64KgqcY
	ha+KuutB9CKcDL2UPzKS4zi1zE8C7u5hLBPGnoFgUGzEdMt6kAiobHPi/UEt5xry
	TA9O/V+P+eh4q0JHiSxMrmlM1PNns2McL3om12Hri4T3JXBgGgpsmi7ZhWjJXRAR
	w1I1kdGI6J2rjR6rb5qUpA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xyse1ggxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 May 2024 00:06:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 00:06:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 8 May 2024 00:06:52 -0700
From: <kai.kang@windriver.com>
To: <peter.kjellerstedt@axis.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v3 1/1] apache2: fix multilib file conflicts
Date: Wed, 8 May 2024 15:06:49 +0800
Message-ID: <20240508070649.1657864-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <17CD719EC1248206.5708@lists.openembedded.org>
References: <17CD719EC1248206.5708@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3GMzu6A1uLNmaHm0tJS55O2QjxcpQ6kv
X-Proofpoint-ORIG-GUID: 3GMzu6A1uLNmaHm0tJS55O2QjxcpQ6kv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 07:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110274

From: Kai Kang <kai.kang@windriver.com>

There are file conflicts of apache2 when multilib enabled:

Error: Transaction test error:
  file /usr/share/apache2/build/config.nice conflicts between attempted
    installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
  file /usr/share/apache2/build/config_vars.mk conflicts between
    attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp

Install the 'build' directory to ${libexecdir} by setting
'installbuilddir' to fix the conflicts. ${libexecdir} is not populated
to sysroot by default, but command apxs requires these files, then add
the dir to SYSROOT_DIRS to populate them.

And inherit bbclasses multilib_script and multilib_header to fix follow
up conflicts:

  file /usr/bin/apxs conflicts between attempted installs of
    apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
  file /usr/include/apache2/ap_config_layout.h conflicts between
    attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp

Since multilib_script inherits update-alternatives, remove it from
inherit line for beautification.

Fix buildpaths warning as well:

  WARNING: lib32-apache2-2.4.58-r0 do_package_qa: QA Issue: File /usr/share/apache2/build/config.nice
           in package lib32-apache2-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.59.bb   | 37 ++++++++++++-------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index b96e8b4e1..59db22310 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e
 
 S = "${WORKDIR}/httpd-${PV}"
 
-inherit autotools update-rc.d pkgconfig systemd update-alternatives
+inherit autotools update-rc.d pkgconfig systemd multilib_script multilib_header
 
 DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
@@ -80,7 +80,9 @@ EXTRA_OECONF:class-native = "\
     "
 
 do_configure:prepend() {
-    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
+    sed -i -e 's#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#' \
+           -e 's#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#' \
+           ${S}/config.layout
 }
 
 do_install:append:class-target() {
@@ -119,14 +121,15 @@ do_install:append:class-target() {
            -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
            -e 's,${HOSTTOOLS_DIR}/,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
-           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
+           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${libexecdir}/${PN}/build/config_vars.mk
 
     sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,${DEBUG_PREFIX_MAP},,g' \
            -e 's,${RECIPE_SYSROOT},,g' \
            -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
-           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
+           -e 's,${WORKDIR}/recipe-sysroot/,,g' \
+           -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/build/config.nice
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
@@ -143,6 +146,8 @@ do_install:append:class-target() {
 
     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
     chown -R root:root ${D}
+
+    oe_multilib_header apache2/ap_config_layout.h
 }
 
 do_install:append:class-native() {
@@ -152,20 +157,22 @@ do_install:append:class-native() {
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " apache_sysroot_preprocess"
 
+SYSROOT_DIRS += "${libexecdir}/${PN}/build"
+
 apache_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
     install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}
     install -d ${SYSROOT_DESTDIR}${sbindir}
     install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
-    sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
-
-    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!\(my $installbuilddir = \)"\(.*\)"!\1"${STAGING_DIR_HOST}\2"!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+
+    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
 }
 
 # Implications - used by update-rc.d scripts
@@ -178,6 +185,8 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 ALTERNATIVE:${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apxs"
+
 PACKAGES = "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
 CONFFILES:${PN} = "${sysconfdir}/${BPN}/httpd.conf \
@@ -200,7 +209,7 @@ FILES:${PN}-utils = "${bindir}/ab \
 # We override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
 # and to get build, icons, error into the -dev package
-FILES:${PN}-dev = "${datadir}/${BPN}/build \
+FILES:${PN}-dev = "${libexecdir}/${PN}/build \
                    ${datadir}/${BPN}/icons \
                    ${datadir}/${BPN}/error \
                    ${includedir}/${BPN} \
-- 
2.34.1


