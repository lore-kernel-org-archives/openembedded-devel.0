Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkJTL-0000by-IG
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 20:02:00 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2718868eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qehdwhire4BfKKnqa0TBhgYbVlGswwIx29M8SS4G7H0=;
	b=naLQeapyAQtWdA+PJdsz/SKJccwGRtheqtvADeaua8Mk/ZAI10v7hyLshT+FenaC/S
	E/BlRyGoqV7WKomEGZxynoHLII//9NwNSK62DlPxZ+XsJZFZO3u/JCu7UjuYr9IEmham
	Te+V4D/ay8JOHVCZgd+hD38ilsLc9/Fgy9C5dSXmRZe3LBcEzTBexN2oSpoMTCaibKu8
	PUEcqKoWb8GnBo4wGVdvB5DJlx3MeBit0THlq5c06+MLIEInZfJtiI0A5HXR9f2yWdyJ
	FVLmu8PO0pgzdxcHA9rvmjE3GhmO+ESd7Vx6SgF2Ii7/HmtvGgEj56S4Ha4sZSyGJ4JJ
	Cm7w==
Received: by 10.14.194.4 with SMTP id l4mr33648069een.42.1355683640258;
	Sun, 16 Dec 2012 10:47:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm24136575eea.3.2012.12.16.10.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 10:47:19 -0800 (PST)
Date: Sun, 16 Dec 2012 19:47:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121216184719.GD3448@jama>
References: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
	<1355510023-17096-3-git-send-email-cliff.brake@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1355510023-17096-3-git-send-email-cliff.brake@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCH 2/3] libdc1394: add recipe
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
X-List-Received-Date: Sun, 16 Dec 2012 19:02:01 -0000
X-Groupsio-MsgNum: 42214
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline

--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 01:33:42PM -0500, Cliff Brake wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
>=20
> Initial recipe created by Khem Raj
>=20
> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> ---
>  .../libdc1394/files/install_examples.patch             | 14 ++++++++++++=
++
>  .../recipes-multimedia/libdc1394/files/libdc1394.png   |  0

Is this empty libdc1394.png really needed?

Cheers,

>  meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb  | 18 ++++++++++++=
++++++
>  3 files changed, 32 insertions(+)
>  create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/install_ex=
amples.patch
>  create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/libdc1394.=
png
>  create mode 100755 meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/libdc1394/files/install_examples.=
patch b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
> new file mode 100755
> index 0000000..89133ad
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
> @@ -0,0 +1,14 @@
> +Index: libdc1394/examples/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libdc1394.orig/examples/Makefile.am	2012-06-30 17:50:46.000000000 -0=
700
> ++++ libdc1394/examples/Makefile.am	2012-06-30 19:02:13.822646430 -0700
> +@@ -36,8 +36,7 @@
> + AM_LDFLAGS =3D -framework CoreFoundation -framework Carbon
> + endif
> +=20
> +-noinst_PROGRAMS =3D $(A)
> +-bin_PROGRAMS =3D $(B)
> ++bin_PROGRAMS =3D $(A) $(B)
> +=20
> + LDADD =3D ../dc1394/libdc1394.la
> +=20
> diff --git a/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png b/m=
eta-oe/recipes-multimedia/libdc1394/files/libdc1394.png
> new file mode 100755
> index 0000000..e69de29
> diff --git a/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta=
-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
> new file mode 100755
> index 0000000..41547d9
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Capture and control API for IIDC compliant cameras"
> +HOMEPAGE =3D "http://sourceforge.net/projects/libdc1394/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc848e78d9a4a5cc69906178e4d6fb=
d64"
> +DEPENDS +=3D "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
> +SRCREV =3D "fa2b5b5a56e2c306cd3e756e810cceb68ab55b8f"
> +
> +SRC_URI =3D "git://libdc1394.git.sourceforge.net/gitroot/libdc1394/libdc=
1394/;branch=3Dmaster;protocol=3Dgit \
> +           file://install_examples.patch \
> +           file://${PN}.png \
> +          "
> +
> +S =3D "${WORKDIR}/git/${PN}"
> +
> +inherit autotools pkgconfig sdl
> +
> +EXTRA_OECONF +=3D "--disable-doxygen-doc"
> --=20
> 1.8.0.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDOFzcACgkQN1Ujt2V2gBzcWQCcCQCN5drQVk8L+taknXaO6bWC
0+8An1Eyrpj1ALGlICIqtAVdXCoNopaW
=hxE9
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
