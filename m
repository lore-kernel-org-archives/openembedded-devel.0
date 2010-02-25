Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NkhRP-0001mn-50
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 18:24:00 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NkhOh-0000UV-41 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 09:21:11 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 25 Feb 2010 09:21:10 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Feb 2010 17:21:09 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Feb 2010 10:21:07 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267094388.4243.1.camel@rex>
References: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc>  <20100213161449.GD30265@mx.loc>
	<1267058975.18176.527.camel@trini-m4400> <1267094388.4243.1.camel@rex>
Organization: Mentor Graphics Corporation
Date: Thu, 25 Feb 2010 10:21:07 -0700
Message-ID: <1267118467.18176.533.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Feb 2010 17:21:10.0533 (UTC)
	FILETIME=[EC7D1B50:01CAB63E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND canadian?
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
X-List-Received-Date: Thu, 25 Feb 2010 17:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-02-25 at 10:39 +0000, Richard Purdie wrote:
> On Wed, 2010-02-24 at 17:49 -0700, Tom Rini wrote:
> > On Sat, 2010-02-13 at 17:14 +0100, Bernhard Reutner-Fischer wrote:
> > > On Sat, Feb 13, 2010 at 01:51:46PM +0100, Bernhard Reutner-Fischer wr=
ote:
> > > >On Thu, Feb 11, 2010 at 12:53:01PM +0000, Phil Blundell wrote:
> > > >>On Wed, 2010-02-10 at 21:13 +0100, Bernhard Reutner-Fischer wrote:
> > > >>> index 0000000..bc5e9ff
> > > >>> --- /dev/null
> > > >>> +++ b/recipes/xz/xz-native.inc
> > > >>> @@ -0,0 +1,2 @@
> > > >>> +inherit native
> > > >>> +require xz_${PV}.bb
> > > >>
> > > >>You could consider using BBCLASSEXTEND to eliminate the need for th=
is
> > > >>separate recipe.
> > > >
> > > >Thanks for that, good thing. This will trim down alot on the number =
of
> > > >recipes in the tree!
> > >=20
> > > AFAICS BBCLASSEXTEND does not take canadian into account ATM, so i co=
uld
> > > convert mpfr without pain but gmp-canadian on darwin (at least 4.2.4 =
is
> > > mentioned in there) will/would break AFAICT, is that correct?
> >=20
> > Since I didn't see a reply... at current, yes BBLCASSEXTEND only covers
> > -native (and not -cross, -cross-sdk/-sdk nor -canadian*).
>=20
> BBCLASSEXTEND covers -native and -nativesdk

Is the -nativesdk part implicit in the anonfuncs in nativesdk.bbclass or
just not merged yet?

> The -cross, -crosssdk, -canadian-cross and other combinations usually
> have too many differences to be worth the effort although it would be
> possible to make them work.

I'm not so sure about that, but we'll see.  I should have some form of
canadian stuff working again shortly.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


