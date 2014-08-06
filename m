Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 39D9470A03
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 18:37:21 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so3015897wgg.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ndQkVbhJ3UXKsfi5urKWrglujrNUSnjf9fjqT/blRm0=;
	b=EQfpswxVpxR9TBPKdLY/JY4DuhlJjt563mczE6kPTkEeUmJi9W5mblIGFODwSID/jH
	pyfclk1Whlveno/JRTAF16NXflKu4wTMN0JzFDTwq4SkK8IQFLQ/8syqTcgSaVWxcDyH
	aE9rC8HHIEHdv15pft2fb/N7wqBLN9vSjEo2NdPjmCsf9PxDlbNNTLejIhLsnF8iYmYI
	MaJBLFkYqzF1FA4+xL0v5NzdBuEwVa71P1B/FrOkeRffpBVjvQk3FPkFwb4srizxCVHq
	7WJM6YU6nDSVCQLYE4B0jnF2HCGOe7BNOe1AL9mPcQIJKCWcy0kASc/KQhm2oUFOseqX
	U4BA==
X-Received: by 10.180.20.105 with SMTP id m9mr18913251wie.6.1407350243068;
	Wed, 06 Aug 2014 11:37:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	do6sm8561013wib.22.2014.08.06.11.37.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 11:37:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 20:37:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806183752.GN14848@jama>
References: <1407237282-24497-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407237282-24497-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] ltrace: add PV and PACKAGECONFIG for libunwind
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
X-List-Received-Date: Wed, 06 Aug 2014 18:37:24 -0000
X-Groupsio-MsgNum: 51460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+mr2ctTDD1GjnQwB"
Content-Disposition: inline

--+mr2ctTDD1GjnQwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2014 at 01:14:42PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../ltrace/{ltrace-git =3D> ltrace}/ltrace-0.7.2-unused-typedef.patch   =
 | 0
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb                          |=
 3 +++
>  2 files changed, 3 insertions(+)
>  rename meta-oe/recipes-devtools/ltrace/{ltrace-git =3D> ltrace}/ltrace-0=
=2E7.2-unused-typedef.patch (100%)
>=20
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unus=
ed-typedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unus=
ed-typedef.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unuse=
d-typedef.patch
> rename to meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-type=
def.patch
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index 89f760a..77790b5 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -9,6 +9,7 @@ HOMEPAGE =3D "http://ltrace.org/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
> =20
> +PV =3D "7.2+git${SRCPV}"

I'll bump PE to prevent version going backwards.

>  SRCREV =3D "f44b28421979cec88d6d6a778fc27a8cd514f508"
> =20
>  DEPENDS =3D "elfutils"
> @@ -20,6 +21,8 @@ S =3D "${WORKDIR}/git"
> =20
>  inherit autotools
> =20
> +PACKAGECONFIG[unwind] =3D "--with-libunwind,--without-libunwind,libunwin=
d"
> +
>  do_configure_prepend () {
>  	( cd ${S}; ./autogen.sh )
>  }
> --=20
> 2.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+mr2ctTDD1GjnQwB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPidgAACgkQN1Ujt2V2gBzY/QCfRF4I14atnZ9eRF21ZfcPsy1V
5FAAnRR35kXRfeXmuCNoE7m+aFeEy3kt
=QMtN
-----END PGP SIGNATURE-----

--+mr2ctTDD1GjnQwB--
