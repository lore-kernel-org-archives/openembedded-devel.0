Received: from [17.148.16.91] (helo=asmtpout016.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MD1tk-0004a0-Dg
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 21:49:48 +0200
MIME-version: 1.0
Received: from [87.201.169.139] by asmtp016.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKU00IH419KE350@asmtp016.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 12:39:47 -0700 (PDT)
Message-id: <566B08B2-D65A-449D-B2B8-53C2AFF7DD67@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Sat, 06 Jun 2009 23:39:40 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: How to create recipe for linux-omap3-2.6.30
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
X-List-Received-Date: Sat, 06 Jun 2009 19:49:48 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I'm trying to create a recipe to for linux-omap3-2.6.30-rc6. But I  
get a fatal: Not a git repository error each time. I've based this off  
the linux-omap3_git.bb recipe.

In my user.collection/recipes/linux/linux-omap3_2.6.30.bb file, I have  
the following entries:

# Linux OMAP3 2.6.30 recipie
DEFAULT_PREFERENCE = 1

# Required packages
require linux.inc

# Package information
DESCRIPTION = "Linux kernel for OMAP3 processors"
KERNEL_IMAGETYPE = "uImage"

COMPATIBLE_MACHINE = "beagleboard|omap3evm|overo"

# Specify the source revision tag
SRCREV = "efea6e3fd0f22b45f2a9f01962603b564b3a25a0"

PN = "linux-omap3"
PV = "2.6.30-rc6+${PR}+git${SRCREV}"
#PV = "2.6.30"
PR = "r01"

SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux- 
omap-2.6.git;branch=master;protocol=git \
	   file://defconfig \	
           "

running bitbake linux-omap3 gives me the following error:

[elvis@zeus overo-oe]$ bitbake linux-omap3
NOTE: Handling BitBake files: / (6811/6811) [100 %]
NOTE: Parsing finished. 6541 cached, 1 parsed, 269 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 305 of 545 (ID: 1, /tool/overo-oe/user.collection/ 
recipes/linux/linux-omap3_2.6.30.bb, do_setscene)
NOTE: Running task 527 of 545 (ID: 2, /tool/overo-oe/user.collection/ 
recipes/linux/linux-omap3_2.6.30.bb, do_fetch)
fatal: Not a git repository
NOTE: Task failed: Fetch failed: Fetch command export HOME=/home/ 
elvis; export SSH_AUTH_SOCK=/tmp/keyring-PVwYzf/ssh; export PATH=/tool/ 
overo-oe/tmp/staging/i686-linux/usr/bin/overo-angstrom-linux-gnueabi:/ 
tool/overo-oe/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux- 
gnueabi:/tool/overo-oe/tmp/staging/i686-linux/usr/sbin:/tool/overo-oe/ 
tmp/staging/i686-linux/usr/bin:/tool/overo-oe/tmp/cross/armv7a/bin:/ 
tool/overo-oe/tmp/staging/i686-linux/sbin:/tool/overo-oe/tmp/staging/ 
i686-linux/bin:/tool/repo:/tool/android/out/host/linux-x86/bin:/tool/ 
script:/tool/overo-oe/bitbake/bin:/tool/overo-oe/tmp/cross/armv7a/bin:/ 
usr/java/jdk1.6.0_12/bin:/tool/repo:/tool/android/out/host/linux-x86/ 
bin:/tool/script:/tool/overo-oe/bitbake/bin:/tool/overo-oe/tmp/cross/ 
armv7a/bin:/usr/java/jdk1.6.0_12/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/ 
bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/ 
sbin:/sbin:/home/elvis/bin; git fetch git://git.kernel.org/pub/scm/ 
linux/kernel/git/tmlind/linux-omap-2.6.git master failed with signal  
128, output:
fatal: Not a git repository

ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/linux/linux- 
omap3_2.6.30.bb do_fetch failed
ERROR: Task 2 (/tool/overo-oe/user.collection/recipes/linux/linux- 
omap3_2.6.30.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 526 tasks of which 525 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/linux/linux- 
omap3_2.6.30.bb' failed


Best regards,

Elvis




