Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GL3KJ-0000V8-2V for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 21:44:47 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 7C1DE401B45; Wed,  6 Sep 2006 12:20:50 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906192050.7C1DE401B45@tinman.treke.net>
Date: Wed,  6 Sep 2006 12:20:50 -0700 (PDT)
Subject: [Bug 1110] env variable MAKEFLAGS should not be propagated into bitbake subprocesses
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
X-List-Received-Date: Wed, 06 Sep 2006 19:44:47 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1110





------- Comment #3 from yamaken@bp.iij4u.or.jp  2006-09-06 12:20 -------
Thank you for response, and sorry for my unclear report.

There are two distinct problems:

1. Some package(s) need to be disabled unsafe parallel compilation
2. The env variable MAKEFLAGS of user shell should not be propagated into
'make' inferior processes of bitbake

For the problem 1., I will try to find the problematic package(s) if they are
not fixed yet. I know what is processed by bitbake about parallel compilation.

And 2. is the problem what I tried to report. What I want is stopping global
propagation of the environment variable MAKEFLAGS into inferior 'make'
processes of bitbake, explicitly. i.e. Erase MAKEFLAGS inherited from the user
shell, by bitbake.

In my case, the propagation caused parallel make by my MAKEFLAGS=-j6 variable
even if PARALLEL_MAKE is disabled by local.conf. What I want is that the
parallel make can be disabled by PARALLEL_MAKE of local.conf even if user env
variable MAKEFLAGS instructs parallel make.

Please reply again if something is unclear yet.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


