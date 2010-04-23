Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O5QiM-0000St-MQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 23:47:24 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O5Qec-0007YF-HF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 14:43:18 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 23 Apr 2010 14:43:18 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 23 Apr 2010 21:43:17 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Apr 2010 14:43:13 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100423205439.GC27322@denix.org>
References: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>
	<hqrv2b$a7u$1@dough.gmane.org> <1272046053.3865.425.camel@trini-m4400>
	<20100423182217.GB27322@denix.org> <hqsprc$no6$1@dough.gmane.org>
	<1272048959.3865.478.camel@trini-m4400> <hqt003$fvd$1@dough.gmane.org>
	<20100423205439.GC27322@denix.org>
Organization: Mentor Graphics Corporation
Date: Fri, 23 Apr 2010 14:43:13 -0700
Message-ID: <1272058993.3865.531.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Apr 2010 21:43:18.0013 (UTC)
	FILETIME=[FC57DAD0:01CAE32D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of TARGET_SYS
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
X-List-Received-Date: Fri, 23 Apr 2010 21:47:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-04-23 at 16:54 -0400, Denys Dmytriyenko wrote:
> On Fri, Apr 23, 2010 at 10:29:54PM +0200, Koen Kooi wrote:
> > >> Yes, that needs to be done, as well as seperating the cross tools in
> > >> case different archs need different versions (as is the case with
> > >> angstrom, v5te and v7a need different binutils). This change largely=
 to
> > >> to cosmetically highlight that the toolchain is not really "universa=
l"
> > >> (yet).
> > >=20
> > > And we can talk about if "universal" is really a good goal either.
> >=20
> > I don't think we can make it "universal" without sacrificing key benefi=
ts.
> >=20
> > > Taking a bit of a guess in the dark, an SDK with support for all the =
fun
> > > stuff found on Beagleboard might not be done easily with also having
> > > support for all the fun stuff found on some other ref board too.
> >=20
> > The immediate problem I'm trying to address now is that having both an
> > armv5te and armv7a toolchain installed is breaking horribly. Ideally
> > they would coexist peacefully, but I don't know if we can manage that,
> > without impacting the ease of use.
>=20
> I know it's not what you are looking for, but easier workaround would be =
to=20
> install different toolchains in different paths... :)

Or, noting all of the very machine specific stuff Koen mentions
elsewhere, we don't pretend it's an SDK for armv7a but just call it an
SDK for ${MACHINE} and encode that into the PATH.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


