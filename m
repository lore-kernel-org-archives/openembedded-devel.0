Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GTdAa-00044b-9V for openembedded-devel@lists.openembedded.org;
	Sat, 30 Sep 2006 13:38:12 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 8BAE3401B46; Sat, 30 Sep 2006 04:08:09 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060930110809.8BAE3401B46@tinman.treke.net>
Date: Sat, 30 Sep 2006 04:08:09 -0700 (PDT)
Subject: [Bug 1439] perl 5.8.7 fails during configure
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
X-List-Received-Date: Sat, 30 Sep 2006 11:38:12 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1439





------- Comment #5 from mickeyl@handhelds.org  2006-09-30 04:08 -------
Thanks. I'm not sure whether I like this solution, since it depends on the
LOCALE. I know that we always recommend using LANG=C for OpenEmbedded, but I
doubt whether we should rely on that. I'm more leaning towards adding GNU
grep-native and making perl depend on that.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


