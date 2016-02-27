Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DA06C607F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 01:39:46 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1aZTrG-0007Io-Ss from Joe_MacDonald@mentor.com ;
	Fri, 26 Feb 2016 17:39:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 17:39:46 -0800
Received: by burninator (Postfix, from userid 1000)	id 7498E580D05; Fri, 26
	Feb 2016 20:39:45 -0500 (EST)
Date: Fri, 26 Feb 2016 20:39:45 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160227013944.GB6310@mentor.com>
References: <20160225171903.GC2565@jama> <20160226181315.GA6310@mentor.com>
	<20160226195617.GA2554@jama>
MIME-Version: 1.0
In-Reply-To: <20160226195617.GA2554@jama>
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
X-List-Received-Date: Sat, 27 Feb 2016 01:39:48 -0000
X-Groupsio-MsgNum: 60234
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

[Re: [oe] Still many meta-networking changes waiting in patchwork/master-ne=
xt] On 16.02.26 (Fri 20:56) Martin Jansa wrote:

> On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> > Hey Martin,
> >=20
> > [[oe] Still many meta-networking changes waiting in patchwork/master-ne=
xt] On 16.02.25 (Thu 18:19) Martin Jansa wrote:
> >=20
> > > Hi Joe.
> > >=20
> > > there are still 18 meta-networking commits in master-next:
> >=20
> > I thought I'd follow up to this and let you know I'll do something with
> > these before the end of the month.  Almost all of them (waf-samba aside)
> > obviously got missed because I'm watching patchwork based on
> > 'meta-networking' and none of these had it in the subject line.
> >=20
> > I think I've asked before, but are you curating all of those bundles by
> > hand or have you got some machinery that filters patches into bundles
> > based on path names in the patches?  Because that would be kind of neat
> > to have.
>=20
> I think I've answered before, but I'm filtering them manually based on
> subject and also actual paths inside the patch. I also need to mark them
> "Accepted", "Superseded", ..  manually, there is git hooks which is suppo=
sed
> to mark at least accepted one, but it finds 1 from 1000 if any.

Yeah, I've seen the hooks trying to find something when I push commits and
just spewing a slew of errors.  I generally do my best to stay on top of
the status in patchwork, doing it all at one time, though.

> This is of course a bit error prone, especially when there are multiple
> versions of the same patch already in master-next - I usually end up
> marking all versions merged patch as Accepted (unless I've marked older
> versions already as Superseded when filtering incoming queue).

I took a bit of time this afternoon to try to come up with a way to
automate at least part of the process for me and I'm sure there's a better
way to do it (hence why I asked again) but since it sounds like you're
doing it by hand for a much larger space than I am, maybe there's not.

Anyway, for what it's worth, here's what I came up with:

   git log --cherry-pick --format=3D"'%s'" \
      oe/master-next...oe/master meta-networking | \
      xargs -r -n1 pwclient search -f "%{id} %{name}" -s New

