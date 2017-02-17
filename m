Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1E34877342
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:28:17 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1cenGU-0005pB-78 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2017 10:28:18 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 17 Feb 2017 10:28:17 -0800
Received: by burninator (Postfix, from userid 1000)	id 27C47580D09; Fri, 17
	Feb 2017 13:28:17 -0500 (EST)
Date: Fri, 17 Feb 2017 13:28:17 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20170217182816.GD8436@mentor.com>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama>
MIME-Version: 1.0
In-Reply-To: <20170217180254.GA3276@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 18:28:18 -0000
X-Groupsio-MsgNum: 65291
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline

--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Splitting meta-oe?] On 17.02.17 (Fri 19:02) Martin Jansa wrote:

> On Fri, Feb 17, 2017 at 06:24:09PM +0100, Andreas M=FCller wrote:
> > On Fri, Feb 17, 2017 at 6:07 PM, Burton, Ross <ross.burton@intel.com> w=
rote:
> > > The recent storm of breakage in meta-oe caused by recipe specific sys=
roots
> > > was quite dramatic:
> > >
> > > ross@flashheart ~/Yocto/meta-oe ((044e518...))
> > > $ git grep PNBLACKLIST| wc -l
> > > 320
> > >
> > > Is it time to talk about splitting meta-oe into smaller real reposito=
ries
> > > so they can be maintained at their own pace by more maintainers?
> > >
> > > Ross
> > What exactly gets better by splitting?
>=20
> I agree with Andreas.

And I agree with both of you.

> 1) RSS is good thing.
>=20
> 2) The breakage wasn't caused by lack of maintainers (at least I don't
>    think that I or Joe were the bottleneck for integrating the fixes).

My schedule is highly variable but I do try to be responsive to
breakages and I do my best to watch and digest the state of the world
messages, those are extremely valuable IMO.

> 3) More maintainers doesn't mean more contributions from people actually
>    using now broken components, it's actually easier to just send a fix
>    than to be a maintainer of some layer just to be able to also merge
>    your fix yourself.
>=20
> 4) It doesn't look so dramatic if it turns out that 200 of those
>    blacklisted recipes weren't actually used by anyone still active in
>    OE ecosystem.

Agreed.  And if those blacklisted recipes are something that someone
in the ecosystem cares about, they really should be sending fixes back
upstream.  Breaking meta-oe up into smaller parts doesn't seem likely to
make them more likely to send patches, AFAICT.  Probably won't make them
less-so, either, but I don't see changing the structure to be a
significant win.

And do note that when we first created meta-networking I was proposing
it be separate from meta-oe, I'm now completely on the other side of
that argument, for what that's worth.

> 5) If someone wants to replace me as meta-oe maintainer, go ahead, it
>    stopped being fun for me long time ago, now it's just slightly annoying
>    routine which takes my free time I would rather invest in something
>    cooler

I frankly think that'd be a loss for everyone, but it's understandable.
That's a big, largely thankless job you've taken on.  Obviously I can't
offer to take on more of the job than I already have with
meta-networking or I would, but maybe someone else with a similarly "big
picture" view will be able to share some of the workload.

-J.

>=20
> Regards,
>=20
> > Splitting =3D Rotting to death due to unmanageable maintenance burden
> > caused by oe? Don't misunderstand me recipe specific sysroot is
> > basically a good thing. But I am tired of this game. As you can see in
> > meta-qt5-extra: I am interested in having cool images not in a cool
> > build system. Long live core-image-sato!
> >=20
> > Andreas
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYp0DAAAoJEEn8ffcsOfaWfm0H/RMHt3j1I5lYuP0cUQR4sEIa
VBrsL8YSlMTxcGVPsxPpLBHQ7vUj+X7TCHjimypUSkU+k3diaPRwTE2ujW8eYKpB
wusJwZ+hYJJDeg1loxcDUhPNhhGb8ooLZcLOzT9qzjI7sLq303X7PVlr8vxGZ4wP
x81wG1ZKVzKpXm+hpZplS0Hf4BJu3Mx8JrF1TswZMWxqkDLQwUqChf32Sia4mNtr
YhoZSVT7QfgN3eoEdIAolirCtquNXTTTtC4R27+5x9G+LlkX6jVZT7/tH9tbzJu7
beafGo0Br8GwgdexDIN9q3yWtPfuB0mJVx5DB274Y7dcuCO5pwNbG49W6vQQBJg=
=RmGr
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
