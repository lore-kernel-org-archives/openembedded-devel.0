Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE0C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:37:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42667.1789659454763488567
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=a9FFTkVs;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 989EE1476
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D985D3F7B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789659454; bh=QV/2+e7bH9TxV2hbUD742qMOe7/9Mnj5Da5S2F7Z23o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a9FFTkVsWuGPGiQSlLNYqUEee/EJ7m3axZccRap1pDXteRl/br0DwR2Kpv7dTE/VR
	 CwnHrAu0a7dCoUpDQyw4EEAIf11Cc5o3Irn19FrdSPaseTn365zQVmI2Z5p5pZmds+
	 3RFnW0oxIpxnUtiCB6zmLA/k6KQqnBmGh2I0FksI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 5/8] spice-gtk: clean up dependencies
Date: Thu, 17 Sep 2026 16:37:22 +0100
Message-ID: <20260917153727.3057505-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917153727.3057505-1-ross.burton@arm.com>
References: <20260917153727.3057505-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 15:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130102

Instead of a single huge list of DEPENDS, add a number of PACKAGECONFIGs
that reflect the upstream options available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/spice/spice-gtk_0.42.bb   | 44 +++++++------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index e8f9ddc5df8..dcfbc69e51b 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -14,35 +14,9 @@ SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spic=
e-gtk.git;protocol=3Dhttps;bra
=20
 CVE_STATUS[CVE-2012-4425] =3D "fixed-version: fixed since 0.15.3"
=20
-
-DEPENDS =3D " \
-	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland wayland-nat=
ive wayland-protocols', '', d)} \
-	acl \
-	cyrus-sasl \
-	gstreamer1.0 \
-	gstreamer1.0-plugins-base \
-	gtk+3 \
-	jpeg \
-	json-glib \
-	libcap-ng \
-	libepoxy \
-	libopus \
-	libusb1 \
-	libva \
-	lz4 \
-	pixman \
-	python3-pyparsing-native \
-	python3-six-native \
-	spice-protocol \
-	usbredir \
-	usbutils \
-	zlib \
-"
+DEPENDS =3D "python3-six-native python3-pyparsing-native spice-protocol =
glib-2.0 pixman openssl jpeg zlib json-glib libcap-ng gstreamer1.0 gstrea=
mer1.0-plugins-base"
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-RDEPENDS:${PN} =3D "python3-pyparsing python3-six hwdata"
-
 inherit meson pkgconfig vala gobject-introspection features_check gtk-do=
c
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
@@ -57,9 +31,19 @@ do_configure:prepend() {
 	echo ${PV} > ${S}/.tarball-version
 }
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)} smartcard"
-PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
+GTK_DEPS =3D "gtk+3 libepoxy libva ${@bb.utils.contains('DISTRO_FEATURES=
', 'wayland', 'wayland-native wayland-protocols wayland', '', d)}"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}=
 \
+                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi=
', '', d)} \
+				   gtk lz4 opus sasl smartcard usbredir"
+PACKAGECONFIG[gtk] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,${GTK_DEPS}"
+PACKAGECONFIG[lz4] =3D "-Dlz4=3Denabled,-Dlz4=3Ddisabled,lz4"
+PACKAGECONFIG[opus] =3D "-Dopus=3Denabled,-Dopus=3Ddisabled,libopus"
+PACKAGECONFIG[polkit] =3D "-Dpolkit=3Denabled,-Dpolkit=3Ddisabled,polkit=
 acl"
+PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
+PACKAGECONFIG[usbredir] =3D "-Dusbredir=3Denabled,-Dusbredir=3Ddisabled,=
usbredir libusb1"
+PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
 PACKAGECONFIG[webdav] =3D "-Dwebdav=3Denabled,-Dwebdav=3Ddisabled,phodav=
 libsoup"
=20
 EXTRA_OEMESON =3D "-Dpie=3Dtrue -Dusb-ids-path=3D${datadir}/hwdata/usb.i=
ds "
@@ -68,3 +52,5 @@ EXTRA_OEMESON:append:libc-musl =3D " -Dcoroutine=3Dlibu=
context"
 LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl=
,--undefined-version', '', d)}"
=20
 FILES:${PN} +=3D "${datadir}"
+
+RDEPENDS:${PN} =3D "hwdata"
--=20
2.43.0


