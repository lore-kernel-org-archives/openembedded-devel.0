Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHmA0-0006Rx-8H for openembedded-devel@lists.openembedded.org;
	Mon, 28 Aug 2006 20:48:36 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 89D3C4014D2; Mon, 28 Aug 2006 11:26:53 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060828182653.89D3C4014D2@tinman.treke.net>
Date: Mon, 28 Aug 2006 11:26:53 -0700 (PDT)
Subject: [Bug 1369] SD not appearing in /dev OZ-3.5.4.2-rc2
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
X-List-Received-Date: Mon, 28 Aug 2006 18:48:36 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1369





------- Comment #2 from jerry@weareburgess.net  2006-08-28 11:26 -------
(In reply to comment #0)
> I built an oz-3.5.4.2-rc2 spitz gpe-image for my borzoi on 25/8/2006. On first
> boot there is an error that modules.deb doesn't exist (message repaets 4
> times). However system loads fine and SD is there all is ok. modules.dep has
> been created. On next boot the first message on the console is: "cat: Write
> Error: invalid argument" system then boots fine, however /dev/mmcblk0p1 doesn't
> exist so no /media/card.
> 
> If I delete /lib/modules/2.6.17/modules.deb then reboot, I get my /media/card
> back until next reboot.
> 
> Attached is what is in my modules.deb
> 

Upon further inspection, the hdimage1.tgz doesn't contain any files in the
/lib/modules/2.6.17 directory except for the /kernel directory.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


