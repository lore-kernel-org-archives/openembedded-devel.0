Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GGWlD-0003MZ-Uq
	for openembedded-devel@openembedded.org; Fri, 25 Aug 2006 10:09:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7P88Cr5023753;
	Fri, 25 Aug 2006 09:08:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23599-04; Fri, 25 Aug 2006 09:08:10 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7P889Wj023747
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 25 Aug 2006 09:08:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <20060825053341.GA29761@twibble.org>
References: <20060817105325.GA2172@twibble.org>
	<20060817153312.GA23152@twibble.org>
	<20060825053341.GA29761@twibble.org>
Date: Fri, 25 Aug 2006 09:08:09 +0100
Message-Id: <1156493289.5554.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 25 Aug 2006 08:09:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-08-25 at 15:33 +1000, Jamie Lenehan wrote:
> On Fri, Aug 18, 2006 at 01:33:12AM +1000, Jamie Lenehan wrote:
> > On Thu, Aug 17, 2006 at 08:53:25PM +1000, Jamie Lenehan wrote:
> > > Attached is a patch I'd like to propose to allow for multiple site
> > > files to be used so that common stuff can be moved into common site
> > [...]
> 
> I've extended this a bit to allow site files to be per package,
> rather than having to be global - including version specific site
> files (such as db needs). Lots of packages just need a few site file
> entries which are generally common across all builds or specific to
> glibc or uclibc.
> 
> Probably the most useful part is allowing all of the x86 site files
> to be merged together.
> 
> If no one has any comments on this then I guess I'll push it in.
> First the info.bbclass, then clean up the few recipes that directly
> mess with CONFIG_SITE, then clean up the x86 files and the the few
> recipes that I've been maintaining. 

For what its worth, I like the idea of this but haven't had time to
review the patches. The name info.bbclass is perhaps too generic though
- could you call it something like autotools-info.bbclass?

Regards,

Richard



