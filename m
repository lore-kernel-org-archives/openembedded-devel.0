Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvpJs-0003xF-S5
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 14:15:49 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so1461456pad.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 05:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MShaYJixiPEGwM7Pg4BtzWJ+p2r4O47+Yrg5oIoPdDs=;
	b=J2qF+56HLDfvA0yzpX70a96glhaiRJlMrRvr4dXrV0VvImiq9rYlneknzvIJy9rrYl
	+1VdDxAQrpgTAGuE6V7oux2g0+XT11GdVbFlyV+E31HfSTsYUOWsqI2q0Sy4XQoBqSO6
	t2kRz4oqQFrpPiGm2yGOlNEsYqU2GU5P1+jFga0jYsKnX04xpMSDIdUDi5AGQ6t5Xvv4
	NB5jA3ktiyPPRVLb4d9aoBauw/o+11oEAixGKYuEr34V7AxQAtv/fgCqaz8SNmhY/cCn
	k1DOztgj8rdUbA7Jh+MzjtCGyC4fk1WImcrXGAYIWJTlcKAagWflDP9v/7JZJoPTSHzc
	tU0g==
X-Received: by 10.68.231.40 with SMTP id td8mr13169544pbc.48.1358427625195;
	Thu, 17 Jan 2013 05:00:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id is3sm1055883pbc.6.2013.01.17.05.00.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 05:00:24 -0800 (PST)
Date: Thu, 17 Jan 2013 14:00:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130117130019.GH3067@jama>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
	<CALbNGRS645Gs8Dbb=qHiwxC11LnN5hh404XQ1H9vQ_tQqjzVyA@mail.gmail.com>
	<CALbNGRSMqRuuLUioaMbv9zeBAkVD0haCLy17_bFb5iH1R9WT1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSMqRuuLUioaMbv9zeBAkVD0haCLy17_bFb5iH1R9WT1w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][PATCH 1/4] bluez4: Package systemd service
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
X-List-Received-Date: Thu, 17 Jan 2013 13:15:49 -0000
X-Groupsio-MsgNum: 42727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline

--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 05:56:00PM +0100, Andreas M=FCller wrote:
> On Tue, Jan 15, 2013 at 12:39 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> >> +SYSTEMD_AUTO_ENABLE =3D "disable"
> > This is quite interesting: For my first tests I also added the
> > 'disable' but I could not get bluez start automatically so I decided
> > to start it at boot time. Maybe it is related to that I did not yet
> > find a way to setup my bluetooth device automatically. It still needs
> >
> > hciattach ttyO1 csr
> >
> > Which service starts blues if not enabled?
> >
> > Andreas
> I finally have an idea how blues service is started automatically. So
>=20
> SYSTEMD_AUTO_ENABLE =3D "disable"
>=20
> is the better default. Therefore

This patch adds bluez4 bbappend in wrong directory (meta-oe instead of
oe-core), I'll fix it before merging it.

The same does apply to portmap and ofono bbappend.

> Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD39eMACgkQN1Ujt2V2gBxzkwCgsHhgnDolaitpoxWT/C18Og9b
Pl0An3dJzfl41rhoO7PPQibtuSNUwemt
=kGyq
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--
