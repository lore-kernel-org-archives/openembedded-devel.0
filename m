Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NkCdu-0003Ox-TB
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 09:30:54 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYC00LDV7ISEEV0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Feb 2010 02:28:04 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3B36314AF60; Wed,
	24 Feb 2010 03:28:04 -0500 (EST)
Date: Wed, 24 Feb 2010 03:28:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100224082804.GB17798@denix.org>
References: <4B84DE66.4080602@dresearch.de>
MIME-version: 1.0
In-reply-to: <4B84DE66.4080602@dresearch.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom, udev, and kernel version
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
X-List-Received-Date: Wed, 24 Feb 2010 08:30:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 24, 2010 at 09:08:06AM +0100, Steffen Sledz wrote:
> Since Angstrom updated to udev_151 we've a big problem.
> 
> udevd started from within /etc/init.d/udev crashes with
> 
> /sbin/udevd -d --debug
> 1266997931.250494 [297] udev_monitor_new_from_netlink: error getting socket: Invalid argument error initializing netlink socket
> 1266997931.250718 [297] main: error initializing netlink socket
> 
> Searching the internet for this error i found some hints that this udev version requires at least linux 2.6.27. Unfortunately we are forced to use 2.6.24 because of special driver/machine support for hipox. :(
> 
> Is there a way to rollback to udev_141 for hipox machine?
> 
> Or is there a backport patch available for 2.6.24 to support udev_151?

You can add the following line to either your conf/local.conf or 
conf/distro/include/angstrom-2008-preferred-versions.inc:

PREFERRED_VERSION_udev_hipox = "141"

I too learned that udev-151 (>147) requires glibc-2.9 or higher. Seems like a 
very demanding version of udev...

-- 
Denys


