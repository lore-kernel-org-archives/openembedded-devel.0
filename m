Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id CB5486D49F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 12:51:08 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so2902402ead.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 05:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ccZplIJKqRKQR7Zo1BY5xXF1PaKS0CNWadhgX9w3QaE=;
	b=CaOpOXQ2XiXcfrGg++Ht+EDAFraj8UO9999plYwbmroOjRitZTB9gf7imVt6LJ0Ffh
	B/UGuJFrj5H3olnd3DxsIgNjtlGCHfxjd2hfQvvedJW8A9Y7EGOns88moPOceNhtrLCY
	2cnYe3vye/BXJYPvwYNMhAPOdtejdFAHu1LqVqV6iddlXtSeWW9Oc9LBEJe/Md2oNM7X
	G+VtbMRxdPL+o66RNsvGCK7jGEUMH7CoZaPACQlEwloHUBNC6/FjGWuwyF01cTtN4+Q6
	h3pA4hN2NgyfKX0LCnN2fgAvqXdAPmozOgUrXfcRQXEPsbTSZDgtcn9CcJ2cE2wNB2SD
	UvGA==
X-Received: by 10.14.219.198 with SMTP id m46mr26866682eep.41.1383051069685;
	Tue, 29 Oct 2013 05:51:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm70002459eeg.13.2013.10.29.05.51.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 05:51:09 -0700 (PDT)
Date: Tue, 29 Oct 2013 13:51:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029125108.GH3697@jama>
References: <1383049466-18494-1-git-send-email-patrick.patat@innotis.org>
MIME-Version: 1.0
In-Reply-To: <1383049466-18494-1-git-send-email-patrick.patat@innotis.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH] libao add missing plugin to packages list
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
X-List-Received-Date: Tue, 29 Oct 2013 12:51:09 -0000
X-Groupsio-MsgNum: 46920
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Content-Disposition: inline

--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 01:24:26PM +0100, Patrick Patat wrote:
> Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
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
> +

libao is using do_split_packages so instead of hardcoding list of          =
                                                                           =
       =20
plugins add add PACKAGES_DYNAMIC matching output_pattern in                =
                                                                           =
       =20
do_split_packages call.                                                    =
                                                                           =
       =20

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

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJvrzwACgkQN1Ujt2V2gBwsWACgmmXO9ETgOQ4ESxHPsy/oH3ox
wcwAoJKkawKzPYfYgpi/eE6v3SM13721
=lWr5
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
