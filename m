Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNtYC-0000Ow-Ip for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 17:54:52 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D4B04401B48; Thu, 14 Sep 2006 08:28:51 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060914152851.D4B04401B48@tinman.treke.net>
Date: Thu, 14 Sep 2006 08:28:51 -0700 (PDT)
Subject: [Bug 1416] New: Slugos udevsynth does not work during boot
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
X-List-Received-Date: Thu, 14 Sep 2006 15:54:52 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1416

           Summary: Slugos udevsynth does not work during boot
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: anoah@pfeiffer.edu
         QAContact: tinderbox-oe@gmx.net


boot slug running openslug HEAD, any flashdrive connected at boot time is not
mounted by udev scripts. calling udevsynth manually immediately after boot
works.

putting a 'sleep 10' in udev rc script just before the call to udevsynth seems
to fix. perhaps udevd --daemon is not ready yet?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


