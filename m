Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxdCU-0003eS-Us
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:43:41 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so4030162pad.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PFD6jLdI3BEfVqNypm8WrAxRQpu2NKmxUTjhkNAdv1Q=;
	b=G+124wBZZ6pnF9GF6+IIWW5tJIQIouR0j0uOoATJdabBi7TziRYS0/65RKvqKAVQDC
	a8SvahD2QkTecpl7I1RbeuEq8LvpHXeJZuxbPyDELrpa0KrOXaj0ih13TkJjfrtCou4Z
	n8s9lGdCLAaSOOPpqCCG/P/xYVpB8KM4tLZMRzYvoRKh4x4M9FZWCabDA5GhoV2CniHy
	whCT2RWeLUpcOU0BAMTZSU8C+BGrtfYntcBSfbycDKGSNc/vx8rHRFb1gjEoNzUBdloY
	99RuZC2zX5JO7WK63EjLfUaWIQxwzPli6oWyk3DzyhTlnvZfOWJKQkXDjBrPbftumhne
	LY7w==
X-Received: by 10.68.200.228 with SMTP id jv4mr38344002pbc.139.1358857688263; 
	Tue, 22 Jan 2013 04:28:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id sk1sm10684433pbc.0.2013.01.22.04.28.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:28:07 -0800 (PST)
Date: Tue, 22 Jan 2013 13:28:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122122807.GR29386@jama.palm1.palmone.com>
References: <1358721879-1549-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358721879-1549-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libcanberra: upgrade and refresh packaging
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
X-List-Received-Date: Tue, 22 Jan 2013 12:43:43 -0000
X-Groupsio-MsgNum: 42797
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e7jIye1Ygp5H0AIi"
Content-Disposition: inline

--e7jIye1Ygp5H0AIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 20, 2013 at 10:44:39PM +0000, Ross Burton wrote:
> Update to 0.29 (latest, 0.30, needs GStreamer 1.0) and refresh the packag=
e based
> on the different recipes in oe-core and meta-oe.
>=20
> Explicitly depend on GTK+ 2 and GTK+ 3, but split those dependencies into
> different packages.

Merged, thanks


