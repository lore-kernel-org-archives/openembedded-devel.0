Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qczgj-0000BX-59 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:52:46 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QczdF-00069P-2i for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 12:49:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <e7293cb1cd6b1853e4ff3f9fe653142f7fb1cb06.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
	<e7293cb1cd6b1853e4ff3f9fe653142f7fb1cb06.1309608953.git.michael.lippautz@gmail.com>
Date: Sat, 02 Jul 2011 14:48:58 +0200
Message-ID: <1309610938.4228.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 3/4] audiofile: 0.2.6 -> 0.2.7
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
X-List-Received-Date: Sat, 02 Jul 2011 12:52:46 -0000
X-Groupsio-MsgNum: 32955
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-01MFfkDzaeXvPBJ33+Y3"

--=-01MFfkDzaeXvPBJ33+Y3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 02.07.2011, 14:20 +0200 schrieb Michael Lippautz:
> 0.2.7 fixes various bugs of 0.2.6 and adds further support for WAVE and A=
IFF-C
> formats.
>=20
> * Rebase CVE-2008-5824 to apply again
> * Drop patches already applied by upstream
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../audiofile-0.2.7/CVE-2008-5824-rebased.patch    |   22 ++++++++
>  .../audiofile-0.2.7/audiofile-oldstyle.patch       |   55 ++++++++++++++=
++++++
>  .../audiofile/audiofile_0.2.7.bb                   |   20 +++++++

I do not see that audiofile_0.2.6 was removed. Please use `git
format-patch -M -C -C -C` next time when sending patches.

>  3 files changed, 97 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/=
CVE-2008-5824-rebased.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/=
audiofile-oldstyle.patch

Please add patch headers. It sounds scary that a security issues gets
ignored upstream and that some patch is applied for some oldstyle
whatever that is.

>  create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.=
bb

[=E2=80=A6]

> diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/me=
ta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
> new file mode 100644
> index 0000000..80ad132
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "The Audio File Library provides a uniform and elegant \
> +API for accessing a variety of audio file formats, such as AIFF/AIFF-C, =
\
> +WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
> +Research, Amiga IFF/8SVX, and NIST SPHERE."

Please add

HOMEPAGE =3D "http://www.68k.org/~michael/audiofile/"

> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2 && GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7 \
> +                    file://COPYING.GPL;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> +PR =3D "r0"
> +
> +SRC_URI =3D " \
> +  http://www.68k.org/~michael/audiofile/${PN}-${PV}.tar.gz \
> +  file://audiofile-oldstyle.patch;striplevel=3D0 \
> +  file://CVE-2008-5824-rebased.patch \
> +"
> +
> +inherit autotools lib_package binconfig
> +
> +SRC_URI[md5sum] =3D "a39be317a7b1971b408805dc5e371862"
> +SRC_URI[sha256sum] =3D "a61c4036c2600a645843f16bec4be166093a9df5f15b02c8=
5291213aa9cf15a2"

Please move that up.


Thanks,

Paul

--=-01MFfkDzaeXvPBJ33+Y3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4PE7oACgkQPX1aK2wOHViy0wCfRhNy8V9BxULIJWitaCKL7Jag
CzwAniWU5BTI2z6E2LH7+SvRwnbntd5V
=gQUY
-----END PGP SIGNATURE-----

--=-01MFfkDzaeXvPBJ33+Y3--
