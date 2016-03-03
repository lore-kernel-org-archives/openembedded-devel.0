Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8604877038
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:46:46 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1aba91-0002uy-A8 from Joe_MacDonald@mentor.com ;
	Thu, 03 Mar 2016 12:46:47 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 12:46:47 -0800
Received: by burninator (Postfix, from userid 1000)	id 1997E5833BA; Thu,  3
	Mar 2016 15:46:46 -0500 (EST)
Date: Thu, 3 Mar 2016 15:46:46 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160303204645.GF4671@mentor.com>
References: <20160225171903.GC2565@jama> <20160302103341.GA10529@jama>
	<20160302132725.GC12524@mentor.com>
	<1592801.EHfQ34bF0n@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1592801.EHfQ34bF0n@peggleto-mobl.ger.corp.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Still many meta-networking changes waiting in patchwork/master-next
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
X-List-Received-Date: Thu, 03 Mar 2016 20:46:49 -0000
X-Groupsio-MsgNum: 60327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
Content-Disposition: inline

--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Still many meta-networking changes waiting in patchwork/master-ne=
xt] On 16.03.03 (Thu 11:08) Paul Eggleton wrote:

> On Wed, 02 Mar 2016 08:27:26 Joe MacDonald wrote:
> > [Re: [oe] Still many meta-networking changes waiting in patchwork/maste=
r-
> next] On 16.03.02 (Wed 11:33) Martin Jansa wrote:
> > > On Fri, Feb 26, 2016 at 08:39:45PM -0500, Joe MacDonald wrote:
> > > > Hi Martin,
> > > >=20
> > > > [Re: [oe] Still many meta-networking changes waiting in=20
> patchwork/master-next] On 16.02.26 (Fri 20:56) Martin Jansa wrote:
> > > > > On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> > > > > > Hey Martin,
> > > > > >=20
> > > > > > [[oe] Still many meta-networking changes waiting in=20
> patchwork/master-next] On 16.02.25 (Thu 18:19) Martin Jansa wrote:
> > > > > > > Hi Joe.
> > > > > >=20
> > > > > > > there are still 18 meta-networking commits in master-next:
> > > > > > I thought I'd follow up to this and let you know I'll do someth=
ing
> > > > > > with
> > > > > > these before the end of the month.  Almost all of them (waf-sam=
ba
> > > > > > aside)
> > > > > > obviously got missed because I'm watching patchwork based on
> > > > > > 'meta-networking' and none of these had it in the subject line.
> > > > > >=20
> > > > > > I think I've asked before, but are you curating all of those bu=
ndles
> > > > > > by
> > > > > > hand or have you got some machinery that filters patches into
> > > > > > bundles
> > > > > > based on path names in the patches?  Because that would be kind=
 of
> > > > > > neat
> > > > > > to have.
> > > > >=20
> > > > > I think I've answered before, but I'm filtering them manually bas=
ed on
> > > > > subject and also actual paths inside the patch. I also need to ma=
rk
> > > > > them
> > > > > "Accepted", "Superseded", ..  manually, there is git hooks which =
is
> > > > > supposed to mark at least accepted one, but it finds 1 from 1000 =
if
> > > > > any.
> > > >=20
> > > > Yeah, I've seen the hooks trying to find something when I push comm=
its
> > > > and
> > > > just spewing a slew of errors.  I generally do my best to stay on t=
op of
> > > > the status in patchwork, doing it all at one time, though.
> > > >=20
> > > > > This is of course a bit error prone, especially when there are
> > > > > multiple
> > > > > versions of the same patch already in master-next - I usually end=
 up
