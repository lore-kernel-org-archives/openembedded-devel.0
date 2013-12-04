Return-Path: <joe@deserted.net>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id A5EA56D761
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 21:10:21 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so11033941eak.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 13:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=FrvZY+sMDOilZV4ischNCJkNiIAzf0yOnvKt0lpTJjg=;
	b=IiE9+wHcfoY1gS3+C16uKHnx0o4t0gJRSr/NHvp1jxvcIDkRDXJ078I+tegz5Yh1pV
	KP8pkKmKCq8a857uB8pFSJyrkd8WNF9kAYqlfKv8263bDloQ/FrCKFxqvzSUbn2mZEt6
	5CvzELFO+xl8wPuBOcF90+qdru/u3/NsIquNKe661gzS+WT+1WubHqQ4IQmg+xoDkaz6
	0ojB2F1DSagKTrilx1vic0e8PcaiTOfipnkaK8LumT+chu7SspiDQURjYJTLuHoRIzFl
	LxWrkpDnGJWfwrMWq+59yfcr9PwDTY1Dofs5fEWbxkwbzGruZEL6l2xLmJDwRj+SwfI4
	bFXQ==
X-Gm-Message-State: ALoCoQkxL3ZKLJDKj1/Cq/AvsU8QuOPO0J1dFMqN6niLyliuzfWmMxG0MISb4XM8igZp9u6Yk6t9
X-Received: by 10.14.215.199 with SMTP id e47mr1371171eep.107.1386191420310;
	Wed, 04 Dec 2013 13:10:20 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id a51sm98469612eeh.8.2013.12.04.13.10.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Dec 2013 13:10:19 -0800 (PST)
Date: Wed, 4 Dec 2013 16:10:15 -0500
From: Joe MacDonald <joe@deserted.net>
To: jackie.huang@windriver.com, koen@dominion.thruhere.net
Message-ID: <20131204211012.GE5677@deserted.net>
References: <1386153235-16411-1-git-send-email-jackie.huang@windriver.com>
	<l7n0m9$4go$1@ger.gmane.org> <20131204134937.GA5677@deserted.net>
MIME-Version: 1.0
In-Reply-To: <20131204134937.GA5677@deserted.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error
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
X-List-Received-Date: Wed, 04 Dec 2013 21:10:23 -0000
X-Groupsio-MsgNum: 47377
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline

--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error]=
 On 13.12.04 (Wed 08:49) Joe MacDonald wrote:

> [Re: [oe] [meta-networking][PATCH 1/2] inetutils: fix simple bb rule erro=
r] On 13.12.04 (Wed 11:39) Koen Kooi wrote:
>=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > jackie.huang@windriver.com schreef op 04-12-13 11:33:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >=20
> > > Correct the usage of alternative link and target:
> >=20
> > Make the above the summary, 'fix simple bb rule error' is too vague when
> > looking through the output of 'git log --oneline'
>=20
> Agreed.  If there's no objection, I'll change this to:
>=20
> inetutils: use new update-alternatives syntax
>=20
> Though that does tend to render the rest of the commit log redundant.
> :-)

Okay, I went ahead and merged what I suggested I would.  I'm seeing QA
issues with bad RPATH values, but those don't appear to be new, so I'll
look at them separately.

-J.

>=20
> -J.
>=20
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> > Comment: GPGTools - http://gpgtools.org
> >=20
> > iD8DBQFSnwZqMkyGM64RGpERAvn8AJwJgmIczTwCWNuTe6TdkiGUyl+kKgCdHrcA
> > ub+FZU7aXb7K84C447kCCqk=3D
> > =3D6wkg
> > -----END PGP SIGNATURE-----
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKfmjQACgkQwFvcllog0XwbFQCghYrCyCzHOUdpwVyIHH4lucI2
T/UAoJeIB0j3nXbSPla9sQm2b6L0+5H9
=hUGq
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
