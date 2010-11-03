Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDZRI-0000oO-MA for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 10:15:30 +0100
Received: from f053043217.adsl.alicedsl.de ([78.53.43.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDZQW-0000k9-4U for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 09:14:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 03 Nov 2010 10:14:39 +0100
Message-ID: <1288775679.3980.31.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pf-ring: update to r4384 to fix `pf_ring.c:329:3: error: implicit declaration of function 'vmalloc_32'`
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
X-List-Received-Date: Wed, 03 Nov 2010 09:15:30 -0000
X-Groupsio-MsgNum: 25772
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-wESEDNJ9f8jBQPYbRhH9"

--=-wESEDNJ9f8jBQPYbRhH9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 31 Oct 2010 22:06:56 +0100

Task `compile` failed with the following error.

	[=E2=80=A6]
	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/p=
f-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c: In function 'rvmalloc':
	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/p=
f-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c:329:3: error: implicit declarati=
on of function 'vmalloc_32'
	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/p=
f-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c:329:7: warning: assignment makes=
 pointer from integer without a cast
	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/p=
f-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c: In function 'rvfree':
	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/p=
f-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c:377:3: error: implicit declarati=
on of function 'vfree'
	[=E2=80=A6]

	Build Configuration:
	BB_VERSION        =3D "1.10.0"
	METADATA_BRANCH   =3D "org.openembedded.dev"
	METADATA_REVISION =3D "8fc09c071a6fba0766c3b002209c758572298d26"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal"
	DISTRO_VERSION    =3D "dev-snapshot-20101103"
	TARGET_FPU        =3D "hard"

Updating to revision 4384 fixes the problem. It was build tested with `mini=
mal`, `minimal-uclibc`, `angstrom-2008.1` and `angstrom-2010.x` for `MACHIN=
E =3D "beagleboard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/pf_ring/pf-ring_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pf_ring/pf-ring_svn.bb b/recipes/pf_ring/pf-ring_svn.b=
b
index 55b5971..0b67016 100644
--- a/recipes/pf_ring/pf-ring_svn.bb
+++ b/recipes/pf_ring/pf-ring_svn.bb
@@ -6,7 +6,7 @@ PV =3D "4.4.0+svnr${SRCPV}"
=20
 S =3D "${WORKDIR}/kernel"
=20
-SRCREV =3D "4326"
+SRCREV =3D "4384"
 SRC_URI =3D "svn://svn.ntop.org/svn/ntop/trunk/PF_RING;module=3Dkernel;pro=
to=3Dhttps"
=20
 inherit module
--=20
1.7.2.3

--=-wESEDNJ9f8jBQPYbRhH9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzRJ/8ACgkQPX1aK2wOHVjZ/gCfZUv5gz3NDRPZwfRAg8W1q7Qw
R7cAnRm3+5DNomfbESno/Kpvq/sSaI8y
=ceJX
-----END PGP SIGNATURE-----

--=-wESEDNJ9f8jBQPYbRhH9--
