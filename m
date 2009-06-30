Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MLjbP-0004t9-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 22:06:52 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM2002E4HZ6SLZ7@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	30 Jun 2009 14:54:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D9A4614AF5F; Tue,
	30 Jun 2009 15:54:41 -0400 (EDT)
Date: Tue, 30 Jun 2009 15:54:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090630195441.GF6573@denix.org>
References: <5f2b60906300444w31cdcf67o6b3eeab0d1fb85ab@mail.gmail.com>
	<20090630170533.GC6573@denix.org>
	<5f2b60906301214u229a7095ne17b77afa08c8656@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <5f2b60906301214u229a7095ne17b77afa08c8656@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: bitbake virtual/kernel fails for davinci
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
X-List-Received-Date: Tue, 30 Jun 2009 20:06:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 30, 2009 at 09:14:30PM +0200, Bj??rn Forsman wrote:
> 2009/6/30 Denys Dmytriyenko <denis@denix.org>:
> > Since then linux-davinci tree was updated to 2.6.30 final and more
> > specifically, staging/vpfe branch was rebased from v2 to v3 vpfe patches.
> > Unfortunately, rebase rewrites the history and changes commit numbers, hence
> > the old commit cannot be found any more...
> 
> Ok. Thanks for explaining.
> 
> > I'll update the recipe with the latest state of the linux-davinci tree. But,
> > it may brake in the future again, as this is a moving target. If you want
> > something, which does not break that often, I'd suggest you don't use the
> > "git" version of the recipe - try setting PREFFERED_PROVIDER/VERSION for
> > 2.6.28 or 2.6.29...
> 
> Ok. I'll try setting PREFERRED_PROVIDER/VERSION next thing tomorrow.

I guess I should also add 2.6.30 version of the recipe. Although I've seen 
Kevin updating/moving the "v2.6.30-davinci1" tag...

> BTW, the currently missing git object was specified as a SHA1 hash in
> a variable called SRCREV. Could this variable be used for specifying
> git objects in other formats? For example "staging/vpfe" or "HEAD"? Or
> is it unwise to have recipes which uses "floating" revisions?

The branch "staging/vpfe" is already specified in the SRC_URI. As of pointing 
to the HEAD, you can check the comments in the linux-davinci_2.6.27.bb, if it 
still works. But it is not recommended, as it would be hard to manage 
different builds and support the correct upgrade path. You can still do it 
locally, as long as you keep updating the MACHINE_KERNEL_PR in the 
conf/machine/include/davinci.inc

-- 
Denys


