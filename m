Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mdymh-0004AO-Sn
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:57:58 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON00A72OV6Q1LF@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 22:40:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 57E6914AF5F; Wed,
	19 Aug 2009 23:40:18 -0400 (EDT)
Date: Wed, 19 Aug 2009 23:40:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820034018.GC32010@denix.org>
References: <6978a1740908182358l69cf380awefdf8d966f75678a@mail.gmail.com>
	<8d7a1face05be6d40b10e2449a443196.marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <8d7a1face05be6d40b10e2449a443196.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Thu, 20 Aug 2009 03:58:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 02:19:12PM +0200, marcin@juszkiewicz.com.pl wrote:
> Dnia Wed, 19 Aug 2009 08:58:25 +0200 napisales[as]:
> 
> > > 1) never ever install something into $HOME
>  
> > 1) Is there possibly something written why not to do that?
> 
> Not every device has $HOME on same partition as / (for example most of 
> Zaurus devices). And as those files ends in package what will happen if user 
> will change file in $HOME and then package will overwrite it with other 
> contents? What with users other then root?
> 
> I know that in your situation most of those reasons are nothing to worry 
> about but this is why we do not touch anything in $HOME.

This warning is only applicable to OE developers or distro maintainers. 
Doesn't really apply to anyone doing own custom images...

-- 
Denys


