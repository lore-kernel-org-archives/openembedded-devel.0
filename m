Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGvnY-0002uf-SS for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 12:53:57 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C93504014D4; Sat, 26 Aug 2006 03:32:49 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826103249.C93504014D4@tinman.treke.net>
Date: Sat, 26 Aug 2006 03:32:49 -0700 (PDT)
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
X-List-Received-Date: Sat, 26 Aug 2006 10:53:57 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1353





------- Comment #1 from pb@reciva.com  2006-08-26 03:32 -------
No, this is not a reasonable solution.  Your proposed patch will simply break
bluetooth support for everyone else.

If you want to make bluetooth optional then you would need to:

1. patch gpe-auto-bluetooth.sh to fail silently when gpe-bluetooth is not
installed, rather than producing an error; and

2. move gpe-bluetooth from RDEPENDS to RRECOMMENDS in the gpe-session-scripts
packaging.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


