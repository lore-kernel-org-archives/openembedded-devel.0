Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSCIf-0000nu-4D for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 14:44:37 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id F0232401B46; Tue, 26 Sep 2006 05:15:38 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060926121538.F0232401B46@tinman.treke.net>
Date: Tue, 26 Sep 2006 05:15:38 -0700 (PDT)
Subject: [Bug 1438] New: Device mapper support in 2.6 kernel missing
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
X-List-Received-Date: Tue, 26 Sep 2006 12:44:37 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1438

           Summary: Device mapper support in 2.6 kernel missing
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bart_botma@yahoo.com
         QAContact: tinderbox-oe@gmx.net


Currently missing to build a really secure mobile platform is the
encryption support in the kernel using the device mapper.

These should be enabled to support encrypted partitions:

#
# Multi-device support (RAID and LVM)
#
CONFIG_MD=y
...
CONFIG_BLK_DEV_DM=m
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_MIRROR=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_EMC=m

Could the current 2.6.16+ config be updated to enable these modules?

Thanks,
Bart

<off-topic Hrw, thanks for the iptables support! /off-topic>


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


