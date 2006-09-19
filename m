Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GPfZP-0006tL-1n for openembedded-devel@lists.openembedded.org;
	Tue, 19 Sep 2006 15:23:27 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id CE73C401B45; Tue, 19 Sep 2006 05:56:10 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060919125610.CE73C401B45@tinman.treke.net>
Date: Tue, 19 Sep 2006 05:56:10 -0700 (PDT)
Subject: [Bug 1423] New: Cross-compiled bison 2.0 fails on broken pipe
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
X-List-Received-Date: Tue, 19 Sep 2006 13:23:28 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1423

           Summary: Cross-compiled bison 2.0 fails on broken pipe
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: marshall.jose@jhuapl.edu
         QAContact: tinderbox-oe@gmx.net


Bison (running on a terrier) dies on a broken pipe (-SIGPIPE).

A google search suggested that this is a bug with v2.0, so I used OE to build
the recommended 1.875 version of bison, but the same thing happened. M4 and
flex packages have been installed.

strace logs of both versions running show the same thing: a process is
vfork()'d (probably m4), several kilobytes are written to the pipe, then bison
dies on a -SIGPIPE.

There is a possibility that the fault is not with bison -- the behavior is
reminiscent of OE bug #877.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


