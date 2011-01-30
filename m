Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PjgVm-0000yh-Mt
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 00:16:50 +0100
Received: (qmail invoked by alias); 30 Jan 2011 23:15:55 -0000
Received: from p4FE0F61A.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.246.26]
	by mail.gmx.net (mp015) with SMTP; 31 Jan 2011 00:15:55 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+SVE8IRj+S6PXMPI8/vnoCf5lsKiuVnRRAeaJIxw
	ux4C1+BanSNMXl
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 00:12:51 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201101310012.51498.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: libgles-omap3 fails
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
X-List-Received-Date: Sun, 30 Jan 2011 23:16:50 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

I don't understand what's going on. When building libgles-omap3 I get

[Superandi@localhost gumstix-oe]$ bitbake libgles-omap3
NOTE: Handling BitBake files: | (0091/7118) [ 1 %]NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: \ (0405/7118) [ 5 %]WARNING: Deprecated usage of 'patch' url param for '/home/Superandi/data/OpenEmbedded/openpandorra-oe/recipes/pandora-system/pandora-pmenu/0001-Remove-libconfig-from-Makefile.patch', please use 'apply={yes,no}'
NOTE: Handling BitBake files: / (1097/7118) [15 %]NOTE: Angstrom DOES NOT support ipkg because ipkg has been superseded by opkg
NOTE: Handling BitBake files: \ (3545/7118) [49 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: Handling BitBake files: \ (3690/7118) [51 %]NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: / (4132/7118) [58 %]WARNING: Deprecated usage of 'patch' url param for '/home/Superandi/data/OpenEmbedded/openpandorra-oe/recipes/slim/slim/fix-manpage.patch', please use 'apply={yes,no}'
NOTE: Handling BitBake files: \ (5024/7118) [70 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: Handling BitBake files: / (5112/7118) [71 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: - (6053/7118) [85 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: \ (6290/7118) [88 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: \ (6339/7118) [89 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: Handling BitBake files: \ (6545/7118) [91 %]NOTE: Angstrom DOES NOT support fso-apm because regular apmd is good enough
NOTE: Handling BitBake files: - (7118/7118) [100 %]
Parsing of 7118 .bb files complete (0 cached, 7118 parsed). 7430 targets, 320 skipped, 2 masked, 0 errors.
ERROR: '['/home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'kernel-2.6.32' but it wasn't found in any PACKAGE or RPROVIDES variables
ERROR: Required build target 'libgles-omap3' has no buildable providers.
Missing or unbuildable dependency chain was: ['libgles-omap3', 'omap3-sgx-modules', 'kernel-2.6.32']

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "oe.org.openembedded.dev"
METADATA_REVISION = "aa479cd"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "overo"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110130"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
ERROR: '['/home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'kernel-2.6.32' but it wasn't found in any PACKAGE or RPROVIDES variables
Unknown Event: <bb.event.NoProvider instance at 0x1280280c>
NOTE: Runtime target 'kernel-2.6.32' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['kernel-2.6.32']
NOTE: Runtime target 'omap3-sgx-modules' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omap3-sgx-modules', 'kernel-2.6.32']
ERROR: Required build target 'libgles-omap3' has no buildable providers.
Missing or unbuildable dependency chain was: ['libgles-omap3', 'omap3-sgx-modules', 'kernel-2.6.32']
Command execution failed: Traceback (most recent call last):
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/command.py", line 174, in buildTargets
    command.cooker.buildTargets(pkgs_to_build, task)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/cooker.py", line 784, in buildTargets
    taskdata.add_unresolved(localdata, self.status)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
    self.remove_runtarget(self.getrun_id(target))
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
    self.fail_fnid(fnid, missing_list)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
    self.remove_runtarget(target, missing_list)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
    self.fail_fnid(fnid, missing_list)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
    self.remove_buildtarget(target, missing_list)
  File "/home/Superandi/data/OpenEmbedded/bitbake/lib/bb/taskdata.py", line 519, in remove_buildtarget
    raise bb.providers.NoProvider
NoProvider

I don't find affecting changes which could have broken this. Any good ideas?

Andreas


