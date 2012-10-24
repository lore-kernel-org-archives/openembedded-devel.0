Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQz45-00018J-Mc
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 13:24:01 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so317144wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2XKOpIp7SN6klk4rZDossG+A6J850dKzLuBnotLlfu8=;
	b=dxD905grpwpEIQ3UmnT0fG99BFJAwDuxRu913/ZcT24u//wvhRtTwRHb1svR5l+03X
	8fBbFyMw1aCeyftXb5zl8130U/4v41KiJcqly4BhTO571h2tbTrZzN9ELAUWyI8BDC+z
	qTyjYXU3s8NgCWCpoTrVFlMLMgcH3OOo3pWUcW8zhKVTdP9Os9O83Ikm3k5HY4C+fchy
	4xkI5J9VO0fMYxq8dqVxeId5NAbOYFwlKgLndBLDHWQbSeYENVrN5CvOfYp0lryqQ1g5
	mlIlgN0mRzI3tuyu2sjF/4+g90KUn9se3h1/ufnf9uVifXAi5KNFKsSIAFveQlOdMtTk
	BInA==
Received: by 10.216.228.193 with SMTP id f43mr8909591weq.41.1351077034590;
	Wed, 24 Oct 2012 04:10:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id di7sm4315101wib.11.2012.10.24.04.10.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 04:10:33 -0700 (PDT)
Date: Wed, 24 Oct 2012 13:10:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121024111051.GD3269@jama.jama.net>
References: <1351076498-28950-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1351076498-28950-1-git-send-email-andrei.adrianx.dinu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 24 Oct 2012 11:24:01 -0000
X-Groupsio-MsgNum: 41259
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="52aklQ8BZHJhx2Z3"
Content-Disposition: inline

--52aklQ8BZHJhx2Z3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 02:01:38PM +0300, Andrei Dinu wrote:
> Added gypsy to meta-oe/recipes-navigation

Looks better, thanks.

0001-gypsy-m4-directory-missing-from-structure.patch which you added in
previous version is not needed?

>=20
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  .../recipes-navigation/gypsy/files/fixups.patch    |   21 ++++++++++++++=
+++
>  meta-oe/recipes-navigation/gypsy/gypsy.inc         |   15 ++++++++++++
>  meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      |   24 ++++++++++++++=
++++++
>  meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |   18 +++++++++++++++
>  4 files changed, 78 insertions(+)
>  create mode 100644 meta-oe/recipes-navigation/gypsy/files/fixups.patch
>  create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy.inc
>  create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
>  create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_git.bb
>=20
> diff --git a/meta-oe/recipes-navigation/gypsy/files/fixups.patch b/meta-o=
e/recipes-navigation/gypsy/files/fixups.patch
> new file mode 100644
> index 0000000..de4d92e
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gypsy/files/fixups.patch
> @@ -0,0 +1,21 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +---
> + docs/reference/Makefile.am |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +--- gypsy.orig/docs/reference/Makefile.am
> ++++ gypsy/docs/reference/Makefile.am
> +@@ -81,10 +81,12 @@ expand_content_files=3D
> + # e.g. GTKDOC_LIBS=3D$(top_builddir)/gtk/$(gtktargetlib)
> +=20
> + INCLUDES=3D-I$(top_srcdir) $(GYPSY_CFLAGS)
> + GTKDOC_LIBS=3D$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
> +=20
> ++EXTRA_DIST =3D
> ++CLEANFILES =3D
> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
> + include $(top_srcdir)/gtk-doc.make
> +=20
> + # Other files to distribute
> + # e.g. EXTRA_DIST +=3D version.xml.in
> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes=
-navigation/gypsy/gypsy.inc
> new file mode 100644
> index 0000000..0c1735e
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "GPS Multiplexing Daemon"
> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> +multiple clients to access GPS data from multiple GPS sources \
> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
> +client applications, passing the data as simple values for the clients \
> +to use."
> +LICENSE =3D "GPLv2.0 & LGPLv2.1"
> +SECTION =3D "x11"
> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib"
> +
> +inherit autotools pkgconfig gtk-doc
> +
> +EXTRA_OECONF +=3D "--with-distro=3Ddebian"
> +
> +FILES_${PN} +=3D "/usr/share/dbus-1/services/"
> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb b/meta-oe/reci=
pes-navigation/gypsy/gypsy_0.9.bb
> new file mode 100644
> index 0000000..51207c9
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "GPS Multiplexing Daemon"
> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> +multiple clients to access GPS data from multiple GPS sources \
> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
> +client applications, passing the data as simple values for the clients \
> +to use."
> +LICENSE =3D "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> +                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b04bb9=
03e34 \
> +                    file://src/main.c;beginline=3D1;endline=3D25;md5=3D3=
fe64e27e61b289b77383a54a982cbdd \
> +                    file://gypsy/gypsy-time.h;beginline=3D1;endline=3D24=
;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> +
> +SECTION =3D "x11"
> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib libxslt"
> +
> +SRC_URI =3D "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
> +PR =3D "r1"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN} +=3D "/usr/share/dbus-1/system-services/"
> +
> +SRC_URI[md5sum] =3D "e2d186df9c2cc3b70a027043e22acf1a"
> +SRC_URI[sha256sum] =3D "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236=
ddfb271904f154d6"
> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb b/meta-oe/reci=
pes-navigation/gypsy/gypsy_git.bb
> new file mode 100644
> index 0000000..e5c564f
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
> @@ -0,0 +1,18 @@
> +require gypsy.inc
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
> +PV =3D "0.9+git${SRCPV}"
> +PR =3D "r1"
> +
> +S =3D "${WORKDIR}/git"
> +
> +LICENSE =3D "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> +                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b04bb9=
03e34 \
> +                    file://src/main.c;beginline=3D1;endline=3D25;md5=3D3=
fe64e27e61b289b77383a54a982cbdd \
> +                    file://gypsy/gypsy-time.h;beginline=3D1;endline=3D24=
;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> +           file://fixups.patch"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--52aklQ8BZHJhx2Z3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCHzLsACgkQN1Ujt2V2gBy1AACbB16VpTDGRqo3hv2dAbjxX1gA
UuYAnAy+tXkj8Bg+99cdCe+0rAgtQGm/
=DqeZ
-----END PGP SIGNATURE-----

--52aklQ8BZHJhx2Z3--
