Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GGWyn-0008Be-OS
	for openembedded-devel@openembedded.org; Fri, 25 Aug 2006 10:23:54 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 8074880DAB;
	Fri, 25 Aug 2006 18:22:13 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07079-08; Fri, 25 Aug 2006 18:22:11 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id BF03A11725;
	Fri, 25 Aug 2006 18:22:11 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 9C387F0B458; Fri, 25 Aug 2006 18:22:11 +1000 (EST)
Date: Fri, 25 Aug 2006 18:22:11 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20060825082210.GA18599@twibble.org>
References: <20060817105325.GA2172@twibble.org>
	<20060817153312.GA23152@twibble.org>
	<20060825053341.GA29761@twibble.org>
	<1156493289.5554.2.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1156493289.5554.2.camel@localhost.localdomain>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@openembedded.org
Subject: Re: site/* - using common files for site information
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Aug 2006 08:23:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2006 at 09:08:09AM +0100, Richard Purdie wrote:
> On Fri, 2006-08-25 at 15:33 +1000, Jamie Lenehan wrote:
[...]
> > If no one has any comments on this then I guess I'll push it in.
> > First the info.bbclass, then clean up the few recipes that directly
> > mess with CONFIG_SITE,

I missed out the need to update autotools.bbclass once none of the
recipes directly mess with the CONFIG_SITE files.

> >then clean up the x86 files and the the few
> > recipes that I've been maintaining. 
> 
> For what its worth, I like the idea of this but haven't had time to

I changed my mind about a dozen times on this, so seeing what someone
else thinks would be good. 

> review the patches. The name info.bbclass is perhaps too generic though
> - could you call it something like autotools-info.bbclass?

The reason I called it info.bbclass is because it's not actually
related to autotools. What it does is provide information about a
target - endianess, 32/64 bit, which libc it's using, what alias
exists for it in a general sort of way.

The autotools.bbclass then makes use of this to decided which site
files to use.

I also made use of the info.bbclass to provide the endiness
information to recipes that were currently manaully looking in the
site file to determine this (since the way they currently work breaks
with the site file.)

-- 
 Jamie Lenehan <lenehan@twibble.org>


