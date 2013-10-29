Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E4EE86CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:46:54 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id l15so2303491eak.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1R6Jq9RyW1QqrRYtxK8gcFRAfYbDKxQKnmOoufMMcWw=;
	b=dNxH3/N2xkxQc0cp+h92dAbILqz6RLWJEU5mhPWmUJcNxnK+71utKC76p9Fx7k0X2N
	/+DaXGlTkCLp4/621i8FnPiXfXfwOr3Vq7UHKfOk18Z5bIWmm/O+XElfY7rN6tYcRZFe
	VqPiLvGCutUvNM07cTvLXhpkKr8D+dZkFn+I7o8nftOgWk/KBPsX0tI3Wnh0a+vLaKfP
	U7HybOq/2UlCm7k+/MEK9PS9dX8GDceE1vE90JON0xG48v9c2SpK1cSRyxRTeOSYAxhh
	R/PxGqvELDBPccz8YgKmK6gl7eW6mZmJQ+1Yu5/E9oz1V8KPL6Gv63PqYOUpb+PFp1pH
	Tj/A==
X-Received: by 10.14.42.6 with SMTP id i6mr2325676eeb.65.1383047216265;
	Tue, 29 Oct 2013 04:46:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e13sm69353146eeu.4.2013.10.29.04.46.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 04:46:55 -0700 (PDT)
Date: Tue, 29 Oct 2013 11:47:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029104708.GD3697@jama>
References: <1383045572-18281-1-git-send-email-patrick.patat@innotis.org>
MIME-Version: 1.0
In-Reply-To: <1383045572-18281-1-git-send-email-patrick.patat@innotis.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH] libao add missing plugin to packages list Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
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
X-List-Received-Date: Tue, 29 Oct 2013 11:46:55 -0000
X-Groupsio-MsgNum: 46916
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


You need blank line between subject and SOB line.

On Tue, Oct 29, 2013 at 12:19:32PM +0100, Patrick Patat wrote:
> ---
>  .../recipes-multimedia/libao/libao_1.1.0.bb        |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/me=
ta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> index 08950b5..47e8f28 100644
> --- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> @@ -11,6 +11,8 @@ SRC_URI[sha256sum] =3D "29de5bb9b1726ba890455ef7e562d87=
7df87811febb0d99ee69164b88c
> =20
>  inherit autotools
> =20
> +PACKAGES =3D+ "libao-plugin-libalsa libao-plugin-liboss libao-plugin-lib=
pulse libao-plugin-libalsa-dbg libao-plugin-liboss-dbg libao-plugin-libpuls=
e-dbg"=20

libao is using do_split_packages so instead of hardcoding list of
plugins add add PACKAGES_DYNAMIC matching output_pattern in
do_split_packages call.

> +
>  do_install_append () {
>      find "${D}" -name '*.la' -exec rm -f {} +
>  }
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJvkiwACgkQN1Ujt2V2gBz6+gCghCDG1HQWB3UE8geNc6sCCS/T
l5cAoImlqUnrEj/fR5puqiukfM52jSeq
=j0o6
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
