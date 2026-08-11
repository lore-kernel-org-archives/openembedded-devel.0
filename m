Return-Path: <james@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE624C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:25:41 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49097.1786433138408106375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=WuCZOpPJ;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1786433136;
	bh=KOumnjKXoynZn4VoTqfXsuP1KzmzVIN8/JV7Mb4NhDs=;
	h=From:To:Cc:Subject:Date;
	b=WuCZOpPJehul6m4bq2dkL5yncF8AjZe9p4Cb0Dh6rSRKAWZ28003uPizAAz/SWBjd
	 gI/cJJpCQezFBhDhIhU0km0Q2xT2w0Na87YMFsuC0hdH4nkbwowxnisiVdna6jtjS6
	 zrPHwZ+wqJGTqD0K+7hIlf1ZFgdqT1OgQ8S+TvFXJt85pSLBQB3wH1DkNdw/fZY05E
	 kz1f6Zj7yPh1oRbXvelyTsCRltNfFw4AbbHdEl6Obbb5INofvueujpCUftFymgJv1X
	 O//uaAypZcvsVvQ+QjtuPBKtw7VIRxOZW+miWU9CynexovNtwR5WOACFUiiqPo7cGt
	 j5ZLW1VXPsqxA==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 16CB067814; Tue, 11 Aug 2026 15:25:36 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [oe] [meta-networking] [PATCH v2 1/2] mctp: split mctp tools and mctpd into separate recipes
Date: Tue, 11 Aug 2026 15:25:22 +0800
Message-ID: <20260811072523.3463118-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 07:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128922

The current mctp recipe relies on the upstream's conditional build and
install of the mctpd binary if systemd is present, only building the
mctp utility otherwise. Future upstream changes allowing running as
non-root require more control over the build process. We will need to
add a new system user when mctpd is built.

Adding a user requires inheriting useradd, which assumes at least one
user will be created, failing the recipe otherwise. Building without
mctpd would then cause the recipe to fail as conditionally inheriting
useradd seems infeasible.

To make useradd available for the new upstream release, split the recipe
into "mctp" for the utilities and "mctpd" for the daemon, isolating the
systemd dependency to "mctpd".

This makes the two parts of the source explicitly selectable from user
choice, rather than auto-detecting based on the presence of systemd. It
will also let us express the useradd rules only when they're needed for
the mctpd installation in the upcoming version bump.

Signed-off-by: James Lee james@codeconstruct.com.au
---
 meta-networking/recipes-support/mctp/mctp.inc | 11 +++++
 .../recipes-support/mctp/mctp_2.5.bb          | 46 ++-----------------
 .../recipes-support/mctp/mctpd_2.5.bb         | 28 +++++++++++
 3 files changed, 42 insertions(+), 43 deletions(-)
 create mode 100644 meta-networking/recipes-support/mctp/mctp.inc
 create mode 100644 meta-networking/recipes-support/mctp/mctpd_2.5.bb

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
new file mode 100644
index 0000000000..98225cffea
--- /dev/null
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -0,0 +1,11 @@
+HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
+SECTION =3D "net"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
+
+SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
+SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dtests=3Dfalse"
diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.5.bb
index a8787d3f2b..5811495c66 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
@@ -1,45 +1,5 @@
-SUMMARY =3D "Management Component Control Protocol utilities"
-HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
-SECTION =3D "net"
-LICENSE =3D "GPL-2.0-only"
+require mctp.inc
=20
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
+SUMMARY =3D "Management Component Transport Protocol (MCTP) utilities"
=20
-SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
-
-SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
-
-
-inherit meson pkgconfig systemd
-
-EXTRA_OEMESON =3D " \
-    -Dtests=3Dfalse \
-"
-
-PACKAGECONFIG ??=3D " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-"
-
-# mctpd will only be built if pkg-config detects libsystemd; in which ca=
se
-# we'll want to declare the dep and install the service.
-PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
-SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
-SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
-
-do_install:append () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',=
 d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${S}/conf/mctpd.service \
-                ${D}${systemd_system_unitdir}/mctpd.service
-        install -m 0644 ${S}/conf/*.target \
-                ${D}${systemd_system_unitdir}/
-        install -d ${D}${datadir}/dbus-1/system.d
-        install -m 0644 ${S}/conf/mctpd-dbus.conf \
-                ${D}${datadir}/dbus-1/system.d/mctpd.conf
-    fi
-}
-
-FILES:${PN} +=3D " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
-            '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
-"
+MESON_TARGET =3D "mctp mctp-client"
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.5.bb
new file mode 100644
index 0000000000..f049be646b
--- /dev/null
+++ b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
@@ -0,0 +1,28 @@
+require mctp.inc
+
+SUMMARY =3D "Management Component Transport Protocol (MCTP) control prot=
ocol daemon"
+
+inherit systemd
+
+do_install:append () {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/conf/mctpd.service \
+            ${D}${systemd_system_unitdir}/mctpd.service
+    install -m 0644 ${S}/conf/*.target \
+            ${D}${systemd_system_unitdir}/
+    install -d ${D}${datadir}/dbus-1/system.d
+    install -m 0644 ${S}/conf/mctpd-dbus.conf \
+            ${D}${datadir}/dbus-1/system.d/mctpd.conf
+}
+
+SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
+
+DEPENDS +=3D "systemd"
+
+# Meson adds mctp utility binaries to FILES and do_install(), which cann=
ot be
+# overriden by MESON_TARGET. Override FILES and remove binaries to corre=
ct.
+FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf ${sbindir}/mctpd"
+
+do_install:append () {
+    rm -r ${D}${bindir}
+}
--=20
2.47.3


