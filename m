Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JZ4EJ-0004Km-8f
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 14:09:26 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx02.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JZ4CM-0002ak-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 08:07:19 -0500
Message-ID: <47D6847D.5070007@dls.net>
Date: Tue, 11 Mar 2008 08:09:17 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>
In-Reply-To: <200803110807.11368.zecke@selfish.org>
X-SA-Exim-Connect-IP: 216.145.245.198
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 13:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

[top posting to save readers time]

+100 from me (can I do that?) --- as a long time SCM proponent (SCM 
consulting has clothed and fed my family and put a roof over our heads 
for many years), I am hugely in favor of switching to another tool and 
using features such as branching!

I haven't used git myself, but from what I've read, it seems to be the 
logical choice, so I concur with that choice as well.

(It would be so incredible to have a proper tool for branching and 
merging - this would make me rather happy!)

Mike (mwester)



Holger Freyther wrote:
> Hey,
> 
> I'm anything but happy with the way we work with our repository. We have a 
> dreambox branch that is not mergable due issues with our SCM system, the 
> OpenMoko guys have to go back to diffing and applying the diff and merging by 
> hand, we just commit fundamental changes like sysroot, packaged-staging, RFCs 
> in one go and then do weeks of fixing. And I can continue with this list.
> 
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
> 
> 
> The issue:
> 	- mtn can not merge. Forcing me to manually delete files in one copy to do a 
> 	  merge is not acceptable.
> 	- mtn has not the concept of short-lived branches (e.g. deleting their 
> 	  existence once done), mtn suspend does not work as witnessed by our 
> 	  automerger.
> 	- mtn pluck is not making me happy
> 	- I lack a GUI to easily browse the repository
> 	- I can not clean up changes before I push them!
> 
> 
> I want that we use more branches for development, apply review on them, 
> land/merge/push these branches after review, pull peoples changes from other 
> hosts, work on perfetch patch series before landing patches. I believe we 
> need to deploy this kind of development in OE again and as mtn is the 
> obstacle to this kind of development I propose to switch to another SCM 
> system that allows us to develop OpenEmbedded the way it should be developed.
> 
> My criteria:
> 	- Should have branches, easy merging, easy merging of merges
> 	- Branches and merging should be cheap
> 	- Make it easy to put the OE tree into another SCM and still be able
> 	  to merge (git-svn and such)
> 	- A good graphical tool to browse the repository
> 	- A good and maintained web frontend
> 	- A good set of builtin tools (e.g. like git-add -i and git-rebase -i)
> 
> I think the two options are hg and git, I tend to favor git due the size of 
> its community. I want to switch OE to one of these systems by the end of this 
> month and start using more branches and creating perfect patch series again.
> 
> 
> comments? agreement?
> 
> 	z.
> 
> 
> PS: It is not the speed of mtn, it is the lack of development in areas like 
> branches, merging, rebasing, we need to use these in OE!
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


