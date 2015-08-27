Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1892460043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:52:21 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so9441915wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KD9xXap96PuXj0tim2KspM+BkO1WcZ2i+Zu9WQFULkU=;
	b=ow6jK+VBTSIZumcuoS6nhsWf5nCklhF2Z0QDEtZnRspdXNcT39A7iYgqZ7TJUTB6rY
	IpX7h2bTUcSCoGclGo8oYX9l1uyvhUjXOpb/+psjrMfV64zx4LFPYeRYAfzgPEQ8Jl4P
	nfDMF4PgKIzQWR5JX2q6DixBnMmRrZiehZpfG4Nqd3CWZOOXh1cN/gfTUXV5cdyAmmsg
	QtoEi/nO5bb/7/cd3SEjwrDgy6vgj/RzhvmpIT7RwRUjbEod2xuRaEH9pNJL1f+xGA73
	A/OSgyPrxQ8SRXe8seu8bsJvEjSNlJXXMrjbDxIucXIrtv7IeVsM7mmi61Vkizhjh4Bq
	zClQ==
X-Received: by 10.180.187.137 with SMTP id fs9mr20289780wic.10.1440683541332; 
	Thu, 27 Aug 2015 06:52:21 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r19sm3746135wib.7.2015.08.27.06.52.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 06:52:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 27 Aug 2015 15:52:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150827135235.GA2443@jama>
References: <1440636910-25925-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1440636910-25925-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] gnome: revector some older versions of pkgs back to bz2 compression
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
X-List-Received-Date: Thu, 27 Aug 2015 13:52:23 -0000
X-Groupsio-MsgNum: 57067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 08:55:10PM -0400, Paul Gortmaker wrote:
> In commit 429985c1f6e50baec6ba03f35f323a4e8c7f72dd and/or
> OE-Core rev: 0f9ea90dde8f63aace19531e066580e41bf3d7cc
> ("classes/gnomebase: change tarball compression to xz")
>=20
> the default changed, and some pkgs were kept back on bz2 where
> the xz did not exist.  However it seems some were missed, and
> I found the fetcher gets 404s on the ones in this commit.
>=20
> Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

These are already by:
http://patchwork.openembedded.org/patch/101611/
aren't they?

> ---
>=20
> [Apologies if you've seen this 2x -- Ross kindly pointed out that I should
>  have sent it to openembedded-devel and not to openembedded-core list.]
>=20
>  meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb=
 | 1 +
>  meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb          =
 | 1 +
>  meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb       =
 | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb
> index 2c526c8edefd..4f95066ec51e 100644
> --- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
=2E0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
=2E0.bb
> @@ -10,6 +10,7 @@ PR =3D "r4"
>  inherit gnomebase gtk-icon-cache
>  SRC_URI[archive.md5sum] =3D "f0366c8baebca0404d190b2d78f3582d"
>  SRC_URI[archive.sha256sum] =3D "03e461b6bda7f773f8018d25fa3213d3073d4dc8=
3a76e6b39d962652f4de6a98"
> +GNOME_COMPRESS_TYPE=3D"bz2"
> =20
>  SRC_URI +=3D "\
>      file://disable-scrollkeeper.patch \
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.=
bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> index 860851d98379..1bbfb17d9f05 100644
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> @@ -24,6 +24,7 @@ EXTRA_OECONF =3D "${@base_contains('DISTRO_FEATURES', '=
pam', '--enable-pam --with-
> =20
>  SRC_URI[archive.md5sum] =3D "9a8aa74e03361676f29d6e73155786fc"
>  SRC_URI[archive.sha256sum] =3D "31fecec1430a97f59a6159a5a2ea8d6a1b44287f=
1e9e595b3594df46bf7f18f9"
> +GNOME_COMPRESS_TYPE=3D"bz2"
> =20
>  FILES_${PN} +=3D "${datadir}/dbus-1/services ${datadir}/gcr \
>                  ${base_libdir}/security/*${SOLIBSDEV} \
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32=
=2E0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
> index 43379bdca2e5..e24188232774 100644
> --- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
> @@ -17,3 +17,4 @@ DEPENDS =3D "dbus libgcrypt glib-2.0 intltool-native"
> =20
>  SRC_URI[archive.md5sum] =3D "c42b2ca66204835d901d3dbfc1fa5ae6"
>  SRC_URI[archive.sha256sum] =3D "56388c0d81ddfdb57d30e4963c83ecc1c18498aa=
b99395420e0fff69929a0f0c"
> +GNOME_COMPRESS_TYPE=3D"bz2"
> --=20
> 2.4.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXfFiMACgkQN1Ujt2V2gBwFSgCfa1iYysNYa52mCw6HJx/qOZwj
l70An1WOIx3Rk8vO4q5cIvftQf5vVr/L
=rXhB
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
