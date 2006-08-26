Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGze1-00060p-6S for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 17:00:21 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 6DBFA401B3B; Sat, 26 Aug 2006 07:39:15 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826143915.6DBFA401B3B@tinman.treke.net>
Date: Sat, 26 Aug 2006 07:39:15 -0700 (PDT)
Subject: [Bug 1353] gpe-session-scripts shouldn't depend on gpe-bluetooth
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
X-List-Received-Date: Sat, 26 Aug 2006 15:00:22 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1353





------- Comment #3 from hma@syd.odn.ne.jp  2006-08-26 07:39 -------
It is good news for SL-C series of Zaurus users if bluetooth is going to be
optional.
* SL-C860, SL-C760, SL-C750, SL-C700
* SL-C3200, SL-C3100, SL-C3000
* SL-C1000
In OpenZaurus machine name, they are c7x0, terrier, borzoi, spitz, akita.
They don't have built-in Bluetooth facility.
In these machines, bluetooth packages should be recommended instead of depended
on.
Especially it is effective for c7x0, as noted by Rolf, flash area for 
root partition is small.

SL-6000W has built-in bluetooth facility.
In this machine bluetooth may be depended on.

At a glance, gpe-auto-bluetooth is already non-bluefish-package ready.
Isn't it?
/etc/sysconfig/bluetooth exists for non-bluetooth machines?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


