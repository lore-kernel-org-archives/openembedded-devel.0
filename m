Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id D183265E7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:25:26 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2709110eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t4R0/LHnUgKeg5fEosF86Uv5Vu4hpU0IqQ380dURLfs=;
	b=oEh5TOYfdp7yPhrAXYammcXzmByxqbLq7n6WVIqVXvjpUtO9v19Tvw6E2zSjp+/iqy
	P+ikkYWV71A9Ce86W4d26UJwf8xL52pDku7HiCG6TAfWJAturgG+Kp4iA+UklVH3hR0z
	6cIgBcX8Julq+B63Lsq4UQR2Vc0fjBvzn+oz10NpNwQ86NZakMrZdYYS/2tK+hSpx8nc
	ReQbmP91dmLgjG3ESrh3WjlnLvzPZ629QZeBdApmmMt7c26CLxgQ8qnCpFhjN3xkyQKV
	FDOCGyTadB8QTVY7vPBER0t4mGjsyngNDC94+K0vVidop2ClB1MsRa06a+yDOtQlTJs3
	xhBw==
X-Received: by 10.14.109.201 with SMTP id s49mr565660eeg.88.1397118327122;
	Thu, 10 Apr 2014 01:25:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm8163954eex.31.2014.04.10.01.25.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:25:26 -0700 (PDT)
Date: Thu, 10 Apr 2014 10:25:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140410082533.GL2132@jama>
References: <1396860746-17944-1-git-send-email-schnitzeltony@googlemail.com>
	<1396860746-17944-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1396860746-17944-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-gnome] abiword: workaround compile races by disabling parallel make
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
X-List-Received-Date: Thu, 10 Apr 2014 08:25:27 -0000
X-Groupsio-MsgNum: 49152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HVCoas+krw6dou6l"
Content-Disposition: inline

--HVCoas+krw6dou6l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 10:52:26AM +0200, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gno=
me/recipes-gnome/abiword/abiword_3.0.0.bb
> index 69d62ef..875cfd6 100644
> --- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
> +++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
> @@ -24,6 +24,11 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.=
getVar('PV',1).split('.')[1]
> =20
>  inherit autotools pkgconfig
> =20
> +# TBD: fix Makefile
> +# | make[3]: *** No rule to make target `../goffice-bits2/libgoffice.la'=
, needed by `libabiword-3.0.la'.  Stop.
> +# | make[3]: *** Waiting for unfinished jobs....
> +PARALLEL_MAKE =3D ""

BTW: this seems to happen only when something is detected in sysroot
(abiword fails in test-dependencies when building in fully-populated
sysroot and builds ok with minimal).

But maybe it's coincidence..=20

> +
>  PACKAGECONFIG ??=3D "collab-backend-xmpp collab-backend-tcp collab-backe=
nd-service"
>  PACKAGECONFIG[spell] =3D "--enable-spell,--disable-spell,enchant"
>  PACKAGECONFIG[collab-backend-xmpp] =3D "--enable-collab-backend-xmpp,--d=
isable-collab-backend-xmpp,libgsf libxml2 loudmouth"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HVCoas+krw6dou6l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGVX0ACgkQN1Ujt2V2gBwdiQCgsPCHyCPMEMsOOmKmRGx+fToR
oGoAoIb65z3bcBHwfWu9XjktQIt4xxn4
=0Drr
-----END PGP SIGNATURE-----

--HVCoas+krw6dou6l--
