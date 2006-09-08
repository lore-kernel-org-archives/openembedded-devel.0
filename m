Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLoBN-0004V5-5Y for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 23:46:41 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B2194401B48; Fri,  8 Sep 2006 14:22:09 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908212209.B2194401B48@tinman.treke.net>
Date: Fri,  8 Sep 2006 14:22:09 -0700 (PDT)
Subject: [Bug 450] 3.5.4-RC, collie: very low speed of writing to /
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
X-List-Received-Date: Fri, 08 Sep 2006 21:46:41 -0000

http://bugs.openembedded.org/show_bug.cgi?id=450


pasky@ucw.cz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pasky@ucw.cz




------- Comment #4 from pasky@ucw.cz  2006-09-08 14:22 -------
Yes, there is definitely something fishy with jffs2 - right now I have 4M free
on the / filesystem and jffs2 is basically reluctant to pass the mark - after
five minutes it allocated another five or so blocks and now for tens of minutes
stalled. Nothing in dmesg, and the space is definitely there usable since I
gained it by moving some files to the CF card (which went without error).


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


