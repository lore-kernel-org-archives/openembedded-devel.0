Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1KJnXm-0006Za-IY
	for openembedded-devel@openembedded.org; Fri, 18 Jul 2008 12:50:34 +0200
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id m6IAkI2u004151
	for <openembedded-devel@openembedded.org>;
	Fri, 18 Jul 2008 03:46:18 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Jul 2008 12:49:44 +0200
Received: from aeglos ([172.24.18.149]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 18 Jul 2008 12:49:42 +0200
Message-ID: <86E7D4E2E8B444CB8C710993E2976AD2@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@openembedded.org>
Date: Fri, 18 Jul 2008 12:49:14 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5512
X-OriginalArrivalTime: 18 Jul 2008 10:49:43.0571 (UTC)
	FILETIME=[FCAFDE30:01C8E8C3]
Subject: How update kernel recipe??
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 18 Jul 2008 10:50:34 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit

I have built "gpe-image" for AT91SAM9263EK
after fixing libsvg-cairo manually due to the LT_VERSION problem.

I would like to upgrade the kernel for AT91SAM9263EK.
I created a recipe for linux-2.6.25.10 called
"packages/linux/linux-atmel_2.6.25.10.bb" (found below)
with DEFAULT_PREFERENCE_at91sam9263ek = "30"

2.6.25.10 is properly built when I run:
$ bitbake -b linux-atmel

When I run
$ bitbake -b gpe-image
it still builds "packages/linux/linux_2.6.20.bb"
with DEFAULT_PREFERENCE_at91sam9263ek = "20"

The at91sam9263ek.conf file says:
PREFERRED_PROVIDER_virtual/kernel = "linux"

I have been trying to figure out how the recipe selection
process works, and I assume that all bb files starting
with "linux" will be considered, and then the
highest DEFAULT_PREFERENCE_<machine> will be used
to select linux.

This obviously is not correct, since 2.6.20 is built.

Do I need to change PREFERRED_PROVIDER_virtual/kernel
to "linux-atmel"?
In that case, why?



"conf/machine/at91wsam9263ek.conf"
===================================================================
#@TYPE: Machine
#@Name: Atmel AT91SAM9263EK Development Platform
#@DESCRIPTION: Machine configuration for the at91sam9263ek development
board with a at91sam9263 processor

TARGET_ARCH = "arm"
PACKAGE_EXTRA_ARCHS = "armv4t armv5te"

PREFERRED_PROVIDER_virtual/kernel = "linux"
PREFERRED_PROVIDER_xserver = "xserver-kdrive"

#don't try to access tty1
USE_VT = "0"

MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen"

# used by sysvinit_2
SERIAL_CONSOLE = "115200 ttyS0"
IMAGE_FSTYPES ?= "jffs2"
EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"

require conf/machine/include/tune-arm926ejs.inc

KERNEL_IMAGETYPE = "uImage"


packages/linux/linux-atmel_2.6.25.10.bb
=================================================================
require linux.inc

DEFAULT_PREFERENCE = "-1"
DEFAULT_PREFERENCE_at91sam9rl64ek = "30"
DEFAULT_PREFERENCE_at91sam9263ek = "30"
DEFAULT_PREFERENCE_at91sam9261ek = "30"
DEFAULT_PREFERENCE_at91sam9260ek = "30"
DEFAULT_PREFERENCE_at91cap9adk   = "30"
DEFAULT_PREFERENCE_kb9202 = "30"
DEFAULT_PREFERENCE_at32stk1000   = "2"
DEFAULT_PREFERENCE_atngw100   = "1"

BASE_KERNEL_VERSION = "2.6.25"
KERNEL_VERSION = "2.6.25.10"
KERNEL_RELEASE = "2.6.25.10"

PR = "r2"

SRC_URI =
"${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${BASE_KERNEL_VERSION}.tar.bz2
\

${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_VERSION}.bz2;patch=1
\
~           "

SRC_URI_append_at91sam9rl64ek = "
http://maxim.org.za/AT91RM9200/2.6/2.6.25-at91.patch.gz;patch=1 \
          file://defconfig \
~                               "

SRC_URI_append_at91sam9263ek = "
http://maxim.org.za/AT91RM9200/2.6/2.6.25-at91.patch.gz;patch=1 \
          file://defconfig \
~                               "

SRC_URI_append_at91sam9261ek = "
http://maxim.org.za/AT91RM9200/2.6/2.6.25-at91.patch.gz;patch=1 \
          file://defconfig \
~                               "

SRC_URI_append_at91sam9260ek = "
http://maxim.org.za/AT91RM9200/2.6/2.6.25-at91.patch.gz;patch=1 \
          file://defconfig \
~                               "

SRC_URI_append_at91cap9adk = "
http://maxim.org.za/AT91RM9200/2.6/2.6.25-at91.patch.gz;patch=1 \
          file://defconfig \
~                               "

SRC_URI_append_kb9202 = "
http://maxim.org.za/AT91RM9200/2.6/2.6.25-at91.patch.gz;patch=1 \
          file://defconfig \
~                               "

SRC_URI_append_at32stk1000 = " \
http://avr32linux.org/twiki/pub/Main/LinuxPatches/linux-2.6.25.10.atmel.2.patch.bz2;patch=1
\
          file://defconfig \
       "
SRC_URI_append_atngw100 = " \
http://avr32linux.org/twiki/pub/Main/LinuxPatches/linux-2.6.25.10.atmel.2.patch.bz2;patch=1
\
          file://defconfig \
       "

S = "${WORKDIR}/linux-${KERNEL_VERSION}"

packages/linux/linux_2.6.20.bb
=================================================================
require linux.inc

DEFAULT_PREFERENCE_at91sam9263ek = "20"
DEFAULT_PREFERENCE_at91sam9261ek = "20"
DEFAULT_PREFERENCE_at91sam9260ek = "20"

PR = "r8"

SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
~           file://defconfig"

SRC_URI_append_n2100 = "\
   file://n2100-r8169-parity.patch;patch=1 \
   file://rtc-rs5c372-n2100.patch;patch=1 \
   "

SRC_URI_append_at91sam9263ek = " \

http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;patch=1 \

http://www.at91.com/repFichier/Project-217/linux-${PV}-at91-exp.diff.bz2;patch=1
\
~                               "
SRC_URI_append_at91sam9261ek = " \

http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;patch=1 \

http://www.at91.com/repFichier/Project-217/linux-${PV}-at91-exp.diff.bz2;patch=1
\
~                               "
SRC_URI_append_at91sam9260ek = " \

http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;patch=1 \

http://www.at91.com/repFichier/Project-217/linux-${PV}-at91-exp.diff.bz2;patch=1
\
~                               "




BR
Ulf Samuelsson




