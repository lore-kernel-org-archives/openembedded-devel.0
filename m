Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GG337-0006sY-84 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Aug 2006 02:26:21 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 605FD401B3F; Wed, 23 Aug 2006 17:05:51 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060824000551.605FD401B3F@tinman.treke.net>
Date: Wed, 23 Aug 2006 17:05:51 -0700 (PDT)
Subject: [Bug 1355] New: Add explicit command separators in populate-volatile.sh
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
X-List-Received-Date: Thu, 24 Aug 2006 00:26:21 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1355

           Summary: Add explicit command separators in populate-volatile.sh
           Product: Openembedded
           Version: Angstrom
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: pmiscml@gmail.com
         QAContact: tinderbox-oe@gmx.net


Built an Angstrom bootstrap image for h4000 lately, during boot there were
quite few errors, yet need to investigate. What's interesting is that I got
funky files like "root.root" in / .

A look at populate-volatile.sh showed that it could use some semicolons to
separate commands which otherwise could get folded into one if argument is
empty. I really not sure why this happen - maybe due to populate-volatile.sh
caching, maybe due to busybox peculiarities, but the fact it does.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


