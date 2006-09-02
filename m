Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJU2V-0005Xy-E1 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Sep 2006 13:51:55 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id EA886401B3E; Sat,  2 Sep 2006 04:29:00 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060902112900.EA886401B3E@tinman.treke.net>
Date: Sat,  2 Sep 2006 04:29:00 -0700 (PDT)
Subject: [Bug 1377] New: OpenNTPD has incorrect Depends
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
X-List-Received-Date: Sat, 02 Sep 2006 11:51:55 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1377

           Summary: OpenNTPD has incorrect Depends
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: jonesml@fastmail.to
         QAContact: tinderbox-oe@gmx.net


The OpenNTPD package included in OE has a dependency on OpenSSL for crypto that
is not stated in the DEPENDS variable of the .bb file.

However, I feel that the correct solution to this problem is to build OpenNTPD
with it's own built in crypto rather than linking to a large external library.

To do this, simply add '--with-builtin-arc4random --without-ssl-dir' to the
configure flags, and the package builds without the need for an external
cryptography library and with a marginal increase in size. No changes to the
DEPENDS variable are then required.

Tested working on a uClibc build.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


