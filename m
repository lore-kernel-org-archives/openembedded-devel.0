Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNArX-0007in-3o for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 18:11:51 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 064AD401B45; Tue, 12 Sep 2006 08:46:25 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912154625.064AD401B45@tinman.treke.net>
Date: Tue, 12 Sep 2006 08:46:25 -0700 (PDT)
Subject: [Bug 1413] package ntp is not created
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
X-List-Received-Date: Tue, 12 Sep 2006 16:11:51 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1413


pmiscml@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




------- Comment #3 from pmiscml@gmail.com  2006-09-12 08:46 -------
Fixed in 3e2ce2d7251972891d2ea2ce5c8e998bbd9d3edb.
So yes, this was due to "ntp" appearing twice in PACKAGES (once by default
assignment of PN to PACKAGES, another by +=). This is error in metadata.
Mentioning on IRC, I was told it was discussed and found worth to be a fatal to
build. But as we don't know how many such packages now, this was made a visible
ERROR for now (there was check, it just needed soem revamping).


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


