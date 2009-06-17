Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MGn6N-00066A-Or
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 06:50:23 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLD001ND8GLKUU7@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 23:29:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1510814AF5F; Wed,
	17 Jun 2009 00:29:09 -0400 (EDT)
Date: Wed, 17 Jun 2009 00:29:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090617042909.GA21132@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: update-rc.d: don't add runtime dependency if not doing online	package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Wed, 17 Jun 2009 04:50:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

The commit ee690abcef0df80271729ca869f19164b1c15bbe[1] (update-rc.d: don't 
add runtime dependency if not doing online package management; only add it to 
${PN} in any case) breaks one important feature - additional runtime 
dependencies for packages, inheriting update-rc.d class.

One of the examples is udev (udev-utils is no longer a dependency):

$ dpkg-deb -I old/udev_141-r10.2_armv5te.ipk |grep Depends
 Depends: udev-utils, libc6, libvolume-id1 (>= 141)
$ dpkg-deb -I angstrom/udev_141-r10.2_armv5te.ipk |grep Depends
 Depends: udev-utils, libc6 (>= 2.6.1), libvolume-id1 (>= 141)

$ dpkg-deb -I new/udev_141-r10.2_armv5te.ipk |grep Depends
 Depends: update-rc.d, libc6, libvolume-id1 (>= 141)

The problem comes from the fact that either RDEPENDS_{PN}_append = "blah" or 
RDEPENDS_{PN} += "blah" used in the class overwrite the value set in 
inheriting recipe, instead of appending to it. The position of the inherit 
command in the recipe relative to its own RDEPENDS does not matter. And I 
don't think this issue only applies to RDEPENDS variable...

It used to "work" before, because update-rc.d.bbclass had the wrong 
RDEPENDS_append and "update-rc.d" was never added to the runtime dependencies, 
while more important udev-utils was.

I tried latest branches/bitbake-1.8 - no difference.

The short-term solution is to revert the commit in question. The correct 
solution is to find the underlying problem. Any takers?

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=ee690abcef0df80271729ca869f19164b1c15bbe

-- 
Denys


