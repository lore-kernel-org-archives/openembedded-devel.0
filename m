Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LjcHU-0004rb-Kv
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 17:37:07 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090317163557.BDOW16134.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 12:35:57 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id UGbw1b00H4dMFYL04Gbwh3; Tue, 17 Mar 2009 12:35:56 -0400
X-Authority-Analysis: v=1.0 c=1 a=rNEJ9tYmwsHcF_sKVXUA:9
	a=nHRrQKAdBKk5Y1DentEA:7 a=BbSfe-FvDkZpA24mwB99bsqgalMA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Mar 2009 09:35:56 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090317163556.GK26343@smtp.west.cox.net>
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
	<49BFC107.5050806@dls.net>
MIME-Version: 1.0
In-Reply-To: <49BFC107.5050806@dls.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 16:37:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2009 at 10:25:59AM -0500, Mike (mwester) wrote:
> Marcin Juszkiewicz wrote:
> > Hi
> > 
> > I know that there were lot of talks about creating stable branch of 
> > OpenEmbedded in last months. But we need stable branch for vendors which 
> > use our product.
> > 
> > As some people know I am working for Bug Labs company. Their product 
> > named 'BUG Linux' is based on Poky 'pinky' (last stable release). We 
> > were considering switch to newer (but never released) version named 
> > 'elroy' but recently we decided to switch to OpenEmbedded. 
> > 
> > But to what kind of OE? Development branch change every day and things 
> > break from time to time, packages get version bumps without notifying 
> > anyone etc. Other possibility would be switch to stable branch but 
> > current one is deprecated and not maintained anymore.
> > 
> > So the situation looks like we will need new stable branch with few 
> > maintainers (I will be one of them) and with proper policies for merging 
> > updates from development tree of OE. I maintained OE branches used for 
> > OpenZaurus/Familiar few years ago so can say that I have needed 
> > experience for it.
> > 
> > Which things needs defining? I have few in mind:
> > 
> > 1. Adding new things. This should be possible only by backporting from
> >    OE.dev tree and needs to be Acked by at least 2-3 developers which
> >    use stable branch. New code has to build for at least one distro and
> >    ARM+x86 architectures (unless it is related to one arch or even one 
> >    machine).
> > 
> > 2. Marking recipes as buildable or not. With over 6000 of them it is
> >    really hard to check everything for status. We can remove many old
> >    versions but sometimes they are useful for some projects. I would   
> >    rather add things like BUILDABLE_armv4t = "1" into recipe or into
> >    conf/distro/include/${DISTRO}-status.inc file. Similar status for
> >    recipes which are known to not work for some archs.
> > 
> > 3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete' 
> >    dirs in metadata - both should be dropped in stable branch. Other
> >    recipes can be marked as not buildable or dropped from branch - I did
> >    not thought yet on it.
> > 
> > 4. Lifetime of branch. Will we do new stable release after 6 months or
> >    after one year? For how long stable branch will be supported by OE
> >    itself? I know that there will be companies which will provide
> >    support for longer time - thats what I do with Poky 'pinky' now.
> > 
> > What do you feel about it? Any opinions or suggestions? Want to join 
> > effort?
> 
> +1 from me.

+1 from me as well.

> I'd also suggest that it might be helpful if we could define one or a
> few "reference host configurations".  On this side of the pond, for
> commercial work that would be RHEL4 or RHEL5.  I'll volunteer to set up
> such a reference host, and document the necessary packages/patches
> required to build the stable branch on that platform.

I'd like to add Ubuntu 8.10.  Further, for each of these reference host
configurations we need to say what's installed, preferably by meta
packages (in Ubuntu's case, say ubuntu-minimal + ubuntu-standard) and
specific packages ('gcc', 'g++', etc..).  And I too can help with the
env.  FWIW, a chroot should be good enough for this..

-- 
Tom Rini


