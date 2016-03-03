Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 666E177038
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:49:07 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1abaBI-0003M2-7g from Joe_MacDonald@mentor.com ;
	Thu, 03 Mar 2016 12:49:08 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 12:49:08 -0800
Received: by burninator (Postfix, from userid 1000)	id 12DE45833BA; Thu,  3
	Mar 2016 15:49:07 -0500 (EST)
Date: Thu, 3 Mar 2016 15:49:07 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20160303204906.GG4671@mentor.com>
References: <20160225171903.GC2565@jama> <20160226181315.GA6310@mentor.com>
	<20160226195617.GA2554@jama> <20160227013944.GB6310@mentor.com>
	<20160302103341.GA10529@jama> <20160302132725.GC12524@mentor.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C80C833@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C80C833@ALA-MBA.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 03 Mar 2016 20:49:07 -0000
X-Groupsio-MsgNum: 60328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Content-Disposition: inline

--c7hkjup166d4FzgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] Still many meta-networking changes waiting in patchwork/master-ne=
xt] On 16.03.03 (Thu 02:51) Huang, Jie (Jackie) wrote:

>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> > Sent: Wednesday, March 02, 2016 9:27 PM
> > To: Martin Jansa
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] Still many meta-networking changes waiting in patchwo=
rk/master-next
> >=20
> > [Re: [oe] Still many meta-networking changes waiting in patchwork/maste=
r-next] On 16.03.02 (Wed
> > 11:33) Martin Jansa wrote:
> >=20
> > > On Fri, Feb 26, 2016 at 08:39:45PM -0500, Joe MacDonald wrote:
> > > > Hi Martin,
> > > >
> > > > [Re: [oe] Still many meta-networking changes waiting in patchwork/m=
aster-next] On 16.02.26 (Fri
> > 20:56) Martin Jansa wrote:
> > > >
> > > > > On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> > > > > > Hey Martin,
> > > > > >
> > > > > > [[oe] Still many meta-networking changes waiting in patchwork/m=
aster-next] On 16.02.25 (Thu
> > 18:19) Martin Jansa wrote:
> > > > > >
> > > > > > > Hi Joe.
> > > > > > >
> > > > > > > there are still 18 meta-networking commits in master-next:
> > > > > >
> > > > > > I thought I'd follow up to this and let you know I'll do someth=
ing with
> > > > > > these before the end of the month.  Almost all of them (waf-sam=
ba aside)
> > > > > > obviously got missed because I'm watching patchwork based on
> > > > > > 'meta-networking' and none of these had it in the subject line.
> > > > > >
> > > > > > I think I've asked before, but are you curating all of those bu=
ndles by
> > > > > > hand or have you got some machinery that filters patches into b=
undles
> > > > > > based on path names in the patches?  Because that would be kind=
 of neat
> > > > > > to have.
> > > > >
> > > > > I think I've answered before, but I'm filtering them manually bas=
ed on
> > > > > subject and also actual paths inside the patch. I also need to ma=
rk them
> > > > > "Accepted", "Superseded", ..  manually, there is git hooks which =
is supposed
> > > > > to mark at least accepted one, but it finds 1 from 1000 if any.
> > > >
> > > > Yeah, I've seen the hooks trying to find something when I push comm=
its and
> > > > just spewing a slew of errors.  I generally do my best to stay on t=
op of
> > > > the status in patchwork, doing it all at one time, though.
> > > >
> > > > > This is of course a bit error prone, especially when there are mu=
ltiple
> > > > > versions of the same patch already in master-next - I usually end=
 up
> > > > > marking all versions merged patch as Accepted (unless I've marked=
 older
> > > > > versions already as Superseded when filtering incoming queue).
> > > >
> > > > I took a bit of time this afternoon to try to come up with a way to
> > > > automate at least part of the process for me and I'm sure there's a=
 better
