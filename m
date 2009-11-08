Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1N78VY-0005JY-70
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 15:12:47 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 1EBA91D36077;
	Sun,  8 Nov 2009 15:04:13 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sun,  8 Nov 2009 15:04:13 +0100
Message-Id: <1257689055-4508-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux: Linux 2.6.31.5
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
X-List-Received-Date: Sun, 08 Nov 2009 14:12:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/checksums.ini            |    4 ++++
 recipes/linux/linux_2.6.31.bb |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index afbd67f..9dae471 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20750,6 +20750,10 @@ sha256=3Ded167dcbdf52c2563a30e7c81a0f2b3d79eb04a=
cc5728e6d484166a4fe8a39e4
 md5=3D02078f4231baee4f0004212f2875df2b
 sha256=3Dbc670682ed9b81d5d3859130c600601bd72053fd738b51b2daf8ddf3f4614a6=
6
=20
+[http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.31.5.bz2]
+md5=3D6cac5e59d5562b591cdda485941204d5
+sha256=3D41e7d98a205d58a62901daf4e46ecf5fb0b177e5a233a3c0ad3250a3a0abe8a=
a
+
 [http://www.muru.com/linux/omap/patches/patch-2.6.9-omap1.bz2]
 md5=3Dd6249654087f0bcafaa860ac573316a4
 sha256=3D91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f2971090d9a=
c
diff --git a/recipes/linux/linux_2.6.31.bb b/recipes/linux/linux_2.6.31.b=
b
index 1559710..f0ff516 100644
--- a/recipes/linux/linux_2.6.31.bb
+++ b/recipes/linux/linux_2.6.31.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r3"
+PR =3D "r4"
=20
 S =3D "${WORKDIR}/linux-${PV}"
=20
@@ -13,7 +13,7 @@ DEFAULT_PREFERENCE_qemumips =3D "1"
 DEFAULT_PREFERENCE_qemux86 =3D "1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.3.bz2;p=
atch=3D1 \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.5.bz2;p=
atch=3D1 \
            file://defconfig"
=20
 SRC_URI_append_db1200 =3D"\
--=20
1.5.6.3



