Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6266AC23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 11:04:04 +0000 (UTC)
Received: by widdi4 with SMTP id di4so47051887wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8rhv0QnQZCXj7qrxk37CSxlP3HygUegl1IjfeQ2i6FU=;
	b=JABCguxgRzWyQQmVX4Ola7gWg8vaiSjx6LDVlKU/L4bRTPs2Qcbk7MzETcxoxEoItU
	9mJ+eLU8iYVhsRZ/VccFUFryaQtyfe+8zsfkXbIqbiu9DJ02SKpsJdANyytFlOiisarb
	R4b+Lz5dssQW6/D0bu34smlpWK7ymRrfQNi7rWVQnSJNN9IQeyqd6N3bUp0OFNCyIR+o
	DV6ljHh5PJPhCmgVorw2lXOLDuPPSjeLYMeXRefa8Vh3iFnCIeljv5DtvuGVeDdftDqa
	u50B0SJtWt2VdtTitIOv6Tclm2k3P2CaXYfWlQHy2EEGj9MdBCYP8FrK0I1AQ29RNgxA
	y+IA==
X-Received: by 10.194.6.228 with SMTP id e4mr26552973wja.63.1428923046065;
	Mon, 13 Apr 2015 04:04:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	fs9sm10977372wjc.34.2015.04.13.04.04.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 04:04:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 13:04:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150413110409.GD2330@jama>
References: <1428685125-20255-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1428685125-20255-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-ruby][PATCH] v2 bundler: Fix QA new Error
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
X-List-Received-Date: Mon, 13 Apr 2015 11:04:06 -0000
X-Groupsio-MsgNum: 55062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline

--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 09:58:45AM -0700, Armin Kuster wrote:
> V2: drop version value in file path

I've taken this patch before branching fido, but I had to fix commit
message a bit.

Please notice extra "v2 " in summary line.

"V2: .*" belongs under --- so that it's visible in review on e-mail, but
not part of commit message itself.

> ERROR: QA Issue: bundler: Files/directories were installed but not shipped
>   /usr/lib/ruby/gems/2.2.0/build_info
>   /usr/lib/ruby/gems/2.2.0/extensions [installed-vs-shipped]
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-ruby/recipes-devtools/ruby/bundler_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/r=
ecipes-devtools/ruby/bundler_git.bb
> index 2adde4d..fc73001 100644
> --- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> +++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> @@ -26,4 +26,6 @@ SRC_URI =3D " \
> =20
>  inherit ruby
> =20
> +FILES_${PN} +=3D "${libdir}/ruby/gems"
> +
>  BBCLASSEXTEND =3D "native"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUroqkACgkQN1Ujt2V2gBxyHwCdHQ/nQYedyw7PAfe4dfYgqy/8
AcYAoJJZ8GY1PXPBqZaDE5x1/KyNDmSt
=dFcp
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
