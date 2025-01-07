Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA398E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 17:13:19 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.26136.1736269994513418847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 09:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id BD9DB139C
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:13:09 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.46.246]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVD8d-4H5yF70; Tue, 7 Jan 2025 18:13:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] x265: update 3.2.1 -> 4.1
Date: Tue,  7 Jan 2025 18:13:20 +0100
Message-ID: <20250107171320.2918503-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736269987-C2FFAB9C-2FDD4649/0/0 CLEAN NORMAL
X-TOI-MSGID: b28a8a1b-b8d0-4eeb-aba9-4375c3581131
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 17:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114717

- add PACKAGECONFIG for hdr10plus and 10bit
- add numa support
- build shared library by default
- do manual packaging to avoid dev-elf error:
x265-4.1-r0 do_package_qa: QA Issue: -dev package x265-dev contains non-s=
ymlink .so '/usr/lib/libhdr10plus.so' [dev-elf]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/x265/x265_3.2.1.bb     | 26 -----------------
 .../recipes-multimedia/x265/x265_4.1.bb       | 29 +++++++++++++++++++
 2 files changed, 29 insertions(+), 26 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265_4.1.bb

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta=
-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
deleted file mode 100644
index 225fbdee87..0000000000
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "H.265/HEVC video encoder"
-DESCRIPTION =3D "A free software library and application for encoding vi=
deo streams into the H.265/HEVC format."
-HOMEPAGE =3D "http://www.videolan.org/developers/x265.html"
-
-LICENSE =3D "GPL-2.0-only"
-LICENSE_FLAGS =3D "commercial"
-LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4=
ad4091"
-
-DEPENDS =3D "nasm-native gnutls zlib libpcre"
-
-SRC_URI =3D "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz=
"
-
-S =3D "${WORKDIR}/x265_${PV}/source"
-
-SRC_URI[sha256sum] =3D "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b86438=
7cec31e3b58cbbcc"
-
-inherit lib_package pkgconfig cmake
-
-do_generate_toolchain_file:append() {
-    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=3D${TARGET_DB=
GSRC_DIR})" >> ${WORKDIR}/toolchain.cmake
-}
-
-EXTRA_OECMAKE:append:x86 =3D " -DENABLE_ASSEMBLY=3DOFF"
-EXTRA_OECMAKE:append:aarch64 =3D " -DENABLE_PIC=3DON"
-
-AS[unexport] =3D "1"
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-m=
ultimedia/recipes-multimedia/x265/x265_4.1.bb
new file mode 100644
index 0000000000..4837b69cfa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "H.265/HEVC video encoder"
+DESCRIPTION =3D "A free software library and application for encoding vi=
deo streams into the H.265/HEVC format."
+HOMEPAGE =3D "https://bitbucket.org/multicoreware/x265_git"
+
+LICENSE =3D "GPL-2.0-only"
+LICENSE_FLAGS =3D "commercial"
+LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4=
ad4091"
+
+DEPENDS =3D "nasm-native gnutls zlib libpcre numactl"
+
+SRC_URI =3D "https://bitbucket.org/multicoreware/x265_git/downloads/x265=
_${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5e=
bf8a4379d7af8f29"
+S =3D "${WORKDIR}/x265_${PV}/source"
+
+inherit lib_package cmake pkgconfig
+
+EXTRA_OECMAKE +=3D "-DENABLE_SHARED=3DON -DENABLE_CLI=3DON"
+
+do_generate_toolchain_file:append() {
+   echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=3D/usr/src/deb=
ug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+}
+
+PACKAGECONFIG ?=3D "hdr10plus 10bit"
+PACKAGECONFIG[hdr10plus] =3D "-DENABLE_HDR10_PLUS=3DON,-DENABLE_HDR10_PL=
US=3DOFF"
+PACKAGECONFIG[10bit] =3D "-DHIGH_BIT_DEPTH=3DON=3DON,-DHIGH_BIT_DEPTH=3D=
ON=3DOFF"
+
+FILES:${PN} +=3D "${libdir}/libhdr10plus.so"
+FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig ${libdir}/libx265=
.so"
+
--=20
2.47.1


