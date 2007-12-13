Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J2dTh-00083s-Sx
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 03:07:09 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J2dL6-0001Y9-Sq
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 01:58:17 +0000
Received: from v-209-98-139-195.mn.visi.com ([209.98.139.195])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 01:58:16 +0000
Received: from grante by v-209-98-139-195.mn.visi.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 01:58:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Grant Edwards <grante@visi.com>
Date: Thu, 13 Dec 2007 01:30:41 +0000 (UTC)
Message-ID: <fjq200$d43$1@ger.gmane.org>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: v-209-98-139-195.mn.visi.com
User-Agent: slrn/0.9.8.1 (Linux)
Sender: news <news@ger.gmane.org>
Subject: Why is package external-toolchain-1.0 failing?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2007 02:07:10 -0000

I've followed the step-by-step instructions on the "getting
started with OE" web page for a Zaurus SL5500, but when I try
to do the example build command "bitbake nano" it fails.
Google didn't really find anything that seemed helpful.  I
searched the mailing list and found a posting a coule weeks ago
from somebody who had the exact same issue, but that posting
got no useful responses (possibly because it hijacked a
thread).

What is an "external toolchain", do I need one to build for an
SL5500 target?  If I do need one, why doesn't bitbake know how
to build one?

Here's the output from the "bitbake nano" command:

________________________________________________________________________
Parsing .bb files, please wait...done.
NOTE: Parsing finished. 4675 cached, 0 parsed, 218 skipped, 0 masked.
NOTE: build 200712121925: started

OE Build Configuration:
BB_VERSION     = "1.8.8"
OE_REVISION    = "47aec7f5811a7e41e48a85cc8ca83a9ef745e862"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "collie"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.9-test-20071213"
TARGET_FPU     = "soft"

NOTE: Resolving missing task queue dependencies
NOTE: multiple providers are available for linux-libc-headers (linux-libc-headers, external-toolchain);
NOTE: consider defining PREFERRED_PROVIDER_linux-libc-headers
NOTE: multiple providers are available for virtual/arm-angstrom-linux-binutils (external-toolchain, binutils-cross);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils
NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-libc-for-gcc)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 88 of 281 (ID: 126, /home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb, do_populate_staging)
NOTE: package external-toolchain-1.0: started
NOTE: package external-toolchain-1.0-r1: task do_populate_staging: started
ERROR: function do_stage failed
ERROR: log data follows (/home/grante/quarq/oe/tmp/work/i686-arm-oabi-sdk-angstrom-linux/external-toolchain-1.0-r1/temp/log.do_stage.8896)
| The external toolchain could not be found in /usr/local/angstrom/arm!
NOTE: Task failed: /home/grante/quarq/oe/tmp/work/i686-arm-oabi-sdk-angstrom-linux/external-toolchain-1.0-r1/temp/log.do_stage.8896
NOTE: package external-toolchain-1.0-r1: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package external-toolchain-1.0: failed
ERROR: Build of /home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb do_populate_staging failed

NOTE: Parsing finished. 4675 cached, 0 parsed, 218 skipped, 0 masked.
NOTE: build 200712121925: started

OE Build Configuration:
BB_VERSION     = "1.8.8"
OE_REVISION    = "47aec7f5811a7e41e48a85cc8ca83a9ef745e862"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "collie"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.9-test-20071213"
TARGET_FPU     = "soft"

NOTE: Resolving missing task queue dependencies
NOTE: multiple providers are available for linux-libc-headers (linux-libc-headers, external-toolchain);
NOTE: consider defining PREFERRED_PROVIDER_linux-libc-headers
NOTE: multiple providers are available for virtual/arm-angstrom-linux-binutils (external-toolchain, binutils-cross);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils
NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-libc-for-gcc)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 88 of 281 (ID: 126, /home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb, do_populate_staging)
ERROR: Task 126 (/home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb, do_populate_staging) failed
NOTE: Tasks Summary: Attempted 87 tasks of which 87 didn't need to be rerun and 1 failed.
ERROR: '/home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb' failed



