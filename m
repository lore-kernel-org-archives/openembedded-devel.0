Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nd75p-0007M2-DB
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 20:10:24 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXB004ZWZSJNMZ0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Feb 2010 13:07:31 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BAFCA14AF60; Thu,
	04 Feb 2010 14:07:30 -0500 (EST)
Date: Thu, 04 Feb 2010 14:07:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100204190730.GB5641@denix.org>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265308970.13632.6.camel@conroy-linux>
MIME-version: 1.0
In-reply-to: <1265308970.13632.6.camel@conroy-linux>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by	using $SDK_PATH var in env setup script
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
X-List-Received-Date: Thu, 04 Feb 2010 19:10:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 04, 2010 at 01:42:50PM -0500, Chris Conroy wrote:
> On Thu, 2010-02-04 at 12:22 -0500, Denys Dmytriyenko wrote:
> > First of all, they are the same. Check conf/bitbake.conf:
> > 
> > SDKPATH = "${SDK_PATH}"
> > 
> > Second, ask RP why he introduced SDKPATH, when we had SDK_PATH for years (my 
> > guess - that's what is used in Poky, so makes porting changes easier):
> Fair enough, but saying 'ask RP' doesn't justify away the fact that
> having these two variables is confusing. If they really are the same,
> then one should be removed. If one shouldn't be removed, then there is
> some difference that should probably be documented. It's just a matter
> of consistency/readability.

All I was trying to say is that, while it's a valid question, it is out of 
scope of this patch. I don't want to mix 2 things in one patch (if we decide 
to remove one of SDKPATH/SDK_PATH). And it would still be good to hear RP's 
rationale.

-- 
Denys


