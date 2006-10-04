Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GV5pM-0003Ey-Im for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 14:26:20 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4A3F3401B45; Wed,  4 Oct 2006 04:55:20 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004115520.4A3F3401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 04:55:20 -0700 (PDT)
Subject: [Bug 1451] libxres-1.0.1 configure fails (autoreconf)
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
X-List-Received-Date: Wed, 04 Oct 2006 12:26:20 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1451





------- Comment #1 from michael.illing@tietoenator.com  2006-10-04 04:55 -------
The following patch seems to fix the problem:

---------------------------------------------------------------

--- configure.ac        2006-10-04 14:17:05.000000000 +0200
+++ configure.ac.orig   2006-10-04 14:16:59.000000000 +0200
@@ -33,9 +33,9 @@
 dnl protocol, so XRes version l.n.m corresponds to protocol version l.n
 dnl
 AC_INIT(libXres, 1.0.1, [keithp@keithp.com], libXres)
-AC_CONFIG_AUX_DIR(.)
 AM_INIT_AUTOMAKE([dist-bzip2])
 AM_CONFIG_HEADER(config.h)
+AC_CONFIG_AUX_DIR(.)

 # Check for progs
 AC_PROG_CC


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


