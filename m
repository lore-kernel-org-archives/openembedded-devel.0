Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMMX1-0001fD-74
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 16:17:45 +0100
Received: from [192.168.0.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 812861B421
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 16:17:45 +0100 (CET)
Message-ID: <4CF120CB.9030808@sensortherm.de>
Date: Sat, 27 Nov 2010 16:16:27 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: disko
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
X-List-Received-Date: Sat, 27 Nov 2010 15:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

disko needs scons to build, but the recipes depends not to 
python-scons-native. I changed DEPENDS in disko.inc from
- DEPENDS = "sqlite3 libpng jpeg curl alsa-lib freetype libxml2 
libsigc++-2.0 openssl"
+ DEPENDS = "python-scons-native sqlite3 libpng jpeg curl alsa-lib 
freetype libxml2 libsigc++-2.0 openssl"

but it doesn't help.

Can you help me?

Regards,

Klaus


klaus@ubuntu:~/development/oe$ bitbake -v  -b disko_1.6.0.bb

Build Configuration:
BB_VERSION        = "1.8.18"
METADATA_BRANCH   = "master"
METADATA_REVISION = "9cc836b"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "dm355-evm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20101127"
TARGET_FPU        = "soft"

NOTE: Preparing runqueue
NOTE: Marking Active Tasks
NOTE: Pruned 14 inactive tasks, 17 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
NOTE: Executing runqueue
NOTE: Running task 1 of 17 (ID: 10, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_setscene)
NOTE: Running task 2 of 17 (ID: 8, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_fetch)
NOTE: Running task 3 of 17 (ID: 0, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_unpack)
NOTE: Unpacking downloads/disko_1.6.0.tar.bz2 to 
tmp/work/armv5te-angstrom-linux-gnueabi/disko-1.6.0-r9/
NOTE: Running task 4 of 17 (ID: 1, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_patch)
NOTE: Applying patch 'pkgconfig.patch' 
(openembedded/recipes/disko/files/pkgconfig.patch)
NOTE: Running task 5 of 17 (ID: 11, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_configure)
NOTE: Running task 6 of 17 (ID: 12, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_qa_configure)
NOTE: Running task 7 of 17 (ID: 13, 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_compile)
ERROR: function do_compile failed
ERROR: log data follows 
(/home/klaus/development/oe/tmp/work/armv5te-angstrom-linux-gnueabi/disko-1.6.0-r9/temp/log.do_compile.19443)
| 
/home/klaus/development/oe/tmp/work/armv5te-angstrom-linux-gnueabi/disko-1.6.0-r9/temp/run.do_compile.19443: 
line 244: 
/home/klaus/development/oe/tmp/sysroots/x86_64-linux/usr/bin/scons: No 
such file or directory
| FATAL: scons build execution failed.
NOTE: Task failed: 
/home/klaus/development/oe/tmp/work/armv5te-angstrom-linux-gnueabi/disko-1.6.0-r9/temp/log.do_compile.19443
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb 
do_compile failed
ERROR: Task 13 
(/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb, 
do_compile) failed
NOTE: Tasks Summary: Attempted 6 tasks of which 0 didn't need to be 
rerun and 1 failed.
ERROR: 
'/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb' 
failed



