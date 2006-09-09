Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GM6Xj-0004w8-2t for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 19:22:59 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 2B2A5401B2B; Sat,  9 Sep 2006 09:58:08 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060909165808.2B2A5401B2B@tinman.treke.net>
Date: Sat,  9 Sep 2006 09:58:08 -0700 (PDT)
Subject: [Bug 1407] New: socat-1.3.2.1 xioinitialize failed
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
X-List-Received-Date: Sat, 09 Sep 2006 17:22:59 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1407

           Summary: socat-1.3.2.1 xioinitialize failed
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: balle@chaostal.de
         QAContact: tinderbox-oe@gmx.net


Tried to use socat-1.3.2.1-r0 on OpenZaurus 3.4.2.1 in connection with tor and
got the following error:
xioinitialize.c:25 xioinitialize: Assertion 3 << opt_csize.arg3 == 0000060
failed
Executed command was: socat
TCP4-LISTEN:6667,fork,SOCKS4A:localhost:irc.freenode.net:6667,socks port=9050
Problem can be solved by cutting the TERMIOS checks


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


