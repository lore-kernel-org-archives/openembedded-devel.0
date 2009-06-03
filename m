Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MBojN-0004tD-Ol
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 13:34:05 +0200
Received: (qmail 31827 invoked by uid 813007); 3 Jun 2009 11:25:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Jun 2009 11:25:09 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Jun 2009 13:25:43 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.2;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200906031325.48159.marcin@juszkiewicz.com.pl>
Subject: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Wed, 03 Jun 2009 11:34:05 -0000
X-Groupsio-MsgNum: 10961
Content-Type: multipart/signed; boundary="nextPart1769453.K24kty8Ml4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1769453.K24kty8Ml4
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


This patch unbreaks current behaviour which was introduced by=20
MACHINE_KERNEL_PR variable.

As most of target machines do not use it they have PR with broken value
(set to "r0" instead of value in recipe). I took other way which makes
both types of users happy -- those with MACHINE_KERNEL_PR in use and=20
those without it.

By default we set M_K_PR to empty string instead of "r0" - this allows
to check is it set at all or not. If it is set then we set PR to this value.
Otherwise we ignore existance of that variable and use PR from recipe.

Please test and review it. If this will work I will request it for stable/2=
009.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 1323228..757b704 100644
=2D-- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -20,6 +20,12 @@ python __anonymous () {
     image =3D bb.data.getVar('INITRAMFS_IMAGE', d, True)
     if image !=3D '' and image is not None:
         bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+
+    pr =3D bb.data.getVar('PR', d, True)
+    machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, True)
+
+    if machine_kernel_pr:
+       bb.data.setVar('PR', machine_kernel_pr, d)
 }

 INITRAMFS_IMAGE ?=3D ""
@@ -64,10 +70,6 @@ export CMDLINE_CONSOLE =3D "console=3D${@bb.data.getVar(=
"KERNEL_CONSOLE",d,1) or "tt
 KERNEL_VERSION =3D "${@get_kernelversion('${S}')}"
 KERNEL_MAJOR_VERSION =3D "${@get_kernelmajorversion('${KERNEL_VERSION}')}"

=2D# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
=2D# rebuilds for kernel and external modules
=2DPR =3D "${MACHINE_KERNEL_PR}"
=2D
 KERNEL_LOCALVERSION ?=3D ""

 # kernels are generally machine specific
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index e711a1f..7bd548d 100644
=2D-- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -164,7 +164,7 @@ P =3D "${PN}-${PV}"

 # Define a PR for kernels that machines can override so things like
 # modules get rebuilt
=2DMACHINE_KERNEL_PR ?=3D "r0"
+MACHINE_KERNEL_PR =3D ""

 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initi=
al"


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1769453.K24kty8Ml4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkomXbgACgkQeQ6MlGH/2qtL0gCeMVQ1f1nqE4gZJlo0wgTTfA/6
eX4Aniqr8m7pc65n1pExE99yd/WeBl7g
=MwAn
-----END PGP SIGNATURE-----

--nextPart1769453.K24kty8Ml4--
