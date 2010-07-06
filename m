Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OWDxR-0002Hc-JS
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 21:37:46 +0200
Received: by fxm12 with SMTP id 12so5392372fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=/C/65wzDE/g83IyutKO6s8pnyL72gGtRSiOFlidvUOU=;
	b=pGXnZ0LIYOYdmN22dGIaOzzBb6pXbHsDr2B0vJkE2DmXk9pfpSEmBnV+K8RaoioFqQ
	wcF+n5G7NrnivnB+aFGDVo5GnNu4G5fhFJbxNPziEH6eyF1mEUfdn9/ZBpMD63/nfArd
	zXV27hH4d3vgsl/77OfxeYtRto5pXRoHoBXsE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iGwCqvI8zWVhZQOE1VGmitVp/B3orFju9euAPGy7RC5zz3pf+fyLs7iS7Fr6nbkkRo
	dKVZ7Cp6a3ZxYhRMfV50QIT/D2VQJZb/go/MZVo/EL9nj1pukOQQ8kquu4u7YEo3G+Sy
	q0zolkXvO1ysZyunxeCGOtIU23DGSKuxDhO7Y=
Received: by 10.86.52.2 with SMTP id z2mr4229703fgz.72.1278444757013;
	Tue, 06 Jul 2010 12:32:37 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id w16sm12623246fao.46.2010.07.06.12.32.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 12:32:36 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWDsX-0001JD-9s; Tue, 06 Jul 2010 21:32:25 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue,  6 Jul 2010 21:32:23 +0200
Message-Id: <1278444743-4924-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v3 4/4] uclibc: add 0.9.31
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
X-List-Received-Date: Tue, 06 Jul 2010 19:37:54 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/include/sane-toolchain.inc             |    2 +-
 recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine   |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine    |   69 +++++++
 recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine |   69 +++++++
 .../uclibc/uclibc-0.9.31/armv5te/uClibc.machine    |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine  |   54 ++++++
 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine   |  192 ++++++++++++++++++++
 recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine   |   70 +++++++
 .../uclibc/uclibc-0.9.31/cm-x270/uClibc.machine    |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine |   70 +++++++
 .../uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine |   54 ++++++
 recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine  |   53 ++++++
 recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine |   69 +++++++
 .../uclibc-0.9.31/gumstix-connex/uClibc.machine    |   70 +++++++
 .../uclibc-0.9.31/gumstix-verdex/uClibc.machine    |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine |   70 +++++++
 .../uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine   |   70 +++++++
 .../uclibc/uclibc-0.9.31/kilauea/uClibc.machine    |   55 ++++++
 recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine |   63 +++++++
 .../uclibc-0.9.31/mpc8313e-rdb/uClibc.machine      |   53 ++++++
 .../uclibc-0.9.31/mpc8315e-rdb/uClibc.machine      |   53 ++++++
 .../uclibc-0.9.31/mpc8323e-rdb/uClibc.machine      |   54 ++++++
 recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine  |   53 ++++++
 .../uclibc/uclibc-0.9.31/om-gta01/uClibc.machine   |   69 +++++++
 recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine |   70 +++++++
 .../uclibc/uclibc-0.9.31/palmz31/uClibc.machine    |   70 +++++++
 .../uclibc/uclibc-0.9.31/palmz72/uClibc.machine    |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine |   70 +++++++
 .../uclibc/uclibc-0.9.31/qemumips/uClibc.machine   |   63 +++++++
 .../uclibc/uclibc-0.9.31/qemux86/uClibc.machine    |   68 +++++++
 .../uclibc/uclibc-0.9.31/sequoia/uClibc.machine    |   53 ++++++
 recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine  |   52 ++++++
 recipes/uclibc/uclibc-0.9.31/uClibc.distro         |  150 +++++++++++++++
 recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t |   69 +++++++
 .../uclibc/uclibc-0.9.31/uClibc.machine.armv5te    |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt |   70 +++++++
 .../uclibc/uclibc-0.9.31/uClibc.machine.strongarm  |   70 +++++++
 recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine   |   73 ++++++++
 recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine    |   72 ++++++++
 recipes/uclibc/uclibc-initial_0.9.31.bb            |   26 +++
 recipes/uclibc/uclibc_0.9.31.bb                    |   30 +++
 54 files changed, 3647 insertions(+), 1 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv5te/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.config
 create mode 100644 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.distro
 create mode 100644 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/cm-x270/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/gumstix-connex/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/gumstix-verdex/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/kilauea/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mpc8313e-rdb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mpc8315e-rdb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mpc8323e-rdb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/om-gta01/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/palmz31/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/palmz72/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/qemumips/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/qemux86/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/sequoia/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.config
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.distro
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv5te
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.strongarm
 create mode 100644 recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-initial_0.9.31.bb
 create mode 100644 recipes/uclibc/uclibc_0.9.31.bb

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index f7df850..9784baf 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -13,7 +13,7 @@ PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_VERSION_eglibc             ?= "2.11"
 PREFERRED_VERSION_eglibc-initial     ?= "2.11"