> > > > > marking all versions merged patch as Accepted (unless I've marked
> > > > > older
> > > > > versions already as Superseded when filtering incoming queue).
> > > >=20
> > > > I took a bit of time this afternoon to try to come up with a way to
> > > > automate at least part of the process for me and I'm sure there's a
> > > > better
> > > > way to do it (hence why I asked again) but since it sounds like you=
're
> > > > doing it by hand for a much larger space than I am, maybe there's n=
ot.
> > > >=20
> > > > Anyway, for what it's worth, here's what I came up with:
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >   =20
> > > >       oe/master-next...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s New
> > > >=20
> > > > Which does pretty well, though it obviously goes a little insane if
> > > > someone puts a ' in the short log, but it didn't seem worth trying =
to
> > > > work
> > > > around that pretty rare (I hope) corner case.  As an aside, the fir=
st
> > > > time
> > > > I did this I was using --format=3D"\"%s\"" and the *very* top commit
> > > > ('recipes: Replace "cp ...) showed me what kind of pain I'm in for =
when
> > > > there are colliding characters in the short log.  It's ugly but not=
hing
> > > > catastrophic.
> > > >=20
> > > > So that gave me 14 of the patches you asked about.  The others were=
 easy
> > > >=20
> > > > to find:
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >   =20
> > > >       oe/master-next...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s Accepted
> > > >=20
> > > > But obviously they haven't been accepted into 'master' next, obviou=
sly
> > > > just a typo or a mis-click at some point.  So that's not bad.
> > > >=20
> > > > Once I had that sanity check done, it's easy to harvest them all:
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >   =20
> > > >       oe/master-next...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{name}" -s new | \
> > > >       sed 's=3D\[.*\] *=3D=3D;s=3D"=3D.=3Dg;s=3D\(.*\)=3D"\1"=3D' |=
 \
> > > >       xargs -r -n1 git log --format=3D"%h" --grep | \
> > > >       xargs -r -n1 git cherry-pick -s
> > > >=20
> > > > The hideous sed in the middle is just to throw out stuff from the
> > > > pwclient
> > > > output that doesn't appear in the git logs (eg. "[v2]") and to skip=
 over
> > > > the craziness that happens on the 'git log grep' if you have a " in=
 the
> > > > subject.
> > > >=20
> > > > Run it a second time to grab the three 'accepted' patches and we're
> > > > nearly
> > > > done.
> > > >=20
> > > > Setting aside all of the inspection steps that follow that nobody w=
ould
> > > > want to automate, the same machinery applies equally well to keeping
> > > >=20
> > > > patchwork up to date:
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >   =20
> > > >       master...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{id}" -s new | \
> > > >       xargs -r -n1 pwclient update -s "accepted"
> > > >=20
> > > > There's not really any point in running this one a second time for =
the
> > > > patches already marked 'accepted'.
> > > >=20
> > > > I've been using a version of this last one for a while now because =
the
> > > > git
> > > > hooks are non-functional.
> > > >=20
> > > > The end result is that my semi-automated process above gets 17 of t=
he 18
> > > > patches you cited and the 18th (waf-samba.bbclass) is a special case
> > > > that
> > > > I don't think could ever be caught except by manual intervention.
> > > >=20
> > > > Mostly just throwing this out there so that maybe it'll help you or
> > > > someone else with similar tasks and maybe someone can look at what =
I'm
> > > > doing and point out obvious flaws / shortcomings / bear-traps /
> > > > improvements.  And also since I haven't bothered to put this into a
> > > > shell
> > > > function or git alias yet, at least my process is archived in the
> > > > mailing
> > > > list and I can find it again if I need it.
> > >=20
> > > Thanks for trying to improve patchwork experience with bunch of scrip=
ts.
> > > Personally I would prefer to just use gerrit (that's why I gave up
> > > trying to work around patchwork issues with scripts and rather sort &
> > > apply the patches manually with just small help from pwclient).
> >=20
> > I've never been a fan of gerrit, but I've only used it on a couple of
> > projects, so I don't really have a lot of experience with it.  Probably
> > obviously, so long as the CLI experience isn't terrible and I can easily
> > script around things that don't work well for me, I can work with almost
> > anything.
>=20
> FWIW, and I know some people may be tired of hearing about this without m=
uch=20
> visible progress, but we still have some people within Intel working on=
=20
> Patchwork as well as some automated patch testing functionality aimed at =
OE=20
> specifically, and they are making progress. I hope to have something to s=
how=20
> pretty soon. It should eliminate a lot of the manual work required with t=
he=20
> current version.

I was wondering about that.  I'm quite looking forward to it.  At the
very least I know newer versions of patchwork than the one we have right
now offer an improved bundle experience.

--=20
-Joe MacDonald.
:wq

--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW2KK1AAoJEEn8ffcsOfaWdqwH/1AFXELxBiFIXVrY6pI2P7w3
zAvi6GGlCSJT+e/dLxpNsef9EaitTq89FRTD007OwXGO8w9JPEF487E6gBy5KPCC
AkvN6/0cCx4d8vudSPTu6X++n3fkRH7c6Q5/M0EkQGAbMyn7UTWAg8rKTfwxDp0e
Yx6I43TrQs3KinS+2ImCvnIfjNo7p7G/ydiqtMcIAJPX7zuVWwsc43LKXGC+UPjp
fQywn59T5WmbePhH/9fxYyRRI1e5IVMhS/wRiZItQAYLORczaiPnK2TGDeVzjn6k
U4wz09fWn6ZIjJJ4ttIYJA0mGpfdpb0mvkRC5DXlI0ID6SNqIOETTGxUWmnPTlw=
=8ewQ
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--
