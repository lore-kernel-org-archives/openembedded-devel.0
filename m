Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Kwt3N-00085R-Uw
	for openembedded-devel@openembedded.org; Mon, 03 Nov 2008 07:36:46 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081103043015.IPRT23774.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 2 Nov 2008 23:30:15 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id aUWC1a00G1E665w04UWD36; Sun, 02 Nov 2008 23:30:15 -0500
X-Authority-Analysis: v=1.0 c=1 a=GwTaWOckg3YA:10 a=yfBNVpTcCFIA:10
	a=E8AFcrTznjBedTch9pQA:9 a=5yOXf77S5KBQHppzSeYA:7
	a=MRaCHhyTdB0WjNSxSv3leF3LxXsA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 2 Nov 2008 21:30:12 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081103043012.GC5568@smtp.west.cox.net>
References: <490BF303.1030701@dls.net> <490E5FAA.9070206@dls.net>
MIME-Version: 1.0
In-Reply-To: <490E5FAA.9070206@dls.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Re: DISTRO_PR, ipkg dependencies, and meta	toolchains...
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
X-List-Received-Date: Mon, 03 Nov 2008 06:36:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 02, 2008 at 08:19:22PM -0600, Mike (mwester) wrote:
> Mike (mwester) wrote:
> 
> (Replying to my own email, and what's worse -- I'm top-posting!)
> (And I changed the subject line to add [RFC] to get your attention.)
> 
> I found the problem.  Here's a fix:

And this would explain why the problem wasn't seen before, 
<sarcasm>
All of you, me and poky use the SDK stuff
</sarcam>

:)

As the area in question came from me, that looks good to me.  That's
where we remove the dep the -dev package has on the main package, if the
main package doesn't exist.

[snip]
> This changes the dependencies written into the "-dev" packages so that
> they include the DISTRO_PR suffix correctly.

Actually, as I think more, why isn't ${DISTRO_PR} part of ${DEBPV} ?
That seems to be the real bug..

> (By-the-way, another solution might be to set DEBPV to include the
> DISTRO_PR, but grep was unable to tell me where that variable is set.)

... as you suggest.

-- 
Tom Rini


