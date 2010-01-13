Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NV2ns-0006Rz-PT
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 13:58:31 +0100
Received: from mcgi47.rambler.ru (mcgi47.rambler.ru [81.19.67.71])
	by mxa.rambler.ru (Postfix) with ESMTP id 0DFCAAC237
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 15:55:18 +0300 (MSK)
Received: from mcgi47.rambler.ru (localhost [127.0.0.1])
	by mcgi47.rambler.ru (Postfix) with ESMTP id 7836D1144F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 15:55:15 +0300 (MSK)
Received: from [77.52.208.230] by mcgi47.rambler.ru with HTTP (mailimap);
	Wed, 13 Jan 2010 15:55:12 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2010 15:55:12 +0300
MIME-Version: 1.0
Message-Id: <97332218.1263387312.156294792.17546@mcgi47.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Adding a new Machine question
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
X-List-Received-Date: Wed, 13 Jan 2010 12:58:32 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Hi!
I have problem with configs for new x86_64 machine.
How I read in manual I need set next vasiables
1. TARGET_ARCH
  TARGET_ARCH = "x86_64"
2. MACHINE_FEATURES
 MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2 x86"
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
3. PREFERRED_PROVIDER_virtual/kernel
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 And now when I build  helloworld-image all is ok i get my RFS image.
But when I try build bootstrap-image I got error
"  no such directory asm-x86" but I see dir with name "asm-generic" and
name of machine conf file is x86_64-generic.conf.
So, I don't understand what I do wrong?

x86_64-generic.conf
# Released under the MIT license (see packages/COPYING)
#@TYPE: Machine
#@NAME: x86_64
#@DESCRIPTION: Machine configuration for a generic x86_64 machine

TARGET_ARCH = "x86_64"

#PREFERRED_PROVIDER_virtual/kernel = "linux"
PREFERRED_VERSION_gcc = "4.4.2"
KERNEL_IMAGETYPE = "bzImage"
GLIBC_ADDONS = "nptl"
GLIBC_EXTRA_OECONF = "--with-tls"

IMAGE_FSTYPES ?= "ext2.gz"
IMAGE_DEVICE_TABLES = " \
  files/device_table-minimal.txt \
  files/device_table_add-loop.txt \
  files/device_table_add-scsi.txt \
"
MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2"
MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
TARGET_CC_ARCH = "-m64"
BASE_PACKAGE_ARCH = "x86_64"
FEED_ARCH = "x86_64"
#PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"





--
Thank you.
Perepelica Alexander


