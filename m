Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWtLh-0002sT-NA
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 21:03:00 +0200
Received: by mail-pa0-f51.google.com with SMTP id lj1so1111438pab.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AkBdC4zrz/nRiVgoB2pQqXPzdb64aWmNDR3fz6py6i8=;
	b=ULSODwafZXguOG27YzAzM+0QS/F7xta43AxNOSTVPHl0iogLHtUbIJN0W9EnrxYnVJ
	hFkyckHdq+JSoG0UuGNZ2ptASe5MuLTiyRs+Ip3egNCjw+bPuRq3SYe5CkBJTk9+s5en
	WSg6eTQaObCLfR/fq1HsuagMWr4+E2TudEwU1yinqs9QcEer/qbgvU+TQvqugp36BGoU
	lx9w+/klWaAP2TLp49AuhYVwLdf56LAVK9HTTWnObS91aVO2yQrk8HtW64USOk9NSxGo
	xmDWSQHvtt8x0Yh8WV/thE3zXGTzwLhmclPZbVmoP6zv0pYqz16UOxc/31IyzzxXnJRc
	J6Rg==
X-Received: by 10.66.138.109 with SMTP id qp13mr43561636pab.127.1367261103398; 
	Mon, 29 Apr 2013 11:45:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	iy2sm25061121pbb.31.2013.04.29.11.45.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 11:45:02 -0700 (PDT)
Date: Mon, 29 Apr 2013 20:45:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130429184516.GM3199@jama>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<1561352.OujRcMfYWi@helios>
	<5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
	<2803066.5t2BvEp21p@helios> <20130429180113.GC3884@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130429180113.GC3884@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Mon, 29 Apr 2013 19:03:11 -0000
X-Groupsio-MsgNum: 44502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSyhVCl2eeZHT0Rn"
Content-Disposition: inline

--KSyhVCl2eeZHT0Rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 02:01:14PM -0400, Joe MacDonald wrote:
> [Re: [oe] [meta-networking, meta-oe][PATCH 0/9] Move networking recipes t=
o meta-networking] On 13.04.16 (Tue 14:22) Paul Eggleton wrote:
>=20
> > On Tuesday 16 April 2013 13:30:29 Koen Kooi wrote:
> > > Op 16 apr. 2013, om 13:19 heeft Paul Eggleton=20
> > <paul.eggleton@linux.intel.com> het volgende geschreven:
> > > > On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
> > > >> These look good to me, but
> > > >>=20
> > > >>> iw: move to meta-networking and update
> > > >>=20
> > > >> This is receferenced by a packagegroup in meta-oe:
> > > >> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
> > > >> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "=
", d)}
> > > >> \
> > > >>=20
> > > >>=20
> > > >> With the 'meta-oe shall only depend on oe-core' rule,
> > > >=20
> > > > Are you sure nothing in meta-oe depends on anything in other layers=
 within
> > > > meta-openembedded already?
> > >=20
> > > I can't say for certain, but Martin and I have been very strict about=
 it in
> > > the past. If there are such external dependencies they should be look=
ed at
> > > and fixed.
> >=20
> > At some point I don't think this is going to be realistic - what happen=
s if=20
> > you have something in meta-oe that's too generic to be put elsewhere an=
d yet=20
> > has a dependency on something in meta-multimedia or meta-networking? It=
 will=20
> > come up at some point fairly soon.
> >=20
> > I can drop the iw patch from this set for the sake of the rest of the p=
atches=20
> > if you object to moving it, but we do need to do something about this i=
n the=20
> > near future.
>=20
> I'm way behind on my meta-networking stuff but finally getting caught up
> and I was wondering if we had run this one to ground.  Martin's already
> merged in most of the other moves and I'm also fine with relocating iw,

I hope you don't mind I did merge them. I never merge changes which are
only for layers with dedicated maintainer, but with this move
overlapping both layers I took them as nice cleanup.

> but I can see the argument in favour of keeping it in meta-oe.  For now
> I'm also planning on merging a couple that didn't get picked up already:
>=20
>    f501ecadb6 strongswan: move to meta-networking
>    cdf2bf5654 vsftpd: move from meta-oe to meta-networking and tweak
>=20
> I'll also pick up the iw one if there's a consensus that moving it is
> the right thing (or not a terrible thing) to do.

I think the consensus is that iw needs to stay where it is unless stuff
which references it is also moved or changed (that's why I haven't
merged this one).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KSyhVCl2eeZHT0Rn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF+v7wACgkQN1Ujt2V2gBydPQCcCk/RfkqPKbrgWmADdZ+6NIx6
PawAoJT9JZO7y77NYbAJofQ/hokvzyU/
=N5yl
-----END PGP SIGNATURE-----

--KSyhVCl2eeZHT0Rn--
