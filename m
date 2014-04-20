Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5204565D8A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:29:50 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2926487eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sfiwhahWa/Q6yBRNEQPTCHgYN7hKeHh0zTbBmZdSvxA=;
	b=YTun2wXjLAxcdFbANrdHoTe9HqckBXmX8+K+/n0Nhon7hYge1ILV/aMCi2af4AKfNo
	kIUcFeyvMaHg/ujY/nb+vaw3QL+8SJpPuUCBdr5K6VtZfTfQNrmDJi0Vcnlf0NaeJTZQ
	kyWr0e0wc3iXxWtnhWjjD1F4f8qblWKcQgBjW236tCYDcfs62oC4BKLR0skNl9TQTMCg
	uj1qMEHNjBAm2BPSYCSvfDSDAB/wotp7FtUiIa3KRSMTOxYu+A+Af4bB8uIVaJsmfoID
	3sAmuBdLmBrWExjInn8dHRDSshD5wVfxw9iKV3/mRQf2tFyR2i3l82WsUHbH9j3xR5f4
	RRGw==
X-Received: by 10.15.42.138 with SMTP id u10mr37263332eev.7.1397986191361;
	Sun, 20 Apr 2014 02:29:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm93011941eeg.11.2014.04.20.02.29.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:29:50 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:29:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420092955.GH2486@jama>
References: <1397475471-23068-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1397475471-23068-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/2] fftw: Refactor EXTRA_OECONF
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
X-List-Received-Date: Sun, 20 Apr 2014 09:29:51 -0000
X-Groupsio-MsgNum: 49315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SR0DFWOzPg+ymaCV"
Content-Disposition: inline

--SR0DFWOzPg+ymaCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 12:37:50PM +0100, Paul Barker wrote:
> The configure flags common to all three fftw recipes are moved into fftw.=
inc and
> then each recipe just appends the extra flags it needs. This makes it eas=
ier to
> read and modify options which affect all three recipes.

Both merged, thanks!

>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta-oe/recipes-support/fftw/fftw.inc       | 2 ++
>  meta-oe/recipes-support/fftw/fftw_3.3.3.bb  | 3 ---
>  meta-oe/recipes-support/fftw/fftwf_3.3.3.bb | 4 +---
>  meta-oe/recipes-support/fftw/fftwl_3.3.3.bb | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/fftw/fftw.inc b/meta-oe/recipes-supp=
ort/fftw/fftw.inc
> index 074a53b..6bd622d 100644
> --- a/meta-oe/recipes-support/fftw/fftw.inc
> +++ b/meta-oe/recipes-support/fftw/fftw.inc
> @@ -11,6 +11,8 @@ S =3D "${WORKDIR}/fftw-${PV}"
> =20
>  inherit autotools pkgconfig
> =20
> +EXTRA_OECONF =3D "--disable-fortran --enable-shared --enable-threads"
> +
>  do_configure_prepend() {
>      echo 'AM_PROG_AS' >> ${S}/configure.ac=20
>  }
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.3.bb b/meta-oe/recipes=
-support/fftw/fftw_3.3.3.bb
> index 03a1274..b889c91 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
> @@ -1,7 +1,4 @@
>  require fftw.inc
> =20
> -EXTRA_OECONF =3D "--disable-fortran --enable-shared --enable-threads"
> -
>  SRC_URI[md5sum] =3D "0a05ca9c7b3bfddc8278e7c40791a1c2"
>  SRC_URI[sha256sum] =3D "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5=
c0731fb5c54a97f3"
> -
> diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb b/meta-oe/recipe=
s-support/fftw/fftwf_3.3.3.bb
> index e2989d6..5e4e8ed 100644
> --- a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
> +++ b/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
> @@ -1,10 +1,8 @@
>  require fftw.inc
> =20
> -EXTRA_OECONF =3D "--disable-fortran --enable-single --enable-shared \
> -    --enable-threads \
> +EXTRA_OECONF +=3D "--enable-single \
>      ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
>  "
> =20
>  SRC_URI[md5sum] =3D "0a05ca9c7b3bfddc8278e7c40791a1c2"
>  SRC_URI[sha256sum] =3D "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5=
c0731fb5c54a97f3"
> -
> diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb b/meta-oe/recipe=
s-support/fftw/fftwl_3.3.3.bb
> index b28784e..9c67354 100644
> --- a/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
> +++ b/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
> @@ -1,7 +1,6 @@
>  require fftw.inc
> =20
> -EXTRA_OECONF =3D "--disable-fortran --enable-long-double --enable-shared=
 --enable-threads"
> +EXTRA_OECONF +=3D "--enable-long-double"
> =20
>  SRC_URI[md5sum] =3D "0a05ca9c7b3bfddc8278e7c40791a1c2"
>  SRC_URI[sha256sum] =3D "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5=
c0731fb5c54a97f3"
> -
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SR0DFWOzPg+ymaCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTk5MACgkQN1Ujt2V2gBzuRgCfWZfqKKuX9kTA/FWhLOdiR8Qp
R2EAn2Cu21Sb7EObP+JxL7m77I5jkZiC
=+dj3
-----END PGP SIGNATURE-----

--SR0DFWOzPg+ymaCV--
