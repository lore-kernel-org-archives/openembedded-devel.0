Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GaJZQ-0006ZQ-Nz
	for openembedded-devel@openembedded.org; Thu, 19 Oct 2006 00:07:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9IM0Npq028131;
	Wed, 18 Oct 2006 23:00:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28090-01; Wed, 18 Oct 2006 23:00:18 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9IM0ILP028110
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 18 Oct 2006 23:00:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>, bitbake-dev@lists.berlios.de
Date: Wed, 18 Oct 2006 23:00:21 +0100
Message-Id: <1161208821.5556.250.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OEDEM - Report from the bitbake session
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 22:07:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'll try and summarise the feelings about bitbake from OEDEM below.

As background I'd recommend reading the set of articles put together by
Paul at http://www.openembedded.org/wiki/BitbakeBackground, particularly
the recent
http://lists.linuxtogo.org/pipermail/openembedded-devel/2006-September/000425.html which gives some history and the current status.


Status of BitBake
=================

The general opinion was that bitbake wasn't doing too badly and looking
a lot better than it ever used to. The stable releases seem to be
working but we need them more often, particularly for fixing certain
bugs. Fixing them in svn isn't enough. I need to learn how to release
it! The 1.4 series is probably over and the 1.6 will be the stable and
preferred version.

The above links cover the rest of the status of bitbake really. We
really need more developers but then so does OE.


Parallel BitBake
================

Fundamentally it works now in trunk. It has problems with confusing
messages to users though (much more than previous bitbake versions). See
below. There isn't that much else wrong with it and developers are using
it.


BitBake-NG
==========

Dead unless someone wants to work on it. We don't have enough bitbake
developers, let alone anyone spare to go and do that as well. It won't
be worked on by the current active bitbake developers as we think the
current code base can still be expanded.


BitBake's warts and issues
==========================

The big concern I raised was the messages and interaction with the user.
We need to drastically improve our user experience and make it easier to
understand why bitbake does what it does, which version it will build
for a given package etc. I don't think anyone knows how to handle this
exactly and its a tricky problem to address. The logging domains I added
help in some ways but also confuse the developers so probably won't help
users. A partial solution may come in the form of a UI (see below).

A summary of the issues to address is:

* Fix global method scope messages [mickeyl has partly addressed this
already, there appears to be a bug in bitbake too]
* We need UI, probably ncurses based at first. See below.
* Versioned DEPENDS support. Long planned but we're really starting to
need this. The new infrastructure in .dev will help a lot.
* Syntax decision: Should it be strict or not: 
    FOO = "a" or FOO = a
    lines ending with spaces?
* addtask needs to be able to accept multiple tasks (rm_work.bbclass)
    addtask gamma after alpha, beta before eta
* Add option to see all PREFERRED_PROVIDER errors in one go (trunk will
help with this)
* fetchers should touch touch md5 stamps to allow easy source mirror
implementation.
* Add fetchall task to OE [done now by me]
* PREMIRROR/POSTMIRROR should not be wget specific
* Pass PREFERRED_[PROVIDER|VERSIONS] decisions to openembedded to decide
whether to error or not. Having thought about this, I'm not sure how we
handle this. We really need to consider bitbake's entire error handling
model - when should it error?
* means to replace/remove variable contents. Controversial :)
* General usability/error messages


C-Parser
========

Should work but needs completion of some parsing unit tests to prove it.


BitBake-UI
==========

We need one. Initially it will be some kind of ncurses interface but
built with future optional PyGTK, PyQT etc. options. The implementations
will be interchangeable around a common core.

The multithreaded bitbake *needs* this before we can release it as its
too confusing atm. 


Performance
===========

I did some profiling of bitbake. I found a nice speed up by adding a
small variable expansion cache to bitbake which gives a 40% speedup to
parsing. Before and after profiles:

http://www.rpsys.net/openzaurus/temp/bitbake-profile.txt
http://www.rpsys.net/openzaurus/temp/bitbake-profile2.txt

Also, I tried removing psyco which resulted in a 16% performance drop
but its also interesting to see which functions are impacted:

http://www.rpsys.net/openzaurus/temp/bitbake-profile(no%20psyco).txt

We're still interested in improving performance and I still think we can
make gains.


Conclusion
==========

Bitbake sat still for a while but its seen a lot of changes recently and
it has a bright future and a lot of potential. More changes are needed
to make it the kind of program it has the potential to be. I don't think
there are many technical problems, the integration of a UI being the
main one. Usability and restructuring bitbake's communication with the
user is going to be the most difficult problem to address (although I
realise this is related to the UI).

I'm hoping this will start people thinking and kickstart some
discussion. People are more than welcome to get involved with bitbake.
Some new ideas might be what's needed to solve some of the usability
issues.





