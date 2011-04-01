Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5mSS-00033V-4z
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 00:04:44 +0200
Received: by iye7 with SMTP id 7so4322131iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 15:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=h1y4CIsmtXFG8tIe3gQG69QOg2eGlxXzwOsI/JVA79A=;
	b=jMjsbAg8Vwc7SfnV1+mV0zYLgmILAOJm/SRRv96GRxRdAbPU1cjX5mWLg8Rv3ao6iN
	ve/KMTSBNC3K9l1t55rf4rMVvX9aIjgKB/4YueTcR6H+oMhfpSrqEbZp4kS44dbWkBdk
	VFDW0N2lpDNIomnoxX7bhc88kd5uCa3414boQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IfJHxsDrDyd09gyf8u2p298h8gwLGoB6NSTB7g7TrCnYVFeZmyXES+oMf6xvaS8/SD
	8fqoBDDNS/qQjEP481rzoTrvt9WqHYQkhhgesiUJWW1eEWv4c9rMk/OBwJBH9RZWuzzR
	GZPhWcjbGWT5z/AKYdEkVLFwR1c5RvW8jv0Rw=
Received: by 10.43.66.14 with SMTP id xo14mr298091icb.220.1301695361754;
	Fri, 01 Apr 2011 15:02:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm1710626iba.55.2011.04.01.15.02.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 15:02:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 15:02:31 -0700
Message-Id: <cover.1301695158.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH 0/7] Uclibc update for meta-oe
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
X-List-Received-Date: Fri, 01 Apr 2011 22:04:44 -0000

This brings in uclibc-git from oe with new set of patches needed to compile 
lot more software using uclibc into meta-oe

Pull URL: git://git.openembedded.org/meta-openembedded-contrib
  Branch: kraj/uclibc-meta-oe
  Browse: http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=kraj/uclibc-meta-oe

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (7):
  uclibc: Add uclibc 0.9.32(to be)
  siteinfo.bbclass: Use linux-uclibceabi instead of uclibcgnueabi
  openssl-0.9.8m, binutils-2.20.1: Use linux-uclibceabi instead of
    uclibcgnueabi
  proxy-libintl: Bring in recipes from OE
  dbus.inc: Add missing dependency on libxdmcp
  gcc-runtime_4.5.bb: Remove construct to filter
    -feliminate-dwarf2-dups
  libgpg-error_1.8.bb: Inherit gettext

 meta-oe/classes/siteinfo.bbclass                   |    4 +-
 .../openssl/openssl-0.9.8m/configure-targets.patch |    4 +-
 meta-oe/recipes-core/dbus/dbus.inc                 |    2 +-
 .../create-as-shared-lib.patch                     |   31 +
 .../proxy-libintl-20080418/soname.patch            |   23 +
 .../proxy-libintl-20080418/stub-only.patch         |   72 +
 .../proxy-libintl/proxy-libintl_20080418.bb        |   39 +
 meta-oe/recipes-core/uclibc/site_config/funcs      |  474 ++
 meta-oe/recipes-core/uclibc/site_config/headers    |  156 +
 meta-oe/recipes-core/uclibc/site_config/types      |   21 +
 meta-oe/recipes-core/uclibc/uClibc.distro          |  157 +
 meta-oe/recipes-core/uclibc/uclibc-config.inc      |  116 +
 .../uclibc/uclibc-git/argp-headers.patch           |  581 +++
 .../uclibc/uclibc-git/argp-support.patch           | 5189 ++++++++++++++++++++
 .../uclibc/uclibc-git/arm/uClibc.machine           |   69 +
 .../uclibc/uclibc-git/armeb/uClibc.machine         |   53 +
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |   76 +
 .../uclibc/uclibc-git/detect-bx-availibility.patch |   75 +
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 +
 .../uclibc/uclibc-git/fts-support.patch            | 1375 ++++++
 .../uclibc/uclibc-git/i386/uClibc.machine          |   59 +
 .../uclibc/uclibc-git/i486/uClibc.machine          |   62 +
 .../uclibc/uclibc-git/i586/uClibc.machine          |   62 +
 .../uclibc/uclibc-git/i686/uClibc.machine          |   59 +
 .../uclibc/uclibc-git/include-arm-asm.h.patch      |   65 +
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   21 +
 .../uclibc/uclibc-git/mips64/uClibc.machine        |   63 +
 .../uclibc/uclibc-git/mipsel/uClibc.machine        |   63 +
 .../uclibc/uclibc-git/nslu2be/uClibc.machine       |   73 +
 .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 +
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |  107 +
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   76 +
 .../uclibc/uclibc-git/qemumips/uClibc.machine      |   63 +
 .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 +
 .../uclibc-git/remove-eabi-oabi-selection.patch    |   91 +
 .../uclibc-git/remove-sub-arch-variants.patch      |  215 +
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  186 +
 .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 +
 .../uclibc/uclibc-git/select-force-thumb.patch     |  172 +
 .../uclibc/uclibc-git/sh4/uClibc.machine           |   48 +
 .../uclibc-git/transform-eabi-oabi-choice.patch    |   71 +
 .../recipes-core/uclibc/uclibc-git/uClibc.distro   |  157 +
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   13 +
 .../uclibc-git/uclibc_enable_log2_test.patch       |   30 +
 .../uclibc/uclibc-git/x86_64/uClibc.machine        |   42 +
 meta-oe/recipes-core/uclibc/uclibc-initial_git.bb  |   33 +
 meta-oe/recipes-core/uclibc/uclibc.inc             |  212 +
 meta-oe/recipes-core/uclibc/uclibc_git.bb          |   44 +
 .../binutils-2.20.1/110-arm-eabi-conf.patch        |    4 +-
 meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb    |    5 -
 .../libgpg-error/libgpg-error_1.8.bb               |    2 +-
 51 files changed, 10824 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/create-as-shared-lib.patch
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/soname.patch
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/stub-only.patch
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20080418.bb
 create mode 100644 meta-oe/recipes-core/uclibc/site_config/funcs
 create mode 100644 meta-oe/recipes-core/uclibc/site_config/headers
 create mode 100644 meta-oe/recipes-core/uclibc/site_config/types
 create mode 100644 meta-oe/recipes-core/uclibc/uClibc.distro
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-config.inc
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/argp-headers.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/argp-support.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/fts-support.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uClibc.config
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uClibc.distro
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-initial_git.bb
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc.inc
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc_git.bb

-- 
1.7.4.1



