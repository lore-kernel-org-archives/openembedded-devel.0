Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LMSGI-0000xO-3k
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 20:15:46 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090112190916.JDUH2948.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 12 Jan 2009 14:09:16 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 2j9E1b0041E665w04j9Eby; Mon, 12 Jan 2009 14:09:16 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=VdEGk7eSNrKj4qQvQYoA:9 a=EIAjsg4qaQYsbmDRSTzi0EswZkEA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 12 Jan 2009 12:09:47 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090112190947.GA3342@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
	<20090109011603.GE400@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090109011603.GE400@smtp.west.cox.net>
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
X-List-Received-Date: Mon, 12 Jan 2009 19:15:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2009 at 06:16:03PM -0700, Tom Rini wrote:
> On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
[snip]
> > * The choice of OVERRIDE you're using worries me as sdk- is far to much 
> >   of a generic expression. You don't use the overrides much and only 
> >   for DEFAULT_PREFERENCE. Can we not find a better way to do this and 
> >   avoid adding overrides? The fact these are there suggests something 
> >   with the PROVIDES and DEPENDS logic you're using is broken as it 
> >   should be fairly magic (and a lot of effort went into that for the 
> >   standard toolchains) :/
> 
> I'll see what I can do about removing that, then.

While this must have been needed at some point in development (perhaps
before the changes I made to get the stuff built as $(target)-$(runs-on)
not just $(runs-on)) it's no longer.  Dropped locally and building
everything fine still.

-- 
Tom Rini


