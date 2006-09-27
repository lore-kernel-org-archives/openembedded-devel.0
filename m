Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSTVh-0002Zd-EB for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 09:07:13 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 76C06401B45; Tue, 26 Sep 2006 23:37:59 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060927063759.76C06401B45@tinman.treke.net>
Date: Tue, 26 Sep 2006 23:37:59 -0700 (PDT)
Subject: [Bug 1441] New: busybox vs. initscripts date weirdness
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
X-List-Received-Date: Wed, 27 Sep 2006 07:07:13 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1441

           Summary: busybox vs. initscripts date  weirdness
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: tom@openhardware.net
         QAContact: tinderbox-oe@gmx.net


I'm not sure how far back this problem may extend into the busybox versions,
but since the body of initscripts is in OE, and not a downloadable package
source, this issue may be an OE issue.

The initscripts save_rtc.sh currently formats the /etc/timestamp as
"%2m%2d%2H%2M%Y", while busybox-1.2.1 will only accept a string formatted as
"%2m%2d%2H%2M00%4Y"

One difference in the strings being that the seconds must be present and have a
value of zero. The other difference is that a 4 digit year is required. Feeding
busybox date with a string outside of those two conditions results in "invalid
date".

I suggest that the initscripts save_rtc.sh be patched as:
============================================================
--- packages/initscripts/initscripts-1.0/save-rtc.sh   
353d869c5dce5dc015a458b99ee7526623ac136b
+++ packages/initscripts/initscripts-1.0/save-rtc.sh   
72506cf424a935fe56e1b11be5e4b9acbc50e513
@@ -12,5 +12,5 @@ then
 then
        echo "Will restore RCT from /etc/timestamp on next boot"
        echo "Delete that file to disable this feature."
-        date +%2m%2d%2H%2M%Y > /etc/timestamp
+        date +%2m%2d%2H%2M00%4Y > /etc/timestamp
 fi


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


