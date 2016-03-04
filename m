Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41CEB6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 01:42:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u241gT22017943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Mar 2016 17:42:29 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.21]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 3 Mar 2016 17:42:29 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] Still many meta-networking changes waiting in
	patchwork/master-next
Thread-Index: AQHRdG7KOI7fHLSciUi9xZKnVyt5PJ9Gq8QAgABYR6CAAbV1gP//y4Lg
Date: Fri, 4 Mar 2016 01:42:29 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C812AAA@ALA-MBA.corp.ad.wrs.com>
References: <20160225171903.GC2565@jama> <20160226181315.GA6310@mentor.com>
	<20160226195617.GA2554@jama> <20160227013944.GB6310@mentor.com>
	<20160302103341.GA10529@jama> <20160302132725.GC12524@mentor.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C80C833@ALA-MBA.corp.ad.wrs.com>
	<20160303204906.GG4671@mentor.com>
In-Reply-To: <20160303204906.GG4671@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.205]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 04 Mar 2016 01:42:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> Sent: Friday, March 04, 2016 4:49 AM
> To: Huang, Jie (Jackie)
> Cc: Martin Jansa; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Still many meta-networking changes waiting in patchwork=
/master-next
>=20
> [RE: [oe] Still many meta-networking changes waiting in patchwork/master-=
next] On 16.03.03 (Thu
> 02:51) Huang, Jie (Jackie) wrote:
>=20
> >
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org [mailto:opene=
mbedded-devel-
> > > bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> > > Sent: Wednesday, March 02, 2016 9:27 PM
> > > To: Martin Jansa
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] Still many meta-networking changes waiting in patch=
work/master-next
> > >
> > > [Re: [oe] Still many meta-networking changes waiting in patchwork/mas=
ter-next] On 16.03.02
> (Wed
> > > 11:33) Martin Jansa wrote:
> > >
> > > > On Fri, Feb 26, 2016 at 08:39:45PM -0500, Joe MacDonald wrote:
> > > > > Hi Martin,
> > > > >
> > > > > [Re: [oe] Still many meta-networking changes waiting in patchwork=
/master-next] On 16.02.26
> (Fri
> > > 20:56) Martin Jansa wrote:
> > > > >
> > > > > > On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> > > > > > > Hey Martin,
> > > > > > >
> > > > > > > [[oe] Still many meta-networking changes waiting in patchwork=
/master-next] On 16.02.25
> (Thu
> > > 18:19) Martin Jansa wrote:
> > > > > > >
> > > > > > > > Hi Joe.
> > > > > > > >
> > > > > > > > there are still 18 meta-networking commits in master-next:
> > > > > > >
> > > > > > > I thought I'd follow up to this and let you know I'll do some=
thing with
> > > > > > > these before the end of the month.  Almost all of them (waf-s=
amba aside)
> > > > > > > obviously got missed because I'm watching patchwork based on
> > > > > > > 'meta-networking' and none of these had it in the subject lin=
e.
> > > > > > >
> > > > > > > I think I've asked before, but are you curating all of those =
bundles by
> > > > > > > hand or have you got some machinery that filters patches into=
 bundles
> > > > > > > based on path names in the patches?  Because that would be ki=
nd of neat
> > > > > > > to have.
> > > > > >
> > > > > > I think I've answered before, but I'm filtering them manually b=
ased on
> > > > > > subject and also actual paths inside the patch. I also need to =
mark them
> > > > > > "Accepted", "Superseded", ..  manually, there is git hooks whic=
h is supposed
> > > > > > to mark at least accepted one, but it finds 1 from 1000 if any.
> > > > >
> > > > > Yeah, I've seen the hooks trying to find something when I push co=
mmits and
> > > > > just spewing a slew of errors.  I generally do my best to stay on=
 top of
> > > > > the status in patchwork, doing it all at one time, though.
> > > > >
> > > > > > This is of course a bit error prone, especially when there are =
multiple
> > > > > > versions of the same patch already in master-next - I usually e=
nd up
> > > > > > marking all versions merged patch as Accepted (unless I've mark=
ed older
> > > > > > versions already as Superseded when filtering incoming queue).
> > > > >
> > > > > I took a bit of time this afternoon to try to come up with a way =
to
> > > > > automate at least part of the process for me and I'm sure there's=
 a better
> > > > > way to do it (hence why I asked again) but since it sounds like y=
ou're
> > > > > doing it by hand for a much larger space than I am, maybe there's=
 not.
