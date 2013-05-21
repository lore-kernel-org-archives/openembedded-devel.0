Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 38C8E6A407
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 19:32:10 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so937475pbb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U6CycbjhnS7IUhW8AdnhKLz45PRUn8gEW3H+OEI38+c=;
	b=BF0vLwYKqkC0bcRXpL1VGhg6k2+N5CWeI9o3VY2TkaGnKsGa63cKbt8xNCx0nhP3FY
	Z38y/T308pDt66MpgNcaRtwd4MuJUSYRaRTYkYSPVsbYRCLnHHT8TS2IV234E2SqXCqH
	KwdMo2vA9Sah4kqHRmu8j01uRAp8/XasqFDgHzZDUXiTVc/QKFpVV6AMEc65l2wIWzGT
	flwQv/nTPfnT5X917dZLmhCWbh/pqP7ktS6jwjyjS7w8mpuYAShcpp9fiRuMhMMDafv+
	EW0Csxr2ri/xja1V3wnQi80f7fVd/8tJHSUIjztvDFhAzu7XtVrSZgcvALslov3vX2YS
	b0Yw==
X-Received: by 10.68.234.100 with SMTP id ud4mr4372317pbc.9.1369164731187;
	Tue, 21 May 2013 12:32:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	xu10sm4536776pab.3.2013.05.21.12.32.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 21 May 2013 12:32:10 -0700 (PDT)
Date: Tue, 21 May 2013 21:32:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130521193204.GD32431@jama>
References: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
	<CALbNGRSBxa7=dYyX1DetnWOkeEVQ40VisrtLoPNzb4cxg=NMqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSBxa7=dYyX1DetnWOkeEVQ40VisrtLoPNzb4cxg=NMqg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: world build on angstrom-next
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
X-List-Received-Date: Tue, 21 May 2013 19:32:10 -0000
X-Groupsio-MsgNum: 44815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline

--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 09:20:26PM +0200, Andreas M=FCller wrote:
> On Tue, May 21, 2013 at 8:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi All
> >
> > I have run world build on angstrom and here are results if anyone is in=
terested and provide fixes.
> >
> > http://sakrah.dontexist.org/files/eglibc.beaglebone.world.log
> >
> > There are a lot of parsing errors especially from meta-opie
> >
> > Thanks
> > -Khem
> >
> Few errors should be fixed by my last series not yet applied (gtkhtml2
> / evince - this is not a ping :)

I plan to push it today anyway, I was just waiting for khem's reply
about .inc merge :).

> For chromium I have fixed some (not yet all) errors which came up with
> gcc 4.8 update. Looking into webkit-efl error messages I think there
> are similar issues (webkit). Hope to find the time to fix both next
> week.

current webkit-efl revision was failing near the end while linking, but
I wanted to upgrade it anyways (I was using old revision mostly because
we didn't have harfbuzz when I was upgrading it for last time), but
it's hard to find newer working revision and what's even worse is that
only test app for webkit-efl (I know of) is eve which is quite abandoned
in upstream and every webkit-efl upgrade in the past required couple of
fixes in eve to support new APIs :/.

Interestingly last revision I was building today r141868 fails in
different places for armv4t, armv5te+armv7a and qemux86-64 :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGby7QACgkQN1Ujt2V2gBzVMACgtz2wK1olZhXXjiYiogN0aXLW
/mQAn0dGsWLBni4Igb2bO3/aR6X+Ii4G
=c8BY
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
