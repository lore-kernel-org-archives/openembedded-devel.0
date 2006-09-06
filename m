Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GL2UZ-0003w1-4g for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 20:51:19 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 28FD5401B45; Wed,  6 Sep 2006 11:27:23 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906182723.28FD5401B45@tinman.treke.net>
Date: Wed,  6 Sep 2006 11:27:23 -0700 (PDT)
Subject: [Bug 1391] minimo package bit rotted badly
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
X-List-Received-Date: Wed, 06 Sep 2006 18:51:19 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391





------- Comment #3 from koen@dominion.kabel.utwente.nl  2006-09-06 11:27 -------
The patch looks ok from a brief view except for these things:

mozconfig:
-# remove link dependency on libstdc++.so
-LIBS=-lsupc++

minimo:
+export MOZILLA_FIVE_HOME=/usr/lib/mozilla-minimo

I think we can generate the script during runtime and use ${libdir}, unless it
turns out minimo doesn't honour $prefix


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


