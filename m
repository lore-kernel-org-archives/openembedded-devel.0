Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id B993160655
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 21:04:28 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rl6so1125530pac.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XPgUe7+blg51Dpc028FDajLMeIoVPAQBqwr0lhWR6Zs=;
	b=XUgAcDqJpVVqj8o9UOBu9pO6p9NIGXxek49MAe/iLz8VX/kF26lgD4k96JuyQ6uBph
	tH7sNTCsl7AwCzmirIpWemapO6AkEaOYPluimW3lPqGFrWAnmbuQ4SFAUiez6Lr4ypGk
	tRFD3ZQi3XUcBAAbmU7uR7r7nJ77azjUP0UIl90wr+kteO2Y5MHZNffBQWyjc1Gk8XAi
	fA1wOWJDA53iHpQ21pTi6ES73ixxVyFFSwKTlZmX8Q5Z+XZYgVEtxPEIfb0/4pc30xcn
	svZhFOAHLOCcQ6sQriuITMGKQSt6GR4sZt0U/Gd+/0AuI5RA9eRyipJBkRs3HGeXg/EV
	0GkQ==
X-Received: by 10.68.233.4 with SMTP id ts4mr4569040pbc.121.1369170269573;
	Tue, 21 May 2013 14:04:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vu10sm4073271pbc.27.2013.05.21.14.04.27 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 21 May 2013 14:04:28 -0700 (PDT)
Date: Tue, 21 May 2013 23:04:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130521210423.GE32431@jama>
References: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
	<CALbNGRSBxa7=dYyX1DetnWOkeEVQ40VisrtLoPNzb4cxg=NMqg@mail.gmail.com>
	<20130521193204.GD32431@jama>
	<CALbNGRTwzk+d+C2y_-PSKD4kWpkG_DEgDfCTGusSeCm6Wjz3qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTwzk+d+C2y_-PSKD4kWpkG_DEgDfCTGusSeCm6Wjz3qw@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 May 2013 21:04:28 -0000
X-Groupsio-MsgNum: 44819
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 09:47:21PM +0200, Andreas M=FCller wrote:
> On Tue, May 21, 2013 at 9:32 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Tue, May 21, 2013 at 09:20:26PM +0200, Andreas M=FCller wrote:
> >> On Tue, May 21, 2013 at 8:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > Hi All
> >> >
> >> > I have run world build on angstrom and here are results if anyone is=
 interested and provide fixes.
> >> >
> >> > http://sakrah.dontexist.org/files/eglibc.beaglebone.world.log
> >> >
> >> > There are a lot of parsing errors especially from meta-opie
> >> >
> >> > Thanks
> >> > -Khem
> >> >
> >> Few errors should be fixed by my last series not yet applied (gtkhtml2
> >> / evince - this is not a ping :)
> >
> > I plan to push it today anyway, I was just waiting for khem's reply
> > about .inc merge :).
> >
> >> For chromium I have fixed some (not yet all) errors which came up with
> >> gcc 4.8 update. Looking into webkit-efl error messages I think there
> >> are similar issues (webkit). Hope to find the time to fix both next
> >> week.
> >
> > current webkit-efl revision was failing near the end while linking, but
> > I wanted to upgrade it anyways (I was using old revision mostly because
> > we didn't have harfbuzz when I was upgrading it for last time), but
> > it's hard to find newer working revision and what's even worse is that
> > only test app for webkit-efl (I know of) is eve which is quite abandoned
> > in upstream and every webkit-efl upgrade in the past required couple of
> > fixes in eve to support new APIs :/.
> >
> > Interestingly last revision I was building today r141868 fails in
> > different places for armv4t, armv5te+armv7a and qemux86-64 :).
> >
> I was also wondering of the passed chromium in the last logs you sent.
> Was this build performed with gcc 4.8 - or was there an update fixing
> builds with gcc 4.8 which I have missed?

My builds were with gcc-4.8 and I see chromium do_compile failing in my=20
last build and the same in khem's log

http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-May/045634.html

| ../../third_party/webrtc/system_wrappers/interface/scoped_ptr.h: In
destructor 'webrtc::scoped_ptr<T>::~scoped_ptr()':
| ../../third_party/webrtc/system_wrappers/interface/scoped_ptr.h:55:18:
error: typedef 'type_must_be_complete' locally defined but not used
[-Werror=3Dunused-local-typedefs]
|      typedef char type_must_be_complete[sizeof(T)];
|                   ^

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGb4VcACgkQN1Ujt2V2gBxdtgCgkokNMwDtFAYpowobt6A6fAx9
GX4AoLUj9kLsGsgNug3XV1OuuyO43/ay
=rJQx
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
