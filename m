Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBE761F47
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:27:51 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1409682eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=axdxlgWqFq8q1hJqCe12uZMzxREGuPzscgzLZnW+aM8=;
	b=TAYJ9CtjVNZ5kqxlbUALAkxYIhwKbw4+TloVKmOLjONb7tjQ4wNBR7SOukfO1yJOJI
	+3lyuQnAobhEoofTzyDfpqc7RPKBDL7OM+xEqDYEKX+ZJM45VpEMx7Ie2mptGbDiszKd
	3K2oVLaMAwkYnTO3zOpkExe03r7n/eVAvVLSNTnAQ5DqlEILHRGTTiGynrmOUuuO8v9k
	oJZ0Hrpjpr3NN4xWzEAqpnAQaclOLCCjR68+N2ZVehqy1R6IQ+oqZKboZ7dAx36N4moY
	dNGD343BVcloXejqM4i4fv+yyQvBhWxLovknF9eUQVAWu4cA7BieLHS/mo32NAi0T9KE
	lDJQ==
X-Received: by 10.15.67.131 with SMTP id u3mr23618591eex.34.1377502071199;
	Mon, 26 Aug 2013 00:27:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm19259013eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 00:27:50 -0700 (PDT)
Date: Mon, 26 Aug 2013 09:29:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130826072900.GN3544@jama>
References: <1377097396-25020-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1377097396-25020-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libungif: update to upstream version 4.1.4
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
X-List-Received-Date: Mon, 26 Aug 2013 07:27:52 -0000
X-Groupsio-MsgNum: 45840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline

--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2013 at 06:03:16PM +0300, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../libungif/{libungif_4.1.3.bb =3D> libungif_4.1.4.bb}            |    =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-extended/libungif/{libungif_4.1.3.bb =3D> libungi=
f_4.1.4.bb} (53%)
>=20
> diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta-o=
e/recipes-extended/libungif/libungif_4.1.4.bb
> similarity index 53%
> rename from meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> rename to meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
> index 3e4b78b..9c9d2ed 100644
> --- a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> +++ b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
> @@ -3,9 +3,9 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04b2917be39b11f78d715=
19a"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "8c198831cc0495596c78134b8849e9ad"
> -SRC_URI[sha256sum] =3D "59e835a57e6df03e4d2253b2357253f3d13da9473ff46556=
3a3b9833a744fc36"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/libungif-4.x/libungif-${PV}/li=
bungif-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "76865bc1bed90ecb5992a1edcc4d6c15"
> +SRC_URI[sha256sum] =3D "708a7eac218d3fd8e8dfb13f1089d4e1e98246985180a17d=
6ecfca5a6bd4d332"
> =20
>  inherit autotools lib_package

I know it isn't new issue caused by this patch, but if you care about
libungif, can you try to resolve this warning:

WARNING: The recipe libungif is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/gif_lib.h
   Matched in manifest-qemuarm-giflib
Please verify which package should provide the above files.

Can we drop libungif and use giflib everywhere now?

> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIbA7wACgkQN1Ujt2V2gBwohgCfTqm7VeNjzHRsqCjrl0DT7wk8
m3sAoJ4gXGhhWnVdtCpvWBwNO+Exq0PB
=bx96
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
