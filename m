Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GI4g0-0000wg-VY for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 16:34:53 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id E03F3401B3E; Tue, 29 Aug 2006 07:13:01 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060829141301.E03F3401B3E@tinman.treke.net>
Date: Tue, 29 Aug 2006 07:13:01 -0700 (PDT)
Subject: [Bug 1341] kernel-module-pcnet-cs-2.6 depends on kernel-module-8390-2.6
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
X-List-Received-Date: Tue, 29 Aug 2006 14:34:53 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1341





------- Comment #5 from hma@syd.odn.ne.jp  2006-08-29 07:13 -------
confirmed for c7x0.

I recognized a message during packaging of kernel modules.
No such file: arm-linux-depmod-2.6

After I rebuild module-init-tools-cross,
$ rm oz354x/tmp/stamps/module-init-tools-cross-*
$ bitbake module-init-tools-cross

and repackaged kernel,
$ rm oz354x/tmp/stamps/linux-openzaurus-2.6.17-r17.do_package
$ rm oz354x/tmp/stamps/linux-openzaurus-2.6.17-r17.do_build
$ bitbake virtual/kernel

kernel-module-pcnet-cs-2.6 depends on kernel-module-8390-2.6

Thanks.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


