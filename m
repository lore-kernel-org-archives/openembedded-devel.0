Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 20725602DA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 08:23:58 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2814502eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sYpyeuNRkf6NY+msuGSOROCYsP/Xm5orXrJTFTzQW3I=;
	b=XZT+oLRgl3zrFXXuGIsPJdW2OSt+D9jBTWA2dtj+499zLjn/PNM8RDMxrF9laYnEBB
	/FTqCu3CgBw66GrXIQfRICIVL8E5PVb/jN66Z0jIFzql8uEJTLWXiPYVrbTjzRIsBpWg
	+GV0h6s39M+dq4DJ4HJZa3hKKHVYfEPUrYB9+s+HykHIPR+ppLveJg1LcofJa1r7yJBb
	mQJhnVcoV7ShTOjIZ5yQaFcOGNFzwMkKCZy/MfqakPAmD0bh2ftKF5D4KKnaIpembs3C
	CLKpVbrN1O/iwOuTrgkQmff0LOqbNCaqs4d1TNbInQ3X6LFkoYG9fKU1Y1qS1OVCQI1w
	K65Q==
X-Received: by 10.14.47.133 with SMTP id t5mr552197eeb.67.1397982238910;
	Sun, 20 Apr 2014 01:23:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm92574265eex.21.2014.04.20.01.23.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 01:23:57 -0700 (PDT)
Date: Sun, 20 Apr 2014 10:24:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420082402.GK2486@jama>
References: <cover.1397545082.git.jackie.huang@windriver.com>
	<00038b50f96f259beae9e06813ec54085dd9fa17.1397545082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <00038b50f96f259beae9e06813ec54085dd9fa17.1397545082.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/3] gd: update to version 2.1.0
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
X-List-Received-Date: Sun, 20 Apr 2014 08:24:01 -0000
X-Groupsio-MsgNum: 49292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AYsPlKobQGgtCvjI"
Content-Disposition: inline

--AYsPlKobQGgtCvjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2014 at 03:01:24PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - Add DESCRIPTION and HOMEPAGE
> - libgd.org is down, use bitbucket.org instead and also
>   remove the MIRROR for it.
> - Remove the unnecessary specified dir for --with-png.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.bb}     |   22 ++++++++++++=
--------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-support/gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.=
bb} (43%)
>=20
> diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/=
recipes-support/gd/gd_2.1.0.bb
> similarity index 43%
> rename from meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> rename to meta-oe/recipes-support/gd/gd_2.1.0.bb
> index 957c4eb..1b78b9b 100644
> --- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
> @@ -1,22 +1,26 @@
> +SUMMARY =3D "gd is a library used to create PNG, JPEG, or WBMP images"
> +DESCRIPTION =3D "The gd graphics library allows your code to quickly dra=
w images \
> +complete with lines, arcs, text, multiple colors, cut and paste from oth=
er \
> +images, and flood fills, and to write out the result as a PNG or JPEG fi=
le. \
> +This is particularly useful in Web applications, where PNG and JPEG are =
two \
> +of the formats accepted for inline images by most browsers. Note that gd=
 is not \
> +a paint program."
> +HOMEPAGE =3D "http://libgd.bitbucket.org/"
>  SECTION =3D "libs"
> +
>  LICENSE =3D "GD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc97638cafd3581eb87abd37332137=
669"
> -SUMMARY =3D "gd is a library used to create PNG, JPEG, or WBMP images"
>  DEPENDS =3D "freetype libpng jpeg zlib"
> -PR =3D "r5"
> -
> -SRC_URI =3D "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
> -SRC_URI[md5sum] =3D "39ac48e6d5e0012a3bd2248a0102f209"
> -SRC_URI[sha256sum] =3D "dd7c1795271221b9237769b96b8cec7fbdc5db7b8954d864=
ead51fc1296a6ac8"
> =20
> -MIRRORS +=3D "http://www.libgd.org/releases/ http://fossies.org/unix/www=
/ \n"
> +SRC_URI =3D "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.=
tar.bz2"
> +SRC_URI[md5sum] =3D "5a1d5bab3a4a41d9f111bcceee4ad25b"
> +SRC_URI[sha256sum] =3D "f3e1bc472bd81ee976a739436659fe752a14727a964c6453=
0fde68531ddeee91"
> =20
> -S =3D "${WORKDIR}/gd-2.0.36RC1"
> +S =3D "${WORKDIR}/libgd-${PV}"
> =20
>  inherit autotools binconfig gettext
> =20
>  EXTRA_OECONF +=3D " --with-zlib=3D${STAGING_LIBDIR}/.. \
> -                  --with-png=3D${STAGING_LIBDIR}/.. \
>                    --with-jpeg=3D${STAGING_LIBDIR}/.. \
>                    --with-freetype \

http://patchwork.openembedded.org/patch/69991/ adds
--with-freetype=3D${STAGING_LIBDIR}/.. \

and together with this it fails with:
| configure:13838: error: freetype support requested, but not found:
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr=
/lib/../bin/freetype-config

can you please check it?

>                    --without-fontconfig \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AYsPlKobQGgtCvjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNThCIACgkQN1Ujt2V2gBxc4ACff2EuaGZpVD/YbOeVAc6KSSf+
Lk4AoI+dSzTF99lDJGxlcjqnaLUNf3Hc
=z+5M
-----END PGP SIGNATURE-----

--AYsPlKobQGgtCvjI--
