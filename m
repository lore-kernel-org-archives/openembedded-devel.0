Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVFit-00067m-1r for openembedded-devel@lists.openembedded.org;
	Thu, 05 Oct 2006 01:00:19 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id EBC54401B45; Wed,  4 Oct 2006 15:29:11 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004222911.EBC54401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 15:29:11 -0700 (PDT)
Subject: [Bug 1448] GLIBC_2.4+NPTL missing pthread_kill external declaration in header file
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
X-List-Received-Date: Wed, 04 Oct 2006 23:00:19 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1448





------- Comment #1 from lenehan@twibble.org  2006-10-04 15:29 -------
[nynaeve][ 8:29AM]/data/oe/build/titan-glibc-24%> find
tmp/staging/sh4-linux/include -exec grep -HI pthread_kill {} \;
tmp/staging/sh4-linux/include/bits/sigthread.h:extern int pthread_kill
(pthread_t __threadid, int __signo) __THROW;

pthread.h includes signal.h which includes bits/sigthread.h

This matches what's on my host system as well. The include of bits/sigthread.h
is protected by this though:

#if defined __USE_POSIX199506 || defined __USE_UNIX98

I'm unable to check further since version included in OE is no longer available
at the specific SRC_URI (replaced with a 1.0.0-rc1 version now).


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


