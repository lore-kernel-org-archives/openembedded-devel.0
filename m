Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id ED40B6ED65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:27:48 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id k10so276780eaj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Iqk3UYiSvzxeZ9fg/nmFlMLAFFaQrtoZR2QF6Otk1Qw=;
	b=L3dw2aaGkb0ESwB3oMx9DVnS7d7c45Sku6CZHjFO/mjhKOHyZ+blSvn84N0vNd5py/
	dt0ifyEhsa5ZQU7Bok53Eh64EYUAdTrP/uJuXn2K5qYzczk8HNGait/ykbdVZ1Ssxp2W
	47J7G6QKF+/oa2AB7YDmEvNwfQQKeVAYzHUci5jIHkacUypczvEKfrMUR0Ue4gHERTzp
	jyj/qSkkSdfwzLNaABTpUW/hs0WyV4EwXAiiPNt3nl7zSEICwBWo0qfUMI97KljXnryu
	WiVEuVvTJoLe/GvSiVXXyqfsnaQWwv/A4mwzb2DETCEEmccnGeQxM3ZRfbncJOT+WJZb
	zqww==
X-Received: by 10.14.209.3 with SMTP id r3mr940271eeo.85.1393349269015;
	Tue, 25 Feb 2014 09:27:49 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i1sm28984926eeo.16.2014.02.25.09.27.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 09:27:48 -0800 (PST)
Date: Tue, 25 Feb 2014 18:27:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140225172747.GR26981@jama>
References: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
	<1393348614-15618-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1393348614-15618-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.1] qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms]
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
X-List-Received-Date: Tue, 25 Feb 2014 17:27:53 -0000
X-Groupsio-MsgNum: 48350
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PVZB3C997XEKXh6G"
Content-Disposition: inline

--PVZB3C997XEKXh6G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 06:16:54PM +0100, Andreas M=FCller wrote:
> * there is no kms around
> * mesa is the default implementation for (lib)gbm (see config.tests/qpa/k=
ms)
> * in configure we find:
>   | if [ "$CFG_KMS" =3D "yes" ]; then
>   |     if [ "$CFG_EGL" =3D "no" ]; then
>   |         echo "The KMS plugin requires EGL support and cannot be built"
>   |         exit 101
>   |     fi
>   | fi
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qtbase.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 116c86f..6c6ec5a 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -108,7 +108,7 @@ PACKAGECONFIG[gtkstyle] =3D "-gtkstyle,-no-gtkstyle,g=
tk+"
>  PACKAGECONFIG[directfb] =3D "-directfb,-no-directfb,directfb"
>  PACKAGECONFIG[linuxfb] =3D "-linuxfb,-no-linuxfb"
>  PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
> -PACKAGECONFIG[kms] =3D "-kms,-no-kms,kms"
> +PACKAGECONFIG[kms] =3D "-kms,-no-kms,virtual/mesa virtual/egl"

Maybe we should introduce some virtual/gbm later, but I'm ok with
virtual/mesa until we have it.

Also there is no virtual/mesa in oe-core/dylan, but I guess that there
is minimum user with dylan who also want kms.

BTW: jansa/qt5-5.2.1 branch was already merged to master, so I plan to
apply this only for master (jansa/qt5-5.2.1 is dead-end).

>  # needed for qtdeclarative (qtdeclarative.do_configure fails to find qui=
ck module without)
>  PACKAGECONFIG[icu] =3D "-icu,-no-icu,${ICU}"
>  PACKAGECONFIG[udev] =3D "-libudev,-no-libudev,udev"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PVZB3C997XEKXh6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMM0pMACgkQN1Ujt2V2gByoDQCdEc9eeCo7Zk2lL3aY+g5cBLnz
fLgAn0rCs1mLxsmrOX58xUi0INJINndI
=+myN
-----END PGP SIGNATURE-----

--PVZB3C997XEKXh6G--
