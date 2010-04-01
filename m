Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxQSQ-0003ew-Jh
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 21:53:42 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxQPE-0000xY-V6 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 12:50:20 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 12:50:20 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 19:49:27 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 12:49:24 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270145520.4993.157.camel@rex>
References: <E1NxJrs-0006SS-LZ@melo.openembedded.org>
	<1270137923.6277.101.camel@trini-m4400> <1270139665.4993.152.camel@rex>
	<1270140902.6277.123.camel@trini-m4400> <1270145520.4993.157.camel@rex>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 12:49:24 -0700
Message-ID: <1270151364.6277.131.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 19:50:20.0593 (UTC)
	FILETIME=[8F992210:01CAD1D4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: post-process non-binary files to fix paths packages
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
X-List-Received-Date: Thu, 01 Apr 2010 19:53:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 19:12 +0100, Richard Purdie wrote:
> On Thu, 2010-04-01 at 09:55 -0700, Tom Rini wrote:
> > On Thu, 2010-04-01 at 17:34 +0100, Richard Purdie wrote:
> > > > There's a lot more than just .la files that get these paths wrong. =
 If
> > > > you use the scan_cmd you set on native/etc for everything you can f=
ix
> > > > them all up.
> > >=20
> > > It scans everything for -native packages and just .la files for targe=
t
> > > packages. I'd argue that for target packages we're better off fixing =
the
> > > problems at source since the real target packages are probably also
> > > bust?
> >=20
> > Ah, hmm.  It's possibly just the .la files on the target (which some of
> > us would like to see die and I can't argue against), I hadn't really
> > bothered to differentiate (and I don't think it's a noticeable time
> > diff).  Less logic also brings it closer to working for relocation of
> > everything.
>=20
> But at the cost our target packages are most likely buggy. We accept
> the .la files are a problem and there is a solution (libtool sysroot
> support) but we're not there yet.
>=20
> I'd like to see the other problems addressed, not brushed under the
> carpet so to speak.
>=20
> You can trivially make this work on all files in your
> local.conf/distro.conf anyway. I'd not like to see that the default.

My worry is that we're missing something important.  What level of
relocation torture have you put this through?  I'm thinking on if I can
merge what you've got into my version easily enough to give it a workout
over the weekend.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


