Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK4j0-0008E9-0u
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 09:20:36 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK4et-0003pW-3g
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 09:16:07 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 0A39D6A11A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 09:16:02 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Jun 2010 09:15:56 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com> <20100603043505.GJ16035@jama>
In-Reply-To: <20100603043505.GJ16035@jama>
MIME-Version: 1.0
Message-Id: <201006030915.57362.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OK4et-0003pW-3g
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Thu, 03 Jun 2010 07:20:36 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 03 June 2010 06:35:05 Martin Jansa wrote:
> On Wed, Jun 02, 2010 at 11:51:37PM +0200, pieterg wrote:
> > I have only a handful of (git) packages for which I need to use
> > AUTOREV, but when I define
> >
> > BB_GIT_CLONE_FOR_SRCREV =3D "1"
> > BB_LOCALCOUNT_OVERRIDE =3D ""
> >
> > the sideeffect is that hundreds of other packages (which I don't need)
> > are suddenly having their repositories cloned as well, when their bb
> > files are parsed. Even though these packages are not using AUTOREV,
> > they have fixed SRCREV's (either in their bb files, or in my distro).
> >
> > This is obviously taking a long time, consuming a lot of diskspace,
> > generating error messages for invalid git urls, and eventually bitbake
> > will fail because it encountered 'parsing errors' because of those
> > invalid git urls.
>
> If you use bitbake-1.10 it will do it just once for git revision (it
> will cache the result of "git list-rev | wc -l" which is used by
> BB_GIT_CLONE_FOR_SRCREV.

Probably, but I don't get that far, bitbake quits at the end, with several=
=20
parsing errors (problems with git repositories which I have no control=20
over, and which I don't even want anything to do with)

> > I guess this is because all of these packages are using ${SRCPV} in
> > their PV, instead of ${SRCREV} (probably in order to find the correct
> > LOCALCOUNT for the gitrev).
> >
> > But argueing that people who don't use BB_GIT_CLONE_FOR_SRCREV will not
> > get these LOCALCOUNT's in their PV anyway, and people that do use
> > BB_GIT_CLONE_FOR_SRCREV will use SRCREV =3D ${AUTOREV} for the packages
> > which they want to be automatically updated, so SRCREV would equal
> > SRCPV, wouldn't it make sense to just use ${SRCREV} instead of ${SRCPV}
> > in PV?
>
> No they won't be the same. They will have the same format
> git${LOCALCOUNT}+${HASH} as when AUTOREV+SRCREV is used.

My point is that I don't think they have to be the same.
There are two sorts of people, those with BB_GIT_CLONE_FOR_SRCREV, and thos=
e=20
without.
(or in my case, this is controlled by the distro, an 'unstable',=20
or 'release').
As long as the versioning is consistent for each group of people (or in my=
=20
case, each distro), I don't need the versioning to stay consistent when=20
toggling BB_GIT_CLONE_FOR_SRCREV.

> in short: why do you insist on BB_GIT_CLONE_FOR_SRCREV? autoincremented
> LOCALCOUNT works good in most cases (as long as you keep cache dir), only
> case for which we introduced BB_LOCALCOUNT_OVERRIDE is for multiple
> builders sharing feed, but not cache directory.

And that's indeed what we have, many people are building the same distro,=20
and they should end up with the exact same version (or LOCALCOUNT), and I=20
don't think there is a way without clearing BB_LOCALCOUNT_OVERRIDE and=20
setting BB_GIT_CLONE_FOR_SRCREV.

My point is, before the big SRCPV change, you only suffered for the=20
carefully picked number of packages for which you wanted to use AUTOSRC.
But now, you suffer for hundreds of packages, which you might not even want=
=20
to have anything to do with, packages which use fixed SRCREV's, so they=20
shouldn't even need dynamically generated PVs.

=46or now, I've made this change in bitbake.conf, which pretty much reverts=
=20
the behaviour to what it was before, so at least my build will complete
(don't mean to propose this patch of course, just as demonstration how I=20
have to work around it at the moment)
Hopefully there is a better way to make AUTOREV work again for our=20
situation.

=46rom 30a9c042d65b32dc1d76a757f493659b556c6a62 Mon Sep 17 00:00:00 2001
=46rom: pieterg <pieterg@users.sourceforge.net>
Date: Thu, 3 Jun 2010 00:23:51 +0200
Subject: [PATCH] bitbake.conf: work around AUTOREV problems

As long as many packages are using SRCPV in their PV,
we cannot use the current AUTOREV / SRCPV strategy
=2D--
 conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 12a5522..1d2c123 100644
=2D-- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -576,8 +576,8 @@ UPDATECOMMAND_cvs =3D "/usr/bin/env 'PATH=3D${PATH}'=20
cvs -d${CVSROOT} update -d -P $
 UPDATECOMMAND_svn =3D "/usr/bin/env svn update ${SVNCOOPTS}"
 SRCDATE =3D "${DATE}"
 SRCREV =3D "1"
=2DSRCPV =3D "${@bb.fetch.get_srcrev(d)}"
=2DAUTOREV =3D "${SRCPV}"
+SRCPV =3D "${SRCREV}"
+AUTOREV =3D "${@bb.fetch.get_srcrev(d)}"
=20
 # For now disable autoincrement of revision counter in SRCPV, whoever want=
s=20
it, should enable it in local.conf or distro config
 # Revision counter is incremented only locally (bad for multiple builders=
=20
filling shared feeds), LOCALCOUNT can be used to maintain
=2D-=20
1.6.5.rc1.44.ga1675


