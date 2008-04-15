Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1JlkHa-0002YJ-DH
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 14:29:06 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id DEA29838FA; Tue, 15 Apr 2008 14:29:02 +0200 (CEST)
Date: Tue, 15 Apr 2008 14:29:02 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080415122902.GA13726@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: How to properly enforce an ARM OABI build?
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
X-List-Received-Date: Tue, 15 Apr 2008 12:29:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I want to build Angstrom for ARM OABI and I'm struggling to get the settings
right.

I'm using org.openembedded.stable and I tried this in my local conf:

MACHINE="armv4t"
DISTRO="angstrom-2007.1"
TARGET_OS :="linux"
ARM_ABI := "oabi"

ANGSTROM_MODE = "uclibc"
TARGET_FPU = "soft"

ENABLE_BINARY_LOCALE_GENERATION = "0"

My machine configuration does not do anything special either:
PACKAGE_EXTRA_ARCHS = "armv4 armv4t"
TARGET_ARCH = "arm"
require conf/machine/include/tune-arm920t.inc

Now.. I saw that Angstrom is using the ARM_ABI variable:
ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
require conf/distro/include/angstrom${ARM_ABI}.inc

Since it's ?= I should be able to override it, right?
The directory in the work dir also look interesting:
arm-oabi-angstrom-linux-uclibcgnueabi

And the toolchain got created as arm-angstrom-linux-uclibcgnueabi-*, the 
produced binaries are also EABI.

What am I missing? How do I force an OABI build for my machine?

Kind regards,
Jin



