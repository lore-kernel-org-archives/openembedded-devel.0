Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URko7-0003QC-3G
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 16:55:18 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so2329560eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=NdRtxR3YxutK+S06uOlUm5c37HPuOMcNwG+Zkw6FoiY=;
	b=n8loTILQ8GvpsFg0w6WlQXoxNL7tio5dsnNKxQkZ2OBKQAlEWzFuClQ+t4uhA4lrrz
	KHscyhggMnlblMJts+hRNVpGDGpigPm5wB+9+HUbDsCZBm/d6qs3QZtiCCS0UeeptUlT
	wFW5Ww4zgzQUS2iRLHNtl+pUnlb4g6wKnCMtbwkAOlX5Yi83BfuM9Vn7PgH4guX472e0
	Rin3cyFG7NrMbVPBqRAL0Q61hhLly7gTktcw/5LGlfSAtmnQhQdUEN87XRfHsEyVdKtd
	MOA+3SyLP6rLo/1ZS0IAIFExJGmUoIfBQUQhOMiKjMaID4Z9mpS2DSkb3p/rLqsRb50z
	ZZug==
X-Received: by 10.15.21.1 with SMTP id c1mr62459033eeu.36.1366036650414;
	Mon, 15 Apr 2013 07:37:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b47sm7659823eez.2.2013.04.15.07.37.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 07:37:29 -0700 (PDT)
Date: Mon, 15 Apr 2013 16:37:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130415143735.GF10628@jama.dyndns-home.com>
References: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
	<1365873301-29552-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1365873301-29552-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe PATCH 2/2] gnumeric: add recipe for version 1.12.0
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
X-List-Received-Date: Mon, 15 Apr 2013 14:55:31 -0000
X-Groupsio-MsgNum: 44202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline

--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2013 at 02:15:01PM -0300, Otavio Salvador wrote:
> From: Mario Domenech Goulart <mario@ossystems.com.br>
>=20
> Based on the OE classic recipe as of
> bd204492e0ed296bbac2999da29f831cbdf965f9
>=20
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      | 44 ++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-=
gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
> new file mode 100644
> index 0000000..cd42e18
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
> @@ -0,0 +1,44 @@
> +LICENSE =3D "GPLv2 | GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbe0de417af78dd340558810d1ced5=
2e6"
> +SECTION =3D "x11/utils"
> +S =3D "${WORKDIR}/gnumeric-${PV}"
> +DEPENDS =3D "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intlto=
ol-native libgnomecanvas libgnomeprint libbonoboui orbit2-native"
> +DESCRIPTION =3D "Gnumeric spreadsheet for GNOME"
> +
> +GNOME_COMPRESS_TYPE =3D "xz"
> +BPN=3D"${PN}"

Why is this needed ^? It shoudn't be there.

> +
> +SRC_URI[archive.md5sum] =3D "3fd87cca95334b5d8ac922989670fe27"
> +SRC_URI[archive.sha256sum] =3D "037b53d909e5d1454b2afda8c4fb1e7838e26034=
3e36d4e36245f4a5d0e04111"
> +
> +inherit gnome
> +
> +EXTRA_OECONF=3D" --without-perl "
> +
> +PACKAGES_DYNAMIC +=3D "gnumeric-plugin-*"
> +PACKAGES +=3D "libspreadsheet libspreadsheet-dev gnumeric-goffice gnumer=
ic-goffice-dbg"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/gnumeric/${PV}/plugins/*/.debug"
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> +FILES_${PN}-staticdev =3D "${libdir}/libspreadsheet.la"
> +FILES_libspreadsheet =3D "${libdir}/libspreadsheet-${PV}.so"
> +FILES_libspreadsheet-dev =3D "${libdir}/libspreadsheet.so"
> +FILES_gnumeric-goffice-dbg +=3D "${libdir}/goffice/*/plugins/gnumeric/.d=
ebug"
> +FILES_gnumeric-goffice =3D "${libdir}/goffice/*/plugins/gnumeric/*"
> +
> +# This hack works around the problem mentioned here:
> +# https://mail.gnome.org/archives/gnumeric-list/2010-February/msg00006.h=
tml
> +do_install_prepend() {
> +    sed -i ${S}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for=
 file in $(omffile); do/'
> +}
> +
> +python populate_packages_prepend () {
> +    gnumeric_libdir =3D bb.data.expand('${libdir}/gnumeric/${PV}/plugins=
', d)
> +
> +    do_split_packages(d, gnumeric_libdir, '^(.*)/.*$',
> +        output_pattern=3D'gnumeric-plugin-%s',
> +        description=3D'Gnumeric plugin %s',
> +        extra_depends=3D'',
> +        recursive=3DTrue,
> +        prepend=3DTrue)
> +}
> --=20
> 1.8.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFsEK8ACgkQN1Ujt2V2gBzRtQCdEglGWrzoQRudwFc4wu8c+6eq
df0An0o+Bda30Le2u64GKXUGWnx5an3h
=Zj+S
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
