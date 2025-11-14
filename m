Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7730CDB473
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:27:15 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9423.1763087230838731429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 6AAFD38C90
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:27:09 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.97]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vJjWm-4HhuzZ0; Fri, 14 Nov 2025 03:27:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] fex: add recipe
Date: Fri, 14 Nov 2025 03:27:02 +0100
Message-ID: <20251114022702.2554476-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1763087228-0AFFB440-EAA7A15D/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f77ff50-df4f-42a0-b6ac-cae785ce26f4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121668

Fex is a fast usermode x86 and x86-64 emulator for Arm64 Linux
It is used by 'valve' to run windows games on snapdragon

Compilation requires TOOLCHAIN =3D "clang"

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/fex/fex_2511.bb | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/fex/fex_2511.bb

diff --git a/meta-oe/recipes-devtools/fex/fex_2511.bb b/meta-oe/recipes-d=
evtools/fex/fex_2511.bb
new file mode 100644
index 0000000000..9eefe8a8ab
--- /dev/null
+++ b/meta-oe/recipes-devtools/fex/fex_2511.bb
@@ -0,0 +1,55 @@
+SUMMARY =3D "A fast usermode x86 and x86-64 emulator for Arm64 Linux"
+HOMEPAGE =3D "https://github.com/FEX-Emu/FEX"
+LICENSE =3D "MIT & BSL-1.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D70d20d502833c35d6d5a4f0ef5d9e=
fcc"
+LIC_FILES_CHKSUM +=3D "file://External/range-v3/LICENSE.txt;md5=3D5dc23d=
5193abaedb6e42f05650004624"
+LIC_FILES_CHKSUM +=3D "file://External/xxhash/LICENSE;md5=3D13be6b481ff5=
616f77dda971191bb29b"
+
+COMPATIBLE_HOST =3D "aarch64.*-linux"
+
+SRC_URI =3D " \
+	git://github.com/FEX-Emu/FEX.git;name=3Dfex;protocol=3Dhttps;nobranch=3D=
1;tag=3DFEX-${PV} \
+	git://github.com/Sonicadvance1/cpp-optparse.git;name=3Dcpp-optparse;sub=
dir=3D${S}/Source/Common/cpp-optparse;protocol=3Dhttps;nobranch=3D1 \
+	git://github.com/FEX-Emu/drm-headers.git;name=3Dfex-drm;subdir=3D${S}/E=
xternal/drm-headers;protocol=3Dhttps;nobranch=3D1 \
+	git://github.com/Cyan4973/xxHash.git;name=3Dxxhash;subdir=3D${S}/Extern=
al/xxhash;protocol=3Dhttps;nobranch=3D1 \
+	git://github.com/FEX-Emu/jemalloc.git;name=3Djemalloc;subdir=3D${S}/Ext=
ernal/jemalloc;protocol=3Dhttps;nobranch=3D1 \
+	git://github.com/FEX-Emu/jemalloc.git;name=3Djemalloc-glibc;subdir=3D${=
S}/External/jemalloc_glibc;protocol=3Dhttps;nobranch=3D1 \
+	git://github.com/ericniebler/range-v3.git;name=3Drange-v3;subdir=3D${S}=
/External/range-v3;protocol=3Dhttps;nobranch=3D1 \
+	git://github.com/FEX-Emu/robin-map.git;name=3Drobin-map;subdir=3D${S}/E=
xternal/robin-map;protocol=3Dhttps;nobranch=3D1 \
+"
+
+SRCREV_FORMAT =3D "fex"
+SRCREV_fex =3D "663fd5a98befbf7a0ac585627de15c662715a731"
+SRCREV_cpp-optparse =3D "9f94388a339fcbb0bc95c17768eb786c85988f6e"
+SRCREV_fex-drm =3D "3e49836995c1dcb3df709440ad2f270b569c6a5f"
+SRCREV_xxhash =3D "e626a72bc2321cd320e953a0ccf1584cad60f363"
+SRCREV_jemalloc =3D "ce24593018ca5d5af7e5661ceda9744e02b59f8f"
+SRCREV_jemalloc-glibc =3D "8436195ad5e1bc347d9b39743af3d29abee59f06"
+SRCREV_robin-map =3D "d5683d9f1891e5b04e3e3b2192b5349dc8d814ea"
+SRCREV_range-v3 =3D "ca1388fb9da8e69314dda222dc7b139ca84e092f"
+
+DEPENDS =3D " \
+    catch2 \
+    fmt \
+    libdrm  \
+    nasm-native \
+    vulkan-headers \
+"
+
+PACKAGECONFIG =3D ""
+PACKAGECONFIG[qt] =3D "-DBUILD_FEXCONFIG=3DON,-DBUILD_FEXCONFIG=3DOFF,qt=
base qttools-native qtquick3d"
+
+EXTRA_OECMAKE +=3D " \
+	-DBUILD_TESTING=3DOFF \
+	-DENABLE_VIXL_DISASSEMBLER=3DOFF \
+	-DENABLE_VIXL_SIMULATOR=3DOFF \
+	-DDATA_DIRECTORY=3D${datadir} \
+	-DQT_HOST_PATH:PATH=3D${RECIPE_SYSROOT_NATIVE}${prefix_native} \
+"
+
+inherit cmake ccache pkgconfig
+
+LDFLAGS +=3D "-fuse-ld=3Dlld"
+
+FILES:${PN} +=3D "${datadir} ${libdir}/binfmt.d ${libdir}/libFEXCore.so"
+FILES:${PN}-dev =3D "${includedir}"
--=20
2.51.0


