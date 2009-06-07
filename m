Received: from [17.148.16.95] (helo=asmtpout020.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MD996-0005pz-Jz
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 05:34:08 +0200
MIME-version: 1.0
Received: from [87.201.169.139] by asmtp020.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKU00KWCMT6JM00@asmtp020.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 20:24:46 -0700 (PDT)
Message-id: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>,
	Steve Sakoman <sakoman@gmail.com>
Date: Sun, 07 Jun 2009 07:24:39 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: linux-omap3_git.bb doesn't work when copied to user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 03:34:08 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I've been faced with a problem for the past day, where I'm trying to  
use linux-omap3_git.bb, after it has been copied to my user.collection/ 
recipes/linux folder, I set the DEFAULT_PREFERENCE =  "1"

but it gives me a fatal: not a git repository error. I have even  
deleted the entire org.openembedded.dev and synchronize the repository  
as of Sunday, to pull in Steve's latest changes.

What could be causing this?

Best regards,

Elvis




[elvis@zeus overo-oe]$ bitbake linux-omap3
NOTE: Handling BitBake files: \ (6881/6881) [100 %]
NOTE: Parsing finished. 6608 cached, 1 parsed, 272 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 115 of 545 (ID: 497, /tool/overo-oe/ 
org.openembedded.dev/recipes/gettext/gettext-native_0.17.bb,  
do_qa_configure)
NOTE: Running task 231 of 545 (ID: 205, /tool/overo-oe/ 
org.openembedded.dev/recipes/u-boot/u-boot-mkimage-openmoko- 
native_oe.bb, do_unpack)
NOTE: Running task 261 of 545 (ID: 1, /tool/overo-oe/user.collection/ 
recipes/linux/linux-omap3_git.bb, do_setscene)
NOTE: Unpacking /usr/share/sources/git_www.denx.de.git.u- 
boot.git._9912121f7ed804ea58fd62f3f230b5dcfc357d88.tar.gz to tmp/work/ 
i686-linux/u-boot-mkimage-openmoko- 
native-1.2.0+git9912121f7ed804ea58fd62f3f230b5dcfc357d88svn2238-r1/
NOTE: Running task 400 of 545 (ID: 2, /tool/overo-oe/user.collection/ 
recipes/linux/linux-omap3_git.bb, do_fetch)
fatal: Not a git repository
NOTE: Task failed: Fetch failed: Fetch command export HOME=/home/ 
elvis; export SSH_AUTH_SOCK=/tmp/keyring-C4wDro/ssh; export PATH=/tool/ 
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
omap3_git.bb do_fetch failed
NOTE: Running task 401 of 545 (ID: 498, /tool/overo-oe/ 
org.openembedded.dev/recipes/gettext/gettext-native_0.17.bb, do_compile)
ERROR: Task 2 (/tool/overo-oe/user.collection/recipes/linux/linux- 
omap3_git.bb, do_fetch) failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /tool/overo-oe/org.openembedded.dev/recipes/gettext/gettext- 
native_0.17.bb, do_compile (22535)
NOTE: 2: /tool/overo-oe/org.openembedded.dev/recipes/u-boot/u-boot- 
mkimage-openmoko-native_oe.bb, do_unpack (22471)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /tool/overo-oe/org.openembedded.dev/recipes/gettext/gettext- 
native_0.17.bb, do_compile (22535)





