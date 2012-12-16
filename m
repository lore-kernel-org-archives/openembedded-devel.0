Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkKC8-0001U7-7q
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 20:48:16 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1987491eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 11:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R9hV9JolkEsClLdOfVgc2ZsS69DOfaxex3uCTpYHTos=;
	b=kontAOw/9iNQI0JucS0ZN/6E1mU0f45WvBLZRAf6kvFItFFv3RcxannPXfwyu0Ui1y
	8C7h5zlqWciEIl8aQhpcYqvpx6IzC9mo8M8YnzND76rAct/NKqrkzViFKp4zwaQMeM8a
	TNzmxq7Ek8wL2uhCtAAhNikY2F/V2Htlai5wZ9emdrhpOSfNhuAuQO7QoFdqRdLWRqiv
	SrS5l0X84tQRdrUzaajge82M2GUm7RMYYrcidwLHQXy7S8wMWsFs5g40mA+Mce2yZfY+
	Yr6iz77RbAy3zkSuYjWAnEbenS++myVT/gu/ehYi+EhT9pZ+ZqQGl55a+WMoGUNjjhgm
	dHgw==
Received: by 10.14.1.195 with SMTP id 43mr34264139eed.31.1355686416956;
	Sun, 16 Dec 2012 11:33:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm24374868eem.14.2012.12.16.11.33.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 11:33:36 -0800 (PST)
Date: Sun, 16 Dec 2012 20:33:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121216193336.GF3448@jama>
References: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
	<1355510023-17096-3-git-send-email-cliff.brake@gmail.com>
	<20121216184719.GD3448@jama>
MIME-Version: 1.0
In-Reply-To: <20121216184719.GD3448@jama>
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
X-List-Received-Date: Sun, 16 Dec 2012 19:48:16 -0000
X-Groupsio-MsgNum: 42215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline

--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2012 at 07:47:19PM +0100, Martin Jansa wrote:
> On Fri, Dec 14, 2012 at 01:33:42PM -0500, Cliff Brake wrote:
> > From: Cliff Brake <cbrake@bec-systems.com>
> >=20
> > Initial recipe created by Khem Raj
> >=20
> > Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> > ---
> >  .../libdc1394/files/install_examples.patch             | 14 ++++++++++=
++++
> >  .../recipes-multimedia/libdc1394/files/libdc1394.png   |  0
>=20
> Is this empty libdc1394.png really needed?

Also please set PV to something usefull.
=20
> Cheers,
>=20
> >  meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb  | 18 ++++++++++=
++++++++
> >  3 files changed, 32 insertions(+)
> >  create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/install_=
examples.patch
> >  create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/libdc139=
4.png
> >  create mode 100755 meta-oe/recipes-multimedia/libdc1394/libdc1394_git.=
bb
> >=20
> > diff --git a/meta-oe/recipes-multimedia/libdc1394/files/install_example=
s.patch b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
> > new file mode 100755
> > index 0000000..89133ad
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
> > @@ -0,0 +1,14 @@
> > +Index: libdc1394/examples/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- libdc1394.orig/examples/Makefile.am	2012-06-30 17:50:46.000000000 =
-0700
> > ++++ libdc1394/examples/Makefile.am	2012-06-30 19:02:13.822646430 -0700
> > +@@ -36,8 +36,7 @@
> > + AM_LDFLAGS =3D -framework CoreFoundation -framework Carbon
> > + endif
> > +=20
> > +-noinst_PROGRAMS =3D $(A)
> > +-bin_PROGRAMS =3D $(B)
> > ++bin_PROGRAMS =3D $(A) $(B)
> > +=20
> > + LDADD =3D ../dc1394/libdc1394.la
> > +=20
> > diff --git a/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png b=
/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png
> > new file mode 100755
> > index 0000000..e69de29
> > diff --git a/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb b/me=
ta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
> > new file mode 100755
> > index 0000000..41547d9
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
> > @@ -0,0 +1,18 @@
> > +DESCRIPTION =3D "Capture and control API for IIDC compliant cameras"
> > +HOMEPAGE =3D "http://sourceforge.net/projects/libdc1394/"
> > +SECTION =3D "libs"
> > +LICENSE =3D "LGPL-2.0"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc848e78d9a4a5cc69906178e4d6=
fbd64"
> > +DEPENDS +=3D "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
> > +SRCREV =3D "fa2b5b5a56e2c306cd3e756e810cceb68ab55b8f"
> > +
> > +SRC_URI =3D "git://libdc1394.git.sourceforge.net/gitroot/libdc1394/lib=
dc1394/;branch=3Dmaster;protocol=3Dgit \
> > +           file://install_examples.patch \
> > +           file://${PN}.png \
> > +          "
> > +
> > +S =3D "${WORKDIR}/git/${PN}"
> > +
> > +inherit autotools pkgconfig sdl
> > +
> > +EXTRA_OECONF +=3D "--disable-doxygen-doc"
> > --=20
> > 1.8.0.2
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDOIhAACgkQN1Ujt2V2gBxW5QCeNKrgGIm3sFTaCkiT4arkRhek
mYoAoKn2tNIuzPmcbn8uhV72gBWcLhvr
=byRE
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
