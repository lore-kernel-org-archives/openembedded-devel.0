Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mo9jy-0005oc-BN
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 07:41:13 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQ300HARP3MBTF1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	17 Sep 2009 00:40:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7EC6F14AF5F; Thu,
	17 Sep 2009 01:40:34 -0400 (EDT)
Date: Thu, 17 Sep 2009 01:40:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090917054034.GB5465@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] -dbg for static libraries?
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
X-List-Received-Date: Thu, 17 Sep 2009 05:41:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

As target binaries and libraries are now built with extra debugging symbols, 
some of the -dbg packages are very large. Unfortunately, -dbg packages only 
contain debug versions of executable binaries and shared libraries, but not 
static libraries, which go directly into -dev packages. That increases the 
size of sdk/toolchain tarballs, which include -dev packages, depending on the 
main packages, and end up with stripped shared libs, but bloated static libs.

I understand, that -dev packages are specifically for development and having 
full debugging symbols in a library might be helpful for that, but -dev 
packages don't usually depend on -dbg, and most toolchain-target tasks don't 
include them either, hence not providing debugging versions of shared libs in 
the sdk/toolchain.

Would it make sense to package stripped version of a static lib into -dev and 
the full version into corresponding -dbg?

-- 
Denys


