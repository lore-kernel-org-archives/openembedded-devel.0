Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB27C18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15897.1740506966139563298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC70E1BCB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39FFB3F6A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/7] tigervnc: simplify xserver unpack and build
Date: Tue, 25 Feb 2025 18:09:12 +0000
Message-ID: <20250225180917.3232793-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225180917.3232793-1-ross.burton@arm.com>
References: <20250225180917.3232793-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115593

When unpacking, just use cp to hardlink the xserver source tree into the
tigervnc source tree.

When configuring, instead of replicating complicated logic, we can
simply set the variable AUTOTOOLS_SCRIPT_PATH and just call
autotools_do_configure.  Some of the options passed to the xserver
configure are obsolete so remove them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tigervnc/tigervnc_1.14.1.bb               | 59 +++----------------
 1 file changed, 8 insertions(+), 51 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb b/meta-=
oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
index 6e4d4a7b0c..ab9edd9ee0 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
@@ -33,32 +33,17 @@ SRC_URI[xorg.sha256sum] =3D "841c82901282902725762df0=
3adbbcd68153d4cdfb0d61df0cfd7
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
 XSERVER_SOURCE_DIR=3D"${S}/unix/xserver"
+AUTOTOOLS_SCRIPT_PATH =3D "${XSERVER_SOURCE_DIR}"
=20
 do_patch[postfuncs] +=3D "do_patch_xserver"
 do_patch_xserver () {
-    subdirs=3D"Xext xkb GL hw/xquartz/bundle hw/xfree86/common man doc"
-    for i in ${subdirs}; do
-        install -d ${XSERVER_SOURCE_DIR}/$i
-    done
-
-    sources=3D"hw/xquartz/bundle/cpprules.in man/Xserver.man doc/smartsc=
hed \
-             xserver.ent.in xkb/README.compiled \
-             hw/xfree86/xorgconf.cpp hw/xfree86/Xorg.sh.in"
-    for i in ${sources}; do
-        install -m 0644 ${XORG_S}/$i ${XSERVER_SOURCE_DIR}/$i;
-    done
-
-    cd ${XORG_S}
-    find . -type f | egrep '.*\.(c|h|am|ac|inc|m4|h.in|pc.in|man.pre|pl|=
txt)$' | \
-    xargs tar cf - | (cd ${XSERVER_SOURCE_DIR} && tar xf -)
-
-    cd ${XSERVER_SOURCE_DIR}
-    xserverpatch=3D"${S}/unix/xserver21.patch"
-    echo "Apply $xserverpatch"
-    patch -p1 -b --suffix .vnc < $xserverpatch
+    # Put the xserver source in the right place in the tigervnc source t=
ree
+    cp -rfl ${XORG_S}/* ${XSERVER_SOURCE_DIR}
+    # Apply the patch to integrate the vnc server
+    patch -p1 -b --suffix .vnc --directory ${XSERVER_SOURCE_DIR} <${S}/u=
nix/xserver21.patch
 }
=20
-EXTRA_OECONF =3D "--disable-xorg --disable-xnest --disable-xvfb --disabl=
e-dmx \
+EXTRA_OECONF =3D "--disable-xorg --disable-xnest --disable-xvfb \
         --disable-xwin --disable-xephyr --disable-kdrive --with-pic \
         --disable-static --disable-xinerama \
         --with-xkb-output=3D${localstatedir}/lib/xkb \
@@ -76,48 +61,20 @@ EXTRA_OECONF =3D "--disable-xorg --disable-xnest --di=
sable-xvfb --disable-dmx \
         --without-xmlto \
         --enable-systemd-logind=3Dno \
         --disable-xinerama \
-        --disable-xwayland \
 "
=20
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
-DCMAKE_INSTALL_UNITDIR=3D${systemd_system_unitdir}', '-DINSTALL_SYSTEMD_=
UNITS=3DOFF', d)}"
=20
 do_configure:append () {
-    olddir=3D`pwd`
-    cd ${XSERVER_SOURCE_DIR}
-
-    rm -rf aclocal-copy/
-    rm -f aclocal.m4
-
-    export ACLOCALDIR=3D"${XSERVER_SOURCE_DIR}/aclocal-copy"
-    mkdir -p ${ACLOCALDIR}/
-    if [ -d ${STAGING_DATADIR_NATIVE}/aclocal ]; then
-        cp-noerror ${STAGING_DATADIR_NATIVE}/aclocal/ ${ACLOCALDIR}/
-    fi
-    if [ -d ${STAGING_DATADIR}/aclocal -a "${STAGING_DATADIR_NATIVE}/acl=
ocal" !=3D "${STAGING_DATADIR}/aclocal" ]; then
-        cp-noerror ${STAGING_DATADIR}/aclocal/ ${ACLOCALDIR}/
-    fi
-    ACLOCAL=3D"aclocal --aclocal-path=3D${ACLOCALDIR}/" autoreconf -Wcro=
ss --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "a=
utoreconf execution failed."
-    chmod +x ./configure
-    ${CACHED_CONFIGUREVARS} ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
-    cd $olddir
+    autotools_do_configure
 }
=20
 do_compile:append () {
-    olddir=3D`pwd`
-    cd ${XSERVER_SOURCE_DIR}
-
     oe_runmake
-
-    cd $olddir
 }
=20
 do_install:append() {
-    olddir=3D`pwd`
-    cd ${XSERVER_SOURCE_DIR}/hw/vnc
-
-    oe_runmake 'DESTDIR=3D${D}' install
-
-    cd $olddir
+    oe_runmake -C ${B}/hw/vnc 'DESTDIR=3D${D}' install
 }
=20
 FILES:${PN} +=3D " \
--=20
2.43.0


