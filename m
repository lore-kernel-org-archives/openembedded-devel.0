Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWvsP-0006uE-0M for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 16:13:05 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 1138440654F; Mon,  9 Oct 2006 06:40:43 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061009134043.1138440654F@tinman.treke.net>
Date: Mon,  9 Oct 2006 06:40:43 -0700 (PDT)
Subject: [Bug 1421] Compilation of glibc-2.4 fails (and therefore gpe-plucker)
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
X-List-Received-Date: Mon, 09 Oct 2006 14:13:06 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1421





------- Comment #1 from bugs.openembedded.org@rolf.leggewie.biz  2006-10-09 06:40 -------
googling around for "compiler support for __thread is required" seemed to
suggest that removing nptl/sysdeps/pthread might do the trick.  It did help in
finishing the configure stage, but then the compilation failed.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