> > > > way to do it (hence why I asked again) but since it sounds like you=
're
> > > > doing it by hand for a much larger space than I am, maybe there's n=
ot.
> > > >
> > > > Anyway, for what it's worth, here's what I came up with:
> > > >
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >       oe/master-next...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s New
> > > >
> > > > Which does pretty well, though it obviously goes a little insane if
> > > > someone puts a ' in the short log, but it didn't seem worth trying =
to work
> > > > around that pretty rare (I hope) corner case.  As an aside, the fir=
st time
> > > > I did this I was using --format=3D"\"%s\"" and the *very* top commit
> > > > ('recipes: Replace "cp ...) showed me what kind of pain I'm in for =
when
> > > > there are colliding characters in the short log.  It's ugly but not=
hing
> > > > catastrophic.
> > > >
> > > > So that gave me 14 of the patches you asked about.  The others were=
 easy
> > > > to find:
> > > >
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >       oe/master-next...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s Accepted
> > > >
> > > > But obviously they haven't been accepted into 'master' next, obviou=
sly
> > > > just a typo or a mis-click at some point.  So that's not bad.
> > > >
> > > > Once I had that sanity check done, it's easy to harvest them all:
> > > >
> > > >
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >       oe/master-next...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{name}" -s new | \
> > > >       sed 's=3D\[.*\] *=3D=3D;s=3D"=3D.=3Dg;s=3D\(.*\)=3D"\1"=3D' |=
 \
> > > >       xargs -r -n1 git log --format=3D"%h" --grep | \
> > > >       xargs -r -n1 git cherry-pick -s
> > > >
> > > > The hideous sed in the middle is just to throw out stuff from the p=
wclient
> > > > output that doesn't appear in the git logs (eg. "[v2]") and to skip=
 over
> > > > the craziness that happens on the 'git log grep' if you have a " in=
 the
> > > > subject.
> > > >
> > > > Run it a second time to grab the three 'accepted' patches and we're=
 nearly
> > > > done.
> > > >
> > > > Setting aside all of the inspection steps that follow that nobody w=
ould
> > > > want to automate, the same machinery applies equally well to keeping
> > > > patchwork up to date:
> > > >
> > > >    git log --cherry-pick --format=3D"'%s'" \
> > > >       master...oe/master meta-networking | \
> > > >       xargs -r -n1 pwclient search -f "%{id}" -s new | \
> > > >       xargs -r -n1 pwclient update -s "accepted"
> > > >
> > > > There's not really any point in running this one a second time for =
the
> > > > patches already marked 'accepted'.
> > > >
> > > > I've been using a version of this last one for a while now because =
the git
> > > > hooks are non-functional.
> > > >
> > > > The end result is that my semi-automated process above gets 17 of t=
he 18
> > > > patches you cited and the 18th (waf-samba.bbclass) is a special cas=
e that
> > > > I don't think could ever be caught except by manual intervention.
> > > >
> > > > Mostly just throwing this out there so that maybe it'll help you or
> > > > someone else with similar tasks and maybe someone can look at what =
I'm
> > > > doing and point out obvious flaws / shortcomings / bear-traps /
> > > > improvements.  And also since I haven't bothered to put this into a=
 shell
> > > > function or git alias yet, at least my process is archived in the m=
ailing
> > > > list and I can find it again if I need it.
> > >
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
> >=20
> > > After bigger merge yesterday I have only the waf-samba change in
> > > master-next (and few new changes),
> >=20
> > Yeah, the waf-samba change has been deliberately left to the end since
> > Jackie's waf-samba commits are now considerably out of date and touch
>=20
> When I made those patches, samba and related recipes were in meta-oe,
> then they were moved to meta-networking and I rebased them twice after
> that, but the patch for waf-samba.bbclass  is still applied for meta-oe. =
Do=20
> you think we need to move it to meta-networking as well?

I wouldn't object to such a move.  I don't think it'll impact anyone
outside of meta-networking.

-J.

>=20
> Thanks,
> Jackie
>=20
> > more than just meta-networking, so I'm trying to be extra careful with
> > them.
> >=20
> > > can you please update status of few pending changes in meta-networking
> > > bundle?
> > > http://patchwork.openembedded.org/bundle/jama/meta-networking/?archiv=
e=3Dboth
> >=20
> > Sure thing.
> >=20
> > > There is 22 changes and most of them were probably already merged or
> > > rejected.
> > >
> > > >
> > > > -J.
> > > >
> > > > >
> > > > > >
> > > > > > -J.
> > > > > >
> > > > > > > pick 959b908 postfix: premission of /var/spool/mail seems inc=
orrect
> > > > > > > pick 21ccb84 wireshark: update SRC_URI link to sources
> > > > > > > pick 204683a nbd: use BPN in Files
> > > > > > > pick ed0b197 cim-schema-exper: fix host-user-contaminated
> > > > > > > pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
> > > > > > > pick 3c95127 netkit-ftp: fixed invalid symlink
> > > > > > > pick 56c4f31 iscsitarget: split the kernel module into separa=
te package
> > > > > > > pick 38fd81c iscsitarget: skip the arch test for kernel modul=
es
> > > > > > > pick 84bfeae ncftp: fix build failures with ccdv
> > > > > > > pick 46b1e93 postfix: fix clean broken issue
> > > > > > > pick ba57020 lowpan-tools: add missing flex/bison deps
> > > > > > > pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "=
aio"
> > > > > > > pick c3c6106 waf-samba.bbclass: add cross-answers option and =
files
> > > > > > > pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powe=
rpc
> > > > > > > pick 87edda7 samba: update systemd service files
> > > > > > > pick 8b320f4 lldpd: use bash-completion.bbclass
> > > > > > > pick 32b5c6f ntp: remove empty libexecdir to prevent potentia=
l QA issues
> > > > > > > pick 93c8a3c inetutils: Fix build when static libs disabled
> > > > > > >
> > > > > > > Not all of them are still "open" on patchwork, maybe they are=
 no longer valid.
> > > > > > >
> > > > > > > + there are few meta-networking patches on patchwork which di=
dn't make it to master-next
> > > > > > >   here is complete list:
> > > > > > >   http://patchwork.openembedded.org/bundle/jama/master-next/?=
archive=3Dboth
> > > > > > > 	postfix: premission of /var/spool/mail seems incorrect	2015-=
10-27	Zhenbo Gao
> > 		New
> > > > > > > 	[meta-oe] lldpd: configure the systemd unit file dir	2015-10=
-30
> > 	rongqing.li@windriver.com		New
> > > > > > > 	[meta-oe] samba: systemv-init script must be executable	2015=
-11-04	Jens
> > Rehsack		New
> > > > > > > 	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	2015-=
11-12	Jens
> > Rehsack		New
> > > > > > > 	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
> > > > > > > 	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11-2=
0	Robert Yang
> > 		New
> > > > > > > 	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert Y=
ang
> > 	New
> > > > > > > 	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert Ya=
ng		New
> > > > > > > 	[1/2] iscsitarget: split the kernel module into separate pac=
kage	2015-11-25	jackie
> > huang		New
> > > > > > > 	[2/2] iscsitarget: skip the arch test for kernel modules	201=
5-11-25	jackie huang
> > 		New
> > > > > > > 	ncftp: fix build failures with ccdv	2015-11-30	jackie huang	=
	New
> > > > > > > 	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-12=
-22
> > 	mike.looijmans@topic.nl		New
> > > > > > > 	[meta-networking,0/7,v3] waf-samba: fix build failure on tar=
gets unsupported by
> > qemu	2016-01-06	jackie huang		New
> > > > > > > 	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers option=
 and files	2016-
> > 01-06	jackie huang		New
> > > > > > > 	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-01-=
20
> > 	rongqing.li@windriver.com		New
> > > > > > > 	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	Geor=
ge McCollister
> > 		New
> > > > > > > 	[07/12] inetutils: Fix build when static libs disabled	2016-=
02-22	Richard Purdie
> > 		New
> > > > > > >
> > > > > > > If they are still there next month, I'll drop them from maste=
r-next branch
> > > > > > > and master-next bundle on patchwork.
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > --
> > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > -Joe MacDonald.
> > > > > > :wq
> > > > >
> > > > >
> > > > >
> > > > --
> > > > -Joe MacDonald.
> > > > :wq
> > >
> > >
> > >
> > --
> > -Joe MacDonald.
> > :wq

--=20
-Joe MacDonald.
:wq

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW2KNCAAoJEEn8ffcsOfaWXiAIANPRiYURMgEAS7JWxmByPYYz
kL2qvja0bqaY1RgAIiyfE310E2eUQM78M+2y79T1I1dWte3jMl7PknzQmwibypEo
VaAf0ofqWWIJWtMJqAhS4RcH/7/l+z4XvroKUzgqH0Gdwfia94R63cRecLEi9PCa
hTRkMWN2Bez+k/YJ5IdO2vBqjQFs15CWDK/qaIpE+0HzhgN/T2fxn5kCCeOJeCbA
s/O3jBywrsPwWcfhKJNOOKYwc58FpcuzaSgNaXqA92iyDwucAcZx0Juiy02rLXhj
BznOXDvuSI0EGakCgmSWYvEdUDgMrwSTw/6WYWhMrpRMYY5KCHarRbqrLt0v3D0=
=ENbt
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
