Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Mq5L1-0003lz-6g
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 15:23:26 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 2C17316DE84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 15:22:48 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id E0CE32A429F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 15:22:47 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 22 Sep 2009 15:23:40 +0200
Message-ID: <4AB8CF91.1070907@dresearch.de>
Date: Tue, 22 Sep 2009 15:22:25 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 22 Sep 2009 13:23:40.0984 (UTC)
	FILETIME=[E6A77B80:01CA3B87]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: bitbake freeze :(
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Sep 2009 13:23:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since a few days i see this crazy behavior. Sometimes bitbake freezes (everytime at the same stages if it freezes) when building a target (e.g. with "bitbake drapptempl"). top tells me that a "make all" process is running and consuming all resources of one cpu. The last lines of an strace show always something like this:

...
5909  stat64(".deps/drapptempl-main.Po", {st_mode=S_IFREG|0644, st_size=8, ...}) = 0
5909  lstat64(".deps/drapptempl-main.Tpo", {st_mode=S_IFREG|0644, st_size=32496, ...}) = 0
5909  lstat64(".deps/drapptempl-main.Po", {st_mode=S_IFREG|0644, st_size=8, ...}) = 0
5909  rename(".deps/drapptempl-main.Tpo", ".deps/drapptempl-main.Po") = 0
5909  close(0)                          = 0
5909  close(1)                          = 0
5909  close(2)                          = 0
5909  exit_group(0)                     = ?
5898  <... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 5909
5898  --- SIGCHLD (Child exited) @ 0 (0) ---
5898  sigreturn()                       = ? (mask now [])
5898  rt_sigprocmask(SIG_BLOCK, [HUP INT QUIT TERM XCPU], NULL, 8) = 0
5898  rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
5898  stat64("drapptempl-main.o", {st_mode=S_IFREG|0644, st_size=107848, ...}) = 0

The recipe for the freezing task looks like this:

 DESCRIPTION = "HydraIP Linux Application Template"
 SECTION = "console/utils"
 PRIORITY = "optional"
 DEPENDS = "libdrhip"

 #SRCREV = "1390"
 SRCREV = "${AUTOREV}" 
 PR = "r1"

 SRC_URI="svn://something.else/repos/HydraIP/trunk/LINUX;module=drapptempl;proto=https"

 PV = "svnr${SRCREV}"
 S = "${WORKDIR}/drapptempl"

 EXTRA_OECONF = "--with-libdrhip-path=${STAGING_DIR_TARGET}"

 inherit autotools

Any idea what's going wrong here? Or how to isolate the problem?

Steffen




