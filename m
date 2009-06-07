Received: from [17.148.16.88] (helo=asmtpout013.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDFdw-0006Lg-VD
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 12:30:25 +0200
MIME-version: 1.0
Received: from [87.201.169.74] by asmtp013.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKV00I9Q62WN150@asmtp013.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Jun 2009 03:21:01 -0700 (PDT)
Message-id: <94920284-2A1B-4EFC-83A0-F445BFDE92B9@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Phil Blundell <pb@reciva.com>
In-reply-to: <1244369313.4151.9.camel@lenovo.internal.reciva.com>
Date: Sun, 07 Jun 2009 14:20:52 +0400
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
	<618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
	<1244369313.4151.9.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb doesn't work	when	copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 10:30:25 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		I deleted all the files in the ${GITDIR} like you suggested, but now  
I get an error:

gzip: stdin: invalid compressed data--format violated
tar: Unexpected EOF in archive
tar: Unexpected EOF in archive
tar: Error is not recoverable: exiting now

What could be causing it?

Elvis


[elvis@zeus org.openembedded.dev]$ bitbake linux-omap3
NOTE: Handling BitBake files: \ (6876/6876) [100 %]
NOTE: Parsing finished. 6604 cached, 0 parsed, 272 skipped, 2 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 152 of 545 (ID: 368, /tool/overo-oe/ 
org.openembedded.dev/recipes/binutils/binutils-cross_2.18.50.0.7.bb,  
do_compile)
NOTE: Running task 262 of 545 (ID: 355, /tool/overo-oe/ 
org.openembedded.dev/recipes/glib-2.0/glib-2.0-native_2.18.0.bb,  
do_compile)
NOTE: Running task 274 of 545 (ID: 1, /tool/overo-oe/ 
org.openembedded.dev/recipes/linux/linux-omap3_git.bb, do_setscene)
NOTE: Running task 426 of 545 (ID: 2, /tool/overo-oe/ 
org.openembedded.dev/recipes/linux/linux-omap3_git.bb, do_fetch)

gzip: stdin: invalid compressed data--format violated
tar: Unexpected EOF in archive
tar: Unexpected EOF in archive
tar: Error is not recoverable: exiting now
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
sbin:/sbin:/home/elvis/bin; tar -xzf /usr/share/sources/ 
git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux- 
omap-2.6.git.tar.gz failed with signal 2, output:

gzip: stdin: invalid compressed data--format violated
tar: Unexpected EOF in archive
tar: Unexpected EOF in archive
tar: Error is not recoverable: exiting now

ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/linux/ 
linux-omap3_git.bb do_fetch failed
ERROR: Task 2 (/tool/overo-oe/org.openembedded.dev/recipes/linux/linux- 
omap3_git.bb, do_fetch) failed


On Jun 7, 2009, at 2:08 PM, Phil Blundell wrote:

> Assuming you haven't overridden it in local.conf, the definitions from
> bitbake.conf will be what you're getting:
>
> CO_DIR = "${DL_DIR}"
> GITDIR = "${CO_DIR}/git"
>
> Judging from your previous mail it seems that you have ${DL_DIR} set
> to /usr/share/sources, so the bits in question are most likely
> in /usr/share/sources/git.
>




