Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8dsc-0001IP-AF
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:59:18 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL006X0RDSVR52@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 13:58:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2BC5E14AF64; Wed,
	20 Oct 2010 14:58:40 -0400 (EDT)
Date: Wed, 20 Oct 2010 14:58:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020185840.GQ11514@denix.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<AANLkTi=uKwjKYq5W4VwKXcNHdSJkxZnu_w4M9kkvVWoX@mail.gmail.com>
	<20101020182509.GO11514@denix.org> <4CBF39BF.9000809@opendreambox.org>
MIME-version: 1.0
In-reply-to: <4CBF39BF.9000809@opendreambox.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 18:59:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 20, 2010 at 08:49:35PM +0200, Andreas Oberritter wrote:
> On 10/20/2010 08:25 PM, Denys Dmytriyenko wrote:
> > In OE we've been using this term for some time now. Although, still too many 
> > old recipes use old notations, sometimes even as generic as just plain "GPL" 
> > w/o specifying the exact version. It wasn't as critical before, but these days 
> > OE is being adopted in corporate environments and proper licensing became 
> > quite important.
> 
> How exactly do "GPLv2" and "GPLv2+" differ from a corporate point of
> view? Can you imagine any company forking a GPLv2+-licensed project to
> distribute it under the terms of a later version of the license?
> 
> Is there any case where someone would say "Hey, we can't use this
> package, because it's GPLv2. We need it to be v3 or later"? The opposite
> seems to be a common case instead.
> 
> I'm asking, because I don't think it's worth the time to verify all
> packages in such detail, i.e. looking at all source files and guessing
> what the original author intended to choose, if there are files called
> COPYING or LICENSE in the root folder of a package.
> 
> The only case where it's important whether v2 or v2+ is in use is if you
> want to stop using v2. IMO, if someone wants to do that, he should do
> the research himself. It isn't important for a distribution.

GPLv2 and GPLv3 are not compatible. Thus, there cannot be a derivative work 
that combines those two. But if one piece of code is GPLv2+ and another is 
GPLv3, the resulting combination is licensed under GPLv3.

So, it's always good to know which libraries you have as strict GPLv2 and 
which are "GPLv2 or later", even in case when you are Ok with GPLv3, you 
should know to not use strict GPLv2 code in any GPLv3 projects...

-- 
Denys


