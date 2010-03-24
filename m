Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NuT1p-0008CY-FF
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 17:02:13 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NuSyk-0005N2-I8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 08:58:46 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 24 Mar 2010 08:58:45 -0700
Received: from 172.30.80.109 ([172.30.80.109]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 24 Mar 2010 15:58:00 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	24 Mar 2010 08:57:59 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269445040.1681.147.camel@rex>
References: <4B99791E.1020102@zenlinux.com> <4BA981A5.5030609@zenlinux.com>
	<19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
	<4BA9B440.2050608@zenlinux.com>  <1269426516.1681.35.camel@rex>
	<1269444453.2395.5.camel@trini-m4400> <1269445040.1681.147.camel@rex>
Organization: Mentor Graphics Corporation
Date: Wed, 24 Mar 2010 08:57:59 -0700
Message-ID: <1269446279.3545.8.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 24 Mar 2010 15:58:45.0975 (UTC)
	FILETIME=[E274AE70:01CACB6A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Wed, 24 Mar 2010 16:02:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-24 at 15:37 +0000, Richard Purdie wrote:
> On Wed, 2010-03-24 at 08:27 -0700, Tom Rini wrote:
> > On Wed, 2010-03-24 at 10:28 +0000, Richard Purdie wrote:=20
> > > The difference is that the old "sdk" assumes the system you want the =
sdk
> > > to run on is the same as the build system. This has always been a big
> > > can of worms causing problems so "nativesdk" removes this assumption =
and
> > > allows you to set SDKMACHINE to be the machine you want the resulting
> > > sdk to run on.
> > >=20
> > > This adds some complexity since we need another cross compiling
> > > toolchain. But cross compiling toolchains are something we're good
> > > at :). It also means we ship *everything* with the sdk including a
> > > standalone glibc massively removing system dependencies from the resu=
lt
> > > which in my opinion can only be a good thing.
> >=20
> > Or a really bad thing, yes.  I think nativesdk will help out a lot for
> > making canadian style builds cleaner.  But going so far as to say 'Oh,
> > lets just throw a libc into the SDK export' is going pretty far down a
> > questionable road.  I'm not so naive to think that there's not problems
> > with my next suggestion, but there's this thing called LSB for a reason=
.
> > If you want build once, run many distributions, you do that, not go and
> > own even more dependencies.
>=20
> However, an LSB compliant SDK becomes a case of installing "LSB" libs
> into the right sysroot and then setting some
> ASSUME_PROVIDED/PREFERRED_PROVIDER lines.
>=20
> So I think its good all around, we achieve independence of the SDK from
> the build system and make it depend on exactly what we do or don't want
> it to. Where is the bad bit (ignoring build time)? :)

How is this working on the runtime?  How relocatable is it?  How much
have we added to the size?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


