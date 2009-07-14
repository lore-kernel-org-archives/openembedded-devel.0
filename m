Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MQnpE-0002G5-1m
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 21:38:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6F44F1416BC5;
	Tue, 14 Jul 2009 21:27:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3LXj9NCxALt; Tue, 14 Jul 2009 21:27:15 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id ADD2B1416BA8;
	Tue, 14 Jul 2009 21:27:14 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jul 2009 21:24:43 +0200
Message-Id: <1247599483.7178.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: [PATCH] glibc: install correct stubs (fixes midori crash)
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
X-List-Received-Date: Tue, 14 Jul 2009 19:38:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Attached patch prevents overwriting of a real stub include file by a
dummy stub file. Patch is tested only with the latest glibc from the
angstrom.

Dummy stub include causes mis-compilation of undefined number of
packages, increment of DISTRO_PR may be considered as useful.

I am not sure, why this line was there. Correct stub file is generated
by make install, at least in the current version of glibc.

--- a/recipes/glibc/glibc-stage.inc
+++ b/recipes/glibc/glibc-stage.inc
@@ -8,7 +8,6 @@ do_stage() {
 	install -d ${STAGING_INCDIR}/gnu \
 		   ${STAGING_INCDIR}/bits \
 		   ${STAGING_INCDIR}/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${STAGING_INCDIR}/gnu/
 	install -m 0644 ${B}/bits/stdio_lim.h ${STAGING_INCDIR}/bits/
 	install -m 0644 misc/syscall-list.h ${STAGING_INCDIR}/bits/syscall.h
 	for r in ${rpcsvc}; do

Review of compilation logs shows that at least following packages are
referring stub functions: glib-2.0, coreutils, module-init-tools,
openssh, rsync, e2fsprogs, libpcap, pth, python, rxvt-unicode, tar,
tcpdump.

Example of mis-compiled package:

midori fails due to GIO mis-compilation. GIO (glib-2.0) incorrectly
thinks, that inotify_init1 is implemented. But it is not true on systems
compiled with kernel headers < 2.6.27. GIO fails to initialize change
notification, which normally never happens.

Note:

Kernel added several new functions since 2.6.23 (e. g. inotify_init1).
It would be nice to reflect it somehow: update linux-libc-headers and
either keep minimal supported kernel in the build as low as possible
(makes a bit slower glibc), move affected packages from platform to
machine feeds or create different repos with different minimal kernel
version. What do you think about it?


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



