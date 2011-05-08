Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1QJ8XX-0006w3-AE
	for openembedded-devel@openembedded.org; Sun, 08 May 2011 20:17:11 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 56A9B1D36069;
	Sun,  8 May 2011 20:06:53 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sun,  8 May 2011 20:06:40 +0200
Message-Id: <1304878000-19242-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] linux-2.6.38: update to the latest stable patchset 2.6.38.5
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
X-List-Received-Date: Sun, 08 May 2011 18:17:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/linux/linux_2.6.38.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/linux/linux_2.6.38.bb b/recipes/linux/linux_2.6.38.b=
b
index 186f987..825ccac 100644
--- a/recipes/linux/linux_2.6.38.bb
+++ b/recipes/linux/linux_2.6.38.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r3"
+PR =3D "r4"
=20
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE =3D "-1"
@@ -14,7 +14,7 @@ DEFAULT_PREFERENCE_tosa =3D "1"
 DEFAULT_PREFERENCE_ts72xx =3D "1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2;name=3Dkernel \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.4.bz2;a=
pply=3Dyes;name=3Dstablepatch \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.5.bz2;a=
pply=3Dyes;name=3Dstablepatch \
            file://defconfig "
=20
 SRC_URI_append_akita =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz=
2 "
@@ -51,5 +51,5 @@ SRC_URI_append_ts72xx =3D " \
=20
 SRC_URI[kernel.md5sum] =3D "7d471477bfa67546f902da62227fa976"
 SRC_URI[kernel.sha256sum] =3D "72f0cfaefb8dc86b219d5a742dd0375332627641e=
cbdf5badd3158e2127b9304"
-SRC_URI[stablepatch.md5sum] =3D "6ef1279c7bd0078fc0fd50aa83e86203"
-SRC_URI[stablepatch.sha256sum] =3D "64abfd999ac9416db143293528f73a0b88ac=
287bf4d075556dc7859017d97687"
+SRC_URI[stablepatch.md5sum] =3D "c8f233d1d31030eb019ab391071e65c2"
+SRC_URI[stablepatch.sha256sum] =3D "46213fd83da87a066f4b6462c043149638bc=
aca423d6a932d8434e9d27c7140b"
--=20
1.7.1



