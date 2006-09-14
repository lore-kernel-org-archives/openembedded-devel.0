Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNhhM-0000oO-6J for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 05:15:33 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 61B13401B49; Wed, 13 Sep 2006 19:49:39 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060914024939.61B13401B49@tinman.treke.net>
Date: Wed, 13 Sep 2006 19:49:39 -0700 (PDT)
Subject: [Bug 1326] libpng doesn't build for x86
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
X-List-Received-Date: Thu, 14 Sep 2006 03:15:33 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1326


pmiscml@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED




------- Comment #10 from pmiscml@gmail.com  2006-09-13 19:49 -------
Ok, actualy that "sed"ding already happens in OE via "inherit binconfig". The
issue, it expected the *-config scripts to have shell assignments of form
path=/there, and broke on path="/there", like libpng used.

And libpng-config wasn't the only one which contained wrong paths. That was
fixed to undersatnd both cases. Verified working ok by myself and Leon. Closing
now.

Note that I didn't try to to bump PR on affected packages, so "-c rebuild" may
be required (actually, I'll bump libpng now).


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


