Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NkRxo-0003nt-KC
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 01:52:25 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NkRv7-0006As-N6 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 16:49:37 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 24 Feb 2010 16:49:37 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Feb 2010 00:49:36 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	24 Feb 2010 17:49:35 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100213161449.GD30265@mx.loc>
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
Organization: Mentor Graphics Corporation
Date: Wed, 24 Feb 2010 17:49:35 -0700
Message-ID: <1267058975.18176.527.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Feb 2010 00:49:37.0517 (UTC)
	FILETIME=[67E349D0:01CAB5B4]
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
X-List-Received-Date: Thu, 25 Feb 2010 00:52:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-02-13 at 17:14 +0100, Bernhard Reutner-Fischer wrote:
> On Sat, Feb 13, 2010 at 01:51:46PM +0100, Bernhard Reutner-Fischer wrote:
> >On Thu, Feb 11, 2010 at 12:53:01PM +0000, Phil Blundell wrote:
> >>On Wed, 2010-02-10 at 21:13 +0100, Bernhard Reutner-Fischer wrote:
> >>> index 0000000..bc5e9ff
> >>> --- /dev/null
> >>> +++ b/recipes/xz/xz-native.inc
> >>> @@ -0,0 +1,2 @@
> >>> +inherit native
> >>> +require xz_${PV}.bb
> >>
> >>You could consider using BBCLASSEXTEND to eliminate the need for this
> >>separate recipe.
> >
> >Thanks for that, good thing. This will trim down alot on the number of
> >recipes in the tree!
>=20
> AFAICS BBCLASSEXTEND does not take canadian into account ATM, so i could
> convert mpfr without pain but gmp-canadian on darwin (at least 4.2.4 is
> mentioned in there) will/would break AFAICT, is that correct?

Since I didn't see a reply... at current, yes BBLCASSEXTEND only covers
-native (and not -cross, -cross-sdk/-sdk nor -canadian*).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


