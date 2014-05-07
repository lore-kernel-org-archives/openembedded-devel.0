Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 946B1605F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 17:08:42 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id ib6so1688403vcb.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tdhhwskpErDKWL0WGVgVRzo3vrcKEIF3fpLSQiwpe6w=;
	b=APkaQKzZvgoHcXHc8HTwDJXB/+5L5V8KAOTgDjdJyW3X7RyBGZ/7SmXM1jietQy9Hs
	ERrGos0D1oFlxwE4oKfn0rkifX0M05lO1kto2lltnvzNCX2NznInqhQVzY4E+1/hcBOy
	sbueA+iOBQ3SAD4rAvHDgYtr/Q48OtViqeB8/MSAanSYfJDgeRafrIBsp+Vsdy7PZR/9
	rRZibb1tDorrwaRIP1FJHDnJpeXUDbK3RXtGCMusxcZ6uUqri9e6V1dDGr5+N77PnIWf
	OQVSz2J4llVLGa2h1gvAg6Jt5KleArVjvU3P8zjQPuWblvGYov0hf0iRorGIwr6JQr5y
	lclQ==
X-Received: by 10.53.1.69 with SMTP id be5mr12287635vdd.27.1399482523766;
	Wed, 07 May 2014 10:08:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	zz3sm32831032vdb.21.2014.05.07.10.08.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 10:08:42 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 19:09:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140507170904.GK30955@jama>
References: <1399357964-15638-1-git-send-email-gizero@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1399357964-15638-1-git-send-email-gizero@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libconfig: inherit from autotools-brokensep
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
X-List-Received-Date: Wed, 07 May 2014 17:08:43 -0000
X-Groupsio-MsgNum: 49778
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline

--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 08:32:44AM +0200, Andrea Galbusera wrote:
> do_compile fails otherwise

This looks exactly the same as the patch you sent 2 days before. Is it
v2 or just duplicate?

>=20
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  .../recipes-extended/libconfig/libconfig_1.4.9.bb  |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta=
-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
> index c7d3cf7..22eecf8 100644
> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dfad9b3332b=
e894bab9bc501572864b29"
> =20
>  SRC_URI =3D "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
> =20
> -inherit autotools pkgconfig
> +inherit autotools-brokensep pkgconfig
> =20
>  SRC_URI[md5sum] =3D "b6ee0ce2b3ef844bad7cac2803a90634"
>  SRC_URI[sha256sum] =3D "09c8979252e60193e2969e9b0e1cd597f7820087867989b2=
f0939ad164473041"
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

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNqaLAACgkQN1Ujt2V2gBzr3wCfVvnnWW2dSxDXGPqiR5As3unb
GGEAoLe2nxC84glA62s9QZrIaU8kOgs6
=saDr
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--
