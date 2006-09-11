Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GMo2H-0000K7-2v for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 17:49:25 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 6A26A401B45; Mon, 11 Sep 2006 08:24:10 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060911152410.6A26A401B45@tinman.treke.net>
Date: Mon, 11 Sep 2006 08:24:10 -0700 (PDT)
Subject: [Bug 1410] New: Boost DEPENDs on Python and thus on x11
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
X-List-Received-Date: Mon, 11 Sep 2006 15:49:25 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1410

           Summary: Boost DEPENDs on Python and thus on x11
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: di@fh-wedel.de
         QAContact: tinderbox-oe@gmx.net


There is only one recipe for two flavours of boost: C++ and Python. This leads
to the problem that even if only building Boost I need to build x11 in order to
build Python. Since my distro (nylon) does not support x11, I cannot build
boost. I suggest to use two separate boost recipes instead.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


