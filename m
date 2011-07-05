Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Qe8wl-00016S-C8
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 19:01:39 +0200
Received: from mail616.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 369D1DC025E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 18:39:19 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Jul 2011 18:38:39 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Jul 2011 18:38:38 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:38:19 +0200
Message-Id: <1309883899-658-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1309883899-658-1-git-send-email-eric@eukrea.com>
References: <1309883899-658-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4471511480277839180
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -30
X-VR-SPAMCAUSE: Vade Retro 01.322.28 AV+AS Profile: OVH; Bailout: 300;
	linux3x (-30)
Cc: leon@sidebranch.com
Subject: [PATCH 4/4] ronetix-pm9g45: update board support
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
X-List-Received-Date: Tue, 05 Jul 2011 17:01:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE can now compile all the binaries to boot this board :
at91bootstrap, u-boot, linux and rootfs in jffs2 and ubifs formats

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 conf/machine/ronetix-pm9g45.conf |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/conf/machine/ronetix-pm9g45.conf b/conf/machine/ronetix-pm9g=
45.conf
index 766fe91..90378b3 100644
--- a/conf/machine/ronetix-pm9g45.conf
+++ b/conf/machine/ronetix-pm9g45.conf
@@ -5,18 +5,19 @@
 include conf/machine/include/at91-2.6.30.inc
 include conf/machine/include/at91-lcd.inc
=20
-#PREFERRED_VERSION_linux =3D "2.6.30"
-
-# Has linux config file in OpenEmbedded
-#
-LINUX26_DEFCONFIG =3D "at91sam9g45ek_defconfig"
+PREFERRED_PROVIDER_at91bootstrap =3D "at91bootstrap_2.13"
+PREFERRED_VERSION_at91bootstrap =3D "2.13"
+PREFERRED_PROVIDER_u-boot =3D "u-boot"
+PREFERRED_VERSION_u-boot =3D "2010.09"
=20
 # Supported u-boot machines
-UBOOT_MACHINE =3D "at91sam9m10g45ek_dataflash_cs0_config"
-#UBOOT_MACHINE =3D "icnova_arm9sodimm_config"
+UBOOT_MACHINE =3D "pm9g45_bb9g45_config"
 UBOOT_ENTRYPOINT =3D "0x70008000"
-
-AT91BOOTSTRAP_BOARD =3D "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+AT91BOOTSTRAP_BOARD =3D "pm9g45"
=20
 MACHINE_FEATURES +=3D "usbhost"
=20
+IMAGE_FSTYPES +=3D "jffs2 ubi"
+EXTRA_IMAGECMD_jffs2 =3D "--pad --little-endian --eraseblock=3D0x20000 -=
n"
+MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 2048"
+UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512"
--=20
1.7.0.4



