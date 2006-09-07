Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLKEh-0004xd-DF for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 15:48:07 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 15BFD401B46; Thu,  7 Sep 2006 06:23:55 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907132355.15BFD401B46@tinman.treke.net>
Date: Thu,  7 Sep 2006 06:23:55 -0700 (PDT)
Subject: [Bug 1395] New: GPE crashes/shuts down at Zaurus suspend
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
X-List-Received-Date: Thu, 07 Sep 2006 13:48:07 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1395

           Summary: GPE crashes/shuts down at Zaurus suspend
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: tomas@alternaliv.se
         QAContact: tinderbox-oe@gmx.net


I have a Zaurus SL-3100, and run OZ3.5.4.1+GPE

If I have either AbiWord or Sylpheed running and suspend the device I am logged
out from GPE at resume (actually I think GPE has shut down and restarted, like
pressing ctrl+alt+backspace). The problem might be with other apps as well, but
these two are the ones I have noticed.

A printout from the system info log shows:
Sep  3 18:59:51 spitz daemon.notice gpe-dm: gpe-dm: Xserver pid 5283 exited
with status 0
Sep  3 18:59:52 spitz daemon.warn gpe-dm: gpe-dm: unknown pid 5285 exited with
status 0 
Sep  3 18:59:53 spitz daemon.notice apmd[3335]: Proxy exited with status 1


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


