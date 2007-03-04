Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HNoR5-0003aV-35
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 11:59:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24AxRr9010692
	for <openembedded-devel@openembedded.org>; Sun, 4 Mar 2007 10:59:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10130-06 for <openembedded-devel@openembedded.org>;
	Sun,  4 Mar 2007 10:59:24 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24AxLbP010672
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 4 Mar 2007 10:59:21 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45EA86BE.2030002@dominion.kabel.utwente.nl>
References: <45E77A73.5020800@protium.com>
	<45E7F2C4.9030300@dominion.kabel.utwente.nl>
	<1172949738.5942.57.camel@localhost.localdomain>
	<45EA86BE.2030002@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 10:59:20 +0000
Message-Id: <1173005960.5832.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Sun, 04 Mar 2007 10:59:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-03-04 at 09:43 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> > On Fri, 2007-03-02 at 10:47 +0100, Koen Kooi wrote:
> >> Again: the ability to use deploy as a feed is still present, it only moved to subdirectories.
> >
> > Which changed a behaviour people were relying on.
> >
> > My view on this is currently that:
> >
> > * Being able to use tmp/deploy/ipk as a feed is a useful feature
> > * we should continue to allow that (as developer use only, not for
> > building real feeds off)
> 
> Sure, but people wanting that can do 'bitbake -b contrib/oe-ipkg-feed.bb'. Building a feed
> not used for rootfs assembling during do_rootfs is plain wrong. Can we at least agree on
> it being out of scope for do_rootfs?

do_rootfs requires a feed at the moment. If its going to create a feed,
we might as well make that feed useful. If a new do_rootfs is created
that doesn't require a feed, I will accept that it need not generate a
feed. We will have package-index for that which is intended to setup
tmp/deploy/ipk as a feed, effectively.

Sticking .bb files in contrib is just plain silly, especially when it
should be doing the same thing as package-index.bb.

I accept there is a fine line between this and supporting feed
generation from OE. The thing is people have been happily using that
directory as a feed, not for users but for development work. I don't
think its fair to break that when we don't need to.

> > Since a number of people want the older single feed behaviour, I think
> > we should have some way of allowing that.
> 
> 'bitbake -b contrib/oe-ipkg-feed.bb' which is only a few chars more as 'bitbake
> package-index'. Same amount of commands and 'post-processing'

But why make this so difficult for people?

> > I understand why people want
> > the split feed behaviour too and we should allow people to select that
> > too. Which should be default I don't really care about.
> 
> People keep saying that do_rootfs should build a feed that can be used as a feed, but what
> is the point in that? OE builds only stuff that's put in the images, so the feed would
> almost be a 1:1 copy of the image you install on your device. 

Eh? I can type bitbake something, then the something packages appear in
deploy. OE isn't just about image generation, that's just what a lot of
people happen to use it for. Or are we going to break anything that
isn't an image target next?

> If you start building more
> packages and run do_rootfs again you're getting into the territory of what you called
> "long standing distro feeds" and associated bugs.

Then that would be a bug which we need to fix in OE. I build tons of
packages every day which are not included in my rootfs and nothing
appears to break. If it did, I would fix the bug.

OE is not just about image generation!

> Think about the situation for a moment:
> 
> * OE builds packages and puts those somewhere
> * OE uses said packages to make a rootfs

Yes, long established behaviour.

> As a side effect you get something you could use a feed after do_rootfs has run.
> Or you ran manually ran 'bitbake package-index'.

Yes, long established behaviour.

> So it always required an extra command (either 'bitbake <foo>-image' or 'bitbake
> package-index'), since the index wasn't refreshed automagically after you built a package.

Nobody has a problem with that.

> However, there is one thing that breaks, which is the upload scripts people were using. My
> suggestion that scripts can be changed didn't go over to well, so I don't have a solution
> for that.

People wanted the old behaviour to be selectable. I don't see why its a
problem. It doesn't appear to hurt anything. Yes, you need to beware how
you use it but that was the case before and is still the case.

> I don't disagree with having a way in OE to generate a feed out of the contents in
> deploy/, but given the problems raised OE should make clear you'll have no warranty and it
> will eat your dog. What about having an OE way that creates 'deploy/bogofeed', in the
> spirit of linux' bogomips?

I think this is now more than well documented on the mailing list and we
can refer anyone having problems to them.

Cheers,

Richard




