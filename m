Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id DD8076FFDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:54:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,426,1449529200"; d="scan'208";a="101198319"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP/TLS/AES128-SHA;
	10 Feb 2016 14:54:47 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.266.1; Wed, 10 Feb 2016 14:54:46 +0100
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.266.1; Wed, 10 Feb 2016 14:54:46 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Feb 2016 14:54:43 +0100
Message-ID: <1455112483-31048-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1455099698-25946-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1455099698-25946-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libopus: upgrade to version 1.1.2
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
X-List-Received-Date: Wed, 10 Feb 2016 13:54:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

https://git.xiph.org/?p=3Dopus.git;a=3Dcommit;h=3D655cc54c564b84ef2827f0b21=
52ce3811046201e
ARM thumb compilation is broken for armv5 but not for armv6, armv7 & arvm8.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../libopus/{libopus_1.1.bb =3D> libopus_1.1.2.bb}   | 36 ++++++++++++++--=
------
 1 file changed, 24 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.1.bb =3D> libopus_1.1=
.2.bb} (24%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb b/meta-oe/re=
cipes-multimedia/libopus/libopus_1.1.2.bb
similarity index 24%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
index 948d4df..35f8574 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
@@ -9,8 +9,8 @@ LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De304cdf74c2a1b0a33a5084c128a23a=
3"

 SRC_URI =3D "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] =3D "c5a8cf7c0b066759542bc4ca46817ac6"
-SRC_URI[sha256sum] =3D "b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbce=
ca20206cbe1d95"
+SRC_URI[md5sum] =3D "1f08a661bc72930187893a07f3741a91"
+SRC_URI[sha256sum] =3D "0e290078e31211baa7b5886bcc8ab6bc048b9fc83882532da4=
a1a45e58e907fd"

 S =3D "${WORKDIR}/opus-${PV}"

@@ -21,14 +21,26 @@ EXTRA_OECONF =3D "${@get_libopus_fpu_setting(bb, d)}"

 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
-#| {standard input}:389: Error: selected processor does not support Thumb =
mode `smull r5,r7,r1,r4'
-#| {standard input}:418: Error: selected processor does not support Thumb =
mode `smull r5,r6,r4,r1'
-#| {standard input}:448: Error: selected processor does not support Thumb =
mode `smull r4,r5,r1,r0'
-#| {standard input}:474: Error: selected processor does not support Thumb =
mode `smull r0,r4,r8,r1'
-#| {standard input}:510: Error: selected processor does not support Thumb =
mode `smull fp,r0,r10,r1'
-#| {standard input}:553: Error: selected processor does not support Thumb =
mode `smull fp,r1,r10,r3'
-#| {standard input}:741: Error: selected processor does not support Thumb =
mode `smull r3,r0,r6,r10'
-#| {standard input}:761: Error: selected processor does not support Thumb =
mode `smull fp,r2,r3,r9'
-#| {standard input}:773: Error: selected processor does not support Thumb =
mode `smull fp,r3,r5,r8'
+#| {standard input}:450: Error: selected processor does not support `smull=
 r4,r8,r2,r0' in Thumb mode
+#| {standard input}:473: Error: selected processor does not support `smull=
 r4,r10,r0,r2' in Thumb mode
+#| {standard input}:520: Error: selected processor does not support `smull=
 r0,r4,r2,r1' in Thumb mode
+#| {standard input}:546: Error: selected processor does not support `smull=
 r1,r0,ip,r2' in Thumb mode
+#| {standard input}:578: Error: selected processor does not support `smull=
 fp,r1,r10,r2' in Thumb mode
+#| {standard input}:616: Error: selected processor does not support `smull=
 fp,r2,r10,r3' in Thumb mode
+#| {standard input}:793: Error: selected processor does not support `smull=
 ip,r9,r4,r0' in Thumb mode
+#| {standard input}:828: Error: selected processor does not support `smull=
 fp,r10,ip,r1' in Thumb mode
+#| {standard input}:855: Error: selected processor does not support `smull=
 fp,ip,r10,r7' in Thumb mode
+#| {standard input}:874: Error: selected processor does not support `smull=
 ip,r9,r5,r0' in Thumb mode
+#| {standard input}:912: Error: selected processor does not support `smull=
 fp,ip,r10,r0' in Thumb mode
+#| {standard input}:937: Error: selected processor does not support `smull=
 r9,r10,r0,r7' in Thumb mode
+#| {standard input}:980: Error: selected processor does not support `smull=
 ip,r9,r3,r0' in Thumb mode
+#| {standard input}:1009: Error: selected processor does not support `smul=
l fp,ip,r10,r1' in Thumb mode
+#| {standard input}:1041: Error: selected processor does not support `smul=
l r9,r4,r10,r7' in Thumb mode
+#| {standard input}:1071: Error: selected processor does not support `smul=
l ip,r9,r0,r1' in Thumb mode
+#| {standard input}:1101: Error: selected processor does not support `smul=
l fp,ip,r10,r0' in Thumb mode
+#| {standard input}:1132: Error: selected processor does not support `smul=
l r9,r5,r10,r7' in Thumb mode
+#| {standard input}:1157: Error: selected processor does not support `smul=
l ip,r9,r0,r1' in Thumb mode
+#| {standard input}:1187: Error: selected processor does not support `smul=
l fp,ip,r10,r1' in Thumb mode
+#| {standard input}:1206: Error: selected processor does not support `smul=
l r9,r10,r3,r7' in Thumb mode
 #| make[2]: *** [celt/celt.lo] Error 1
-ARM_INSTRUCTION_SET =3D "arm"
+ARM_INSTRUCTION_SET_armv5 =3D "arm"
--
1.9.1

This email and its content belong to Ingenico Group. The enclosed informati=
on is confidential and may not be disclosed to any unauthorized person. If =
you have received it by mistake do not forward it and delete it from your s=
ystem. Cet email et son contenu sont la propri=C3=A9t=C3=A9 du Groupe Ingen=
ico. L=E2=80=99information qu=E2=80=99il contient est confidentielle et ne =
peut =C3=AAtre communiqu=C3=A9e =C3=A0 des personnes non autoris=C3=A9es. S=
i vous l=E2=80=99avez re=C3=A7u par erreur ne le transf=C3=A9rez pas et sup=
primez-le.

