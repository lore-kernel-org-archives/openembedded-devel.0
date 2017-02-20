Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 60584601A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 04:28:57 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1cffar-00071l-Dg from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Feb 2017 20:28:57 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 19 Feb 2017 20:28:56 -0800
Received: by burninator (Postfix, from userid 1000)	id D66C25803B0; Sun, 19
	Feb 2017 23:28:55 -0500 (EST)
Date: Sun, 19 Feb 2017 23:28:55 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20170220042855.GM8436@mentor.com>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
	<3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
	<1487561463.17001.28.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1487561463.17001.28.camel@linuxfoundation.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
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
X-List-Received-Date: Mon, 20 Feb 2017 04:28:58 -0000
X-Groupsio-MsgNum: 65329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ubuMVesmirrCclZT"
Content-Disposition: inline

--ubuMVesmirrCclZT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Splitting meta-oe?] On 17.02.19 (Sun 19:31) Richard Purdie wrote:

> On Fri, 2017-02-17 at 14:45 -0500, Philip Balister wrote:
> > And I'm with these gyus. Splitting the git repository doesn't solve
> > any underlying problems. The real problem from my point of view is
> > very few of use are actually paid to maintain the layers we maintain.
> >=20
> > Employers want to pay things they profit from, and that is not paying
> > someone to maintain "core infrastructure".
> >=20
> > Layer maintainers interests change over time, and you burn out
> > supporting people who get to do all the cool stuff with the layers
> > you maintain. In the end, you get all the crap and non of the glory.
> > Within this list, most people appreciate your work. Outside the
> > community, people completely underestimate the amount of work
> > required to keep the ecosystem running.
> >=20
> > Yeah, add my name to the list of cranky people.
>=20
> I do think this is a valid question that Ross asks and that whilst the
> first quick reaction is "no", its worth thinking about the pros/cons.

Absolutely, and that's why I brought up earlier that my initial proposal
for meta-networking was that it be a separate tree from the rest of
meta-oe.  When I first looked at this and what my initial goals were for
meta-networking, it made sense to me to be at arms' length.  Still does,
to be honest, but being several years into the project now I find myself
with a different mindset on the costs/benefits.

> The pros to me would be about better test time on patches and in
> theory more specialist knowledge. This isn't to say Martin/Joe don't
> do a bad job but the size of meta-oe does mean there are limits.

This is the thing that I'd like to get more of your point of view on,
because it doesn't seem clear to me.  Today, a quick survey of meta-oe
shows we have 14 top-level layers in meta-oe (yeah, does seem like a
lot) and of those I maintain one (sharing ownership with Armin when it
comes to anything netkit-related, as noted in the MAINTAINERS file) of
the others only meta-gnome seems to have only Martin listed as a
maintainer (though a few, for example gpe, multimedia and oe, have only
Martin and Koen, so there's certainly a case to be made there for there
being a larger burden on them).

Maybe we're talking specifically about meta-openembedded/meta-oe, in
which case I apologize for derailing the discussion.  I certain tried to
help that situation with creating meta-networking and moving some of the
stuff in meta-oe out into the new layer when we created it, but meta-oe
still is a really big layer (664 recipes if 'find' can be trusted), no
question.

> The cons are more around finding suitable layer maintainers, which as
> we all know are hard to find.
>=20
> I'd probably suggest that:
>=20
> a) We need to encourage/empower more people to maintain layers

Yes, without question.

> b) Having better infrastructure, tools and processes that help a) would
> =A0 =A0therefore be desirable.

The updated patchwork has seriously made my life a lot easier.  And I
don't want to go off too much on an tangent, but I'd really love to
bring meta-selinux into that same fold.

> c) We need to be willing to separate out pieces for people to maintain
> =A0 =A0in such layers. It might not always work out but we should be=A0
> =A0 =A0willing to try.

This is the part I'm still struggling with.  For good or ill
meta-networking got created, I've tried to maintain it reasonably
carefully and along the way the only thing that stands out for me as an
issue while remaining part of the overall meta-openembedded project was
a brief hiccup following the hardware upgrade at the end of December
where I lost the ability to push commits.  But since Martin hadn't, I
just asked him to merge the meta-networking queue I was trying to merge
and that's all sorted out now.

I certainly don't object to having another meta-something in the overall
meta-openembedded project and I don't object to having additional hands
to carry the workload, but I'm not clear how separate git repositories
addresses the current challenge.

> As for the comments about core changes, I really do try hard not to
> make them in many ways. The ones we do make, I'd hope are for the right
> reasons.
>=20
> No easy answers but don't shoot Ross for asking what I think is a
> reasonable question.

I really, honestly did not mean for anything I said to sound like that.
It's good to have this kind of discussion from time to time.  It's very
easy to get stuck in the "this is the way it's always been done" rut, so
I hope Ross didn't feel like anyone was shouting him down.

Wish I was going to be around Wilsonville this week, I'd like to talk
more about this with you all.

--=20
-Joe MacDonald.
:wq

--ubuMVesmirrCclZT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYqnCEAAoJEEn8ffcsOfaWe8UH/3rpoB1XibxsY2vGxqiR6H03
umKIszyQ/WfSxjPctMLmtCYQzCxLg0Q8KRS6s4v6FLpYnANSGSzP2e+/wm8jeYVo
c/IzFKnj+DVjHj9G2d8FZJUX5JIbBM+wkg/6XIz8x/Yd9cblJRdDlNruICeLPN1f
44XzUDZXezdByNn3V2tQD0rsaQ2K+jZCd6nzqhltjySFHo1qhyKTjzKmOednXKIK
yfBvxoo5pmXuH/xPKi2PRq6yanPjOfXtIy8pWKQhfcgBMkkGgzTmTosQdiv084e7
dGx9sEUyp4VzpwCMx4UKNAykyHjAnp3yGH7sIFSYBXi4Gy9c6FlehTAvs8B5fHw=
=prki
-----END PGP SIGNATURE-----

--ubuMVesmirrCclZT--
