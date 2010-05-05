Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O9o6l-0007vA-An
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 01:34:29 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O9o34-0001DG-EW from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 16:30:38 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 5 May 2010 16:30:38 -0700
Received: from 172.30.80.24 ([172.30.80.24]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  5 May 2010 23:30:37 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	05 May 2010 16:30:35 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1273101776.5743.39.camel@rex>
References: <1270135981.4993.128.camel@rex>  <hpum4g$18m$1@dough.gmane.org>
	<1271087957.29304.86.camel@trini-m4400>
	<1271090799.14344.19.camel@localhost.localdomain>
	<1272756595.30647.1942.camel@rex> <1272905195.2931.0.camel@trini-m4400>
	<1272996601.1355.5.camel@rex>  <1272999334.2533.18.camel@trini-m4400>
	<1273101776.5743.39.camel@rex>
Organization: Mentor Graphics Corporation
Date: Wed, 05 May 2010 16:30:35 -0700
Message-ID: <1273102235.457.55.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 05 May 2010 23:30:38.0055 (UTC)
	FILETIME=[F7DD4770:01CAECAA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Wed, 05 May 2010 23:34:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-05-06 at 00:22 +0100, Richard Purdie wrote:
> On Tue, 2010-05-04 at 11:55 -0700, Tom Rini wrote:
> > On Tue, 2010-05-04 at 19:10 +0100, Richard Purdie wrote:
> > > On Mon, 2010-05-03 at 09:46 -0700, Tom Rini wrote:
> > > > On Sun, 2010-05-02 at 00:29 +0100, Richard Purdie wrote:
> > > > > On Mon, 2010-04-12 at 17:46 +0100, Joshua Lock wrote:
> > > > > > On Mon, 2010-04-12 at 08:59 -0700, Tom Rini wrote:
> > > > > > > On Mon, 2010-04-12 at 10:37 +0200, Koen Kooi wrote:
> > > > > >  > Joshuas last 3 commits to poky seem to fix Toms issue with b=
inconfig and
> > > > > > > > my issue with chrpath, which only leaves the cross staging =
lamangler
> > > > > > > > stuff to get fixed.
> > > > > > >=20
> > > > > > > Actually (and I'm OK with binconfig stuff being broken in the=
 first
> > > > > > > merge) the problem with binconfig junk isn't the file content=
s, but the
> > > > > > > file location.  staging-target-pkg will contain
> > > > > > > staging/<host>/usr/bin/<target>/foo-config.  Which means usin=
g pstaging
> > > > > > > for a target pkg built on 32bit Linux fails when used on 64bi=
t Linux.
> > > > > > > Not that I wouldn't mind seeing the binconfig stuff die, just=
 saying
> > > > > > > it's a problem today :)
> > > > > >=20
> > > > > > Ah, hmm... yes. That is a problem.
> > > > > >=20
> > > > > > FWIW I don't think you'll get any arguments from the Poky team =
where the
> > > > > > binconfig stuff to suffer an untimely demise!
> > > > >=20
> > > > > FWIW, Poky has had some interesting commits recently that address=
 Tom's
> > > > > issue above from Josh.
> > > >=20
> > > > Interesting.  When you killed CROSS_*, did you rework stuff so that=
 gcc
> > > > & co's sysroot stuff works automatically or no?  Can't tell off-han=
d.
> > >=20
> > > What do you mean by "works automatically"?
> >=20
> > gcc & co have certain paths that they look in by default, relative to
> > their location (see meta-toolchain.bb, that's not a hard-coded search,
> > that's a relocatable one).  The current oe.dev layout of things doesn't
> > fit here so we have to pass in --sysroot=3D... at a minimum and often h=
ave
> > -isystem for "legacy" reasons.
>=20
> Ah, right. I haven't attempted this, no. It would really depend on what
> the "certain paths" that are hardcoded are and whether we can influence
> them at all. Would be worth looking at in due course though.

I'd really like to see us do this at the same time we kill off cross.
That, really, is the hard part of the equation and you've tackled it
already.  We just need <some name>/<target>/<std layout> and <some
name>/bin,lib,etc.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


