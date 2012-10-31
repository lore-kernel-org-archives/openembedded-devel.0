Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TTa05-0006KT-3L
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 16:14:37 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so785331eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZSS0i3qRXojSJ+eo8oHJXDTfrArhM4VeS9Lu4hevC0U=;
	b=BLRkKORzhD01jN1v9usPXvYd+YEF2DWOywkqVW9HTA3B9w4agzKBwaQ/ruj2DImTbP
	e/l5gdAf9y2snlOYuDy2pKmT1q8mko6nVE91Ab3Kw5Erw4NvHon9nFK5wqTZjOPNKf5i
	zljL9cP9IPDSNgXCBQlGnd/XeyKwoVZ0n8KAjq9MbpyCHlJkwd50mrtndaGlEjFb7inC
	wvWgweB5jBX2PyG6poMTS9cVUCH+NpwZUnWA4fh+tcttwbRjrbaZ4QC5GkEHhoT9+aO+
	pD8NcIlH3t/gooPOVS5vCpb4kqZ9IjimwEQNECnoztM2+ZQjHgGs2Ja6Lnhfl9ex3DGh
	yQig==
Received: by 10.14.203.132 with SMTP id f4mr86591140eeo.11.1351695660282;
	Wed, 31 Oct 2012 08:01:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm8365397eem.3.2012.10.31.08.00.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 08:00:57 -0700 (PDT)
Date: Wed, 31 Oct 2012 16:00:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121031150053.GB3272@jama.jama.net>
References: <1351076498-28950-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<20121024111051.GD3269@jama.jama.net>
	<20121031083408.GA3272@jama.jama.net> <50910E16.5060609@intel.com>
MIME-Version: 1.0
In-Reply-To: <50910E16.5060609@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] gypsy: added to meta-oe/recipes-navigation
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
X-List-Received-Date: Wed, 31 Oct 2012 15:14:37 -0000
X-Groupsio-MsgNum: 41390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2012 at 01:40:06PM +0200, Andrei Dinu wrote:
> That patch was needed because the git version was old ( 0.8+... ) .

That patch was part of
http://patchwork.openembedded.org/patch/37765/
used in git recipe with exactly the same SRCREV as this version has.

+SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
+PV =3D "0.8+git${SRCPV}"

new git recipe has
+SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
+PV =3D "0.9+git${SRCPV}"

but OK

> As i put in the latest version in the tarball, that patch is no longer=20
> needed.
>=20
> On 10/31/2012 10:34 AM, Martin Jansa wrote:
> > On Wed, Oct 24, 2012 at 01:10:51PM +0200, Martin Jansa wrote:
> >> On Wed, Oct 24, 2012 at 02:01:38PM +0300, Andrei Dinu wrote:
> >>> Added gypsy to meta-oe/recipes-navigation
> >> Looks better, thanks.
> >>
> >> 0001-gypsy-m4-directory-missing-from-structure.patch which you added in
> >> previous version is not needed?
> > ping
> >
> >>> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> >>> ---
> >>>   .../recipes-navigation/gypsy/files/fixups.patch    |   21 +++++++++=
++++++++
> >>>   meta-oe/recipes-navigation/gypsy/gypsy.inc         |   15 +++++++++=
+++
> >>>   meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      |   24 +++++++++=
+++++++++++
> >>>   meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |   18 +++++++++=
++++++
> >>>   4 files changed, 78 insertions(+)
> >>>   create mode 100644 meta-oe/recipes-navigation/gypsy/files/fixups.pa=
tch
> >>>   create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy.inc
> >>>   create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
> >>>   create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_git.bb
> >>>
> >>> diff --git a/meta-oe/recipes-navigation/gypsy/files/fixups.patch b/me=
ta-oe/recipes-navigation/gypsy/files/fixups.patch
> >>> new file mode 100644
> >>> index 0000000..de4d92e
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-navigation/gypsy/files/fixups.patch
> >>> @@ -0,0 +1,21 @@
> >>> +Upstream-Status: Inappropriate [configuration]
> >>> +
> >>> +---
> >>> + docs/reference/Makefile.am |    2 ++
> >>> + 1 file changed, 2 insertions(+)
> >>> +
> >>> +--- gypsy.orig/docs/reference/Makefile.am
> >>> ++++ gypsy/docs/reference/Makefile.am
> >>> +@@ -81,10 +81,12 @@ expand_content_files=3D
> >>> + # e.g. GTKDOC_LIBS=3D$(top_builddir)/gtk/$(gtktargetlib)
> >>> +
> >>> + INCLUDES=3D-I$(top_srcdir) $(GYPSY_CFLAGS)
> >>> + GTKDOC_LIBS=3D$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
> >>> +
> >>> ++EXTRA_DIST =3D
> >>> ++CLEANFILES =3D
> >>> + # This includes the standard gtk-doc make rules, copied by gtkdociz=
e.
> >>> + include $(top_srcdir)/gtk-doc.make
> >>> +
> >>> + # Other files to distribute
> >>> + # e.g. EXTRA_DIST +=3D version.xml.in
> >>> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/rec=
ipes-navigation/gypsy/gypsy.inc
> >>> new file mode 100644
> >>> index 0000000..0c1735e
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
> >>> @@ -0,0 +1,15 @@
> >>> +SUMMARY =3D "GPS Multiplexing Daemon"
> >>> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> >>> +multiple clients to access GPS data from multiple GPS sources \
> >>> +concurrently.  Gypsy also hides the details of parsing NMEA from the=
 \
