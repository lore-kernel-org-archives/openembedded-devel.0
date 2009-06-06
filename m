Received: from [17.148.16.88] (helo=asmtpout013.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MCr4a-0002FD-4b
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 10:16:16 +0200
MIME-version: 1.0
Received: from [87.201.169.139] by asmtp013.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKT00IW157JA020@asmtp013.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 01:06:59 -0700 (PDT)
Message-id: <FAF267A4-D417-4B8A-A07C-6E2A3DA5BAD6@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <20090606074606.GF4988@denix.org>
Date: Sat, 06 Jun 2009 12:06:52 +0400
References: <046B8D02-FF75-4D9E-BBB9-2D2DF22E37BC@mac.com>
	<20090606074606.GF4988@denix.org>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Where do the extra #include <mach/board-overo.h> come	from in linux-omap3-2.6.29.bb recipe?
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
X-List-Received-Date: Sat, 06 Jun 2009 08:16:16 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	When I comment out the SRCREV entry, and do a

$ bitbake -c clean linux-omap3-2.6.29
$ bitbake -c rebuild linux-omap3-2.6.29

I get a "fatal: Not a git repository" error:

bitbake -c rebuild linux-omap3-2.6.29
NOTE: Handling BitBake files: | (6810/6810) [100 %]
NOTE: Parsing finished. 6541 cached, 0 parsed, 269 skipped, 2 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 305 of 546 (ID: 2, /tool/overo-oe/user.collection/ 
recipes/linux/linux-omap3_2.6.29.bb, do_setscene)
NOTE: Running task 527 of 546 (ID: 3, /tool/overo-oe/user.collection/ 
recipes/linux/linux-omap3_2.6.29.bb, do_fetch)
fatal: Not a git repository
NOTE: Task failed: Fetch failed: Fetch command export HOME=/home/ 
elvis; export SSH_AUTH_SOCK=/tmp/keyring-M40Rvw/ssh; export PATH=/tool/ 
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
omap3_2.6.29.bb do_fetch failed
ERROR: Task 3 (/tool/overo-oe/user.collection/recipes/linux/linux- 
omap3_2.6.29.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 526 tasks of which 525 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/linux/linux- 
omap3_2.6.29.bb' failed


Best regards,

Elvis


