Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcF00-0004iV-3n for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 11:29:16 +0100
Received: from f053035160.adsl.alicedsl.de ([78.53.35.160]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcEzY-0006Ti-P7 for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 10:28:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D2A0680.6030704@gmail.com>
References: <1294586079.4036.63.camel@mattotaupa> <4D2A0680.6030704@gmail.com>
Date: Mon, 10 Jan 2011 11:28:47 +0100
Message-ID: <1294655327.4342.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] [RESEND] Convert `libcap_1.10` to new staging system by removing `do_stage()` [1].
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
X-List-Received-Date: Mon, 10 Jan 2011 10:29:16 -0000
X-Groupsio-MsgNum: 27861
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-odbX9RmhRl66l9axDbGi"

--=-odbX9RmhRl66l9axDbGi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 9 Jan 2011 15:59:33 +0100

This change is build tested with the following configuration and `PREFERRED=
_BINUTILS_VERSION =3D "2.21"`.

        Build Configuration:
        BB_VERSION        =3D "1.10.2"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "224c193"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-uclibceabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal-uclibc"
        DISTRO_VERSION    =3D "dev-snapshot-20110109"
        TARGET_FPU        =3D "soft"

[1] http://wiki.openembedded.org/index.php/Legacy_staging

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Am Sonntag, den 09.01.2011, 11:03 -0800 schrieb Khem Raj:
> On 1/9/2011 7:14 AM, Paul Menzel wrote:

[=E2=80=A6]

> this patch is malformed and have spurious line breaks and other stuff.=
=20
> Please redo and send again

Sorry Khem. I copied the output from `more git-am-formatted.mbox` over
an SSH session into the MUA. It looks like that does not work well. The
Signed-off-by line was wrong too.
---
 recipes/libcap/libcap_1.10.bb |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes/libcap/libcap_1.10.bb b/recipes/libcap/libcap_1.10.bb
index e6ca393..af5600b 100644
--- a/recipes/libcap/libcap_1.10.bb
+++ b/recipes/libcap/libcap_1.10.bb
@@ -22,11 +22,5 @@ do_install() {
 	oe_libinstall -s -C libcap libcap ${D}${libdir}
 }
=20
-do_stage() {
-	install -d ${STAGING_INCDIR}/sys
-	install -m 0644 libcap/include/sys/capability.h ${STAGING_INCDIR}/sys/
-	oe_libinstall -s -C libcap libcap ${STAGING_LIBDIR}
-}
-
 SRC_URI[md5sum] =3D "4426a413128142cab89eb2e6f13d8571"
 SRC_URI[sha256sum] =3D "66c3f033fdc8f9ba0bd9d0ae2d1f2c11f9fa51bf0d1418e5cb=
75e29e6577a5bc"
--=20
1.7.2.3

--=-odbX9RmhRl66l9axDbGi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0q318ACgkQPX1aK2wOHVheOACfb5kLthUwvZpvy17Ubhb1+bxx
8B8An0V6R1L2NDEBr73DlvX78sEHbU6P
=AyNH
-----END PGP SIGNATURE-----

--=-odbX9RmhRl66l9axDbGi--
