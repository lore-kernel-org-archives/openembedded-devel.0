Received: from [206.46.252.46] (helo=vms046pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ke3JA-0003gu-Gx
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 09:43:12 +0200
Received: from gandalf.denix.org ([71.255.232.65])
	by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K7200GD4NZD6WJA@vms046.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Sep 2008 02:40:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0DB956B8008; Fri,
	12 Sep 2008 03:40:25 -0400 (EDT)
Date: Fri, 12 Sep 2008 03:40:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20080912021136.GA20033@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080912074024.GC17523@denix.org>
MIME-version: 1.0
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com> <20080912015320.GB17523@denix.org>
	<20080912021136.GA20033@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Fri, 12 Sep 2008 07:43:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 11, 2008 at 07:11:36PM -0700, Khem Raj wrote:
> > > > #1 gcc-cross-sdk 4.3.1 missing include-fixed
> > > > http://bugs.openembedded.net/show_bug.cgi?id=4536
> > > > 
> > > > gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
> > > > which are missing in the gcc-cross-sdk version, rendering external toolchain
> > > > unusable.
> > > 
> > > I do not like this fix. IMO Instead of copying them into include directory 
> > > they should be let alone in include-fixed directory and packaged. You should 
> > > add knowledge of this new directory to the failing package instead. What 
> > > packages are broken because of this.
> > 
> > I agree that this is not a proper fix, but rather a hack. glibc has its own 
> > limits.h, which wants to include gcc's limits.h like this:
> > 
> > This issue was brought up before, but as far as I can tell, it wasn't fixed 
> > properly.
> > This is initial Koen's post about the issue:
> > http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
> > And here is your own reply with one of the possible solutions:
> > http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
> 
> right. So can you try this patch and see if this fixes the problem ?

Let me try it. The thing is it's for glibc only, I guess.

> > > > #2 external-toolchain misses providing runtime libgcc
> > > > http://bugs.openembedded.net/show_bug.cgi?id=4542
> > > > 
> > > > Since external-toolchain misses specifying libgcc as provided runtime library,
> > > > dependency tree picks up either gcc-cross or even gcc-noemu...
> > > 
> > > This one seems ok to me. 
> > 
> > Thanks! Whom should I ping to get it commited?
> 
> I can do it.

That would be great. Thanks.

-- 
Denys


