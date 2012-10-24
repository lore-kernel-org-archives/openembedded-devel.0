Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQye8-0008Vu-6S
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 12:57:12 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so4086807wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pSh/tf2p1QJTH1KulwYp74UMWUAOZUq6Al8r9z2mUnI=;
	b=x9NKs3pSy9g9H2ckc+8gZ020AwXF8foDZpyRE/txtvKc7M5IwBWbQF4t80mlKzsvDx
	DFT34cjrMGbjNRzwf3ax4EceB+dYwyQZNm4D16A6xq/hHm2DYJne66szhSsg/JCanP1S
	/m76c8W5hljfmI+3UyLuy/sbLfjpXV5VnqyZO7JguU3c8nUMMum/Upee1TzrROrHvmyv
	6R3sLtStOKhniVQhVWU1SsLV+Ihrv7sW2yW7SezQuV5BFACvVt2rWfAlCVOonHRfmBEK
	aWA3bacvEtcZQJO+r+D3Kt1KM5ctlC3otu0orDtOclkUds27nfiNvd7N54zzcYVE+Qlt
	KbRQ==
Received: by 10.216.45.135 with SMTP id p7mr9773139web.129.1351075424772;
	Wed, 24 Oct 2012 03:43:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg4sm4205960wib.6.2012.10.24.03.43.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 03:43:43 -0700 (PDT)
Date: Wed, 24 Oct 2012 12:44:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121024104401.GC3269@jama.jama.net>
References: <1351073335-28110-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<20121024101220.GB3269@jama.jama.net> <5087C5E1.80105@intel.com>
MIME-Version: 1.0
In-Reply-To: <5087C5E1.80105@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] gypsy: added gypsy to meta-oe/recipes-connectivity
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
X-List-Received-Date: Wed, 24 Oct 2012 10:57:12 -0000
X-Groupsio-MsgNum: 41257
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ytgo/kJyDF3J5kSH"
Content-Disposition: inline

--Ytgo/kJyDF3J5kSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 01:41:37PM +0300, Andrei Dinu wrote:
> Should i submit a new patch with the gypsy in recipes-navigation?

Yes,

> I spoke to Ross Burton about the bug/patch and he suggested adding only=
=20
> the tarball, that's
>=20
> why i didn't include the git recipe too.
>=20
> I'm waiting for your answer.

Please include it too (as you have it already), it wont harm with negative =
DEFAULT_PREFERENCE.

Cheers,

> On 10/24/2012 01:12 PM, Martin Jansa wrote:
> > On Wed, Oct 24, 2012 at 01:08:55PM +0300, Andrei Dinu wrote:
> >> This patch is related to bug https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D2797.
> > Ah I forgot to mention that recipes-navigation would be better directory
> > for this.
> >
> > And you can add that updated git recipe too.
> >
> > Cheers,
> >
> >> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> >> ---
> >>   .../recipes-connectivity/gypsy/files/fixups.patch  |   21 ++++++++++=
+++++++
> >>   meta-oe/recipes-connectivity/gypsy/gypsy.inc       |   15 ++++++++++=
++
> >>   meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb    |   24 ++++++++++=
++++++++++
> >>   3 files changed, 60 insertions(+)
> >>   create mode 100644 meta-oe/recipes-connectivity/gypsy/files/fixups.p=
atch
> >>   create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy.inc
> >>   create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb
> >>
> >> diff --git a/meta-oe/recipes-connectivity/gypsy/files/fixups.patch b/m=
eta-oe/recipes-connectivity/gypsy/files/fixups.patch
> >> new file mode 100644
> >> index 0000000..de4d92e
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/gypsy/files/fixups.patch
> >> @@ -0,0 +1,21 @@
> >> +Upstream-Status: Inappropriate [configuration]
> >> +
> >> +---
> >> + docs/reference/Makefile.am |    2 ++
> >> + 1 file changed, 2 insertions(+)
> >> +
> >> +--- gypsy.orig/docs/reference/Makefile.am
> >> ++++ gypsy/docs/reference/Makefile.am
> >> +@@ -81,10 +81,12 @@ expand_content_files=3D
> >> + # e.g. GTKDOC_LIBS=3D$(top_builddir)/gtk/$(gtktargetlib)
> >> +
> >> + INCLUDES=3D-I$(top_srcdir) $(GYPSY_CFLAGS)
> >> + GTKDOC_LIBS=3D$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
> >> +
> >> ++EXTRA_DIST =3D
> >> ++CLEANFILES =3D
> >> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
> >> + include $(top_srcdir)/gtk-doc.make
> >> +
> >> + # Other files to distribute
> >> + # e.g. EXTRA_DIST +=3D version.xml.in
> >> diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy.inc b/meta-oe/re=
cipes-connectivity/gypsy/gypsy.inc
> >> new file mode 100644
> >> index 0000000..0c1735e
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/gypsy/gypsy.inc
> >> @@ -0,0 +1,15 @@
> >> +SUMMARY =3D "GPS Multiplexing Daemon"
> >> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> >> +multiple clients to access GPS data from multiple GPS sources \
> >> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
> >> +client applications, passing the data as simple values for the client=
s \
> >> +to use."
> >> +LICENSE =3D "GPLv2.0 & LGPLv2.1"
> >> +SECTION =3D "x11"
> >> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib"
> >> +
> >> +inherit autotools pkgconfig gtk-doc
> >> +
> >> +EXTRA_OECONF +=3D "--with-distro=3Ddebian"
> >> +
> >> +FILES_${PN} +=3D "/usr/share/dbus-1/services/"
> >> diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb b/meta-oe=
/recipes-connectivity/gypsy/gypsy_0.9.bb
> >> new file mode 100644
> >> index 0000000..51207c9
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb
> >> @@ -0,0 +1,24 @@
> >> +SUMMARY =3D "GPS Multiplexing Daemon"
> >> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> >> +multiple clients to access GPS data from multiple GPS sources \
> >> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
> >> +client applications, passing the data as simple values for the client=
s \
> >> +to use."
> >> +LICENSE =3D "GPLv2+ & LGPLv2+"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe \
> >> +                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b04=
bb903e34 \
> >> +                    file://src/main.c;beginline=3D1;endline=3D25;md5=
=3D3fe64e27e61b289b77383a54a982cbdd \
> >> +                    file://gypsy/gypsy-time.h;beginline=3D1;endline=
=3D24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> >> +
> >> +SECTION =3D "x11"
> >> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib libxslt"
> >> +
> >> +SRC_URI =3D "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
> >> +PR =3D "r1"
> >> +
> >> +inherit autotools pkgconfig
> >> +
> >> +FILES_${PN} +=3D "/usr/share/dbus-1/system-services/"
> >> +
> >> +SRC_URI[md5sum] =3D "e2d186df9c2cc3b70a027043e22acf1a"
> >> +SRC_URI[sha256sum] =3D "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e=
236ddfb271904f154d6"
> >> --=20
> >> 1.7.9.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ytgo/kJyDF3J5kSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCHxnEACgkQN1Ujt2V2gBy6wgCaAo3zKqCra261kWRhWXZDv6YR
W8EAn15Anl/XNYrWzuQOgwJyxDWtczQy
=V+iH
-----END PGP SIGNATURE-----

--Ytgo/kJyDF3J5kSH--
