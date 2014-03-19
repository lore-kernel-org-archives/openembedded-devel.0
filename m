Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 437E76EA2F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 14:15:02 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so6665292eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f5jzciRwa5hj331QghTL1dBWllq7IALzWQ0KFs9/nVk=;
	b=ZkdZGBGP5dJkLtW078KpTI6C5680kubD+VpoH8ggYuO6KxTv/6MZPu1He4wv6Wj0aJ
	lqvAF2qd8/U6xGSV3f2CpYzub3KSEfQBiADPCtf8MaKVjsij2BXxC7kC9DArycFOIlYf
	Z2ljOivZPauojarUFNrQ6duws8r96zN3uebO+FnWK9qcPRx0UhzU9ytr0M23Jx1PzxXh
	6SyhED4BQEEHUZscM4TbNGHGAH9Aii4e5A3uT6gDaNkw/hLvduqCoAskn4PhY5kovF4i
	ae44kKI2rzhpa03A7M1Xdm/pvTnSPPAbq9Qnb940hkfTrLq3cDGgdifGXiHXgC1Gw5/I
	gKog==
X-Received: by 10.15.45.130 with SMTP id b2mr36075787eew.28.1395238502823;
	Wed, 19 Mar 2014 07:15:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm22408595eef.20.2014.03.19.07.15.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 07:15:01 -0700 (PDT)
Date: Wed, 19 Mar 2014 15:15:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140319141501.GA3726@jama>
References: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
	<2836509.grP80ui5Ay@koontz>
	<CAPbeDCkN2jeKJr-+0hV0DWvJ1v26a8WYHb3wn1u1Novssa7_=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPbeDCkN2jeKJr-+0hV0DWvJ1v26a8WYHb3wn1u1Novssa7_=Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: sgh@sgh.dk
Subject: Re: [meta-qt5][PATCH] qtbase: Add libxi to depends.
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
X-List-Received-Date: Wed, 19 Mar 2014 14:15:04 -0000
X-Groupsio-MsgNum: 48759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2014 at 02:56:18PM +0100, Jacob Kroon wrote:
> Maybe do something this instead ? This is only necessary for X11 right ?
>=20
> -DEPENDS +=3D "qtbase-native"
> +DEPENDS +=3D " \
> +    qtbase-native \
> +    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxi', '', d)} \
> +"
>=20
> /Jacob

I think it belongs to
PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"

> On Wed, Mar 19, 2014 at 2:45 PM, S=F8ren Holm <sgh@sgh.dk> wrote:
>=20
> > I'd like this to go into dora if possible.
> >
> > Sorry for the double posts :)
> >
> > --
> > S=F8ren Holm
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20
> --=20
>   -- Jacob
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMppmUACgkQN1Ujt2V2gBycDACeKf+3ibiQ0IT3l/Zb9u1HgWGg
yU8An3/VFjKD0CK4c1Obmcch6tmCvTwF
=N8fJ
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
