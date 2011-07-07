Received: from mail.dawning.com ([63.247.149.203])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <awaterman@dawning.com>) id 1QeoHp-0004s5-13
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 15:06:33 +0200
Received: from victoria.dawning.com by mail.dawning.com (MDaemon PRO v9.5.4)
	with ESMTP id 28-md50000009227.msg
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 09:00:23 -0400
Message-ID: <4E15ACD2.4010104@dawning.com>
Date: Thu, 07 Jul 2011 08:55:46 -0400
From: Alex Waterman <awaterman@dawning.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated-Sender: awaterman@dawning.com
X-Spam-Processed: mail.dawning.com, Thu, 07 Jul 2011 09:00:23 -0400
	(not processed: message from trusted or authenticated source)
X-Return-Path: awaterman@dawning.com
X-Envelope-From: awaterman@dawning.com
X-MDaemon-Deliver-To: openembedded-devel@lists.openembedded.org
Subject: Build fail for eglibc
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
X-List-Received-Date: Thu, 07 Jul 2011 13:06:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Hello List,

I have been trying to compile cacao for a development platform using 
openembedded. I have built a tool chain using crosstool-ng targeting
arm-none-linux-gnueabi, and have set up openembedded following the getting
started page on the wiki.

However, I run into an issue with eglibc. I get a make error during the compile
for eglibc:

... snip ...
| make[2]: Entering directory `/home/alex/bb-build/tmp/work/armv5te-none-linux-gnueabi/eglibc-2.12-r21.8+svnr13230/eglibc-2_12/libc/nss'
| Makefile:85: *** OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG variable left unset.  Stop.
| make[2]: Leaving directory `/home/alex/bb-build/tmp/work/armv5te-none-linux-gnueabi/eglibc-2.12-r21.8+svnr13230/eglibc-2_12/libc/nss'
| make[1]: *** [nss/subdir_lib] Error 2
... snip ...

I am using the latest git tree, as of 15 minutes ago.

Any help or advice would be greatly appreciated. Are there any work arounds?
Or fixes?

Oh, and my local.conf file:

---
# Source directory.
DL_DIR = "${HOME}/bitbake-sources"

# BB files...
BBFILES = "/usr/openembedded/recipes/*/*.bb"

# Our machine in question...
MACHINE = "at91sam9m10g45ek"
TARGET_ARCH = "arm"

# Target operating system.
TARGET_OS = "linux"
DISTRO = "minimal"

# Tool chain ralated stuff.
TOOLCHAIN_VENDOR = "-none"
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "x-tool"
TOOLCHAIN_PATH = "/usr/alex-embeded"

# Output image type.
IMAGE_FSTYPES = "jffs2"

# Other things
BBINCLUDELOGS = "yes"

SRCPV = "${@bb.fetch.get_srcrev(d)}"
---

Best Regards,
Alex

-- 
Alex Waterman
Computer Engineer
Phone: 215-896-4920
Email: awaterman@dawning.com



