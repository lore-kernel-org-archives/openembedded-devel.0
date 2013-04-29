Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UWtUU-0003aF-WA
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 21:12:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3TIs8bL018338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 11:54:08 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 29 Apr 2013 11:54:08 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id CCD1F7FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 14:52:39 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 294BF43CE6; Mon,
	29 Apr 2013 14:54:06 -0400 (EDT)
Date: Mon, 29 Apr 2013 14:54:06 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130429185405.GA9488@windriver.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<1561352.OujRcMfYWi@helios>
	<5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
	<2803066.5t2BvEp21p@helios> <20130429180113.GC3884@windriver.com>
	<20130429184516.GM3199@jama>
MIME-Version: 1.0
In-Reply-To: <20130429184516.GM3199@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
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
X-List-Received-Date: Mon, 29 Apr 2013 19:13:06 -0000
X-Groupsio-MsgNum: 44503
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to =
meta-networking] On 13.04.29 (Mon 20:45) Martin Jansa wrote:

> On Mon, Apr 29, 2013 at 02:01:14PM -0400, Joe MacDonald wrote:
> > [Re: [oe] [meta-networking, meta-oe][PATCH 0/9] Move networking recipes=
 to meta-networking] On 13.04.16 (Tue 14:22) Paul Eggleton wrote:
> >=20
> > > On Tuesday 16 April 2013 13:30:29 Koen Kooi wrote:
> > > > Op 16 apr. 2013, om 13:19 heeft Paul Eggleton=20
> > > <paul.eggleton@linux.intel.com> het volgende geschreven:
> > > > > On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
> > > > >> These look good to me, but
> > > > >>=20
> > > > >>> iw: move to meta-networking and update
> > > > >>=20
> > > > >> This is receferenced by a packagegroup in meta-oe:
> > > > >> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
> > > > >> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant",=
 "", d)}
> > > > >> \
> > > > >>=20
> > > > >>=20
> > > > >> With the 'meta-oe shall only depend on oe-core' rule,
> > > > >=20
> > > > > Are you sure nothing in meta-oe depends on anything in other laye=
rs within
> > > > > meta-openembedded already?
> > > >=20
> > > > I can't say for certain, but Martin and I have been very strict abo=
ut it in
> > > > the past. If there are such external dependencies they should be lo=
oked at
> > > > and fixed.
> > >=20
> > > At some point I don't think this is going to be realistic - what happ=
ens if=20
> > > you have something in meta-oe that's too generic to be put elsewhere =
and yet=20
> > > has a dependency on something in meta-multimedia or meta-networking? =
It will=20
> > > come up at some point fairly soon.
> > >=20
> > > I can drop the iw patch from this set for the sake of the rest of the=
 patches=20
> > > if you object to moving it, but we do need to do something about this=
 in the=20
> > > near future.
> >=20
> > I'm way behind on my meta-networking stuff but finally getting caught up
> > and I was wondering if we had run this one to ground.  Martin's already
> > merged in most of the other moves and I'm also fine with relocating iw,
>=20
> I hope you don't mind I did merge them. I never merge changes which are
> only for layers with dedicated maintainer, but with this move
> overlapping both layers I took them as nice cleanup.

Not at all!  I appreciated you picking them up for me.

> > but I can see the argument in favour of keeping it in meta-oe.  For now
> > I'm also planning on merging a couple that didn't get picked up already:
> >=20
> >    f501ecadb6 strongswan: move to meta-networking
> >    cdf2bf5654 vsftpd: move from meta-oe to meta-networking and tweak
> >=20
> > I'll also pick up the iw one if there's a consensus that moving it is
> > the right thing (or not a terrible thing) to do.
>=20
> I think the consensus is that iw needs to stay where it is unless stuff
> which references it is also moved or changed (that's why I haven't
> merged this one).

Sure, that makes sense.  We'll leave iw where it is, then, and if it
really makes sense to relocate it into meta-networking in the future,
we'll take a wider view.

Thanks.

--=20
-Joe MacDonald.
:wq

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF+wc0ACgkQPN8S4W6ZZnc7lACeJMOd4Ki49ticDpuaRrTYjipv
qXoAnA83+T9vgZtli4FF5Jsal4TZI95a
=/yRp
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
