Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id C0FD76EE31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 14:00:04 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id o10so2102357eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 06:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8yOiLj/tn2LirW0/Jd90EIGL1pKPp0jzvGUi6iAy+gs=;
	b=QDZezxeEaJ9ZSzhDz4Gq/D5sgbk2Fn5InicOE/fRb7KVN4aTPIVLac75eR+glOPBI+
	9PbvfOTl4IybqwGD/eXARaCymubruJDBGdgwZXawDkUIZePvW+uT3B2gxo0NIORLBFie
	u50kIelNsHOlxQB2/IquPllXowL/XWhWg9zhyvrZAMzs1ArgPkFzFCdUf0XI3IfjBf9+
	KIAs/MztjyeFU1cC452GMD1j6gv3q4b/uxxwb3pPAMJP+27cLkF7PvCTA6PGrZp+wSjy
	QIkrRVogA9aZorF0uWwVYVTHMEZdSsRudCV6ZPmX+UHX5mpQzwEgMeNXjOwyN09Z0OoY
	3TOQ==
X-Received: by 10.15.111.130 with SMTP id cj2mr4028240eeb.102.1393596005199;
	Fri, 28 Feb 2014 06:00:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j41sm10798698eeg.10.2014.02.28.06.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 06:00:03 -0800 (PST)
Date: Fri, 28 Feb 2014 15:00:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140228140004.GI26981@jama>
References: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1393594900-16092-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1393594900-16092-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH v2] fbida 2.09: cleanups and use PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 14:00:06 -0000
X-Groupsio-MsgNum: 48450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mQQrPwpUFXnyQ/Ik"
Content-Disposition: inline

--mQQrPwpUFXnyQ/Ik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 02:41:40PM +0100, Matthieu Crapet wrote:
> There are now 3 packageconfig variables: gif, png, tiff.
>=20
> Changes:
> - fix missing $ for STAGING_INCDIR (jpeg version detection)
> - add DESCRIPTION
> - no more QA warnings
> Use this to reveal:
> sed -i -e '/^verbose/s/no/yes/' ${S}/mk/Autoconf.mk
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 35 ++++++++++++++++++++++=
++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recip=
es-graphics/fbida/fbida_2.09.bb
> index 32f376f..0c663c1 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
> @@ -1,21 +1,49 @@
> +SUMMARY =3D "Framebuffer image and doc viewer tools"
> +DESCRIPTION =3D "The fbida project contains a few applications for viewi=
ng and editing images, \
> +               with the main focus being photos."
>  HOMEPAGE =3D "http://linux.bytesex.org/fbida/"
> -SUMMARY =3D "frame buffer image and doc viewer tools"
>  AUTHOR =3D "Gerd Hoffmann"
>  SECTION =3D "utils"
> =20
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> =20
> -DEPENDS =3D "virtual/libiconv libpng jpeg fontconfig freetype libexif cu=
rl libungif tiff"
> +DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif curl"
> =20
> +PR =3D "r1"

you don't need this

> +
> +# Note: SRCREV is 3 revisions ahead of 2.09

It would be better to add

PV =3D "2.09+git${SRCPV}"

and rename the recipe to fbida_git.bb that way it will be clear from
package version which revision was used.

>  SRC_URI =3D "git://git.kraxel.org/fbida"
>  SRCREV =3D "cb0ce5fa5f42bfaea4f8f326bcd8914dd14e782d"
>  S =3D "${WORKDIR}/git"
> =20
>  EXTRA_OEMAKE =3D "STRIP=3D"
> =20
> +PACKAGECONFIG ??=3D "gif png"
> +PACKAGECONFIG[gif] =3D ",,libungif"
> +PACKAGECONFIG[png] =3D ",,libpng"
> +PACKAGECONFIG[tiff] =3D ",,tiff"
> +
>  do_compile() {
> -    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I{STAGING_INCDIR}:g' GNUmake=
file
> +    sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
> +    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I${STAGING_INCDIR}:' ${S}/GN=
Umakefile
> +
> +    if [ -z "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" =
]; then
> +        sed -i -e '/^HAVE_MOTIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +    fi
> +
> +    # Be sure to respect preferences (force to "no")
> +    # Also avoid issues when ${BUILD_ARCH} =3D=3D ${HOST_ARCH}
> +    if [ -z "${@base_contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ];=
 then
> +        sed -i -e '/^HAVE_LIBUNGIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +    fi
> +    if [ -z "${@base_contains('PACKAGECONFIG', 'png', 'png', '', d)}" ];=
 then
> +        sed -i -e '/^HAVE_LIBPNG/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +    fi
> +    if [ -z "${@base_contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" =
]; then
> +        sed -i -e '/^HAVE_LIBTIFF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +    fi
> +
>      oe_runmake
>  }
> =20
> @@ -24,4 +52,3 @@ do_install() {
>  }
> =20
>  RDEPENDS_${PN} =3D "ttf-dejavu-sans-mono"
> -
> --=20
> 1.8.5.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mQQrPwpUFXnyQ/Ik
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMQlmQACgkQN1Ujt2V2gBxRrACeNya3DVJP52NQnAlOP74UTwii
xK0An3YRxcGnW4uRI/K307/cHOo+24i2
=Rr5I
-----END PGP SIGNATURE-----

--mQQrPwpUFXnyQ/Ik--
