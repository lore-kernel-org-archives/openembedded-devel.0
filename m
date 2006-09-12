Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GN4Iu-0005PV-5y for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 11:11:40 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 86FBC401B45; Tue, 12 Sep 2006 01:46:18 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912084618.86FBC401B45@tinman.treke.net>
Date: Tue, 12 Sep 2006 01:46:18 -0700 (PDT)
Subject: [Bug 1412] New: libx11: missing flag to make command for native makekeys
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
X-List-Received-Date: Tue, 12 Sep 2006 09:11:40 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1412

           Summary: libx11: missing flag to make command for native makekeys
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: di@fh-wedel.de
         QAContact: tinderbox-oe@gmx.net


The make command for makekeys fails on my system because the variable
X11_CFLAGS is not overridden in the make command. I thus suggest to call make
like this:

[libx11_X11R7.1-1.0.1.bb]

oe_runmake -C src/util 'X11_CFLAGS=' 'CC=${BUILD_CC}' [...]
                       ^^^^^^^^^^^^^^


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


