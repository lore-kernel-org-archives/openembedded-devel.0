Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GFuXc-000799-9i for openembedded-devel@lists.openembedded.org;
	Wed, 23 Aug 2006 17:21:16 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 42EFC401B3F; Wed, 23 Aug 2006 08:00:52 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060823150052.42EFC401B3F@tinman.treke.net>
Date: Wed, 23 Aug 2006 08:00:52 -0700 (PDT)
Subject: [Bug 1341] kernel-module-pcnet-cs-2.6 depends on kernel-module-8390-2.6
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
X-List-Received-Date: Wed, 23 Aug 2006 15:21:17 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1341


hma@syd.odn.ne.jp changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |




------- Comment #3 from hma@syd.odn.ne.jp  2006-08-23 08:00 -------
>> That should be fixed already - rebuild kernel.

I don't understand.
I rebuild the kernel, linux-openzaurus-2.6.17-r17.

After the build procedure, I found pcnet_cs.ko in
oz354x/tmp/rootfs/lib/modules/2.6.17/kernel/drivers/net/pcmcia/ directory.

$ modinfo pcnet_cs.ko | grep depends
depends:        8390

but I can't find
oz354x/tmp/rootfs/lib/modules/2.6.17/kernel/drivers/net/8390.ko

Where is it?
Should I pick some patch from .dev branch?
Now I'm building for 3.5.4.2  


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


