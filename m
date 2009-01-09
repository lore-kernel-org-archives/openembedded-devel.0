Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LLKsF-0002oX-PN
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 18:10:22 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090109170402.EHOY2342.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 9 Jan 2009 12:04:02 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 1V431b00D1E665w03V43Yv; Fri, 09 Jan 2009 12:04:03 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=M3HJeWuXmWidmdhufEcA:9 a=3x2N49aqCTnPRm655kYA:7
	a=WH-zXRF7LelkZ9rxv5f4OBMZ5pUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 9 Jan 2009 10:04:35 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090109170434.GI400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1231462490.6467.85.camel@dax.rpnet.com>
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
X-List-Received-Date: Fri, 09 Jan 2009 17:10:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
[snip]
> * I'm also not keen on the SDK_PREFIX -> SDK_PATH change. Why? It 
>   breaks things for people. In fact please back this out before merging 
>   anything above, I don't see a good reason for it.

I tried not doing that and got (for MACHINE=efika):
ERROR: Required build target 'canadian-sdk' has no buildable providers.
Missing or unbuildable dependency chain was: ['canadian-sdk',
'virtual//OpenEmbedded/angstrom/powerpcbinutils']

That said, all I did was a quick dropping of the change.  I'm going to
make sure that my current rebasing on top of your current branch builds
for at least one target then I'll see about dropping the PREFIX->PATH
change again.  But, I'm unsure if we can, in the current overall SDK
implementation.  We do need to say "I need
runs-on-mingw32-builds-for-powerpc binutils".  So the SDK_PREFIX ->
SDK_PATH (in most cases) change makes sense.  We need one variable for
the runs-on-builds-for and one for installs-into.  Or is there a trick
I'm missing (aside from relocatible SDK, which I want)?

-- 
Tom Rini


