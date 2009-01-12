Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LMTnK-0005YE-SV
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 21:53:59 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090112204725.DLHZ8485.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 12 Jan 2009 15:47:25 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 2knQ1b00P1E665w03knQx9; Mon, 12 Jan 2009 15:47:24 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=PXGNFKlPTS4hl0ketd0A:9 a=M24n71aj7I66HnoqDGcA:7
	a=cHsD1t-M7wo7IWGoaluLVPTJUVwA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 12 Jan 2009 13:47:58 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090112204758.GE3342@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
	<20090109170434.GI400@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090109170434.GI400@smtp.west.cox.net>
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
X-List-Received-Date: Mon, 12 Jan 2009 20:53:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2009 at 10:04:35AM -0700, Tom Rini wrote:
> On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
> [snip]
> > * I'm also not keen on the SDK_PREFIX -> SDK_PATH change. Why? It 
> >   breaks things for people. In fact please back this out before merging 
> >   anything above, I don't see a good reason for it.
> 
> I tried not doing that and got (for MACHINE=efika):
> ERROR: Required build target 'canadian-sdk' has no buildable providers.
> Missing or unbuildable dependency chain was: ['canadian-sdk',
> 'virtual//OpenEmbedded/angstrom/powerpcbinutils']
> 
> That said, all I did was a quick dropping of the change.  I'm going to
> make sure that my current rebasing on top of your current branch builds
> for at least one target then I'll see about dropping the PREFIX->PATH
> change again.  But, I'm unsure if we can, in the current overall SDK
> implementation.  We do need to say "I need
> runs-on-mingw32-builds-for-powerpc binutils".  So the SDK_PREFIX ->
> SDK_PATH (in most cases) change makes sense.  We need one variable for
> the runs-on-builds-for and one for installs-into.  Or is there a trick
> I'm missing (aside from relocatible SDK, which I want)?

OK, I did some more thinking and looking into this.  The problem is that
(as Esben just noted) we have {TARGET,BUILD,HOST}_PREFIX that mean one
thing and SDK_PREFIX that means another.  Adding in the canadian stuff
also means that we need an SDK_PREFIX analogous to the others, along
with the "SDK is compiled for this path" variable.

We can either re-use SDK_PREFIX or in much of the new stuff,
s/${SDK_PREFIX}/${SDK_SYS}-/ but I really think the correct approach is
making SDK_PREFIX mean what {TARGET,BUILD,HOST}_PREFIX mean.  If you
really want, we can hold off on that until the big SDK rework.

-- 
Tom Rini


