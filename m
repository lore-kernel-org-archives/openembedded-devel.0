Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LJrg5-0002V2-Oi
	for openembedded-devel@openembedded.org; Mon, 05 Jan 2009 16:47:42 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090105154143.MKKJ11567.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 5 Jan 2009 10:41:43 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id zrhg1a00C1E665w04rhgMx; Mon, 05 Jan 2009 10:41:43 -0500
X-Authority-Analysis: v=1.0 c=1 a=UA0Z595oU3QA:10 a=nvBvAxcGjs0A:10
	a=6LRGvzUkpSJhU01C7LUA:9 a=bMMcjrz9uJ49wfXYEmSEVK1unkIA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 5 Jan 2009 08:42:10 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090105154209.GR400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native	and sdk recipes)
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
X-List-Received-Date: Mon, 05 Jan 2009 15:47:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 05, 2009 at 03:31:53PM +0100, Esben Haabendal wrote:
> On Fri, Jan 2, 2009 at 5:37 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> > On Fri, Jan 02, 2009 at 01:11:53AM +0000, Richard Purdie wrote:
> >
> > [snip]
> >> Ideally I want to be able to generate a Linux 32 bit toolchain, a Linux
> >> 64 bit toolchain and a windows one. If I can do that using canadian-sdk,
> >> the current -sdk stuff can be removed.
> >
> > It's a theory, and not one I've tested (and I know it won't work _today_
> > as there's some hard-coded C:\ paths right now.  Those can die if we
> > build it properly relocatible like CodeSourcery does).
> 
> Sorry, but where would that be?
> 
> In class/canadian-sdk.bbclass:
> 
> SDK_PATH_sdk-mingw32 = "/OpenEmbedded/${SDK_NAME}"
> SDK_REALPATH = "${SDK_PATH}"
> SDK_REALPATH_sdk-mingw32 = "C:/OpenEmbedded/${SDK_NAME}"
> 
> Which should only hard-code C:/ into mingw32 toolchains.  I don't
> remember seing C:\

Just mis-remembered.  But the big point is we should be able to compile
everyone for /OpenEmbedded/${SDK_NAME} and it should just work.

-- 
Tom Rini


