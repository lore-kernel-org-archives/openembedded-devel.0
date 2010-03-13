Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqQFI-00043L-VI for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 13:15:09 +0100
Received: from f053041077.adsl.alicedsl.de ([78.53.41.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqQCQ-0004Z1-Rw for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 12:12:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 13:12:09 +0100
Message-ID: <1268482329.11170.31.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-omap*/beagleboard/defconfig: Compile Ext4 support into Linux.
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
X-List-Received-Date: Sat, 13 Mar 2010 12:15:09 -0000
X-Groupsio-MsgNum: 17575
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BT5Q7nXx2dO+ZYKRt3oc"

--=-BT5Q7nXx2dO+ZYKRt3oc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Currently Ext4 support is only build as a loadable kernel module. Therefore=
 Ext4 partitions cannot be used for the rootfs. To fix this compile Ext4 su=
pport directly into Linux.

I used the following command

    $ find . -name defconfig | grep "beagleboard" | xargs sed -i 's/CONFIG_=
EXT4_FS=3Dm/CONFIG_EXT4_FS=3Dy/'

and increased `MACHINE_KERNEL_PR`. I took commit 9a3aceee4861e3b79ad8c73a01=
b4e4a93e421c0b as an example.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 conf/machine/include/omap3.inc                     |    2 +-
 .../linux/linux-omap-2.6.28/beagleboard/defconfig  |    2 +-
 .../linux/linux-omap-2.6.29/beagleboard/defconfig  |    2 +-
 .../linux/linux-omap-2.6.31/beagleboard/defconfig  |    2 +-
 .../linux/linux-omap-2.6.32/beagleboard/defconfig  |    2 +-
 .../linux-omap-pm-2.6.28/beagleboard/defconfig     |    2 +-
 .../linux-omap-pm-2.6.29/beagleboard/defconfig     |    2 +-
 .../linux-omap-pm-2.6.31/beagleboard/defconfig     |    2 +-
 recipes/linux/linux-omap-pm/beagleboard/defconfig  |    2 +-
 .../linux-omap-psp-2.6.32/beagleboard/defconfig    |    2 +-
 recipes/linux/linux-omap/beagleboard/defconfig     |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.in=
c
index dd1188b..d96b189 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY =3D "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r51"
+MACHINE_KERNEL_PR =3D "r52"
=20
 KERNEL_IMAGETYPE =3D "uImage"
=20
diff --git a/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig b/recipe=
s/linux/linux-omap-2.6.28/beagleboard/defconfig
index 2c95d76..51a598a 100644
--- a/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig
@@ -1817,7 +1817,7 @@ CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig b/recipe=
s/linux/linux-omap-2.6.29/beagleboard/defconfig
index b79f279..f6d8daf 100644
--- a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
@@ -2308,7 +2308,7 @@ CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig b/recipe=
s/linux/linux-omap-2.6.31/beagleboard/defconfig
index 4856361..d4e4875 100644
--- a/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig
@@ -2321,7 +2321,7 @@ CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig b/recipe=
s/linux/linux-omap-2.6.32/beagleboard/defconfig
index 7857e2d..cebe1f5 100644
--- a/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig
@@ -2427,7 +2427,7 @@ CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
 # CONFIG_EXT4_FS_SECURITY is not set
diff --git a/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig b/rec=
ipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig
index 83327b4..7f2f0e8 100644
--- a/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig
@@ -2028,7 +2028,7 @@ CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig b/rec=
ipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig
index 9cb8ab5..e36b945 100644
--- a/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig
@@ -2296,7 +2296,7 @@ CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig b/rec=
ipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig
index f43c8f5..615b0c1 100644
--- a/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig
@@ -2296,7 +2296,7 @@ CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-pm/beagleboard/defconfig b/recipes/li=
nux/linux-omap-pm/beagleboard/defconfig
index 5e0a85a..4cb5592 100644
--- a/recipes/linux/linux-omap-pm/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-pm/beagleboard/defconfig
@@ -2249,7 +2249,7 @@ CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig b/re=
cipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
index 461c854..7450bbc 100644
--- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
@@ -2456,7 +2456,7 @@ CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
 # CONFIG_EXT4_FS_SECURITY is not set
diff --git a/recipes/linux/linux-omap/beagleboard/defconfig b/recipes/linux=
/linux-omap/beagleboard/defconfig
index f6c503c..e6b3ace 100644
--- a/recipes/linux/linux-omap/beagleboard/defconfig
+++ b/recipes/linux/linux-omap/beagleboard/defconfig
@@ -1845,7 +1845,7 @@ CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=3Dy
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4DEV_COMPAT is not set
 CONFIG_EXT4_FS_XATTR=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
--=20
1.7.0

--=-BT5Q7nXx2dO+ZYKRt3oc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkubgRkACgkQPX1aK2wOHVj1tACcDNQKU9pwRBgi/rsOWAlXAD89
HyIAnjjlXAf7NGE6U0m1tlju6Qd7vacm
=3GXn
-----END PGP SIGNATURE-----

--=-BT5Q7nXx2dO+ZYKRt3oc--
