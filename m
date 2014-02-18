Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE706D14A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:39:13 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so7679313eei.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 05:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RPGyazyXp73jC+fN8bFUvMBUqeOMUBcuU8HPjLNISNM=;
	b=sH7FSbgidLHCEGu+jKvjgb2ts2otkq28+S6m6mL7G042bTjRxm6xCZ/6k+wvkGBjtr
	k4BXHS8+AFKmSFx7jH+wRgN4X3KZV3ex3QUdUVs2K6D0Mp+ib+QOXUK6Rd/t9rUthDV8
	Z9Vr4AU6WbuB2Iy9bnve3A3Is/MoS2i4UdRVvze3w6H/XvT14c4hulldADRuTdzbX1Sj
	YA5U2ZWWNryFuRlk0o8O2AEQ4aGWNI0Rv32Aah6EX0nsHrXAzSZ6mM3f00imFrVnLmMj
	SySEODcf47HxgV5L+Oxs3LuaUW5W448woQSFVVePwmHQUh+1y6iYKx+wE3hnkbOHS3k7
	LnyA==
X-Received: by 10.15.107.77 with SMTP id ca53mr8430314eeb.59.1392730754062;
	Tue, 18 Feb 2014 05:39:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm70290598eep.11.2014.02.18.05.39.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 05:39:12 -0800 (PST)
Date: Tue, 18 Feb 2014 14:39:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140218133944.GJ4067@jama>
References: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
	<20140218114855.GH4067@jama>
	<CAMCfZKFwMmcmTmQ+EyYwaDJXu0o2kzh+KYwnH4h5Q4R2kuqQ0A@mail.gmail.com>
	<20140218123121.GI4067@jama>
	<CAMCfZKGNk3vBd007VD_8qxbq6DTn5NpLPBp3Lc998YseDLCqDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKGNk3vBd007VD_8qxbq6DTn5NpLPBp3Lc998YseDLCqDQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: libao build fails on dora and master
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
X-List-Received-Date: Tue, 18 Feb 2014 13:39:14 -0000
X-Groupsio-MsgNum: 48197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cy9Nn4fUvYST66Pl"
Content-Disposition: inline

--cy9Nn4fUvYST66Pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 09:43:35AM -0300, Diego Sueiro wrote:
> On Tue, Feb 18, 2014 at 9:31 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > > > > libao compiling is failing because of a dependency on esound.
> > > > > Adding EXTRA_OECONF +=3D "--disable-esd" to recipe fix the issue.
> > > >
> > > > Please add PACKAGECONFIG for esound and send such patch, thanks.
> > >
> > > Something link this?
> > >
> > > PACKAGECONFIG ??=3D ""
> > > PACKAGECONFIG[esound] =3D "--enable-esd,--disable-esd,esound"
> >
> > Yes, just replace ??=3D with ?=3D.
>=20
>=20
> Thanks.
> Should I send separate patches for dora and master branches on this list?

Send one for master, wait few days after it's merged to master and if
nobody reports new issue related to that send it for dora branch (you
can send just commit id for cherry-pick).

>=20
>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> Administrador do Embarcados
> www.embarcados.com.br
>=20
> /*long live rock 'n roll*/
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cy9Nn4fUvYST66Pl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMDYqAACgkQN1Ujt2V2gBwHQgCeJ8fBRcWgI+5NoQbUVUf+zQ5n
qDQAoKhhzukzWLfdksdptHRrY2B6fXVO
=qzB+
-----END PGP SIGNATURE-----

--cy9Nn4fUvYST66Pl--
