Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLP1X-00054b-CG for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 20:54:51 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 104DD401B45; Thu,  7 Sep 2006 11:30:37 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907183037.104DD401B45@tinman.treke.net>
Date: Thu,  7 Sep 2006 11:30:37 -0700 (PDT)
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
X-List-Received-Date: Thu, 07 Sep 2006 18:54:51 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391





------- Comment #13 from erik@hovland.org  2006-09-07 11:30 -------
For some reason the patch included in your new diff does not patch to the
mozilla tree it checked out:
patching file content/html/content/src/nsFormSubmission.cpp
Hunk #1 FAILED at 1315.
1 out of 1 hunk FAILED -- saving rejects to file
content/html/content/src/nsFormSubmission.cpp.rej
patching file embedding/base/Makefile.in
Hunk #1 FAILED at 43.
1 out of 1 hunk FAILED -- saving rejects to file embedding/base/Makefile.in.rej
patching file js/src/Makefile.in
Hunk #1 FAILED at 46.
1 out of 1 hunk FAILED -- saving rejects to file js/src/Makefile.in.rej
patching file minimo/Makefile.in
Hunk #1 FAILED at 41.
1 out of 1 hunk FAILED -- saving rejects to file minimo/Makefile.in.rej
patching file minimo/base/Makefile.in
Hunk #1 FAILED at 95.
Hunk #2 FAILED at 138.
Hunk #3 FAILED at 171.
3 out of 3 hunks FAILED -- saving rejects to file minimo/base/Makefile.in.rej
...
Applied patch patches/minimo.patch (forced; needs refresh)
NOTE: dropping user into a shell, so that patch rejects can be fixed manually.

Not sure why it is doing that. I did do a bitbake -cclean minimo before
executing the new bb.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


