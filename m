Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NmuWM-0003CZ-8e
	for openembedded-devel@openembedded.org; Wed, 03 Mar 2010 20:46:20 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 7C7FE1D360F7;
	Wed,  3 Mar 2010 20:43:20 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Mar 2010 20:43:17 +0100
Message-Id: <1267645398-7106-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1267645398-7106-2-git-send-email-ynezz@true.cz>
References: <20100303194141.GT24852@ibawizard.net>
	<1267645398-7106-1-git-send-email-ynezz@true.cz>
	<1267645398-7106-2-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] linux 2.6.32: update to latest stable 2.6.32.9 patchset
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
X-List-Received-Date: Wed, 03 Mar 2010 19:46:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/checksums.ini            |    4 ++++
 recipes/linux/linux_2.6.32.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 0651728..513dd1d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -21754,6 +21754,10 @@ sha256=3Db4d0d667db5094fd430ed58955f4f9ed71d278d=
5ce70e63d287c53f8db028ac3
 md5=3Deabf01da4c72f7ea5b4e4bf8e8535e5f
 sha256=3D50c08a7ffcad1e7cd2e7c2c906795896dd36ce71249d816914c306dcc5875fd=
2
=20
+[http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.32.9.bz2]
+md5=3D7f615dd3b4a3b19fb86e479996a2deb5
+sha256=3D8aeb15c31fb09c769f004c8dc51e29aa26be8e84d70db418af70ecefc463459=
a
+
 [http://www.muru.com/linux/omap/patches/patch-2.6.9-omap1.bz2]
 md5=3Dd6249654087f0bcafaa860ac573316a4
 sha256=3D91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f2971090d9a=
c
diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32.b=
b
index 2661c00..fdc22e3 100644
--- a/recipes/linux/linux_2.6.32.bb
+++ b/recipes/linux/linux_2.6.32.bb
@@ -22,7 +22,7 @@ DEFAULT_PREFERENCE_jornada6xx =3D "-1"
 DEFAULT_PREFERENCE_jornada7xx =3D "-1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2;name=3Dkernel \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.8.bz2;p=
atch=3D1 \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.9.bz2;p=
atch=3D1 \
            file://defconfig"
=20
 SRC_URI[kernel.md5sum] =3D "260551284ac224c3a43c4adac7df4879"
--=20
1.6.3.3



