Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxmgF-0003jy-0H
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 20:32:51 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090425182756.UHES16134.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 14:27:56 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id juTw1b0084dMFYL04uTwrC; Sat, 25 Apr 2009 14:27:56 -0400
X-Authority-Analysis: v=1.0 c=1 a=pgl4xSkU13EA:10 a=EW5hFJrvp-MA:10
	a=Z3vyHhKYB7moO9TJx9sA:9 a=yBF_IWr0SaSpnzuAZow-n6IfNkoA:4
	a=SR-wqsnMdtQA:10
X-CM-Score: 0.00
Date: Sat, 25 Apr 2009 11:27:56 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090425182756.GH15489@smtp.west.cox.net>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251304.17624.mickey@vanille-media.de>
	<49F310E0.6030909@balister.org>
	<200904251540.40566.mickey@vanille-media.de>
	<be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the	new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 18:32:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 25, 2009 at 03:17:22PM -0300, Otavio Salvador wrote:
> Hello Mickey,
> 
> On Sat, Apr 25, 2009 at 10:40 AM, Michael 'Mickey' Lauer
> <mickey@vanille-media.de> wrote:
> > On Saturday 25 April 2009 15:32:16 Philip Balister wrote:
> >> Both Graeme and I have expressed concern that the commits in
> >> question should be reviewed.
> >
> > Good. Then do that. The commits fix the linking and RRECOMMENDS issue which was
> > not fixed by Koen's commit. Yes, they may break the update path, I'm sorry for
> > that, but sometimes you have to catch up with upstream and we have a stable
> > branch for a reason.
> 
> I belive that the stable branch is not a proper justification for this.
> 
> At least for me, stable is to provide a less moving target. A place where
> only tested things get in and all involved transitions are done only when
> already done in dev and merged all at same time to avoid a breakage.
> 
> This all is not a justification to break the whole World at dev. dev will
> be the basis of next stable, and even more, it is the source of changes
> for stable. So if we mess it up we'll end up with an very difficult to maintain
> stable branch and an unusable dev.

If I can sum up what it sounds like mickey is saying, he fixed some
issues that Koen didn't yet (and thus are back now that his changes are
committed).  So is .dev where we need to freak out and revert things
that do fix some issue but open another?

-- 
Tom Rini


