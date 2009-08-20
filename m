Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mdyaq-0003mv-2D
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:45:41 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON00J8TOAQFU84@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 22:28:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6B8CF14AF5F; Wed,
	19 Aug 2009 23:28:02 -0400 (EDT)
Date: Wed, 19 Aug 2009 23:28:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820032802.GA32010@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Use AUTOREV and have revision/commit number in package name?
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
X-List-Received-Date: Thu, 20 Aug 2009 03:45:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

I've been playing with AUTOREV for some time now and also asked this question 
before on the IRC, but so far there seems to be no easy solution to the 
problem in subject.

Usually, when a package is built from an SCM repository, SRCREV is set to a 
specific commit#/tag etc. And SRCREV is also usually referenced from PV (like 
PV = "X.Y.Z-scmr${SRCREV}") to have the revision/commit number in the package 
name, to easily track different builds.

Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python function, 
which does the magic of fetching the latest snapshot from a repository. But 
now if PV contains references to SRCREV, it breaks (undesrandably), since 
SRCREV gets resolved in do_fetch and PV needs to be resolved early on.

Are there any standard ways to work around this limitation?

I was thinking this maybe quite tricky, since the actual revision number used, 
is not known until do_fetch runs the actual checkout, at which time changing 
PV is too late, as temp/work is already created and so on. So, would it be 
possible to hack one of the do_package tasks to add the actual revision/commit 
number to a final package name, bypassing changing PV/PR?

Any thoughts? Feel free to throw ideas. Thanks.

-- 
Denys


