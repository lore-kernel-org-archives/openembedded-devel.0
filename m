Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JZ3Fm-0006RF-VG
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:06:49 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JZ3jF-0002yo-D4
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:37:13 +0100
Message-ID: <47D67568.4060205@kernelconcepts.de>
Date: Tue, 11 Mar 2008 13:04:56 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>
In-Reply-To: <200803110807.11368.zecke@selfish.org>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 12:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

Holger Freyther schrieb:
> I'm anything but happy with the way we work with our repository. We have a 
> dreambox branch that is not mergable due issues with our SCM system, the 
> OpenMoko guys have to go back to diffing and applying the diff and merging by 
> hand, we just commit fundamental changes like sysroot, packaged-staging, RFCs 
> in one go and then do weeks of fixing. And I can continue with this list.

agreed, looking at other projects it becomes clear that we could do much better.

> What: I think we should use more branches
> 	- As many shortlived and medium lived branches as developers want
> 	- Shared branches for stuff like packaged staging, RFCs, sysroot. Were you
> 	  start the development, add features, other people will compile their stuff, 
> 	  other compile and then you rebase and merge!
> 	- Basicly you develop a feature in a branch until it is ready and not 
> 	  impacting other things, then you rebase/cleanup, propose it for inclusion 
> 	  and wait for feedback, then merge.
> 	- Stable distributions and vendors get their own branch, they can merge, 
> 	  cherry-pick what ever they want.

This implies a similar workflow like for the Linux kernel development. With
working tools a good idea. The only disadvantage I see is that a major share of
the developers (including myself) might not be used to this yet. But I would be
fine with that.

> The issue:
> 	- mtn can not merge. Forcing me to manually delete files in one copy to do a 
> 	  merge is not acceptable.

That's the major drawback of mtn - even CVS is better resolving conflicts.
Another major issue is the missing support for atomic operations. If an update
fails it happens that you end up in an undefined state where it is hard or even
impossible to recover from.

> I want that we use more branches for development, apply review on them, 
> land/merge/push these branches after review, pull peoples changes from other 
> hosts, work on perfetch patch series before landing patches. I believe we 
> need to deploy this kind of development in OE again and as mtn is the 
> obstacle to this kind of development I propose to switch to another SCM 
> system that allows us to develop OpenEmbedded the way it should be developed.

It would reduce the effort for maintaining a kind of 'testing' branch (in the
sense of Debian testing) where we put in stuff that is quite up to date but
basically tested.

> My criteria:
> 	- Should have branches, easy merging, easy merging of merges
> 	- Branches and merging should be cheap
Yes, very important.

> 	- Make it easy to put the OE tree into another SCM and still be able
> 	  to merge (git-svn and such)
that's another good point - OE is used as a tool for other projects who might
have decided for a different SCM before (e.g. OpenMoko and Poky). This would
make it much easier to integrate their work with OE and merge back changes.
For OE I would see this as a one of the key features the SCM must have.

> I think the two options are hg and git, I tend to favor git due the size of 
> its community. I want to switch OE to one of these systems by the end of this 
> month and start using more branches and creating perfect patch series again.

I do not think there are more candidates, but even deciding for one of these is
hard. :-} Do we have a good comparison between these somewhere?

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


