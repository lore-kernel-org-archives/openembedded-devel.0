Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NkbB2-00062t-4g
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 11:42:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1PAds1a025248
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 10:39:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25167-02 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 10:39:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1PAdnLC025242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 10:39:50 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267058975.18176.527.camel@trini-m4400>
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
	<1267058975.18176.527.camel@trini-m4400>
Date: Thu, 25 Feb 2010 10:39:48 +0000
Message-ID: <1267094388.4243.1.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=RDNS_DYNAMIC,TVD_RCVD_IP
	autolearn=no version=3.2.5
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
X-List-Received-Date: Thu, 25 Feb 2010 10:42:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-24 at 17:49 -0700, Tom Rini wrote:
> On Sat, 2010-02-13 at 17:14 +0100, Bernhard Reutner-Fischer wrote:
> > On Sat, Feb 13, 2010 at 01:51:46PM +0100, Bernhard Reutner-Fischer wrote:
> > >On Thu, Feb 11, 2010 at 12:53:01PM +0000, Phil Blundell wrote:
> > >>On Wed, 2010-02-10 at 21:13 +0100, Bernhard Reutner-Fischer wrote:
> > >>> index 0000000..bc5e9ff
> > >>> --- /dev/null
> > >>> +++ b/recipes/xz/xz-native.inc
> > >>> @@ -0,0 +1,2 @@
> > >>> +inherit native
> > >>> +require xz_${PV}.bb
> > >>
> > >>You could consider using BBCLASSEXTEND to eliminate the need for this
> > >>separate recipe.
> > >
> > >Thanks for that, good thing. This will trim down alot on the number of
> > >recipes in the tree!
> > 
> > AFAICS BBCLASSEXTEND does not take canadian into account ATM, so i could
> > convert mpfr without pain but gmp-canadian on darwin (at least 4.2.4 is
> > mentioned in there) will/would break AFAICT, is that correct?
> 
> Since I didn't see a reply... at current, yes BBLCASSEXTEND only covers
> -native (and not -cross, -cross-sdk/-sdk nor -canadian*).

BBCLASSEXTEND covers -native and -nativesdk

The -cross, -crosssdk, -canadian-cross and other combinations usually
have too many differences to be worth the effort although it would be
possible to make them work.

Cheers,

Richard






