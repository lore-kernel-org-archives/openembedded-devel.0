Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GIRXG-0006ph-E3 for openembedded-devel@lists.openembedded.org;
	Wed, 30 Aug 2006 16:59:22 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A8FCE401B3E; Wed, 30 Aug 2006 07:37:11 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060830143711.A8FCE401B3E@tinman.treke.net>
Date: Wed, 30 Aug 2006 07:37:11 -0700 (PDT)
Subject: [Bug 1290] qemu-native-0.8.1 fails in staging because of lack of strip binary
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
X-List-Received-Date: Wed, 30 Aug 2006 14:59:22 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1290





------- Comment #4 from hma@syd.odn.ne.jp  2006-08-30 07:37 -------
How about let 
/opt/stuff/oz354x/tmp/staging/i686-linux/bin/strip
appear?

Maybe it should be from binutils-cross or some binutils variant package.

Now
stuff/oz354x/tmp/work/binutils-cross-2.15.94.0.1-r1/binutils-2.15.94.0.1/build.i686-linux.arm-linux/binutils/Makefile
has following line.

noinst_PROGRAMS =  nm-new$(EXEEXT) strip-new$(EXEEXT) cxxfilt$(EXEEXT)

Is this the reason why strip program is not installed in
/opt/stuff/oz354x/tmp/staging/i686-linux/bin/ ?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


