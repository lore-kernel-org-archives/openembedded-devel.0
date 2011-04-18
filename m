Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1QBoEf-0004VT-2p
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 15:11:25 +0200
Received: by fxm19 with SMTP id 19so3343223fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 06:09:04 -0700 (PDT)
Received: by 10.223.15.71 with SMTP id j7mr2153906faa.11.1303132142459;
	Mon, 18 Apr 2011 06:09:02 -0700 (PDT)
Received: from risca-hp.localnet ([130.236.133.98])
	by mx.google.com with ESMTPS id j12sm1668017fax.9.2011.04.18.06.09.01
	(version=SSLv3 cipher=OTHER); Mon, 18 Apr 2011 06:09:01 -0700 (PDT)
From: "Patrik =?iso-8859-15?q?Dahlstr=F6m?= (student)"
	<patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 15:09:05 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.37-sabayon; KDE/4.6.2; x86_64; ; )
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302960519.20934.5.camel@mattotaupa>
In-Reply-To: <1302960519.20934.5.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104181509.05818.patda293@student.liu.se>
Subject: Re: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Mon, 18 Apr 2011 13:11:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable


l=F6rdag 16 april 2011 15.28.39 skrev  Paul Menzel:
> Dear Patrik,
>=20
> Am Freitag, den 15.04.2011, 18:42 +0200 schrieb Patrik Dahlstr=F6m:
> > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
> >=20
> >   patch sets the appropriate flags in autoconf.mk.in for
> >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
> >=20
> > Signed-off-by: Patrik Dahlstr=F6m <patda293@student.liu.se>
> > ---
> >=20
> >  recipes/mozilla/firefox_3.6.8.bb |    7 +++++--
> >  1 files changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/recipes/mozilla/firefox_3.6.8.bb
> > b/recipes/mozilla/firefox_3.6.8.bb index 04dde08..828822c 100644
> > --- a/recipes/mozilla/firefox_3.6.8.bb
> > +++ b/recipes/mozilla/firefox_3.6.8.bb
> > @@ -28,6 +28,7 @@ SRC_URI[archive.md5sum] =3D
> > "0ee5f14fd8be07513d16131027ebcb61"
> >=20
> >  SRC_URI[archive.sha256sum] =3D
> >  "fc609cc6a0ddaa2a9ebd8511ec39ae4a404e1107a12e07b233e2afca51d9a10e"
> > =20
> >  S =3D "${WORKDIR}/mozilla-1.9.2"
> >=20
> > +export PKG_CONFIG=3D${STAGING_BINDIR_NATIVE}/pkg-config
>=20
> is that line really needed?
It seems I misspelled something here. It was supposed to say PKG_CONFIG_PAT=
H.=20
Apparently it works anyway, but I don't know if it would work for every kin=
d=20
of configuration.
However, when I used $PKG_CONFIG instead of $(pkg-config ...) below it didn=
't=20
work. I will try to reproduce the error when I have some time over and be m=
ore=20
precise on what the actual error was (missing glib.h as I recall).
>=20
> >  inherit mozilla
> >  require firefox.inc
> >=20
> > @@ -37,7 +38,9 @@ EXTRA_OECONF +=3D " --enable-official-branding
> > --disable-crashreporter"
> >=20
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> >  -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> >=20
> > -	cp ${WORKDIR}/jsautocfg.h ${S}/js/src/
> > -	sed -i "s|CPU_ARCH =3D|CPU_ARCH =3D ${TARGET_ARCH}|"
> > security/coreconf/Linux.mk +    cp ${WORKDIR}/jsautocfg.h ${S}/js/src/
> > +    sed -i "s|CPU_ARCH =3D|CPU_ARCH =3D ${TARGET_ARCH}|"
> > security/coreconf/Linux.mk +    sed -i "s|HOST_LIBIDL_CFLAGS =3D
> > \@HOST_LIBIDL_CFLAGS\@|HOST_LIBIDL_CFLAGS =3D $(pkg-config --cflags
> > libIDL-2.0)|" config/autoconf.mk.in +    sed -i "s|HOST_LIBIDL_LIBS   =
=3D
> > @HOST_LIBIDL_LIBS@|HOST_LIBIDL_LIBS =3D $(pkg-config --libs libIDL-2.0)=
|"
> > config/autoconf.mk.in
> >=20
> >  }
>=20
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> Is that bug fixed in newer releases of Firefox?
This was the latest release of firefox in OE. I didn't try to create a new=
=20
recipe for any newer version of FF.
>=20
>=20
> Thanks,
My pleasure.
>=20
> Paul
=2D-=20
MvH / with best regards
Patrik Dahlstr=F6m


