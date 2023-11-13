Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0863C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 01:13:35 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.28062.1699838010262395138
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 17:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout11.t-online.de (Postfix) with SMTP id 8811F7303
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 02:13:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.200]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2LVw-25JNwY0; Mon, 13 Nov 2023 02:13:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] qpdf: cleanup
Date: Mon, 13 Nov 2023 02:13:36 +0100
Message-ID: <20231113011336.2843244-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113011336.2843244-1-f_l_k@t-online.de>
References: <20231113011336.2843244-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699838000-E4E0893F-D076667D/0/0 CLEAN NORMAL
X-TOI-MSGID: f41f8e69-5ee6-423d-a1ae-f130507dc184
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 01:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106622

- remove autotools remains
- select tls depending on packageconfig instead of doing autoselect
- preselect gnutls because thats the default if both gnutls/openssl are b=
uilt
- disable the internal tls fallback
- enable pkgconfig
- fix license, it was changed to Apache-2.0
- dont create an additional package just to rdepend on it afterwards
- dont build static lib
- fetch source from git

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb | 41 ++++++++------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_11.6.3.bb
index b56f8a822..ceb9f25ae 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
@@ -1,40 +1,31 @@
 DESCRIPTION =3D "PDF transformation/inspection software"
 HOMEPAGE =3D "http://qpdf.sourceforge.net"
-LICENSE =3D "Artistic-2.0"
-SECTION =3D "libs"
-DEPENDS =3D "libpcre zlib libjpeg-turbo openssl gnutls"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40=
264b7fe67acd90bc"
+DEPENDS =3D "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '=
gnutls', 'openssl', d)}"
=20
-LIC_FILES_CHKSUM =3D "file://Artistic-2.0;md5=3D7806296b9fae874361e6fb10=
072b7ee3"
+SRC_URI =3D "git://github.com/qpdf/qpdf.git;protocol=3Dhttps;branch=3Dma=
in"
+SRCREV =3D "81823f4032caefd1050bccb207d315839c1c48db"
=20
-inherit cmake gettext
+inherit cmake pkgconfig gettext
=20
-# disable random file detection for cross-compile
-EXTRA_OECONF =3D "--without-random \
-                --disable-static \
-                --disable-check-autofiles \
-                "
-
-EXTRA_OECMAKE =3D '-DRANDOM_DEVICE=3D"/dev/random"'
+EXTRA_OECMAKE =3D ' \
+	-DRANDOM_DEVICE=3D"/dev/random" \
+	-DBUILD_STATIC_LIBS=3DOFF \
+	-DALLOW_CRYPTO_NATIVE=3DOFF \
+	-DUSE_IMPLICIT_CRYPTO=3DOFF \
+'
=20
 LDFLAGS:append:mipsarch =3D " -latomic"
 LDFLAGS:append:riscv32 =3D " -latomic"
=20
-S=3D"${WORKDIR}/${BPN}-${PV}"
+S=3D"${WORKDIR}/git"
+
+PACKAGECONFIG ?=3D "gnutls"
+PACKAGECONFIG[gnutls] =3D "-DREQUIRE_CRYPTO_GNUTLS=3DON,-DREQUIRE_CRYPTO=
_OPENSSL=3DON"
=20
 do_install:append() {
     # Change the fully defined path on the target
     sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BP=
N}/libqpdfTargets.cmake
 }
-
-# avoid Makefile returning error on 'make clean' before configure was ru=
n
-CLEANBROKEN =3D "1"
-
-DEBIAN_NOAUTONAME:libqpdf =3D "1"
-
-PACKAGES =3D+ "libqpdf"
-FILES:libqpdf =3D "${libdir}/libqpdf.so.*"
-
-RDEPENDS:${PN} =3D "libqpdf"
--=20
2.42.0