>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../libcanberra-increase-buffer-size.patch         |   13 ----
>  .../libcanberra/libcanberra_0.26.bb                |   63 --------------=
------
>  .../libcanberra/libcanberra_0.29.bb                |   55 ++++++++++++++=
+++
>  3 files changed, 55 insertions(+), 76 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/libcanberra/libcanberra/libc=
anberra-increase-buffer-size.patch
>  delete mode 100644 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26=
=2Ebb
>  create mode 100644 meta-oe/recipes-support/libcanberra/libcanberra_0.29.=
bb
>=20
> diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra=
-increase-buffer-size.patch b/meta-oe/recipes-devtools/libcanberra/libcanbe=
rra/libcanberra-increase-buffer-size.patch
> deleted file mode 100644
> index 1005d78..0000000
> --- a/meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra-increa=
se-buffer-size.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: libcanberra-0.14/src/alsa.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libcanberra-0.14.orig/src/alsa.c
> -+++ libcanberra-0.14/src/alsa.c
> -@@ -272,7 +272,7 @@
> -     return translate_error(ret);
> - }
> -=20
> --#define BUFSIZE (16*1024)
> -+#define BUFSIZE (128*1024)
> -=20
> - static void* thread_func(void *userdata) {
> -     struct outstanding *out =3D userdata;
> diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/m=
eta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
> deleted file mode 100644
> index 5cf9a55..0000000
> --- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme=
 and Name \
> -Specifications, for generating event sounds on free desktops."
> -LICENSE =3D "LGPLv2.1+"
> -LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
> -DEPENDS =3D "alsa-lib gstreamer gtk+ libtool libvorbis gconf"
> -SECTION =3D "libs/multimedia"
> -AUTHOR =3D "Lennart Poettering"
> -HOMEPAGE =3D "http://0pointer.de/lennart/projects/libcanberra"
> -PR =3D "r2"
> -
> -inherit autotools vala
> -
> -SRC_URI =3D "http://0pointer.de/lennart/projects/libcanberra/libcanberra=
-${PV}.tar.gz \
> -           file://libcanberra-increase-buffer-size.patch"
> -
> -SRC_URI[md5sum] =3D "ee2c66ada7c851a4e7b6eb1682285a24"
> -SRC_URI[sha256sum] =3D "4b5d8d2c2835133620adbc53745dd107b6e58b9a2963059e=
8f457143fee00982"
> -
> -EXTRA_OECONF =3D "\
> -  --enable-alsa \
> -  --enable-gstreamer \
> -  --enable-gtk \
> -  --enable-multi \
> -  --enable-null \
> -  --disable-oss \
> -  --disable-pulse \
> -  --disable-tdb \
> -"
> -# enable pulse again when pulseaudio >=3D 0.9.11 is the default in OE
> -
> -python populate_packages_prepend() {
> -    plugindir =3D d.expand('${libdir}/${P}/')
> -    do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanber=
ra-%s', '%s support library', extra_depends=3D'' )
> -}
> -
> -PACKAGES =3D+ "${PN}-gtk"
> -
> -PACKAGES_DYNAMIC +=3D "^libcanberra-.*"
> -
> -FILES_${PN}-gtk =3D "\
> -  ${sysconfdir}/gconf \
> -  ${bindir}/* \
> -  ${libdir}/libcanberra-gtk.so.* \
> -  ${libdir}/gtk-2.0/modules/* \
> -  ${libdir}/gtk-3.0/modules/* \
> -  ${datadir}/gnome \
> -  ${datadir}/gdm \
> -"
> -
> -# /usr/lib/gtk-3.0/modules/libcanberra-gtk-module.so > /usr/lib/gtk-3.0/=
modules/libcanberra-gtk3-module.so
> -INSANE_SKIP_${PN}-gtk =3D "dev-so"
> -
> -FILES_${PN}-dev +=3D "\
> -  ${libdir}/gtk-2.0/modules/*.la \
> -  ${libdir}/gtk-3.0/modules/*.la \
> -  ${libdir}/${P}/*.la \
> -"
> -
> -FILES_${PN}-dbg +=3D "\
> -  ${libdir}/gtk-2.0/modules/.debug \
> -  ${libdir}/gtk-3.0/modules/.debug \
> -  ${libdir}/${P}/.debug \
> -"
> diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/me=
ta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
> new file mode 100644
> index 0000000..a6d68d4
> --- /dev/null
> +++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
> @@ -0,0 +1,55 @@
> +SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"
> +DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme=
 and Name Specifications, for generating event sounds on free desktops."
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
 \
> +                    file://src/canberra.h;beginline=3D7;endline=3D24;md5=
=3Dc616c687cf8da540a14f917e0d23ab03"
> +
> +DEPENDS =3D "alsa-lib gstreamer gtk+ gtk+3 libtool libvorbis pulseaudio"
> +PR =3D "r0"
> +
> +inherit autotools
> +
> +SRC_URI =3D "http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar=
=2Exz"
> +SRC_URI[md5sum] =3D "2594093a5d61047bd9cc87e955f86df8"
> +SRC_URI[sha256sum] =3D "127a5ef07805856d63758e5180ebfb241d1f80094fd301c2=
87591a15b8cfcd72"
> +
> +EXTRA_OECONF =3D "\
> +  --enable-null \
> +  --enable-alsa \
> +  --enable-gstreamer \
> +  --enable-pulse \
> +  --disable-oss \
> +  --enable-gtk \
> +  --enable-gtk3 \
> +  --disable-tdb \
> +  --disable-lynx \
> +"
> +
> +python populate_packages_prepend() {
> +    plugindir =3D d.expand('${libdir}/${P}/')
> +    do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanber=
ra-%s', '%s support library', extra_depends=3D'' )
> +    do_split_packages(d, plugindir, '^libcanberra-(.*)\.la$', 'libcanber=
ra-%s', '%s support library', extra_depends=3D'' )
> +}
> +
> +PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
> +
> +FILES_${PN} =3D "${bindir}/ ${libdir}/${BPN}.so.*"
> +
> +FILES_${PN}-dev +=3D "${datadir}/vala/vapi"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/${P}/.debug ${libdir}/gtk-*/modules/.deb=
ug"
> +
> +FILES_${PN}-gtk2 =3D "${libdir}/${BPN}-gtk.so.* \
> +                    ${libdir}/gtk-2.0/modules/*.la \
> +                    ${libdir}/gtk-2.0/modules/*.so"
> +
> +# -gtk3 ships a symlink to a .so
> +INSANE_SKIP_${PN}-gtk3 =3D "dev-so"
> +FILES_${PN}-gtk3 =3D "${libdir}/${BPN}-gtk3.so.* \
> +                    ${libdir}/gtk-3.0/modules/*.la \
> +                    ${libdir}/gtk-3.0/modules/*.so"
> +
> +FILES_${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/ \
> +                     ${datadir}/gdm/ ${datadir}/gnome/"
> +
> +FILES_${PN}-systemd =3D "${base_libdir}/systemd/system/*.service"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e7jIye1Ygp5H0AIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+hdcACgkQN1Ujt2V2gBziyACdHDr6UbGBfE4BprARwQ8JXIDN
nucAnRy+5PkXh3urPWwemhhdKgoMPxJ5
=Imep
-----END PGP SIGNATURE-----

--e7jIye1Ygp5H0AIi--
