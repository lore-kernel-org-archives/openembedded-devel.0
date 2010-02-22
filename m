Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NjbvG-0005gG-L9
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 18:18:23 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Njbsb-0007en-6P from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 09:15:33 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 22 Feb 2010 09:15:32 -0800
Received: from 172.30.80.10 ([172.30.80.10]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 22 Feb 2010 17:15:13 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	22 Feb 2010 10:15:12 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100222131040.GW30265@mx.loc>
References: <20100221164048.GU30265@mx.loc> <1266842451.1714.8.camel@rex>
	<20100222131040.GW30265@mx.loc>
Organization: Mentor Graphics Corporation
Date: Mon, 22 Feb 2010 10:15:12 -0700
Message-ID: <1266858912.18176.16.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 22 Feb 2010 17:15:32.0499 (UTC)
	FILETIME=[A3C3F630:01CAB3E2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [BBCLASSEXTEND BUG?] Not taking virtual:native provider into account?
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
X-List-Received-Date: Mon, 22 Feb 2010 17:18:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-02-22 at 14:10 +0100, Bernhard Reutner-Fischer wrote:
> On Mon, Feb 22, 2010 at 12:40:51PM +0000, Richard Purdie wrote:
> >On Sun, 2010-02-21 at 17:40 +0100, Bernhard Reutner-Fischer wrote:
> >> Hi,
> >>=20
> >> I'm using bitbake 641e6cf3ec3ab4d26929cf4d2a3704ff07eed4d6 (current
> >> HEAD) on HEAD of oe.
> >>=20
> >> I'm adding:
> >> $ cat recipes/git/git_1.7.0.bb=20
> >> require git.inc
> >> SRC_URI[git.md5sum] =3D "c7553b73e2156d187ece6ba936ae30ab"
> >> SRC_URI[git.sha256sum] =3D "a61e863944381c4f8231841f678f41f56b634bebca=
486a61005b35e5bcbb7c79"
> >> DEPENDS =3D "openssl curl zlib expat"
> >> RDEPENDS =3D "perl perl-module-file-path cpio findutils sed"
> >> PR =3D "r0"
> >> FILES_${PN}-dbg +=3D "${libexecdir}/git-core/.debug"
> >> BBCLASSEXTEND =3D "native"
> >>=20
> >> (and add ";name=3Dgit" to the .tar in git.inc's SRC_URI)
> >> and bake git-native and see:
> >> DEBUG: adding .../recipes/git/git-native_1.6.0.4.bb to satisfy git-nat=
ive
> >> instead of
> >> DEBUG: adding virtual:native:.../recipes/git/git_1.7.0.bb to satisfy g=
it-native
> >> which i get if i rm git-native_*
> >>=20
> >> Assuming that the aboce recipe is correct in principle, this somehow
> >> sounds like BBCLASSEXTEND'ed virtual:native never make it into
> >> providers. What am i doing wrong?
> >
> >If a real git-native_xyz.bb exists it will be preferred to the
> >BBCLASSEXTEND version.
>=20
> Even if the BBCLASSEXTENDed version is higher than the
> git-native_0.bb's? That doesn't sound too handy for i'd need to also
> touch the old version :(
>=20
> $ ls -1 recipes/git/*bb
> recipes/git/git_1.6.0.4.bb
> recipes/git/git_1.7.0.bb
> recipes/git/git-native_1.6.0.4.bb
>=20
> >I'm not sure why you'd want two versions?
>=20
> For this git package i wouldn't want to, but there are alot of packages
> that have numerous (legacy) versions used by some distros. I'd rather
> not update all old recipes just because i happen to add a new,
> cleaned-up version of a package. What do you think?

Well, if we convert them all, that reduces the number of files to parse,
which is a good thing, yes?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


