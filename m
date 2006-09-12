Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GN3zG-0005Aw-P3 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 10:51:22 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4A396401B45; Tue, 12 Sep 2006 01:25:57 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912082557.4A396401B45@tinman.treke.net>
Date: Tue, 12 Sep 2006 01:25:57 -0700 (PDT)
Subject: [Bug 1411] New: build of libx11 should fail if native build of makekeys fails
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
X-List-Received-Date: Tue, 12 Sep 2006 08:51:23 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1411

           Summary: build of libx11 should fail if native build of makekeys
                    fails
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


I suggest something like this:

[libx11_X11R7.1-1.0.1.bb]

do_compile() {
        (
                unset CC LD CXX CCLD
                oe_runmake -C src/util [...] makekeys
        ) || exit 1
        rm -f ${STAGING_INCDIR}/X11/Xlib.h
        oe_runmake
}


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


