Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9A66D925
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 15:40:04 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so1849291eak.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 07:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FX8yLWGe4gr+ejleQVi+Yy35Pr8I/PztN72oCJXziZQ=;
	b=jUQu4qbBCa0XIZQiAbwSbJMcV5aCX26l7MhSxnriCoLb5TKuZaccIgOQ8Ta3t7kXpe
	1n6M5Ka5Y4KzLOa1WYWZQeUX84WTsOsW+ePay2Dx9yMdULTEL0pvPPFUYJ8G9SsrBFWr
	pngW6RUJmTpcPYPPQw9KH04HMuTiPRV94GLu3cnJYRf2RGkwqaIyD6SS8BBvxC0G83SY
	C7i0taVqwGARrGs/meyBzkKQHroMm5O1PMF33NxRkrz/Wh08GHzA2BacUV38XgW3HNoJ
	7WQDjbs+KoZt6Qto6KaHnqL+gG0KjlrBnA0jeFs3ackiwJxT5Q/J+d/mMpoST0+pznru
	pdTQ==
X-Received: by 10.14.210.8 with SMTP id t8mr2655912eeo.39.1385307604275;
	Sun, 24 Nov 2013 07:40:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm35619471eea.10.2013.11.24.07.40.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 07:40:03 -0800 (PST)
Date: Sun, 24 Nov 2013 16:40:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131124154003.GC2870@jama>
References: <alpine.DEB.2.02.1311240834020.2268@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1311240834020.2268@oneiric>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: missing leading space for EXTRA_OECONF_append?
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
X-List-Received-Date: Sun, 24 Nov 2013 15:40:05 -0000
X-Groupsio-MsgNum: 47247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 24, 2013 at 08:35:27AM -0500, Robert P. J. Day wrote:
>=20
>   is this correct?
>=20
> meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append =3D =
"--with-python=3D${WORKDIR}/python"
>=20
> does there not need to be a leading space in that string?

Wrong ML, but yes there should be leading space to be sure.

>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKSHdMACgkQN1Ujt2V2gBz8uQCfZm0z/MkYW1g6ciXReHItkiFv
fNkAniKRY8/nNqAQhK9kbn8SyzHPIc0v
=45Dx
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
