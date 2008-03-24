Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JdeKN-0002J0-Tq
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 05:30:32 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx04.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JdeKN-0005kC-8n
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Mar 2008 23:30:31 -0500
Message-ID: <47E72E65.3030609@dls.net>
Date: Sun, 23 Mar 2008 23:30:29 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>	<1205858910.7500.39.camel@dax.rpnet.com>
	<frosov$c0b$1@ger.gmane.org>	<47E5A67B.5030809@dls.net>
	<1206313579.4529.85.camel@dax.rpnet.com>
In-Reply-To: <1206313579.4529.85.camel@dax.rpnet.com>
Subject: Re: [RFC] move to opkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2008 04:30:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> I'm not going to comment specifically on the various aspects of this
> thread, it makes depressing reading and I can sympathise with the
> various sides.

Yes, it's depressing.  So something needs to be done.

> Yes, there is a strong desire to remove ipkg from OE entirely from
> certain parties and the reasons are political and complicated since
> there is a lot of history involved. Personally I'm on the fence, ipkg is
> a known quantity, bugs and all but I can see benefits of opkg.

 From what I know, I suspect opkg would be desirable as well, but we 
lack any information to determine what the cost would be.

Here's my proposed solution: let's revert the opkg changes.  And then 
let's do it right.  I'll be more than happy to drop all project 
activities I have going on right now to assist in a re-do of the opkg 
implementation.

(Conversely, and regrettably, I just don't see that someone telling me 
to reverse-engineer another distro in order for me to get the 
information necessary is going to be accurate, productive, or 
particularly beneficial to me or the community, so that's just not a 
solution.)


But let's leave the ipkg/opkg specifics aside for the moment...

[snip for brevity]

> This does raise the question of whether basing a distribution directly
> off .dev is a good idea? I know some people do, I also know its called
> the OE development branch for a reason.

Dev moves too fast; if a distro is not constantly at the tip of the dev 
branch, it is nearly impossible to get it working again. I know this 
because twice now I've let .dev get ahead of me too far, and it's been a 
real job to catch up.  In fact, if it wasn't for folks like rwhitby who 
took on a lot of the work, we wouldn't have ever caught up from the 
situation where I let several months elapse.

> The thing is I don't think this is a technical problem, its more a
> question about how OE.dev is managed and who can do what and how. If we
> all had to write down the aims and objectives of OE.dev, every one would
> be different :/.

This is probably the root of the problem.

I make an assumption about the gating criteria for entry of a change 
into the .dev branch; it seems this assumption is not shared.

But I did not form these assumptions in a vacuum -- they came from this 
very place -- this mailing list.  Specifically, from the several commits 
I made that upset certain people, who clarified (some more helpfully and 
politely than others, but that's life) what I should have done: to 
ensure that I properly communicated my intent to commit, and that I 
didn't break anyone else's stuff when I finally committed the change. 
I'm merely applying the criteria I was given (multiple times) to this 
situation.

Have we altered this thinking?  Can I now relax my criteria for 
committing changes, too?  Please don't tell me that this is a case where 
special dispensation has been granted for certain distros?

> I could wade into this discussion as I've done in others but I don't
> particularly want to and I'd prefer to let someone else deal with it.
> I've already wasted far too much time trying to type this so far, this
> is about the 3rd version since I'm not getting across what I think is
> the right message to all parties :/.
> 
> The battering I've had recently on list, off list and on irc are enough
> to make me seriously consider why I do what I do and whether I want to
> continue doing it.

I don't see where this is your problem.  In fact, you've been 
extraordinarily helpful in resolving past issues with changes.  You've 
gone above and beyond the call of duty in that regard -- for which I'm 
very grateful.

But where (and who) is the OE core team?  Why are they not enforcing 
some of the rules (or if they prefer, clarifying that .dev is a 
free-for-all)?  Either way would have resolved this issue, which 
primarily resulted from a different expectations of the completeness and 
quality of known-to-be-disruptive changes made on the branch.

> Richard - wishing everyone could coexist

Regards,
Mike (mwester) - wishing for consistency



