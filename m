Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LMuSH-0002nu-3g
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 02:22:01 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090114011525.NMQB8485.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 20:15:25 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 3DFC1b0041E665w04DFHdQ; Tue, 13 Jan 2009 20:15:25 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=b2ZvGRdsAAAA:8 a=Ee4E1S1o3n0iJVhKWCMA:9
	a=IX96GUKLl7ExgfU2fZi8HMKE-yUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 13 Jan 2009 18:15:39 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090114011539.GA2376@smtp.west.cox.net>
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
X-List-Received-Date: Wed, 14 Jan 2009 01:22:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
> On Fri, 2009-01-02 at 01:11 +0000, Richard Purdie wrote:
> > I just had a look through the trini/canadian-sdk branch and there are
> > bits I like and bits I dislike. I'll try and provide some feedback in
> > due course with a view to getting the less controversial bits merged. I
> > have some tweaks in poky to do with dynamic library extension handling
> > for example (from playing with darwin targets) where it would pay us to
> > find a common solution.
> 
> Sorry for the delayed feedback, what I've looked at so far follows
> below. It was easiest to extract some patches from your tree and make
> some commits of my own so these are in:
> 
> http://git.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/rpurdie/canadian-sofar
> 
> Basically I wanted to particularly review the changes to the existing OE
> core classes/bitbake.conf. The changes in that branch are versions I'm
> happy with. I had two concerns there:
> 
> 1. I don't want to see ${HOST_EXEEXT} everywhere but I know why you 
>    need it and this was something OE would inevitably face. As a 
>    compromise I propose adding:
> 
>    EXEEXT = "${HOST_EXEEXT}"
> 
>    and using ${EXEEXT} which is fractionally less ugly for all common 
>    uses. Could you update your patch to use ${EXEEXT} please assuming 
>    we all agree on this. Its the same dilemma as the SOLIBS stuff I 
>    have with Darwin :/
> 
> 2. All the bb.data.inherits_class() stuff is ugly as sin and totally 
>    unreadable. My series has a better patch.
> 
> Moving on to the rest of the code, I don't see a problem merging any of
> the totally new files. How about the following merge process:
> 
> a) We push my tree into OE

My git-fu is weak and since we can't delete remote branches without
bugging someone, can we do this step?  I've got...

> b) You rebase onto my tree's changes and adjust the EXEEXT stuff.
> 
> c) You add changes which add the EXEEXT changes only to existing 
>    recipes and commit that.
> 
> d) The checksums.ini changes are a no brainer.
> 
> e) You start adding the totally new files to OE directly in a logical 
>    sequence of something like:
> 
>    i) Add canadian core classes (classes/canadian*)
>    ii) Add mingw new recipes
>    iii) Add misc support recipes (gmp/mprf-canadian)
>    iv) Add new binutils recipes
>    v) Add new gcc recipes

... this done locally, mostly, in quilt.

-- 
Tom Rini


