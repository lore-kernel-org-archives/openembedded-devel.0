Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2B770313
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 09:55:40 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so7146145wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jul 2014 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SdopV2XCskPJ1FnYaYoBcacjO9GU8F2+pU2TGn5jQV8=;
	b=z51bWHOYO1XOHk/KEEDVoldqTrd5VZgYmtVVB790siYVMhlmbww9oatJ/NGXzUytab
	+V8CL5vY/HHXhSG9OfhzZePDiohcX+nHCf4Eh3o+48mpeUd5Jvu7gPMkW1cTUrO3Vkfg
	C2ryeFyFIpPPfEVScEpQbvPqq4GoVOUMMuncDYUosh7KgrByKlss0txbyE5r4Q89UHe7
	c4c3K7/m/bw5mK8F1gklGJDYue/wg6xqS6i2GnwFbQAuWxCKdy/E/vMhwA+frtxROsOs
	ST4tcMd0FUVKLwsAh3/mOTvgM/EHtvi8Hxbt4u663v8fCdpReJKsZpM6gmeH81dTafy1
	s2dg==
X-Received: by 10.180.73.230 with SMTP id o6mr10202093wiv.30.1404899741667;
	Wed, 09 Jul 2014 02:55:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v14sm30066307wjw.38.2014.07.09.02.55.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jul 2014 02:55:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Jul 2014 11:55:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140709095544.GC2446@jama>
References: <1404886727-44130-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1404886727-44130-1-git-send-email-liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe] [PATCH] fftwf and fftwl: exclude them from world
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
X-List-Received-Date: Wed, 09 Jul 2014 09:55:48 -0000
X-Groupsio-MsgNum: 50799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 11:18:47PM -0700, Robert Yang wrote:
> The fftw, fftwf and fftwl provide the same files (different contents), we
> should only build one of them, otherwise there would be warning
>=20
> WARNING: The recipe fftw is trying to install files into a shared area wh=
en those files already exist. Those files and their manifest location are:
>    sysroots/qemux86-64/usr/include/fftw3.f03
>    Matched in manifest-qemux86-64-fftwl.populate_sysroot
> manifest-qemux86-64-fftwf.populate_sysroot
>    sysroots/qemux86-64/usr/include/fftw3.h
>    Matched in manifest-qemux86-64-fftwl.populate_sysroot
> manifest-qemux86-64-fftwf.populate_sysroot
>    sysroots/qemux86-64/usr/include/fftw3q.f03
>    Matched in manifest-qemux86-64-fftwl.populate_sysroot
> manifest-qemux86-64-fftwf.populate_sysroot
>    sysroots/qemux86-64/usr/include/fftw3.f
>    Matched in manifest-qemux86-64-fftwl.populate_sysroot
> manifest-qemux86-64-fftwf.populate_sysroot
>    sysroots/qemux86-64/usr/include/fftw3l.f03
>    Matched in manifest-qemux86-64-fftwl.populate_sysroot
> manifest-qemux86-64-fftwf.populate_sysroot
> Please verify which package should provide the above files.
>=20
> and maybe errors (race issue):
>=20
> The recipe imagemagick.do_compiler error:
>   fourier.c:69:19: fatal error: fftw3.h: No such file or directory
>    #include <fftw3.h>
>=20
> This is because imagemagick.do_configure depends on fftw.populate_sysroot=
, but
> the files installed by fftw.populate_sysroot, maybe removed by fftwl or f=
ftwf
> when they rebuild.
>=20
> Only build fftw in the world will fix the problem.

But it doesn't fix the problem for people who are really building fftwl
and fftw. If there is someone with this use-case can he send patch
moving common parts to separate recipe used by all 3 or just rename/move
files to have unique name?

Or if they aren't needed at the same time, lets convert fftwl and fftwf
to PACKAGECONFIG options in fftw.

Regards,

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-support/fftw/fftwf_3.3.4.bb |    2 ++
>  meta-oe/recipes-support/fftw/fftwl_3.3.4.bb |    2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipe=
s-support/fftw/fftwf_3.3.4.bb
> index 59f4a11..8731df7 100644
> --- a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
> +++ b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
> @@ -6,3 +6,5 @@ EXTRA_OECONF +=3D "--enable-single \
> =20
>  SRC_URI[md5sum] =3D "2edab8c06b24feeb3b82bbb3ebf3e7b3"
>  SRC_URI[sha256sum] =3D "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2=
979a72dbe5af0982"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb b/meta-oe/recipe=
s-support/fftw/fftwl_3.3.4.bb
> index 8f37346..a56bbc8 100644
> --- a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
> +++ b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
> @@ -4,3 +4,5 @@ EXTRA_OECONF +=3D "--enable-long-double"
> =20
>  SRC_URI[md5sum] =3D "2edab8c06b24feeb3b82bbb3ebf3e7b3"
>  SRC_URI[sha256sum] =3D "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2=
979a72dbe5af0982"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
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

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO9EaAACgkQN1Ujt2V2gBy+7QCeN8qy+jj5/tJSIimmHH3nw6Iq
QnYAoKWQhL4KKny+7iSo1bXxFb4ONKpi
=s9qA
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
