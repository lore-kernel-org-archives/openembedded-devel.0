Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NeeEx-0005UY-N0
	for openembedded-devel@openembedded.org; Tue, 09 Feb 2010 01:46:10 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 77B391D360F6;
	Tue,  9 Feb 2010 01:43:37 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 01:43:33 +0100
Message-Id: <1265676216-9722-4-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1265676216-9722-3-git-send-email-ynezz@true.cz>
References: <1265676216-9722-1-git-send-email-ynezz@true.cz>
	<1265676216-9722-2-git-send-email-ynezz@true.cz>
	<1265676216-9722-3-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.27: update to latest patchset
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
X-List-Received-Date: Tue, 09 Feb 2010 00:46:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/checksums.ini            |    4 ++++
 recipes/linux/linux_2.6.27.bb |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 5173ec0..0478fa5 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -21682,6 +21682,10 @@ sha256=3Dad9e0c07e709e9e9a60abe0b15a61482645f3aa=
64b30fa72c27f1bd13d7aa84d
 md5=3Dda09ddd041a3fb35d236d37ec6de88e9
 sha256=3Da63144608d5fa72b23151022d9d716e9ebc5b428e6307535481a4f48adb2cfe=
8
=20
+[http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.27.45.bz2]
+md5=3D9ad766753f54ba0a4df7c42873e7aa16
+sha256=3Dfb78c95e902194ac62facdbad1a89430c991271a35e4bd30ce9dad2f948d99c=
8
+
 [http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.27.8.bz2]
 md5=3Dec23e3dce22b23ca681199fe515f10fb
 sha256=3D31c35db09289c6e0436a258745d7180e0cd8f567949f27b3dab5a57a3664ed2=
f
diff --git a/recipes/linux/linux_2.6.27.bb b/recipes/linux/linux_2.6.27.b=
b
index bb7b1f3..0437547 100644
--- a/recipes/linux/linux_2.6.27.bb
+++ b/recipes/linux/linux_2.6.27.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r12"
+PR =3D "r13"
=20
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE =3D "-1"
@@ -9,7 +9,7 @@ DEFAULT_PREFERENCE_progear =3D "1"
 DEFAULT_PREFERENCE_simpad =3D "-1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.44.bz2;=
patch=3D1 \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.45.bz2;=
patch=3D1 \
            file://defconfig "
=20
 SRC_URI_append_boc01 =3D "\
--=20
1.6.0.4



