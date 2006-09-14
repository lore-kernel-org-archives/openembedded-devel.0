Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNtfz-0000Sl-Aj for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 18:02:55 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id AB277401B48; Thu, 14 Sep 2006 08:36:58 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060914153658.AB277401B48@tinman.treke.net>
Date: Thu, 14 Sep 2006 08:36:58 -0700 (PDT)
Subject: [Bug 1417] New: slugos patch to udhcp startup script causes dhcp server ip starvation
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
X-List-Received-Date: Thu, 14 Sep 2006 16:02:55 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1417

           Summary: slugos patch to udhcp startup script causes dhcp server
                    ip starvation
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: anoah@pfeiffer.edu
         QAContact: tinderbox-oe@gmx.net


slug running openslug HEAD, when first bringing up eth0 interface on dhcp,
should
set the ip to 0.0.0.0. this is how the original /etc/udhcpc.d/50default works.

slugos-specific patch changes to just 'up' the interface. this causes interface
to keep old ip when doing `ifdown eth0; ifup eth0`. dhcp server will ping the
ip before re-issuing lease, but the slug responds, causing server to issue a
new lease for a different ip.

net result, if you have a script or use serial to up/down the interface alot,
your ip keeps changing, and you suck up all the ips in the dhcp range.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


