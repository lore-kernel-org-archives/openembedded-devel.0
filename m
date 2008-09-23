Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KiBZ4-0002Oi-Eo
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 19:20:42 +0200
Received: from gandalf.denix.org ([71.255.232.65]) by vms173005.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K7N0089IRZLT0UI@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Sep 2008 12:16:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D14B06B83B5; Tue,
	23 Sep 2008 13:16:32 -0400 (EDT)
Date: Tue, 23 Sep 2008 13:16:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20080919210118.GA4101@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080923171632.GA28205@denix.org>
MIME-version: 1.0
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com> <20080912015320.GB17523@denix.org>
	<20080912021136.GA20033@gmail.com> <gaggd6$86a$1@ger.gmane.org>
	<20080913190643.GA14530@gmail.com> <20080915071849.GA7168@denix.org>
	<20080919210118.GA4101@denix.org>
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
X-List-Received-Date: Tue, 23 Sep 2008 17:20:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 19, 2008 at 05:01:18PM -0400, Denys Dmytriyenko wrote:
> Khem,
> 
> On Mon, Sep 15, 2008 at 03:18:49AM -0400, Denys Dmytriyenko wrote:
> > On Sat, Sep 13, 2008 at 12:06:43PM -0700, Khem Raj wrote:
> > > >>> I agree that this is not a proper fix, but rather a hack. glibc has its own
> > > >>> limits.h, which wants to include gcc's limits.h like this:
> > > >>>
> > > >>> This issue was brought up before, but as far as I can tell, it wasn't fixed
> > > >>> properly.
> > > >>> This is initial Koen's post about the issue:
> > > >>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
> > > >>> And here is your own reply with one of the possible solutions:
> > > >>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
> > > >>
> > > >> right. So can you try this patch and see if this fixes the problem ?
> > 
> > The proper fix seems to work fine. Thanks for applying the patch.
> 
> I see most of gcc-cross* recipes been cleaned removing the hack mentioned 
> above, but there are few more, mostly CodeSourcery ones. The patch for those 
> is in the ticket #4560:
> 
> http://bugs.openembedded.net/show_bug.cgi?id=4560

Any updates for this item? Please let me know if the patch needs more work. 
Thanks.

-- 
Denys


