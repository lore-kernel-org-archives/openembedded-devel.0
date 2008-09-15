Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Kf8PD-00070n-Nl
	for openembedded-devel@openembedded.org; Mon, 15 Sep 2008 09:21:55 +0200
Received: from gandalf.denix.org ([71.255.232.65]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K780046J6ZGR19B@vms173003.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Mon, 15 Sep 2008 02:18:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DA2056B8008; Mon,
	15 Sep 2008 03:18:49 -0400 (EDT)
Date: Mon, 15 Sep 2008 03:18:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20080913190643.GA14530@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080915071849.GA7168@denix.org>
MIME-version: 1.0
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com> <20080912015320.GB17523@denix.org>
	<20080912021136.GA20033@gmail.com> <gaggd6$86a$1@ger.gmane.org>
	<20080913190643.GA14530@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Mon, 15 Sep 2008 07:21:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 13, 2008 at 12:06:43PM -0700, Khem Raj wrote:
> >>>>> gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
> >>>>> which are missing in the gcc-cross-sdk version, rendering external toolchain
> >>>>> unusable.
> >>>> I do not like this fix. IMO Instead of copying them into include directory
> >>>> they should be let alone in include-fixed directory and packaged. You should
> >>>> add knowledge of this new directory to the failing package instead. What
> >>>> packages are broken because of this.
> >>> I agree that this is not a proper fix, but rather a hack. glibc has its own
> >>> limits.h, which wants to include gcc's limits.h like this:
> >>>
> >>> This issue was brought up before, but as far as I can tell, it wasn't fixed
> >>> properly.
> >>> This is initial Koen's post about the issue:
> >>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
> >>> And here is your own reply with one of the possible solutions:
> >>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
> >>>
> >>
> >> right. So can you try this patch and see if this fixes the problem ?
> 
> I only did cross build/testing no target gcc stuff so I did not see this problem thus far.
> I thought gcc driver should have added include-fixed to default search paths for includes unless you disable it to do so like glibc does in such a case the application should add it to include search paths manually. 
> 
> If you can give more details about this failure on native build. I could try to dig more.

The proper fix seems to work fine. Thanks for applying the patch.

-- 
Denys


