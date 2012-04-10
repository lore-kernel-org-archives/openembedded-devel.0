Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SHUZt-00084y-V8 for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 08:29:22 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SHUQt-0003bh-Rg for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 08:20:05 +0200
Received: from ABTS-KK-dynamic-104.29.172.122.airtelbroadband.in
	([ABTS-KK-dynamic-104.29.172.122.airtelbroadband.in])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 08:20:03 +0200
Received: from surendra.dhobalelinux by
	ABTS-KK-dynamic-104.29.172.122.airtelbroadband.in with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 08:20:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: surendra dhobale <surendra.dhobalelinux@gmail.com>
Date: Tue, 10 Apr 2012 06:10:58 +0000 (UTC)
Message-ID: <loom.20120410T074726-240@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 122.172.29.104 (Mozilla/5.0 (X11; Ubuntu; Linux i686;
	rv:11.0) Gecko/20100101 Firefox/11.0)
Subject: Error: while applying the new patch...
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
X-List-Received-Date: Tue, 10 Apr 2012 06:29:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
I am working with open embedded arago project. 
I had setup all the open
embedded build enviornment. 
Now i have started with modification of the
u-boot source code in the in the working directory(S).
I made some changes in S directory and
 create the patch of the changes
using thegit work-flow as mentioned in 
yocto project user manual.
The patch create successfully. This patch, now added in the 
corresponding bit bake file andrecipe.
but when i start to built 
it gives the errors while do_patch state
and error of quilt.
Error Logs:-
utc-arago@utc-arago-desktop:~/oe$ MACHINE=am335x-evm bitbake u-boot
NOTE: Handling BitBake files: | (7691/7691) [100 %]
Parsing of 7691 .bb files complete (7228 cached, 463 parsed).
 7887 targets, 451
skipped, 585 masked, 0 errors.
Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "da378da"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2011.09"
TARGET_FPU        = "hard"
NOTE: Resolving any missing task queue 
dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 396 of 649 (ID: 11,
/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb,
do_setscene)
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60:
task do_setscene: Started
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
695466ccf32c19d0453f94724987cf063024b60:
task do_setscene: Succeeded
NOTE: Running task 397 of 649 (ID: 9,
/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb, do_fetch)
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60:
task do_fetch: Started
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60:
task do_fetch: Succeeded
NOTE: Running task 398 of 649 (ID: 0,
/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb, do_unpack)
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60:
task do_unpack: Started
NOTE: Unpacking
downloads/git_arago-project.org.git.projects.u-boot-am33x.git_
1695466ccf32c19d0453f94724987cf063024b60.tar.gz
to
arago-tmp/work/am335x-evm-arago-linux-gnueabi/
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60/
FATAL: Execution of 'quilt
--quiltrc=/home/utc-arago/oe/arago-tmp/sysroots/
i686-linux/
usr/bin/quiltrc push'
failed with exit code 1:
Applying patch 0001-Surendra-after-change.patch
patching file board/ti/am335x/evm.c
Hunk #2 FAILED at 704.
1 out of 2 hunks FAILED -- rejects in file
 board/ti/am335x/evm.c
patching file board/ti/am335x/mux.c
Hunk #1 FAILED at 675.
1 out of 1 hunk FAILED -- rejects in file board/ti/am335x/mux.c
Patch 0001-Surendra-after-change.patch does
 not apply (enforce with -f)
ERROR: Function patch_do_patch failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb
do_patch failed
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60:
task do_unpack: Succeeded
ERROR: Task 1
(/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb,
do_patch) failed with exit code 1
ERROR:
'/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb' failed
NOTE: Running task 405 of 649 (ID: 1,
/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb, do_patch)
NOTE: package
u-boot-2011.09-psp04.06.00.06-r11.0+gitr0+
1695466ccf32c19d0453f94724987cf063024b60:
task do_patch: Started
NOTE: Applying patch '0001-Surendra-after-change.patch'
(arago/recipes/u-boot/u-boot-2011.09-psp04.06.00.06/
0001-Surendra-after-change.patch)
FATAL: Execution of 'quilt
--quiltrc=/home/utc-arago/oe/arago-tmp/sysroots/
i686-linux/
usr/bin/quiltrc push'
failed with exit code 1:
Applying patch 0001-Surendra-after-change.patch
patching file board/ti/am335x/evm.c
Hunk #2 FAILED at 704.
1 out of 2 hunks FAILED -- rejects in file 
board/ti/am335x/evm.c
patching file board/ti/am335x/mux.c
Hunk #1 FAILED at 675.
1 out of 1 hunk FAILED -- rejects in file
board/ti/am335x/mux.c
Patch 0001-Surendra-after-change.patch 
does not apply (enforce with -f)
ERROR:
'/home/utc-arago/oe/arago/recipes/u-boot/
u-boot_2011.09-psp04.06.00.06.bb' failed