> >>> +client applications, passing the data as simple values for the clien=
ts \
> >>> +to use."
> >>> +LICENSE =3D "GPLv2.0 & LGPLv2.1"
> >>> +SECTION =3D "x11"
> >>> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib"
> >>> +
> >>> +inherit autotools pkgconfig gtk-doc
> >>> +
> >>> +EXTRA_OECONF +=3D "--with-distro=3Ddebian"
> >>> +
> >>> +FILES_${PN} +=3D "/usr/share/dbus-1/services/"
> >>> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb b/meta-oe/=
recipes-navigation/gypsy/gypsy_0.9.bb
> >>> new file mode 100644
> >>> index 0000000..51207c9
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
> >>> @@ -0,0 +1,24 @@
> >>> +SUMMARY =3D "GPS Multiplexing Daemon"
> >>> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> >>> +multiple clients to access GPS data from multiple GPS sources \
> >>> +concurrently.  Gypsy also hides the details of parsing NMEA from the=
 \
> >>> +client applications, passing the data as simple values for the clien=
ts \
> >>> +to use."
> >>> +LICENSE =3D "GPLv2+ & LGPLv2+"
> >>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaaba=
a882bbe \
> >>> +                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b0=
4bb903e34 \
> >>> +                    file://src/main.c;beginline=3D1;endline=3D25;md5=
=3D3fe64e27e61b289b77383a54a982cbdd \
> >>> +                    file://gypsy/gypsy-time.h;beginline=3D1;endline=
=3D24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> >>> +
> >>> +SECTION =3D "x11"
> >>> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib libxslt"
> >>> +
> >>> +SRC_URI =3D "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.g=
z"
> >>> +PR =3D "r1"
> >>> +
> >>> +inherit autotools pkgconfig
> >>> +
> >>> +FILES_${PN} +=3D "/usr/share/dbus-1/system-services/"
> >>> +
> >>> +SRC_URI[md5sum] =3D "e2d186df9c2cc3b70a027043e22acf1a"
> >>> +SRC_URI[sha256sum] =3D "14e1cbe17351f408538e033ca370b4bf51ccf9c88744=
e236ddfb271904f154d6"
> >>> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb b/meta-oe/=
recipes-navigation/gypsy/gypsy_git.bb
> >>> new file mode 100644
> >>> index 0000000..e5c564f
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
> >>> @@ -0,0 +1,18 @@
> >>> +require gypsy.inc
> >>> +
> >>> +DEFAULT_PREFERENCE =3D "-1"
> >>> +
> >>> +SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
> >>> +PV =3D "0.9+git${SRCPV}"
> >>> +PR =3D "r1"
> >>> +
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +LICENSE =3D "GPLv2+ & LGPLv2+"
> >>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaaba=
a882bbe \
> >>> +                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b0=
4bb903e34 \
> >>> +                    file://src/main.c;beginline=3D1;endline=3D25;md5=
=3D3fe64e27e61b289b77383a54a982cbdd \
> >>> +                    file://gypsy/gypsy-time.h;beginline=3D1;endline=
=3D24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> >>> +
> >>> +SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> >>> +           file://fixups.patch"
> >>> --=20
> >>> 1.7.9.5
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> --=20
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCRPSUACgkQN1Ujt2V2gBzN9gCguJvLwyjZRixXTCiY8oG05Hht
FtoAn26x/YKsBX0mSYTvO5mZknj+nmRk
=c8kL
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
