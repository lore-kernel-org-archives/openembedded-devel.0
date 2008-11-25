Received: from [82.182.55.65] (helo=pcjr2.rosbacke.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mikael@rosbacke.org>) id 1L50FX-0004On-Gc
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Nov 2008 16:54:51 +0100
Received: from [192.168.0.195] by pcjr2.rosbacke.org with esmtp (Exim 4.63)
	(envelope-from <mikael@rosbacke.org>) id 1L50Cf-0005AR-49
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Nov 2008 16:51:53 +0100
From: Mikael Rosbacke <mikael@rosbacke.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Nov 2008 16:46:53 +0100
Message-Id: <1227628013.10122.37.camel@akaza1>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
X-SA-Exim-Connect-IP: 192.168.0.195
X-SA-Exim-Mail-From: mikael@rosbacke.org
X-SA-Exim-Scanned: No (on pcjr2.rosbacke.org); SAEximRunCond expanded to false
Subject: uclibc support for x86
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
X-List-Received-Date: Tue, 25 Nov 2008 15:54:51 -0000
X-Groupsio-MsgNum: 6729
Content-Type: multipart/mixed; boundary="=-7NmGZnIdJUQbRCGBX/5l"

--=-7NmGZnIdJUQbRCGBX/5l
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello!

Seems I'm the only one crazy enough to try to run a uClibc based
distribution on x86. (I can see the response, What's the point?)

Anyway, it turns out uClibc is currently lacking support for x86. 
I've added the folder openembedded/packages/uclibc/uclibc-0.9.30/x86
and created the file uClibc.machine in this folder. (See attachment)

Is there some way to get this into the git tree? Should I file a bug
report or could some maintainer give feedback on things to fix before
inclusion? I've tried to keep the config file in style with similar
config files for other machines. 

Thanks in advance,


--- Mikael Rosbacke

--=-7NmGZnIdJUQbRCGBX/5l
Content-Disposition: attachment; filename="uClibc.machine"
Content-Type: text/plain; name="uClibc.machine"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#
# Automatically generated make config: don't edit
# Version: 0.9.30
# Tue Nov 25 12:58:02 2008
#
# TARGET_alpha is not set
# TARGET_arm is not set
# TARGET_avr32 is not set
# TARGET_bfin is not set
# TARGET_cris is not set
# TARGET_e1 is not set
# TARGET_frv is not set
# TARGET_h8300 is not set
# TARGET_hppa is not set
TARGET_i386=y
# TARGET_i960 is not set
# TARGET_ia64 is not set
# TARGET_m68k is not set
# TARGET_microblaze is not set
# TARGET_mips is not set
# TARGET_nios is not set
# TARGET_nios2 is not set
# TARGET_powerpc is not set
# TARGET_sh is not set
# TARGET_sh64 is not set
# TARGET_sparc is not set
# TARGET_v850 is not set
# TARGET_vax is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="i386"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_GENERIC_386=y
# CONFIG_386 is not set
# CONFIG_486 is not set
# CONFIG_586 is not set
# CONFIG_586MMX is not set
# CONFIG_686 is not set
# CONFIG_PENTIUMII is not set
# CONFIG_PENTIUMIII is not set
# CONFIG_PENTIUM4 is not set
# CONFIG_K6 is not set
# CONFIG_K7 is not set
# CONFIG_ELAN is not set
# CONFIG_CRUSOE is not set
# CONFIG_WINCHIPC6 is not set
# CONFIG_WINCHIP2 is not set
# CONFIG_CYRIXIII is not set
# CONFIG_NEHEMIAH is not set
TARGET_SUBARCH=""

#
# Using ELF file format
#
ARCH_LITTLE_ENDIAN=y

#
# Using Little Endian
#
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
# DO_C99_MATH is not set
# UCLIBC_HAS_FENV is not set
KERNEL_HEADERS="/usr/include"
HAVE_DOT_CONFIG=y

--=-7NmGZnIdJUQbRCGBX/5l--
