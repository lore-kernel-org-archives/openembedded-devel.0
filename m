Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NrHXn-0005Eh-LI
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 22:09:53 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NrHUr-00044b-UP
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 00:06:47 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 00:04:18 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003151658.45421.ml@vdm-design.de>
In-Reply-To: <201003151658.45421.ml@vdm-design.de>
MIME-Version: 1.0
Message-Id: <201003160004.24164.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qemu: fails to build without zlib-dev installed on buildhost
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
X-List-Received-Date: Mon, 15 Mar 2010 21:09:53 -0000
X-Groupsio-MsgNum: 17690
Content-Type: multipart/signed; boundary="nextPart1513278.9Iamzv6bVC";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1513278.9Iamzv6bVC
Content-Type: multipart/mixed;
  boundary="Boundary-01=_SDqnL0BWDmVJ1Kq"
Content-Transfer-Encoding: 7bit

--Boundary-01=_SDqnL0BWDmVJ1Kq
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =CF=EE=ED=E5=E4=E5=EB=FC=ED=E8=EA 15=
 =EC=E0=F0=F2=E0 2010 18:58:45 =E0=E2=F2=EE=F0 Thomas Zimmermann=20
=ED=E0=EF=E8=F1=E0=EB:
> Please check the following patch, as i've no exprience with
> BBCLASSEXTEND=3D"native" and i don't want to break qemu.

Thanks for reporting, first of all.

> -DEPENDS =3D "zlib"
> +DEPENDS =3D "zlib-native"

zlib-native is already a dependency for qemu-native thanks to BBCLASSEXTEND=
=20
magic.

>  do_configure() {
> +       export QEMU_CFLAGS=3D"-I${STAGING_INCDIR_NATIVE} ${QEMU_CFLAGS}"
>         ${S}/configure --prefix=3D${prefix} ${EXTRA_OECONF}
>  }

And this one should only be added for native.

So I think something like attached patch should be a bit better. Please try=
=20
that.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--Boundary-01=_SDqnL0BWDmVJ1Kq
Content-Type: text/x-patch;
  charset="utf-8";
  name="0001-qemu-fix-build-with-zlib-dev-missing-on-host.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-qemu-fix-build-with-zlib-dev-missing-on-host.patch"

From e6f9e79ea507644a413be9f0954fb57c6da15286 Mon Sep 17 00:00:00 2001
From: Roman I Khimov <khimov@altell.ru>
Date: Mon, 15 Mar 2010 23:55:00 +0300
Subject: [PATCH] qemu: fix build with zlib-dev missing on host

OE provides its own zlib-native and qemu-native should use that.

Thanks to Thomas Zimmermann <ml@vdm-design.de> for spotting it.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/qemu/qemu_0.12.3.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/qemu/qemu_0.12.3.bb b/recipes/qemu/qemu_0.12.3.bb
index 035b1a5..d1971e9 100644
--- a/recipes/qemu/qemu_0.12.3.bb
+++ b/recipes/qemu/qemu_0.12.3.bb
@@ -1,7 +1,7 @@
 LICENSE =3D "GPL"
 DEPENDS =3D "zlib"
=20
-PR =3D "r0"
+PR =3D "r1"
=20
 SRC_URI =3D "\
     http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz;name=
=3Dqemu-${PV} \
@@ -31,6 +31,10 @@ EXTRA_OECONF +=3D "--disable-sdl --disable-strip"
=20
 inherit autotools
=20
+do_configure_prepend_virtclass-native() {
+	export QEMU_CFLAGS=3D"-I${STAGING_INCDIR_NATIVE} ${QEMU_CFLAGS}"
+}
+
 do_configure() {
 	${S}/configure --prefix=3D${prefix} ${EXTRA_OECONF}
 }
--=20
1.6.4.2


--Boundary-01=_SDqnL0BWDmVJ1Kq--

--nextPart1513278.9Iamzv6bVC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkueoNgACgkQXJ70z+XgVcPmEgCgs4f+B1J3mvb+ajeDPA0Zv1Fw
G78AoNQzNV81tPFqJYKTxH7oST4IBDjw
=/fID
-----END PGP SIGNATURE-----

--nextPart1513278.9Iamzv6bVC--
