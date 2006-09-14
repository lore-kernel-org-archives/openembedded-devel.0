Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNyTs-0001GC-P6 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 23:10:45 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B9D13401B48; Thu, 14 Sep 2006 13:44:40 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060914204440.B9D13401B48@tinman.treke.net>
Date: Thu, 14 Sep 2006 13:44:40 -0700 (PDT)
Subject: [Bug 1416] Slugos udevsynth does not work during boot
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
X-List-Received-Date: Thu, 14 Sep 2006 21:10:45 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1416





------- Comment #1 from anoah@pfeiffer.edu  2006-09-14 13:44 -------
the mount script _does_ seem to work, but any udev script that attempts to
modify files on the rootfs fails, because rootfs is mounted read-only at the
time udevsynthesize is run.

i think running udevsynth AFTER rootfs is remounted rw might be a better
solution,
but i bet that wont work for setups where rootfs is pivoted to external drive,
and the external drive must be discovered via udev.

perhaps run udevsynth twice? that is what i am doing now, just after syslog
starts. i can grab the udev output, and see that it works.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


