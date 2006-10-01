Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GTpri-0006Wg-IB for openembedded-devel@lists.openembedded.org;
	Sun, 01 Oct 2006 03:11:34 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4AD61401B45; Sat, 30 Sep 2006 17:41:27 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061001004127.4AD61401B45@tinman.treke.net>
Date: Sat, 30 Sep 2006 17:41:27 -0700 (PDT)
Subject: [Bug 1446] New: zlib-native-1.2.3.bb does not stage zlib.h
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
X-List-Received-Date: Sun, 01 Oct 2006 01:11:34 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1446

           Summary: zlib-native-1.2.3.bb does not stage zlib.h
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: likewise@gmx.net
         QAContact: tinderbox-oe@gmx.net


From zlib-native_1.2.2.bb to zlib-native_1.2.3.bb, the use of autotools seems
to have broken the staging of zlib.h.

Also, most of the .bb now has unused cruft. (I can put random text in the
do_stage() function and it does not seem to be failing on it.)

I can reproduce this by building lzma-native, which needs zlib.h (and therefore
should depend on zlib-native).


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


