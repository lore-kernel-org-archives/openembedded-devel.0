Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCTnL-0007ey-B8 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 11:34:06 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCTla-0002ib-Cw for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:32:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c7f3c39da393b9259fb84c14d99f54b734869b86.1303289630.git.michael.lippautz@gmail.com>
References: <cover.1303289630.git.michael.lippautz@gmail.com>
	<c7f3c39da393b9259fb84c14d99f54b734869b86.1303289630.git.michael.lippautz@gmail.com>
Date: Wed, 20 Apr 2011 11:31:37 +0200
Message-ID: <1303291897.3979.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [oe-meta][PATCHv2] 1/3] libnet: Clean and upgrade (see below)
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
X-List-Received-Date: Wed, 20 Apr 2011 09:34:12 -0000
X-Groupsio-MsgNum: 31353
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-d3gGO2x7zGFdXGlrUXLq"

--=-d3gGO2x7zGFdXGlrUXLq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Michael,


thank you for your patches.

Am Mittwoch, den 20.04.2011, 10:57 +0200 schrieb Michael Lippautz:
> * libbnet upstream on packetfactor is dead
>   using https://github.com/sam-github/libnet instead
> * Move to version 1.1.5
> * Dropped patches (not needed): support-uclibc, new-autotools
> * Added LIC_FILES_CHKSUM
> * Removed useless do_install_append, works automatically
> * Not building statically anymore
> * Should be compatible with old v1.1 versions
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../libnet/libnet-1.1.5/fix-endianess-test.patch   |   38 ++++++++++++++=
++++++
>  .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   24 ++++++++++++
>  2 files changed, 62 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-=
endianess-test.patch
>  create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb

[=E2=80=A6]

> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-o=
e/recipes-connectivity/libnet/libnet_1.1.5.bb
> new file mode 100644
> index 0000000..ec426a5
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A packet dissection and creation library"
> +# libnet at packetfactory.net is dead
> +HOMEPAGE =3D "https://github.com/sam-github/libnet"
> +SECTION =3D "libs"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D533bea47338d490e86744c6a0c5692=
e7"

What does the README have to do with the license? I thought if there is
not file `COPYING` =E2=80=93 maybe one should be sent upstream =E2=80=93 on=
e takes the
header of the source files as for example `libnet_asn1.c` [1].

> +DEPENDS =3D "libpcap"
> +# There are major API changes beween libnet v1.0 and libnet v1.1
> +PROVIDES =3D "libnet-1.1"
> +PR =3D "r0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
> +           file://fix-endianess-test.patch"
> +
> +SRC_URI[md5sum] =3D "a9bc1d75a610efcfee200d3e28d8eb8f"
> +SRC_URI[sha256sum] =3D "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80d=
8275db994496a20d"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"

This is the default [2] and should be dropped.

> +
> +inherit autotools binconfig
> +
> +do_configure_prepend() {
> +        rm -f aclocal.m4 Makefile.am ltmain.sh
> +}


Thanks,

Paul


[1] https://github.com/sam-github/libnet/blob/master/libnet/src/libnet_asn1=
.c
[2] http://docs.openembedded.org/usermanual/usermanual.html#id327409

--=-d3gGO2x7zGFdXGlrUXLq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2up/kACgkQPX1aK2wOHVjbFgCfWPHO5hIGbSU6VOWYATkhAXIR
nFcAni9IOKcZ7/as+Q2/RCcczMMXBLq1
=UUmb
-----END PGP SIGNATURE-----

--=-d3gGO2x7zGFdXGlrUXLq--
