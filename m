Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <EsbenHaabendal@gmail.com>) id 1JZ0Aj-0003tj-PU
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 09:49:26 +0100
Received: from [192.168.18.42] ([77.233.226.18]) (authenticated bits=0)
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m2B8lJW5025308
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 09:47:25 +0100
Message-ID: <47D64717.3050804@gmail.com>
Date: Tue, 11 Mar 2008 09:47:19 +0100
From: Esben Haabendal <EsbenHaabendal@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200803110807.11368.zecke@selfish.org>
In-Reply-To: <200803110807.11368.zecke@selfish.org>
X-SA-Exim-Connect-IP: 193.201.35.47
X-SA-Exim-Mail-From: EsbenHaabendal@gmail.com
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
X-List-Received-Date: Tue, 11 Mar 2008 08:49:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

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
Without going into the specifics of the SCM tools discussion, I would
just like to say that I would REALLY REALLY love to see branches being
used actively in OE development, especially for feature development
(such as sysroot, packaged-staging, and so on) and for release engineering.

For OE to really reach it's potential we have to be able add even more
features while at the same time delivering stable releases/branches for
distro and product developers to work from.

When Joe-average-embedded-product-developer comes along, shopping for
which embedded Linux tool to use for his embedded product, he really
should be able to checkout a stable version of OE and be able to build a
toolchain and a simple image for all supported targets. And this is
certainly not the situation right now.

/Esben


