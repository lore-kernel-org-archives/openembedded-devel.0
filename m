Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH18a-0007Ya-DG for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 18:36:00 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C63814014D2; Sat, 26 Aug 2006 09:14:53 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826161453.C63814014D2@tinman.treke.net>
Date: Sat, 26 Aug 2006 09:14:53 -0700 (PDT)
Subject: [Bug 1110] env variable MAKEFLAGS should not be propagated into bitbake subprocesses
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
X-List-Received-Date: Sat, 26 Aug 2006 16:36:01 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1110


bugs.openembedded.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs.openembedded.org@rolf.l
                   |                            |eggewie.biz




------- Comment #1 from bugs.openembedded.org@rolf.leggewie.biz  2006-08-26 09:14 -------
Yamamoto-san,

thank you for your bug report.  I am not 100% sure I have understood your
comment correctly but it seems like something I have come across in the past.

I think your report is about packages being safe for parallel compilation. 
Where have you set this?  I set it in build/conf/local.conf via an entry
'PARALLEL_MAKE = "-j 3"'.  I believe I have seen bb files which I assume are
unsafe for parallel compilation where this variable was reset to 1.

In case I understood your problem correctly, can you please set the variable in
local.conf and report back if this solves your problem?  Thank you.

Regards

Rolf


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


