Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7FD6D157
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:31:22 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so4337569eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XPYAtsCixZtiXgO7h2YnNu24HoAYTekdVZ3FBBYUP+s=;
	b=oc0Y8c7VY+OYPn08Z8Z8keF2hFhFOyQ9gQsCAq4t2luHdzynjhX78+q9KUt4JSu/sj
	CJUslMGEya0tJCGkpl1bUgeLF3lGJvsMSzK5wvAWc+ZL/yeKVKyeqlSCs+/t12H3oyvt
	21+MF77JVDqB/GiV+YpeOp0jp45r/VQcGe2zrBnCg60wiBoY6zKm8ldUakSiDXM6vhhj
	cxP3vqUItNeOaOOoHnGDo+fsqJE1BLeHgm2rhgyoO7brDfiziypbIKoh9nAkBGJhrRgN
	aavpB2zr6mghzpffrT9Vm88BQmIYLmXTA/JPbMHT21qymCn8OKbzrHhKCn6S/xRxYLzI
	SE8g==
X-Received: by 10.14.95.2 with SMTP id o2mr4087443eef.69.1394548282877;
	Tue, 11 Mar 2014 07:31:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm58133505eeu.0.2014.03.11.07.31.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 07:31:21 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:31:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311143134.GF2137@jama>
References: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B57548165@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B57548165@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Tue, 11 Mar 2014 14:31:23 -0000
X-Groupsio-MsgNum: 48597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline

--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 08:41:21AM +0000, Matthieu CRAPET wrote:
> Hi,
>=20
> Does it mean that " allarch " is incompatible with "autotools" ? Is this =
true for all recipes?

No, autotools (the -native tools used by this bbclass) are OK, only
problem is when it tries to use CC (which is TUNE_PKGARCH specific).

There are even some recipes which are using autotools and were detecting
CC in configure.ac without any good reason, so they were patched to stop
doing this and to allow using allarch.

allarch.bbclass now resets couple variables to make sure that configure
will at fail if it tries to detect CC.

> -----Message d'origine-----
> De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembe=
dded-devel-bounces@lists.openembedded.org] De la part de Martin Jansa
> Envoy=E9=A0: jeudi 6 mars 2014 18:05
> =C0=A0: openembedded-devel@lists.openembedded.org
> Objet=A0: [oe] [meta-oe][PATCH] bash-completion: remove allarch
>=20
> * it has runtime dependency on TUNE_PKGARCH bash, so it cannot be allarch
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.=
bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> index ad7fd28..155fe90 100644
> --- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> +++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> @@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "e5a490a4301dfb228361bdca2ffca59=
7958e47dd6056005ef9393a5852
> =20
>  PARALLEL_MAKE =3D ""
> =20
> -inherit allarch autotools
> +inherit autotools
> =20
>  do_install_append() {
>  	install -d ${D}${sysconfdir}/bash_completion.d/
> --=20
> 1.9.0
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfHkYACgkQN1Ujt2V2gBx+ewCgqybR9/fx7gD5qf7NKLPuqM/s
aQAAn29DG4yxLze7U1ctidgGkDEDwCYO
=48zL
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
