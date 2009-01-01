Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LIVhi-00024t-PQ
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 23:07:47 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090101220204.KLVG2948.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 1 Jan 2009 17:02:04 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id yN221a00B1E665w04N22bl; Thu, 01 Jan 2009 17:02:04 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=B23kOqASdaRjjqYnmYYA:9 a=zneL1x-iP8MQD4eHfDQA:7
	a=ltoxsIRRZMijjd9fEJl5gDzDVPIA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 1 Jan 2009 15:02:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090101220229.GH7040@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1230840687.5320.56.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Thu, 01 Jan 2009 22:07:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 01, 2009 at 08:11:27PM +0000, Richard Purdie wrote:
> 
> On Thu, 2009-01-01 at 11:25 -0700, Tom Rini wrote:
> > On Thu, Jan 01, 2009 at 04:25:14PM +0000, Richard Purdie wrote:
> > 
> > > Its nice to try something a bit different occasionally. For a long time
> > > the mechanical repetitive nature of -native and -sdk recipes has
> > > bothered me and people have talked about getting rid of them since
> > > forever. I've had ideas floating around on how to address this for a
> > > while and I now have a proper proposal and better still a proof of
> > > concept.
> > 
> > I'll read the whole thing again later, but in working on the canadian
> > SDK stuff (*poke*) I've been thinking why don't we just build the "SDK"
> > packages for building our own stuff?  gcc/etc are relocatible if we
> > build them right...
> 
> Even if gcc is relocatable, some software (quilt springs to mind) has to
> be built using the paths it will be installed to. I'll happily support
> any effort to make as much as possible support relocation but at the
> very least we'll continue having -native packages and its them this is
> primarily aimed at. I wouldn't want to miss the opportunity to kill off
> many of the -sdk packages in poky at the same time though!

I know for quilt specifically anything you can compile in as a path you
can override in quiltrc, and you can pass-in --quiltrc, so... next? :)
But yes, I too wouldn't mind having a few less -sdk packages in my own
stuff too.

> I've been wondering how much the canadian SDK code will benefit from
> this and perhaps you can give some input on that?

Off the top of my head, it depends on if we want to allow one env to
make both a Linux and a Windows SDK.  The foo-canadian-sdk packages can
fit very easily into any reuse scheme (the gcc ones look like all of the
others now).  I was thinking there's no reason really (esp if we build
gcc correctly for relcation, which we don't now) that any 'target gcc
for sdk' recipe couldn't build for any one Linux or Windows target, but
not both.  For my needs, I want both Linux and Windows SDKs kicked out
from one bitbake invokation.

-- 
Tom Rini


