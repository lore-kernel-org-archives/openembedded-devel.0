Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GMI4G-0007fC-AM for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 07:41:20 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 7D831401B45; Sat,  9 Sep 2006 22:16:31 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060910051631.7D831401B45@tinman.treke.net>
Date: Sat,  9 Sep 2006 22:16:31 -0700 (PDT)
Subject: [Bug 1160] libxslt fails to build
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
X-List-Received-Date: Sun, 10 Sep 2006 05:41:21 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1160


lenehan@twibble.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




------- Comment #2 from lenehan@twibble.org  2006-09-09 22:16 -------
This is caused by the configure script finding libgcrypt-config on the host:

 configure:22292: checking for libgcrypt-config
 configure:22310: found /usr/bin/libgcrypt-config
 configure:22323: result: /usr/bin/libgcrypt-config

If libgcrypt-config is not installed on the host then crypto support will be
disabled.

So there are two fixes here:

1) Add libgcrypt to DEPENDS if we want crypto; or
2) Add --without-crypto to EXTRA_OECONF to disable crypto.

Since people will already be randomly getting crypto enabled or not I suspect
that disabling crypto is the correct option here.

If no one else has any comments I'll submit the change to disable crypto in a
few days.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


