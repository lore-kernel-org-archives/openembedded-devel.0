Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuxOm-0005ch-Li
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 01:23:09 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090417231904.BKKW16134.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 19:19:04 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id gnK31b00L4dMFYL03nK3UN; Fri, 17 Apr 2009 19:19:03 -0400
X-Authority-Analysis: v=1.0 c=1 a=PoRkGHk4kssA:10 a=2BL7SsxftHYA:10
	a=OqtE8aXPCf4tGz0AxkUA:9 a=o-ZrlWXmM03Sy2aOKHIA:7
	a=DfpPp5xdsRH2SBDjnqn8jebpTTQA:4
X-CM-Score: 0.00
Date: Fri, 17 Apr 2009 16:19:03 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090417231903.GX17629@smtp.west.cox.net>
References: <59e7e6f90904171406x49c44219pffd6f79e87ff90d1@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <59e7e6f90904171406x49c44219pffd6f79e87ff90d1@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: compiling for a coprocessor with a different architecture
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
X-List-Received-Date: Fri, 17 Apr 2009 23:23:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2009 at 04:06:32PM -0500, Mike Turquette wrote:
> Hi all,
> 
> I work at TI and have some internal recipes we use to build DSP stuff
> in OE for OMAP.  The existing recipes are gross and fetch the DSP
> toolchain from a local server, then any other recipe that needs to be
> compiled with that for the DSP simply calls the compiler from native
> staging in a hardcoded fashion.
> 
> What is the right way to compile a subset of recipes for a different
> architecture than your main Linux stuff within OE?  Is there a
> mechanism for this already?  I'd like something that wasn't specific
> to TI or my recipes, and can be used for any number of coprocessors
> that have a different architecture from the main CPU.

Hmm.  If you can limit yourself to just one DSP toolchain, something
kind of like how we do canadian builds would work.  Roughly speaking,
check out conf/bitbake.conf for SDK_* variables and make DSP_ version.
Also check out classes/canadian*bbclass.

-- 
Tom Rini


