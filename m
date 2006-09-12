Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GN8mW-0005iH-Kr for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 15:58:32 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id CA1F9401B45; Tue, 12 Sep 2006 06:33:07 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912133307.CA1F9401B45@tinman.treke.net>
Date: Tue, 12 Sep 2006 06:33:07 -0700 (PDT)
Subject: [Bug 1413] package ntp is not created
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
X-List-Received-Date: Tue, 12 Sep 2006 13:58:33 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1413





------- Comment #1 from di@fh-wedel.de  2006-09-12 06:33 -------
The problem seems to result from the runstrip() function's behaviour: the files
in  image/usr/bin are moved to image/usr/bin/.debug by the runstrip() function
which is defined in package.bbclass. Not quite sure whose bug this now is?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


