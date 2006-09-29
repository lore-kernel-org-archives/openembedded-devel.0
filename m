Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GTEQY-0005ou-Qi for openembedded-devel@lists.openembedded.org;
	Fri, 29 Sep 2006 11:13:03 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 02C6B401B46; Fri, 29 Sep 2006 01:43:17 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060929084317.02C6B401B46@tinman.treke.net>
Date: Fri, 29 Sep 2006 01:43:17 -0700 (PDT)
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
X-List-Received-Date: Fri, 29 Sep 2006 09:13:03 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1439


lenehan@twibble.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




------- Comment #4 from lenehan@twibble.org  2006-09-29 01:43 -------
I've pushed a fix to stop it grepping binary files since that's obviously
correct, although it doesn't explain why your perl-native binary all of a
sudden is getting references to /usr/include in it. I used "grep -v ..."
instead of "grep -I" since I'm not sure if I can rely on grep being gnu grep.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


