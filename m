Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJU5x-0005db-NB for openembedded-devel@lists.openembedded.org;
	Sat, 02 Sep 2006 13:55:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4E294401B3E; Sat,  2 Sep 2006 04:32:39 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060902113239.4E294401B3E@tinman.treke.net>
Date: Sat,  2 Sep 2006 04:32:39 -0700 (PDT)
Subject: [Bug 1378] New: NFS-Utils does not build with uClibc 0.9.28
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
X-List-Received-Date: Sat, 02 Sep 2006 11:55:29 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1378

           Summary: NFS-Utils does not build with uClibc 0.9.28
           Product: Openembedded
           Version: unspecified
          Platform: All
               URL: http://dev.gentoo.org/~solar/uclibc/nfs-utils-1.0.6-
                    uclibc.patch
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: jonesml@fastmail.to
         QAContact: tinderbox-oe@gmx.net


NFS-Utils 1.0.6 makes a call to a function that exists in glibc but not in
uClibc 0.9.28 (though the function was added ~12 months ago to the uClibc
HEAD),

This patch removes the call to the function when uClibc is used as the C
library and is used successfully in Gentoo and OpenWRT distributions.

Here, it fixes the build problem on a uClibc build.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


