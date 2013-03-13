Received: from mail-gg0-f181.google.com ([209.85.161.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFpMu-0002AJ-5S
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 18:21:42 +0100
Received: by mail-gg0-f181.google.com with SMTP id e5so206278ggh.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pWKJgIQsL1a8xomLTybXCSb9IvZfovVO9qLQ6gk1i14=;
	b=ir6R/kWI+L4QfHhd0KBEFYEpdcuR9Ae92yXbMhxgnxrHPGHkCFI1IpdsmYR3b9pk/e
	eyHULXtnUU+MzpMJjdTWVV2SQERg51YsenVMEgItqpuZYd4UzqAynms12nX12nrFO5ct
	jXcequ56Mbdb2rkcC10c0SKJLyArw2PgrP7L7xgW0m+HtwPziqFvju0IG2gHfzA2EC9M
	xbboP9wTZMW9lqysA0VkeOksgyL92T4WjTmUMfdlcSfzO7U7tns8PQY4mXyAYIWRe72t
	iKoRXhVyGAlz654NtItNyR5EEczXds5AQvRoq/4ClVbC9Z9AKT9baMf9OlWR9/7j3KBU
	Ga9Q==
X-Received: by 10.236.59.97 with SMTP id r61mr16055567yhc.103.1363194294884;
	Wed, 13 Mar 2013 10:04:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id n2sm36452644yhm.1.2013.03.13.10.04.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 10:04:53 -0700 (PDT)
Date: Wed, 13 Mar 2013 18:04:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313170447.GE3260@jama>
References: <cover.1362831936.git.apelete@seketeli.net>
	<73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
	<3C660C3C-34A4-4805-B6C0-E49AC8EEED55@gmail.com>
	<20130309195424.GA6272@hermes>
MIME-Version: 1.0
In-Reply-To: <20130309195424.GA6272@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH v2 1/2] gnutls: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 17:21:51 -0000
X-Groupsio-MsgNum: 43543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSMWOr4h/ZU3vZ/E"
Content-Disposition: inline

--aSMWOr4h/ZU3vZ/E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 08:54:24PM +0100, Apelete Seketeli wrote:
> Le 09-Mar-13, Khem Raj a =E9crit:
> >=20
> > On Mar 9, 2013, at 4:38 AM, Apelete Seketeli <apelete@seketeli.net> wro=
te:
> >=20
> > > -SRC_URI =3D "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;na=
me=3Dgnutls"
> > > +SRC_URI =3D "ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${PV}.t=
ar.bz2;name=3Dgnutls"
> >=20
> > can we use PV instead of 2.10 ? if not then move SRC_URI out of .inc in=
to .bb
>=20
> PV is actually 2.10.4 here, it can't be used instead of 2.10 it seems.
> I'll move SRC_URI into .bb then.

In couple of recipes we're using:
SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split(=
'.')[1]}"
SRC_URI =3D "http://download.gnome.org/sources/${PN}/${SHRT_VER}/${PN}-${PV=
}.tar.gz"

This could be applied here too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aSMWOr4h/ZU3vZ/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAsa8ACgkQN1Ujt2V2gBwSpgCgmbmBPtsNX+iM/Hks3Qc9tgh8
wUgAn07mW58G1rWS7SbRAyo6ujIsKT1H
=CuHf
-----END PGP SIGNATURE-----

--aSMWOr4h/ZU3vZ/E--
