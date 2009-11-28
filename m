Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NEVcA-00037c-0o
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Nov 2009 23:18:05 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KTU006XAB7G93MK@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	28 Nov 2009 16:16:28 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DC6AB14AF60; Sat,
	28 Nov 2009 17:16:27 -0500 (EST)
Date: Sat, 28 Nov 2009 17:16:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091128221627.GA29288@denix.org>
References: <alpine.LFD.2.00.0911281441150.14889@localhost>
MIME-version: 1.0
In-reply-to: <alpine.LFD.2.00.0911281441150.14889@localhost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: invalid git commit for beagle in u-boot recipe?
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
X-List-Received-Date: Sat, 28 Nov 2009 22:18:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Nov 28, 2009 at 02:46:52PM -0500, Robert P. J. Day wrote:
> 
>   as best i can tell, this entry in u-boot_git.bb on the OE dev
> branch:
> 
> SRCREV_beagleboard = "1590f84007e2b50ad346a482fff89195cb04ff4e"
> 
> refers to an invalid commit.  this is what happens when i build for
> the beagle:
> 
> NOTE: preferred version git of u-boot not available (for item u-boot)
> 
> just an observation.

The message above has nothing to do with the commit number specified. The 
problem is with PV being overwritten for beagleboard to specify a proper 
version, while PREFERRED_VERSION still wants "git"...

-- 
Denys


