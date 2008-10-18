Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KrCRu-000819-7i
	for openembedded-devel@openembedded.org; Sat, 18 Oct 2008 16:06:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9IE6P8O000760
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 15:06:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32686-10 for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 15:06:12 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9IE68hf000746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 15:06:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200810181432.38565.zecke@selfish.org>
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<200810181432.38565.zecke@selfish.org>
Date: Sat, 18 Oct 2008 15:06:09 +0100
Message-Id: <1224338769.5215.26.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 14:06:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 14:32 +0200, Holger Freyther wrote:
> On Saturday 18 October 2008 11:03:29 Richard Purdie wrote:
> > What is most annoying is that given a bit longer I think we could have
> > done something that would have meant this was unnecessary, specifically
> > inserted the revision into the package at package_*.bbclass time where
> > we can manipulated PR as needed. This combined with a staging ABI change
> > would have been all that was needed. If staging ABI isn't enough, we can
> > insert the modified PR into STAMPS instead of the real PR or some other
> > magic. My point is that there are better options than FILE_PR, it just
> > needs some thought. The fact the testing branch had so many merge issues
> > should have meant a better idea was sought, not that is should be
> > committed ASAP.
> 
> I don't agree with this. This means package names will not match with the on 
> dir directory name. For me this was the strongest argument against doing it 
> automatically in the packaging bbclass. I really don't like the idea that if 
> I bump the DISTRO_PR the existing build directories will be recycled and 
> packages will be rebuild in there. That mostly defeats the purpose of a 
> deterministic tool. And I really don't like the idea of adding more python 
> black magic that is mangling PR... :)

We'll take this one to a separate thread.

> > 2. The Git conversion including the BKCVS data.
> >
> > I'd made it quite clear this should have been a tree graft and this
> > wasn't done so we're now stuck with broken history :(. This is pretty
> > frustrating since I'd repeatedly said not to include it and went to the
> > effort of gathering my conversion data and sending it to Jan who then
> > didn't realise what I meant by graft (though no fault of his own).
> 
> Should we start over from scratch and rebase what we have already added? Will 
> this be the _last_ time we consider it?

As far as I'm concerned, yes. This is a one off problem.

> > 4. Bitbake changes
> >
> > These should go to the bitbake list as well as the OE list and should be
> > discussed. I've raised issues with patches which have been ignored and
> > these patches have now just need committed. I'm not happy about the
> > process that was used :(. I know people have various commitments but we
> > need to try and stick to some kind of process for this kind of thing.
> 
> ???? Things have been ignored... three times...

I tried for a couple of *months* after the first versions of those
patches were published to talk to you on irc about them and you were
always too busy. I did reply on the mailing list about them but we never
got a discussion going about things. You at least *knew* I wanted too
discuss them.

To tell me I ignored them is just plain wrong.

> > Where from here?
> >
> > I'd actually like to a strong line on this and suggest we revert the
> > FILE_PR change since its badly thought out and also that we consider
> > redoing the git conversion ASAP and the replaying the recent commits
> > before its too late to get rid of the corruption in there. This is
> > probably going to have to go to a core team vote since its a pretty big
> > change to suggest but opinions are welcome.
> 
> Do whatever you want. 

This is the attitude that gets us into trouble. Its not what I want, its
a question of what is best for OE.

> I think FILE_PR is the right thing to do, feel free to 
> invest the time to redo the conversion, the scripts are public and Jan might 
> be able to upload the "source" for git-fast-import, please also coordinate 
> the git-rebase (we will lose merges but that seems okay, but I did merge the 
> FILE_PR changes on purpose for ease of reverting), make sure no one is 
> merging old history with new history (this was not a big problem with the 
> trial but will be one now)...

Right, if we do this, we need to do this carefully. If it needs to be me
that finds the time to do this, so be it, I'm the one complaining.
Obviously some tips on how to make the conversion would be good but I
will do it from scratch and blind if that pain makes you feel better.

Cheers,

Richard




