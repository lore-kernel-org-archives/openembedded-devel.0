Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lmtsr-0001zk-4q
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 19:00:53 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KH400GG0KLYAWY1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	26 Mar 2009 12:58:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AF2916B83B5; Thu,
	26 Mar 2009 13:58:45 -0400 (EDT)
Date: Thu, 26 Mar 2009 13:58:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090326175845.GA6756@denix.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF746@hiob.intern.dresearch.de>
MIME-version: 1.0
In-reply-to: <69E6C70090A0A14498CC98FAE5E06B6E3CF746@hiob.intern.dresearch.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: u-boot update question
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
X-List-Received-Date: Thu, 26 Mar 2009 18:00:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 26, 2009 at 12:20:53PM +0100, Sledz, Steffen wrote:
> We like to update u-boot for our OXNAS machine from 1.1.2 to the newer version 2009.03.
> 
> The first idea was to create a new u-boot_2009.03.bb.
> 
> But then i found u-boot_git.bb and i thought this recipe seems to be the better way. I added 
> 
>   SRCREV_oxnas = "e60beb13cf0135dc71c541021487b5ccc4d269cb"
> 
> which seems to be the hash from 2009.03. Or is there a way to use the tag v2009.03 directly?
> 
> And there is another question. How do i persuade bitbake to use u-boot_git.bb instead of u-boot_1.1.2.bb? I couldn't find DEFAULT_PREFERENCE items for the other machines in both recipes so i assumed that the git recipe is preferred to the other. But a "bitbake u-boot" still builds from 1.1.2 .  :(

conf/machine/oxnas.conf

-- 
Denys


