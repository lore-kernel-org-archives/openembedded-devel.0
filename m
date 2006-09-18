Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GPJ3i-0000E8-3t for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 15:21:14 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 9F386401B45; Mon, 18 Sep 2006 05:54:17 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060918125417.9F386401B45@tinman.treke.net>
Date: Mon, 18 Sep 2006 05:54:17 -0700 (PDT)
Subject: [Bug 1406] opie-mediaplayer1 circular dependencies
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
X-List-Received-Date: Mon, 18 Sep 2006 13:21:14 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1406





------- Comment #1 from bugs.openembedded.org@rolf.leggewie.biz  2006-09-18 05:54 -------
Well, my first thought on this is: possibly this comes from an include file.  
While checking up a bit in the bb files, I did not find the solution.  But I
found another strangeness which may cause this problem, although I doubt it.

opie-mediaplayer1.inc has both a DEPENDS and RDEPENDS line on
opie-mediaplayer2-skin-default.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