-PREFERRED_UCLIBC_VERSION            ?= "0.9.30.1"
+PREFERRED_UCLIBC_VERSION            ?= "0.9.31"
 
 # Some systems need a special gcc version
 PREFERRED_GCC_VERSION_486sx          ?= "4.3.2"
diff --git a/recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine
new file mode 100644
index 0000000..898b73a
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine
@@ -0,0 +1,69 @@
+#
+# Automatically generated make config: don't edit
+# Mon May 14 10:23:14 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+CONFIG_ARM920T=y
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine
new file mode 100644
index 0000000..2d9f63e
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 22:07:03 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_BIG_ENDIAN=y
+ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine
new file mode 100644
index 0000000..898b73a
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine
@@ -0,0 +1,69 @@
+#
+# Automatically generated make config: don't edit
+# Mon May 14 10:23:14 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+CONFIG_ARM920T=y
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/armv5te/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/armv5te/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/armv5te/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine
new file mode 100644
index 0000000..85f70f7
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+UCLIBC_HAS_SOFT_FLOAT=n
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine
new file mode 100644
index 0000000..85f70f7
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+UCLIBC_HAS_SOFT_FLOAT=n
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine
new file mode 100644
index 0000000..ed8b1a4
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine
@@ -0,0 +1,54 @@
+#
+# Automatically generated make config: don't edit
+# Thu May  1 16:06:57 2008
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+TARGET_avr32=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="avr32"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_AVR32_AP7=y
+LINKRELAX=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/home/stelios/proj/OE/tmp/uclibc/staging/avr32-angstrom-linux-uclibc/usr/include"
+HAVE_DOT_CONFIG=y
diff --git a/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.config b/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.config
new file mode 100644
index 0000000..e69de29
diff --git a/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.distro b/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.distro
new file mode 100644
index 0000000..e69de29
diff --git a/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine
new file mode 100644
index 0000000..33a294f
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine
@@ -0,0 +1,192 @@
+#
+# Automatically generated make config: don't edit
+# Sat Oct 20 20:22:28 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+TARGET_bfin=y
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="bfin"
+FORCE_OPTIONS_FOR_ARCH=y
+TARGET_SUBARCH=""
+# UCLIBC_FORMAT_ELF is not set
+UCLIBC_FORMAT_FDPIC_ELF=y
+# UCLIBC_FORMAT_FLAT is not set
+# UCLIBC_FORMAT_FLAT_SEP_DATA is not set
+# UCLIBC_FORMAT_SHARED_FLAT is not set
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_NO_MMU=y
+
+#
+# Target CPU lacks a memory management unit (MMU)
+#
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+# DO_C99_MATH is not set
+KERNEL_HEADERS="/usr/include"
+# UCLIBC_UCLINUX_BROKEN_MUNMAP is not set
+EXCLUDE_BRK=y
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+DOPIC=y
+# HAVE_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+HAVE_SHARED=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+LDSO_CACHE_SUPPORT=y
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+LDSO_BASE_FILENAME="ld.so"
+UCLIBC_STATIC_LDCONFIG=y
+LDSO_RUNPATH=y
+UCLIBC_CTOR_DTOR=y
+# HAS_NO_THREADS is not set
+UCLIBC_HAS_THREADS=y
+PTHREADS_DEBUG_SUPPORT=y
+LINUXTHREADS_OLD=y
+UCLIBC_HAS_LFS=y
+MALLOC=y
+# MALLOC_SIMPLE is not set
+# MALLOC_STANDARD is not set
+# MALLOC_GLIBC_COMPAT is not set
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+# UCLIBC_SUSV3_LEGACY is not set
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_HAS_SHADOW=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS___PROGNAME=y
+UNIX98PTY_ONLY=y
+ASSUME_DEVPTS=y
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Networking Support
+#
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_USE_NETLINK is not set
+
+#
+# String and Stdio Support
+#
+UCLIBC_HAS_STRING_GENERIC_OPT=y
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+UCLIBC_HAS_CTYPE_UNSAFE=y
+# UCLIBC_HAS_CTYPE_CHECKED is not set
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_PRINTF is not set
+# USE_OLD_VFPRINTF is not set
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not set
+# UCLIBC_HAS_PRINTF_M_SPEC is not set
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+UCLIBC_HAS_FNMATCH_OLD=y
+# UCLIBC_HAS_WORDEXP is not set
+# UCLIBC_HAS_FTW is not set
+UCLIBC_HAS_GLOB=y
+# UCLIBC_HAS_GNU_GLOB is not set
+
+#
+# Library Installation Options
+#
+SHARED_LIB_LOADER_PREFIX="$(RUNTIME_PREFIX)lib"
+RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
+DEVEL_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/usr/"
+MULTILIB=""
+
+#
+# Security options
+#
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+UCLIBC_BUILD_RELRO=y
+# UCLIBC_BUILD_NOW is not set
+UCLIBC_BUILD_NOEXECSTACK=y
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=y
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
diff --git a/recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/cm-x270/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/cm-x270/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/cm-x270/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine
new file mode 100644
index 0000000..6e89444
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:29:51 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_ARM_OABI=y
+# CONFIG_ARM_EABI is not set
+# USE_BX is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+CONFIG_ARM_SA1100=y
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine
new file mode 100644
index 0000000..2a38cfd
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine
@@ -0,0 +1,54 @@
+#
+# Automatically generated make config: don't edit
+# Sun May  4 23:50:48 2008
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/home/stelios/proj/OE/tmp/uclibc/staging/powerpc-angstrom-linux-uclibc/usr/include"
+HAVE_DOT_CONFIG=y
diff --git a/recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine
new file mode 100644
index 0000000..e059257
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine
@@ -0,0 +1,53 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:25:50 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/powerpc-angstrom-linux-uclibc/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine
new file mode 100644
index 0000000..898b73a
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine
@@ -0,0 +1,69 @@
+#
+# Automatically generated make config: don't edit
+# Mon May 14 10:23:14 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+CONFIG_ARM920T=y
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/gumstix-connex/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/gumstix-connex/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/gumstix-connex/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/gumstix-verdex/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/gumstix-verdex/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/gumstix-verdex/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine
new file mode 100644
index 0000000..6e89444
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:29:51 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_ARM_OABI=y
+# CONFIG_ARM_EABI is not set
+# USE_BX is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+CONFIG_ARM_SA1100=y
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine
new file mode 100644
index 0000000..6e89444
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:29:51 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_ARM_OABI=y
+# CONFIG_ARM_EABI is not set
+# USE_BX is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+CONFIG_ARM_SA1100=y
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine
new file mode 100644
index 0000000..2d9f63e
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 22:07:03 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_BIG_ENDIAN=y
+ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/kilauea/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/kilauea/uClibc.machine
new file mode 100644
index 0000000..effef11
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/kilauea/uClibc.machine
@@ -0,0 +1,55 @@
+#
+# Automatically generated make config: don't edit
+# Sun May  4 23:50:48 2008
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/home/stelios/proj/OE/tmp/uclibc/staging/powerpc-angstrom-linux-uclibc/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine
new file mode 100644
index 0000000..07c45f7
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine
@@ -0,0 +1,63 @@
+#
+# Automatically generated make config: don't edit
+# Wed Jul  9 13:37:36 2008
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+TARGET_mips=y
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="mips"
+FORCE_OPTIONS_FOR_ARCH=y
+ARCH_CFLAGS="-mno-split-addresses"
+CONFIG_MIPS_O32_ABI=y
+# CONFIG_MIPS_N32_ABI is not set
+# CONFIG_MIPS_N64_ABI is not set
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+CONFIG_MIPS_ISA_MIPS32=y
+# CONFIG_MIPS_ISA_MIPS64 is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+# ARCH_BIG_ENDIAN is not set
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="/home/kraj/work/cross/mips-none-linux-uclibc/sysroot/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/mpc8313e-rdb/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/mpc8313e-rdb/uClibc.machine
new file mode 100644
index 0000000..3ad8ff0
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/mpc8313e-rdb/uClibc.machine
@@ -0,0 +1,53 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:25:50 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="will be mangled in bitbake"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/mpc8315e-rdb/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/mpc8315e-rdb/uClibc.machine
new file mode 100644
index 0000000..3ad8ff0
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/mpc8315e-rdb/uClibc.machine
@@ -0,0 +1,53 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:25:50 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="will be mangled in bitbake"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/mpc8323e-rdb/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/mpc8323e-rdb/uClibc.machine
new file mode 100644
index 0000000..6206769
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/mpc8323e-rdb/uClibc.machine
@@ -0,0 +1,54 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:25:50 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="to be mangled by uclibc bitbake"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine
new file mode 100644
index 0000000..23ca904
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine
@@ -0,0 +1,53 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:25:50 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/stuff/build/tmp/cross/powerpc-angstrom-linux-uclibc/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/om-gta01/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/om-gta01/uClibc.machine
new file mode 100644
index 0000000..898b73a
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/om-gta01/uClibc.machine
@@ -0,0 +1,69 @@
+#
+# Automatically generated make config: don't edit
+# Mon May 14 10:23:14 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+CONFIG_ARM920T=y
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/palmz31/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/palmz31/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/palmz31/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/palmz72/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/palmz72/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/palmz72/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/qemumips/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/qemumips/uClibc.machine
new file mode 100644
index 0000000..1cf1add
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/qemumips/uClibc.machine
@@ -0,0 +1,63 @@
+#
+# Automatically generated make config: don't edit
+# Wed Jul  9 13:37:36 2008
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+TARGET_mips=y
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="mips"
+FORCE_OPTIONS_FOR_ARCH=y
+ARCH_CFLAGS="-mno-split-addresses"
+CONFIG_MIPS_O32_ABI=y
+# CONFIG_MIPS_N32_ABI is not set
+# CONFIG_MIPS_N64_ABI is not set
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+CONFIG_MIPS_ISA_MIPS32=y
+# CONFIG_MIPS_ISA_MIPS64 is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+# ARCH_BIG_ENDIAN is not set
+ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/qemux86/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/qemux86/uClibc.machine
new file mode 100644
index 0000000..44fec16
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/qemux86/uClibc.machine
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Fri Nov 23 15:49:33 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+TARGET_i386=y
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="i386"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_GENERIC_386=y
+# CONFIG_386 is not set
+# CONFIG_486 is not set
+# CONFIG_586 is not set
+# CONFIG_586MMX is not set
+# CONFIG_686 is not set
+# CONFIG_PENTIUMII is not set
+# CONFIG_PENTIUMIII is not set
+# CONFIG_PENTIUM4 is not set
+# CONFIG_K6 is not set
+# CONFIG_K7 is not set
+# CONFIG_ELAN is not set
+# CONFIG_CRUSOE is not set
+# CONFIG_WINCHIPC6 is not set
+# CONFIG_WINCHIP2 is not set
+# CONFIG_CYRIXIII is not set
+# CONFIG_NEHEMIAH is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/sequoia/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/sequoia/uClibc.machine
new file mode 100644
index 0000000..e059257
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/sequoia/uClibc.machine
@@ -0,0 +1,53 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:25:50 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_CLASSIC=y
+# CONFIG_E500 is not set
+TARGET_SUBARCH="classic"
+
+#
+# Using ELF file format
+#
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/powerpc-angstrom-linux-uclibc/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine
new file mode 100644
index 0000000..6e89444
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:29:51 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_ARM_OABI=y
+# CONFIG_ARM_EABI is not set
+# USE_BX is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+CONFIG_ARM_SA1100=y
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine
new file mode 100644
index 0000000..75c5328
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine
@@ -0,0 +1,52 @@
+#
+# Automatically generated make config: don't edit
+# Wed May 16 12:03:09 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+TARGET_sh=y
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="sh"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_SH2A is not set
+# CONFIG_SH2 is not set
+# CONFIG_SH3 is not set
+CONFIG_SH4=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
diff --git a/recipes/uclibc/uclibc-0.9.31/uClibc.config b/recipes/uclibc/uclibc-0.9.31/uClibc.config
new file mode 100644
index 0000000..e69de29
diff --git a/recipes/uclibc/uclibc-0.9.31/uClibc.distro b/recipes/uclibc/uclibc-0.9.31/uClibc.distro
new file mode 100644
index 0000000..1f4666c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/uClibc.distro
@@ -0,0 +1,150 @@
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+# DOPIC is not set
+# HAVE_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+HAVE_SHARED=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+LDSO_CACHE_SUPPORT=y
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+LDSO_BASE_FILENAME="ld.so"
+# UCLIBC_STATIC_LDCONFIG is not set
+LDSO_RUNPATH=y
+UCLIBC_CTOR_DTOR=y
+LDSO_GNU_HASH_SUPPORT=y
+# HAS_NO_THREADS is not set
+UCLIBC_HAS_THREADS=y
+PTHREADS_DEBUG_SUPPORT=y
+LINUXTHREADS_OLD=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
+COMPAT_ATEXIT=y
+UCLIBC_SUSV3_LEGACY=y
+UCLIBC_SUSV3_LEGACY_MACROS=y
+UCLIBC_SUSV4_LEGACY=y
+UCLIBC_HAS_SHADOW=y
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
+UNIX98PTY_ONLY=y
+UCLIBC_HAS_GETPT=y
+UCLIBC_HAS_LIBUTIL=y
+ASSUME_DEVPTS=y
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Networking Support
+#
+UCLIBC_HAS_IPV6=y
+UCLIBC_HAS_RPC=y
+UCLIBC_HAS_FULL_RPC=y
+# UCLIBC_HAS_REENTRANT_RPC is not set
+# UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+
+#
+# String and Stdio Support
+#
+UCLIBC_HAS_STRING_GENERIC_OPT=y
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+UCLIBC_HAS_WCHAR=y
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+UCLIBC_HAS_STDIO_BUFSIZ_256=y
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_4096 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+# UCLIBC_HAS_STDIO_GETC_MACRO is not set
+# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+# UCLIBC_HAS_REGEX_OLD is not set
+UCLIBC_HAS_FNMATCH=y
+# UCLIBC_HAS_FNMATCH_OLD is not set
+UCLIBC_HAS_WORDEXP=y
+UCLIBC_HAS_FTW=y
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
+
+#
+# Library Installation Options
+#
+SHARED_LIB_LOADER_PREFIX="/lib"
+RUNTIME_PREFIX="/"
+DEVEL_PREFIX="//usr"
+
+#
+# Security options
+#
+# UCLIBC_BUILD_PIE is not set
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+UCLIBC_BUILD_RELRO=y
+UCLIBC_BUILD_NOW=y
+UCLIBC_BUILD_NOEXECSTACK=y
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=n
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
+
+# math stuff for perl
+DO_C99_MATH=y
diff --git a/recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t
new file mode 100644
index 0000000..898b73a
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t
@@ -0,0 +1,69 @@
+#
+# Automatically generated make config: don't edit
+# Mon May 14 10:23:14 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+CONFIG_ARM920T=y
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv5te b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv5te
new file mode 100644
index 0000000..ec0385b
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv5te
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:16:02 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt
new file mode 100644
index 0000000..e27931c
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat May 12 23:18:41 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_ARM_OABI is not set
+CONFIG_ARM_EABI=y
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+CONFIG_ARM_IWMMXT=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/uClibc.machine.strongarm b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.strongarm
new file mode 100644
index 0000000..6e89444
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/uClibc.machine.strongarm
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sun May 13 11:29:51 2007
+#
+# TARGET_alpha is not set
+TARGET_arm=y
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="arm"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_ARM_OABI=y
+# CONFIG_ARM_EABI is not set
+# USE_BX is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_SA110 is not set
+CONFIG_ARM_SA1100=y
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_ANY_ENDIAN=y
+ARCH_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine
new file mode 100644
index 0000000..3dcf4b1
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine
@@ -0,0 +1,73 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.30
+# Mon Mar 16 21:38:28 2009
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+TARGET_i386=y
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="i386"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_GENERIC_386 is not set
+# CONFIG_386 is not set
+CONFIG_486=y
+# CONFIG_586 is not set
+# CONFIG_586MMX is not set
+# CONFIG_686 is not set
+# CONFIG_PENTIUMII is not set
+# CONFIG_PENTIUMIII is not set
+# CONFIG_PENTIUM4 is not set
+# CONFIG_K6 is not set
+# CONFIG_K7 is not set
+# CONFIG_ELAN is not set
+# CONFIG_CRUSOE is not set
+# CONFIG_WINCHIPC6 is not set
+# CONFIG_WINCHIP2 is not set
+# CONFIG_CYRIXIII is not set
+# CONFIG_NEHEMIAH is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+UCLIBC_HAS_FENV=y
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine b/recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine
new file mode 100644
index 0000000..6cd19e8
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine
@@ -0,0 +1,72 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.30.1
+# Wed Jul  1 17:04:32 2009
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+TARGET_i386=y
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="i386"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_GENERIC_386=y
+# CONFIG_386 is not set
+# CONFIG_486 is not set
+# CONFIG_586 is not set
+# CONFIG_586MMX is not set
+# CONFIG_686 is not set
+# CONFIG_PENTIUMII is not set
+# CONFIG_PENTIUMIII is not set
+# CONFIG_PENTIUM4 is not set
+# CONFIG_K6 is not set
+# CONFIG_K7 is not set
+# CONFIG_ELAN is not set
+# CONFIG_CRUSOE is not set
+# CONFIG_WINCHIPC6 is not set
+# CONFIG_WINCHIP2 is not set
+# CONFIG_CYRIXIII is not set
+# CONFIG_NEHEMIAH is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+# UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+KERNEL_HEADERS="/bla"
+HAVE_DOT_CONFIG=y
diff --git a/recipes/uclibc/uclibc-initial_0.9.31.bb b/recipes/uclibc/uclibc-initial_0.9.31.bb
new file mode 100644
index 0000000..a9fa146
--- /dev/null
+++ b/recipes/uclibc/uclibc-initial_0.9.31.bb
@@ -0,0 +1,26 @@
+SECTION = "base"
+require uclibc_${PV}.bb
+
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
+PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
+PACKAGES = ""
+
+do_install() {
+	# Install initial headers into the cross dir
+	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+		install_headers
+	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
+
+	# This conflicts with the c++ version of this header
+	rm -f ${D}${includedir}/bits/atomicity.h
+	install -d ${D}${libdir}/
+	install -m 644 lib/crt[1in].o ${D}${libdir}/
+	install -m 644 lib/libc.so ${D}${libdir}/
+}
+
+do_compile () {
+	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o lib/libc.so
+}
diff --git a/recipes/uclibc/uclibc_0.9.31.bb b/recipes/uclibc/uclibc_0.9.31.bb
new file mode 100644
index 0000000..751b74b
--- /dev/null
+++ b/recipes/uclibc/uclibc_0.9.31.bb
@@ -0,0 +1,30 @@
+# UCLIBC_BASE should be the latest released revision of uclibc (that way
+# the config files will typically be correct!)  uclibc-cvs takes precedence
+# over uclibc-${UCLIBC_BASE}, if a config file in uclibc-cvs is out of date
+# try removing it
+#
+# UCLIBC_BASE can be set in a distro file, but whether this works depends
+# on whether the base patches apply to the selected (SRCDATE) svn release.
+#
+UCLIBC_BASE ?= "0.9.31"
+
+require uclibc.inc
+PR = "${INC_PR}.0"
+
+PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+
+SRC_URI += "file://uClibc.machine file://uClibc.distro \
+	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
+	   "
+
+#recent versions uclibc require real kernel headers
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+#as stated above, uclibc needs real kernel-headers
+#however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
+KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
+
+S = "${WORKDIR}/uClibc-${UCLIBC_BASE}"
+
+SRC_URI[uClibc-0.9.31.md5sum] = "52fb8a494758630c8d3ddd7f1e0daafd"
+SRC_URI[uClibc-0.9.31.sha256sum] = "80d33549d2a5d7ddc95b10dd964fead34d568c47268bba057c4b816f1d1263fa"
-- 
1.7.1