Which does pretty well, though it obviously goes a little insane if
someone puts a ' in the short log, but it didn't seem worth trying to work
around that pretty rare (I hope) corner case.  As an aside, the first time
I did this I was using --format=3D"\"%s\"" and the *very* top commit
('recipes: Replace "cp ...) showed me what kind of pain I'm in for when
there are colliding characters in the short log.  It's ugly but nothing
catastrophic.

So that gave me 14 of the patches you asked about.  The others were easy
to find:

   git log --cherry-pick --format=3D"'%s'" \
      oe/master-next...oe/master meta-networking | \
      xargs -r -n1 pwclient search -f "%{id} %{name}" -s Accepted

But obviously they haven't been accepted into 'master' next, obviously
just a typo or a mis-click at some point.  So that's not bad.

Once I had that sanity check done, it's easy to harvest them all:


   git log --cherry-pick --format=3D"'%s'" \
      oe/master-next...oe/master meta-networking | \
      xargs -r -n1 pwclient search -f "%{name}" -s new | \
      sed 's=3D\[.*\] *=3D=3D;s=3D"=3D.=3Dg;s=3D\(.*\)=3D"\1"=3D' | \
      xargs -r -n1 git log --format=3D"%h" --grep | \
      xargs -r -n1 git cherry-pick -s

The hideous sed in the middle is just to throw out stuff from the pwclient
output that doesn't appear in the git logs (eg. "[v2]") and to skip over
the craziness that happens on the 'git log grep' if you have a " in the
subject.

Run it a second time to grab the three 'accepted' patches and we're nearly
done.

Setting aside all of the inspection steps that follow that nobody would
want to automate, the same machinery applies equally well to keeping
patchwork up to date:

   git log --cherry-pick --format=3D"'%s'" \
      master...oe/master meta-networking | \
      xargs -r -n1 pwclient search -f "%{id}" -s new | \
      xargs -r -n1 pwclient update -s "accepted"=20

There's not really any point in running this one a second time for the
patches already marked 'accepted'.

I've been using a version of this last one for a while now because the git
hooks are non-functional.

The end result is that my semi-automated process above gets 17 of the 18
patches you cited and the 18th (waf-samba.bbclass) is a special case that
I don't think could ever be caught except by manual intervention.

Mostly just throwing this out there so that maybe it'll help you or
someone else with similar tasks and maybe someone can look at what I'm
doing and point out obvious flaws / shortcomings / bear-traps /
improvements.  And also since I haven't bothered to put this into a shell
function or git alias yet, at least my process is archived in the mailing
list and I can find it again if I need it.

-J.

>=20
> >=20
> > -J.
> >=20
> > > pick 959b908 postfix: premission of /var/spool/mail seems incorrect
> > > pick 21ccb84 wireshark: update SRC_URI link to sources
> > > pick 204683a nbd: use BPN in Files
> > > pick ed0b197 cim-schema-exper: fix host-user-contaminated
> > > pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
> > > pick 3c95127 netkit-ftp: fixed invalid symlink
> > > pick 56c4f31 iscsitarget: split the kernel module into separate packa=
ge
> > > pick 38fd81c iscsitarget: skip the arch test for kernel modules
> > > pick 84bfeae ncftp: fix build failures with ccdv
> > > pick 46b1e93 postfix: fix clean broken issue
> > > pick ba57020 lowpan-tools: add missing flex/bison deps
> > > pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> > > pick c3c6106 waf-samba.bbclass: add cross-answers option and files
> > > pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
> > > pick 87edda7 samba: update systemd service files
> > > pick 8b320f4 lldpd: use bash-completion.bbclass
> > > pick 32b5c6f ntp: remove empty libexecdir to prevent potential QA iss=
ues
> > > pick 93c8a3c inetutils: Fix build when static libs disabled
> > >=20
> > > Not all of them are still "open" on patchwork, maybe they are no long=
er valid.
> > >=20
> > > + there are few meta-networking patches on patchwork which didn't mak=
e it to master-next
> > >   here is complete list:
> > >   http://patchwork.openembedded.org/bundle/jama/master-next/?archive=
=3Dboth
> > > 	postfix: premission of /var/spool/mail seems incorrect	2015-10-27	Zh=
enbo Gao		New
> > > 	[meta-oe] lldpd: configure the systemd unit file dir	2015-10-30	rong=
qing.li@windriver.com		New
> > > 	[meta-oe] samba: systemv-init script must be executable	2015-11-04	J=
ens Rehsack		New
> > > 	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	2015-11-12	Je=
ns Rehsack		New
> > > 	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
> > > 	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11-20	Robert=
 Yang		New
> > > 	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert Yang		New
> > > 	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert Yang		New
> > > 	[1/2] iscsitarget: split the kernel module into separate package	201=
5-11-25	jackie huang		New
> > > 	[2/2] iscsitarget: skip the arch test for kernel modules	2015-11-25	=
jackie huang		New
> > > 	ncftp: fix build failures with ccdv	2015-11-30	jackie huang		New
> > > 	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-12-22	mike=
=2Elooijmans@topic.nl		New
> > > 	[meta-networking,0/7,v3] waf-samba: fix build failure on targets uns=
upported by qemu	2016-01-06	jackie huang		New
> > > 	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers option and fil=
es	2016-01-06	jackie huang		New
> > > 	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-01-20	rongq=
ing.li@windriver.com		New
> > > 	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	George McCol=
lister		New
> > > 	[07/12] inetutils: Fix build when static libs disabled	2016-02-22	Ri=
chard Purdie		New
> > >=20
> > > If they are still there next month, I'll drop them from master-next b=
ranch
> > > and master-next bundle on patchwork.
> > >=20
> > > Thanks
> > >=20
> > > --=20
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >=20
> >=20
> >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW0P5gAAoJEEn8ffcsOfaWwb0H/ioNJWY3MEE0hh5iAzXlH8U2
9rONLDS9UMA/gG4VN73njjnNgbaYbzQtOwCBb4ARV4SF786ulJev3C0Geb+RxqGt
ZMOtzYy3uDwAoLHd6UUMS20KZ3uTDR74hTw471zq2oIA1cKOfHDKrAwTtIqdreh7
BJsO/8GNqvusKv1FkaNqs+SIfrWwLGg8g/Rg5AuAcabGbO0/l8KwUUfModTZ97Rf
DZng6tR4JNqVCj3jJJcyz8E1zYEjaHMc6LOngrLZEK+OpkD0i5MI0vDjl3yPr+3C
dsgsUX0YCJWPTq0ghZ8N6KqMNaWrowNX/+7k3QrpkpFRYCRDkOv7d5eOdY+wTbM=
=rgOe
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
