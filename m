Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NuZuq-0001cL-IX
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 00:23:13 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NuZrk-0000aM-Uw from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 16:20:01 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 24 Mar 2010 16:19:30 -0700
Received: from 172.30.80.109 ([172.30.80.109]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 24 Mar 2010 23:19:30 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	24 Mar 2010 16:19:29 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269453955.1681.165.camel@rex>
References: <4B99791E.1020102@zenlinux.com> <4BA981A5.5030609@zenlinux.com>
	<19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
	<4BA9B440.2050608@zenlinux.com>  <1269426516.1681.35.camel@rex>
	<1269444453.2395.5.camel@trini-m4400> <1269445040.1681.147.camel@rex>
	<1269446279.3545.8.camel@trini-m4400> <1269453955.1681.165.camel@rex>
Organization: Mentor Graphics Corporation
Date: Wed, 24 Mar 2010 11:46:05 -0700
Message-ID: <1269456365.3545.9.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 24 Mar 2010 23:19:30.0797 (UTC)
	FILETIME=[74CC49D0:01CACBA8]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND sdk vs. nativesdk
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
X-List-Received-Date: Wed, 24 Mar 2010 23:23:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-24 at 18:05 +0000, Richard Purdie wrote:
> On Wed, 2010-03-24 at 08:57 -0700, Tom Rini wrote:
> > On Wed, 2010-03-24 at 15:37 +0000, Richard Purdie wrote:
> > > On Wed, 2010-03-24 at 08:27 -0700, Tom Rini wrote:
> > > > Or a really bad thing, yes.  I think nativesdk will help out a lot =
for
> > > > making canadian style builds cleaner.  But going so far as to say '=
Oh,
> > > > lets just throw a libc into the SDK export' is going pretty far dow=
n a
> > > > questionable road.  I'm not so naive to think that there's not prob=
lems
> > > > with my next suggestion, but there's this thing called LSB for a re=
ason.
> > > > If you want build once, run many distributions, you do that, not go=
 and
> > > > own even more dependencies.
> > >=20
> > > However, an LSB compliant SDK becomes a case of installing "LSB" libs
> > > into the right sysroot and then setting some
> > > ASSUME_PROVIDED/PREFERRED_PROVIDER lines.
> > >=20
> > > So I think its good all around, we achieve independence of the SDK fr=
om
> > > the build system and make it depend on exactly what we do or don't wa=
nt
> > > it to. Where is the bad bit (ignoring build time)? :)
> >=20
> > How is this working on the runtime?  How relocatable is it?
>=20
> Its no more or less reclocatable than the original was, that wasn't an
> objective. Some postprocessing with the same code we use in
> packaged-staging shouldn't see it being too bad though.

Today it's fully relocatable, if you use $ORIGIN.  Is that still true?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