> > > > >
> > > > > Anyway, for what it's worth, here's what I came up with:
> > > > >
> > > > >    git log --cherry-pick --format=3D"'%s'" \
> > > > >       oe/master-next...oe/master meta-networking | \
> > > > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s New
> > > > >
> > > > > Which does pretty well, though it obviously goes a little insane =
if
> > > > > someone puts a ' in the short log, but it didn't seem worth tryin=
g to work
> > > > > around that pretty rare (I hope) corner case.  As an aside, the f=
irst time
> > > > > I did this I was using --format=3D"\"%s\"" and the *very* top com=
mit
> > > > > ('recipes: Replace "cp ...) showed me what kind of pain I'm in fo=
r when
> > > > > there are colliding characters in the short log.  It's ugly but n=
othing
> > > > > catastrophic.
> > > > >
> > > > > So that gave me 14 of the patches you asked about.  The others we=
re easy
> > > > > to find:
> > > > >
> > > > >    git log --cherry-pick --format=3D"'%s'" \
> > > > >       oe/master-next...oe/master meta-networking | \
> > > > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s Accepted
> > > > >
> > > > > But obviously they haven't been accepted into 'master' next, obvi=
ously
> > > > > just a typo or a mis-click at some point.  So that's not bad.
> > > > >
> > > > > Once I had that sanity check done, it's easy to harvest them all:
> > > > >
> > > > >
> > > > >    git log --cherry-pick --format=3D"'%s'" \
> > > > >       oe/master-next...oe/master meta-networking | \
> > > > >       xargs -r -n1 pwclient search -f "%{name}" -s new | \
> > > > >       sed 's=3D\[.*\] *=3D=3D;s=3D"=3D.=3Dg;s=3D\(.*\)=3D"\1"=3D'=
 | \
> > > > >       xargs -r -n1 git log --format=3D"%h" --grep | \
> > > > >       xargs -r -n1 git cherry-pick -s
> > > > >
> > > > > The hideous sed in the middle is just to throw out stuff from the=
 pwclient
> > > > > output that doesn't appear in the git logs (eg. "[v2]") and to sk=
ip over
> > > > > the craziness that happens on the 'git log grep' if you have a " =
in the
> > > > > subject.
> > > > >
> > > > > Run it a second time to grab the three 'accepted' patches and we'=
re nearly
> > > > > done.
> > > > >
> > > > > Setting aside all of the inspection steps that follow that nobody=
 would
> > > > > want to automate, the same machinery applies equally well to keep=
ing
> > > > > patchwork up to date:
> > > > >
> > > > >    git log --cherry-pick --format=3D"'%s'" \
> > > > >       master...oe/master meta-networking | \
> > > > >       xargs -r -n1 pwclient search -f "%{id}" -s new | \
> > > > >       xargs -r -n1 pwclient update -s "accepted"
> > > > >
> > > > > There's not really any point in running this one a second time fo=
r the
> > > > > patches already marked 'accepted'.
> > > > >
> > > > > I've been using a version of this last one for a while now becaus=
e the git
> > > > > hooks are non-functional.
> > > > >
> > > > > The end result is that my semi-automated process above gets 17 of=
 the 18
> > > > > patches you cited and the 18th (waf-samba.bbclass) is a special c=
ase that
> > > > > I don't think could ever be caught except by manual intervention.
> > > > >
> > > > > Mostly just throwing this out there so that maybe it'll help you =
or
> > > > > someone else with similar tasks and maybe someone can look at wha=
t I'm
> > > > > doing and point out obvious flaws / shortcomings / bear-traps /
> > > > > improvements.  And also since I haven't bothered to put this into=
 a shell
> > > > > function or git alias yet, at least my process is archived in the=
 mailing
> > > > > list and I can find it again if I need it.
> > > >
> > > > Thanks for trying to improve patchwork experience with bunch of scr=
ipts.
> > > > Personally I would prefer to just use gerrit (that's why I gave up
> > > > trying to work around patchwork issues with scripts and rather sort=
 &
> > > > apply the patches manually with just small help from pwclient).
> > >
> > > I've never been a fan of gerrit, but I've only used it on a couple of
> > > projects, so I don't really have a lot of experience with it.  Probab=
ly
> > > obviously, so long as the CLI experience isn't terrible and I can eas=
ily
> > > script around things that don't work well for me, I can work with alm=
ost
> > > anything.
> > >
> > > > After bigger merge yesterday I have only the waf-samba change in
> > > > master-next (and few new changes),
> > >
> > > Yeah, the waf-samba change has been deliberately left to the end sinc=
e
> > > Jackie's waf-samba commits are now considerably out of date and touch
> >
> > When I made those patches, samba and related recipes were in meta-oe,
> > then they were moved to meta-networking and I rebased them twice after
> > that, but the patch for waf-samba.bbclass  is still applied for meta-oe=
. Do
> > you think we need to move it to meta-networking as well?
>=20
> I wouldn't object to such a move.  I don't think it'll impact anyone
> outside of meta-networking.

Ok, so I will move it to meta-networking, rebase my patch and re-send as fo=
llow-up.

Thanks,
Jackie

>=20
> -J.
>=20
> >
> > Thanks,
> > Jackie
> >
> > > more than just meta-networking, so I'm trying to be extra careful wit=
h
> > > them.
> > >
> > > > can you please update status of few pending changes in meta-network=
ing
> > > > bundle?
> > > > http://patchwork.openembedded.org/bundle/jama/meta-networking/?arch=
ive=3Dboth
> > >
> > > Sure thing.
> > >
> > > > There is 22 changes and most of them were probably already merged o=
r
> > > > rejected.
> > > >
> > > > >
> > > > > -J.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > -J.
> > > > > > >
> > > > > > > > pick 959b908 postfix: premission of /var/spool/mail seems i=
ncorrect
> > > > > > > > pick 21ccb84 wireshark: update SRC_URI link to sources
> > > > > > > > pick 204683a nbd: use BPN in Files
> > > > > > > > pick ed0b197 cim-schema-exper: fix host-user-contaminated
> > > > > > > > pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
> > > > > > > > pick 3c95127 netkit-ftp: fixed invalid symlink
> > > > > > > > pick 56c4f31 iscsitarget: split the kernel module into sepa=
rate package
> > > > > > > > pick 38fd81c iscsitarget: skip the arch test for kernel mod=
ules
> > > > > > > > pick 84bfeae ncftp: fix build failures with ccdv
> > > > > > > > pick 46b1e93 postfix: fix clean broken issue
> > > > > > > > pick ba57020 lowpan-tools: add missing flex/bison deps
> > > > > > > > pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and=
 "aio"
> > > > > > > > pick c3c6106 waf-samba.bbclass: add cross-answers option an=
d files
> > > > > > > > pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for po=
werpc
> > > > > > > > pick 87edda7 samba: update systemd service files
> > > > > > > > pick 8b320f4 lldpd: use bash-completion.bbclass
> > > > > > > > pick 32b5c6f ntp: remove empty libexecdir to prevent potent=
ial QA issues
> > > > > > > > pick 93c8a3c inetutils: Fix build when static libs disabled
> > > > > > > >
> > > > > > > > Not all of them are still "open" on patchwork, maybe they a=
re no longer valid.
> > > > > > > >
> > > > > > > > + there are few meta-networking patches on patchwork which =
didn't make it to master-
> next
> > > > > > > >   here is complete list:
> > > > > > > >   http://patchwork.openembedded.org/bundle/jama/master-next=
/?archive=3Dboth
> > > > > > > > 	postfix: premission of /var/spool/mail seems incorrect	201=
5-10-27	Zhenbo Gao
> > > 		New
> > > > > > > > 	[meta-oe] lldpd: configure the systemd unit file dir	2015-=
10-30
> > > 	rongqing.li@windriver.com		New
> > > > > > > > 	[meta-oe] samba: systemv-init script must be executable	20=
15-11-04	Jens
> > > Rehsack		New
> > > > > > > > 	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	201=
5-11-12	Jens
> > > Rehsack		New
> > > > > > > > 	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
> > > > > > > > 	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11=
-20	Robert Yang
> > > 		New
> > > > > > > > 	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert=
 Yang
> > > 	New
> > > > > > > > 	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert =
Yang		New
> > > > > > > > 	[1/2] iscsitarget: split the kernel module into separate p=
ackage	2015-11-25	jackie
> > > huang		New
> > > > > > > > 	[2/2] iscsitarget: skip the arch test for kernel modules	2=
015-11-25	jackie huang
> > > 		New
> > > > > > > > 	ncftp: fix build failures with ccdv	2015-11-30	jackie huan=
g		New
> > > > > > > > 	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-=
12-22
> > > 	mike.looijmans@topic.nl		New
> > > > > > > > 	[meta-networking,0/7,v3] waf-samba: fix build failure on t=
argets unsupported by
> > > qemu	2016-01-06	jackie huang		New
> > > > > > > > 	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers opti=
on and files	2016-
> > > 01-06	jackie huang		New
> > > > > > > > 	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-0=
1-20
> > > 	rongqing.li@windriver.com		New
> > > > > > > > 	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	Ge=
orge McCollister
> > > 		New
> > > > > > > > 	[07/12] inetutils: Fix build when static libs disabled	201=
6-02-22	Richard Purdie
> > > 		New
> > > > > > > >
> > > > > > > > If they are still there next month, I'll drop them from mas=
ter-next branch
> > > > > > > > and master-next bundle on patchwork.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > --
> > > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > -Joe MacDonald.
> > > > > > > :wq
> > > > > >
> > > > > >
> > > > > >
> > > > > --
> > > > > -Joe MacDonald.
> > > > > :wq
> > > >
> > > >
> > > >
> > > --
> > > -Joe MacDonald.
> > > :wq
>=20
> --
> -Joe MacDonald.
> :wq

