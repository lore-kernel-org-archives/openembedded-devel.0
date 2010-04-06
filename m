Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NzCWg-0004jr-TN
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 19:25:25 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NzCTQ-0006ou-R8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 10:22:00 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 6 Apr 2010 10:22:00 -0700
Received: from 172.30.80.159 ([172.30.80.159]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  6 Apr 2010 17:21:42 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	06 Apr 2010 10:21:41 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270570937.24602.24.camel@localhost.localdomain>
References: <E1NxKhE-0007AF-AE@melo.openembedded.org>
	<1270160485.6277.143.camel@trini-m4400>
	<1270564528.9623.19.camel@localhost.localdomain>
	<1270566559.3340.9.camel@trini-m4400>
	<w2kb6ebd0a51004060825yc9696da3z4076cf2acf6112e9@mail.gmail.com>
	<1270570937.24602.24.camel@localhost.localdomain>
Organization: Mentor Graphics Corporation
Date: Tue, 06 Apr 2010 10:21:40 -0700
Message-ID: <1270574500.3340.96.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 06 Apr 2010 17:22:00.0160 (UTC)
	FILETIME=[AA979600:01CAD5AD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: enhancements from Poky for fetching and relocatability
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
X-List-Received-Date: Tue, 06 Apr 2010 17:25:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-04-06 at 17:22 +0100, Joshua Lock wrote:
> On Tue, 2010-04-06 at 08:25 -0700, Chris Larson wrote:
> > On Tue, Apr 6, 2010 at 8:09 AM, Tom Rini <tom_rini@mentor.com> wrote:
> >=20
> > > On Tue, 2010-04-06 at 15:35 +0100, Joshua Lock wrote:
> > > > On Thu, 2010-04-01 at 15:21 -0700, Tom Rini wrote:
> > > > > On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
> > > > > > Module: openembedded.git
> > > > > > Branch: rpurdie/work-in-progress
> > > > > > Commit: ccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> > > > > > URL:
> > > http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3Dc=
cbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> > > > > >
> > > > > > Author: Joshua Lock <josh@linux.intel.com>
> > > > > > Date:   Wed Mar 31 11:22:02 2010 +0100
> > > > > >
> > > > > > packaged-staging: enhancements from Poky for fetching and
> > > relocatability
> > > > >
> > > > > Question.  Do we really want to rename DEPLOY_DIR_PSTAGE to PSTAG=
E_DIR.
> > > > > Is that really a nomenclature change like that?  I see it's still=
 soft
> > > > > assign so outsideof TMPDIR can work still, so it's fine otherwise=
.
> > >  Just
> > > > > checking.
> > > > >
> > > >
> > > > I changed the name because we now have two pstage directories and w=
anted
> > > > the change to be apparent and I dropped the DEPLOY_ prefix as I mov=
ed
> > > > the default location outside of the deploy dir.
> > > >
> > > > Does that seem reasonable?
> > >
> > > I think so, but I must be missing something.  Are you talking about t=
he
> > > dir where we assemble packages as the 2nd one?  Or something else?
> > > Haven't made my coffee yet today...
> >=20
> >=20
> > I haven't looked at the patches in a while, but from what I recall, he
> > splits the dir where the pstage .ipk files go from the rest of the file=
s
> > that cluttered up DEPLOY_DIR_PSTAGE.  I could be remembering incorrectl=
y, of
> > course (do that a *lot* :).
>=20
> My memory is recalling the same thing ;-)

Sounds fine then.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


