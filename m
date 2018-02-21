Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE1B78757
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:44:26 +0000 (UTC)
Received: from svr-orw-mbx-09.mgc.mentorg.com ([147.34.90.209])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1eoVdE-0004QH-2J from Joe_MacDonald@mentor.com ;
	Wed, 21 Feb 2018 06:44:28 -0800
Received: from SVR-ORW-MBX-05.mgc.mentorg.com (2002:9322:5acd::9322:5acd) by
	SVR-ORW-MBX-09.mgc.mentorg.com (2002:9322:5ad1::9322:5ad1) with
	Microsoft
	SMTP Server (TLS) id 15.0.1320.4; Wed, 21 Feb 2018 06:44:24 -0800
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Wed, 21 Feb 2018 06:44:23 -0800
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)
	id 2AC6958D5A8; Wed, 21 Feb 2018 09:44:23 -0500 (EST)
Date: Wed, 21 Feb 2018 09:44:23 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20180221144422.6sec4lqytkk4ifyp@mentor.com>
References: <f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
	<20180221142058.GJ4311@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20180221142058.GJ4311@bill-the-cat>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 21 Feb 2018 14:44:27 -0000
X-Groupsio-MsgNum: 70800
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ws6mes72coxy3en7"
Content-Disposition: inline

--ws6mes72coxy3en7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Splitting meta-oe?] On 18.02.21 (Wed 09:20) Tom Rini wrote:

> On Wed, Feb 21, 2018 at 09:02:53AM -0500, Joe MacDonald wrote:
> > [Re: [oe] Splitting meta-oe?] On 18.02.21 (Wed 11:22) Martin Jansa wrot=
e:
> >=20
> > > There is good example of inter-layer dependencies from real world:
> > > http://lists.openembedded.org/pipermail/openembedded-devel/2017-Febru=
ary/111447.html
> > >=20
> > > Do you want
> > > A) new git repository meta-libio-socket-ssl-perl so that meta-network=
ing
> > > will depend on this on instead of whole meta-perl
> > > B) meta-ddclient which will probably depend on both meta-perl and
> > > meta-networking
> > > C) ddclient and its dependencies in meta-perl
> > > D) libio-socket-ssl-perl moved to oe-core, so that next time we can s=
ay
> > > that oe-core is just like old oe-classic just with a bit less stuff i=
n it
> > >=20
> > > Neither of these options is ideal, but meta-networking getting meta-p=
erl
> > > dependency is the one which causes fewest issues to OE users.
> >=20
> > Yeah, I've been thinking about this and trying to decide what is the
> > "right" thing to do here.  Because I already have added layer
> > dependencies in meta-networking that I didn't originally envision, so
> > what's one more that is, as you say, almost certainly in the majority of
> > consumers' projects anyway?  But it does force a new layer dependency on
> > consumers of the meta-networking layer who may not care about ddclient,
> > and I'd like to avoid that if possible.
> >=20
> > Honestly, now that I'm back from my vacation, I think the right thing is
> > to add the dependency and then start thinking about a way to specify
> > layer dependencies with greater granularity than on a meta-layer basis.
> > Like, there's no question meta-networking depends on core.  It's
> > nonsense to think of it without that dependency.  But it'd be nice to be
> > able to specify a layer dependency that only exists if your project
> > includes specific recipes out of that layer.
> >=20
> > But that kind of mechanism seems highly prone to breakage and likely to
> > be highly contentious even if it was shown to be reliable, so it may not
> > get beyond a "that'd be nice" thing for me.
> >=20
> > Unless someone else has already implemented it and I'm just not aware of
> > how to use it?  :-)
>=20
> One thing I've been thinking about is that some layers need more
> sub-layers.  Taking a very tiny peek into meta-networking, perhaps
> re-organize into meta-networking-core, meta-networking-iscsi,
> meta-networking-vpn, etc.  Or maybe that won't help with dependencies.
> But the need for layer X for a single recipe can sometimes I think be
> solved by re-thinking the layer.

I really like that idea.  We effectively started that with the netkit
stuff when Armin first submitted it, so making it more formal isn't a
big step anyway.

> All that said, it might be better instead to add something like
> RECIPE_LAYERDEPENDS so that for the one-or-two offs, the recipe will
> fail to build (and implement that similar to the logic in
> image-container.bbclass? so that you only get a failure on building that
> recipe rather than anything in the layer) ?

Yeah, that's kind of what I'd been thinking.  In the short term, though,
the reorg you suggested above sounds *very* appealing to me at first
glance.  Might be a "let's do both" situation.

--=20
-Joe MacDonald.
:wq

--ws6mes72coxy3en7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlqNhcYACgkQSfx99yw5
9pY6fwgAwYDUPVrlWSzOPHgUREtP2IodZXNCe2vSy5NeQj0bjTqsA6j5fcv+6R0b
u+XQegK+9906S041W5abi8pkNQtf9NF+fVVE4At1vl9PQ4aHbVwI2O7EZZveLJAZ
v9Ih2vDdbGj3jfvzd9sctItLxvr+5aB/PLcfo0YCGnQB1Slg9M6DLwlC0dSjeQvQ
gGt054ACt/N06gdfesR3t59ykVj4cB7iziXPtMTi4z6LyWyT9qVKlgiqKHJ7xQds
/R8G3sY9ePr6ag9VpeOFQMBJ/kPvzBsS6ylUet4msZRgovwmzCt29DvcMk/6CXmC
J1gnhYThKYsF3a5xxI+F8fNbUcf+LA==
=wuli
-----END PGP SIGNATURE-----

--ws6mes72coxy3en7--
