Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GUHtG-0000K0-0i for openembedded-devel@lists.openembedded.org;
	Mon, 02 Oct 2006 09:07:02 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 878BC401B46; Sun,  1 Oct 2006 23:36:31 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061002063631.878BC401B46@tinman.treke.net>
Date: Sun,  1 Oct 2006 23:36:31 -0700 (PDT)
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
X-List-Received-Date: Mon, 02 Oct 2006 07:07:02 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1439





------- Comment #6 from lenehan@twibble.org  2006-10-01 23:36 -------
Good point about the LOCALE, that's something that I didn't think off.
I was worried about being able to rely on having gnup grep, but adding
grap-native should ensure that is the case.
I've now checked in grep-native and modified perl to depend on it and changed
it to use grep -I.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


