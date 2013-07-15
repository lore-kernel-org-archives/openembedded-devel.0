Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6710661663
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:42:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FHgS9b014081
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jul 2013 10:42:28 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 10:42:26 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id B4CE67FE4;
	Mon, 15 Jul 2013 13:41:59 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 435FC410DF; Mon,
	15 Jul 2013 13:42:25 -0400 (EDT)
Date: Mon, 15 Jul 2013 13:42:25 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130715174224.GE3842@windriver.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<20130715123759.GB3842@windriver.com>
	<CAP9ODKp3=Lf7C710t8AeC+o9jA46oQFEokUiHuSW+L4W-uJFJA@mail.gmail.com>
	<5498122.1xgS5ZiCM9@helios>
	<CAP9ODKqjG_Nj-mthddkf38--f79T=VhZjt9k0oPZwUJc187wTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqjG_Nj-mthddkf38--f79T=VhZjt9k0oPZwUJc187wTg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][PATCH 0/3] Add mosh and dependencies
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
X-List-Received-Date: Mon, 15 Jul 2013 17:42:55 -0000
X-Groupsio-MsgNum: 45379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline

--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH 0/3] Add mosh and dependencies] On 13.07.15 (Mon =
13:40) Otavio Salvador wrote:

> On Mon, Jul 15, 2013 at 12:36 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Monday 15 July 2013 12:02:59 Otavio Salvador wrote:
> >> On Mon, Jul 15, 2013 at 9:37 AM, Joe MacDonald
> >>
> >> <Joe.MacDonald@windriver.com> wrote:
> >> > [[oe] [meta-oe][PATCH 0/3] Add mosh and dependencies] On 13.07.13 (S=
at
> > 15:47) Paul Eggleton wrote:
> >> >> Add a recipe for mosh, and for dependencies migrate libio-pty-perl =
=66rom
> >> >> OE-Classic and bring in protobuf from meta-virtualization.
> >> >>
> >> >> I considered putting this in meta-networking, however meta-virtuali=
zation
> >> >> will still need protobuf and it already depends on meta-oe, and
> >> >> officially meta-networking does not depend on meta-oe so splitting =
these
> >> >> would not really work with the current layer dependencies.
> >> >
> >> > That's not strictly true anymore, actually.  It was my intent and I
> >> > think there's value in it, but CRDA (already in meta-networking) dep=
ends
> >> > on python-m2crypto (in meta-oe).  I discovered it in my world build a
> >> > few weeks ago and hadn't yet managed to get round to seeing if there=
 was
> >> > a clean way to separate the two.
> >> >
> >> > I absolutely don't want the stated intent that meta-networking be
> >> > standalone be a barrier to adding packages to it that clearly belong=
 to
> >> > it.
> >> >
> >> > That's my way of saying I've no objection right now to including thi=
s in
> >> > meta-net.
> >>
> >> I agree; maybe we could add those inside meta-oe subdir? so people can
> >> opt in enable them or not.
> >
> > Sorry Otavio, what are you suggesting exactly?
>=20
> To have a meta-networking/meta-oe with recipes which requires it.

Oh.  That's an interesting idea.  I guess the argument against that is
the support infrastructure has a reasonable home in meta-oe and nobody
wants meta-oe to depend on meta-networking.  I do think that having some
mechanism for keeping meta-net reasonably standalone but still not full
of stuff that's on there to satisfy dependencies is good, though.
Haven't really thought much about this yet, though.

-J.

>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHkNIAACgkQPN8S4W6ZZnftogCcC48uFVmuAbQ3IrXtOzcv3Aw9
F6cAn2avTu12aH3CUjwZvYn5632DPet8
=zeVH
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
