Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDFNu-0000Ul-UH
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 12:13:51 +0200
MIME-version: 1.0
Received: from [87.201.169.74] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKV00FFF5BADU60@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Jun 2009 03:04:27 -0700 (PDT)
Message-id: <75B0D99F-6176-43F7-B640-105A130ACD2E@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Phil Blundell <pb@reciva.com>
In-reply-to: <1244367963.4151.5.camel@lenovo.internal.reciva.com>
Date: Sun, 07 Jun 2009 14:04:18 +0400
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb doesn't work when copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 10:13:51 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		I deleted the entire org.openembedded.dev repository, re-cloned it  
and this time around, ran the bitbake linux-omap3 command, after  
commenting out the DEFAULT_PREFERENCE="-1".

Still get the same error. What can I do?

Elvis


On Jun 7, 2009, at 1:46 PM, Phil Blundell wrote:

>
>
> Have you tried cleaning out your ${GITDIR}?


[elvis@zeus org.openembedded.dev]$ bitbake linux-omap3
NOTE: Handling BitBake files: \ (6876/6876) [100 %]
NOTE: Parsing finished. 6603 cached, 1 parsed, 272 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 130 of 545 (ID: 366, /tool/overo-oe/ 
org.openembedded.dev/recipes/binutils/binutils-cross_2.18.50.0.7.bb,  
do_configure)
NOTE: Running task 242 of 545 (ID: 353, /tool/overo-oe/ 
org.openembedded.dev/recipes/glib-2.0/glib-2.0-native_2.18.0.bb,  
do_configure)
NOTE: Running task 270 of 545 (ID: 1, /tool/overo-oe/ 
org.openembedded.dev/recipes/linux/linux-omap3_git.bb, do_setscene)
NOTE: Running task 346 of 545 (ID: 503, /tool/overo-oe/ 
org.openembedded.dev/recipes/gettext/gettext-native_0.17.bb,  
do_package_stage)
NOTE: Running task 422 of 545 (ID: 2, /tool/overo-oe/ 
org.openembedded.dev/recipes/linux/linux-omap3_git.bb, do_fetch)
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
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/linux/ 
linux-omap3_git.bb do_fetch failed
ERROR: Task 2 (/tool/overo-oe/org.openembedded.dev/recipes/linux/linux- 
omap3_git.bb, do_fetch) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1: /tool/overo-oe/org.openembedded.dev/recipes/binutils/binutils- 
cross_2.18.50.0.7.bb, do_configure (4729)
NOTE: 2: /tool/overo-oe/org.openembedded.dev/recipes/glib-2.0/glib-2.0- 
native_2.18.0.bb, do_configure (4730)
NOTE: 3: /tool/overo-oe/org.openembedded.dev/recipes/gettext/gettext- 
native_0.17.bb, do_package_stage (4739)
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /tool/overo-oe/org.openembedded.dev/recipes/binutils/binutils- 
cross_2.18.50.0.7.bb, do_configure (4729)
NOTE: 2: /tool/overo-oe/org.openembedded.dev/recipes/glib-2.0/glib-2.0- 
native_2.18.0.bb, do_configure (4730)
^Z
[3]+  Stopped                 bitbake linux-omap3
[elvis@zeus org.openembedded.dev]$


[elvis@zeus org.openembedded.dev]$



