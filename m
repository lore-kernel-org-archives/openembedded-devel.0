Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LcQcu-0006Hw-8u
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 21:45:08 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFN003OE2TDF879@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	25 Feb 2009 14:41:43 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1EB936B83A8; Wed,
	25 Feb 2009 15:41:37 -0500 (EST)
Date: Wed, 25 Feb 2009 15:41:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090225204137.GA25095@denix.org>
References: <go498c$bqq$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <go498c$bqq$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 25 Feb 2009 20:45:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 25, 2009 at 09:21:32PM +0100, Koen Kooi wrote:
> Hi,
>
> I keep trying to teach people the difference between recipes (what's in OE) 
> and packages (what you install on the target) and keep getting reactions 
> like "ok, but why is the dir called packages?", which are completely valid.
>
> Proposal:
>
> mv packages recipes ; git commit .
>
> While it would make setting up OE more intuitive, it does mean that people 
> have to adjust local.conf and distro people need to update their 
> installation instructions.

+1 - the whole directory structure needs some revamping. There are also some 
inconsistencies with meta, images and tasks directories. But it is good to 
start with small and easy items first.

> I have some other intrusive proposals about shuffling things around in TMP 
> a bit (and out of TMP as well), standardizing on source locations for 
> source_distribute and sourcepkg, etc, but let's start with this easy one.

Speaking of TMP and outside of it - does it make sense to have DEPLOY outside 
of TMP by default in OE? I do it in Arago, but I had to make a small fix in 
base.bbclass though - see bug #4580.

-- 
Denys


