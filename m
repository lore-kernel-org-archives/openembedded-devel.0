Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PuLcJ-0002s2-IA
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 10:11:39 +0100
Received: by fxm8 with SMTP id 8so4388718fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=uxsxzxDVEJLvLv4Prp0vR+D7jKTiYumqBebY9ZbAl5U=;
	b=i5PVmNmO8/w7VSpXFme7aoGSEBJk9DPXJOco86zfdUalpVSUIL8oiLGvdG/00VpNqw
	lY/hdt6bMiQMY9ejTWLYr5XtuPPsLco4U5QE/BABYIH0lMdD4dMgf9Bg52Lvh7dyGfaP
	HkyWBroiO9ByPZoPNwDAxbrVYwvqOMIThME1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZmfwS8RtP+A3Bpxp65aPaY3sqo6uZqiUFup8xKZL3cI4ChKJ3xZVMajXK++UA5enai
	rkagTHu/xQkWemk+ULWZ8dSxPx5MMKWKtmX+9djaCLUi9nP64SgodcPAisj6YaZMB3N9
	hj7oNBcGhnH3eiWWScpzQ5KeLp6F4d+3I0P1M=
Received: by 10.223.72.10 with SMTP id k10mr3984796faj.31.1298970612822;
	Tue, 01 Mar 2011 01:10:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 11sm1999372faw.20.2011.03.01.01.10.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 01:10:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 10:10:09 +0100
Message-Id: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 09:11:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/sane-toolchain-eglibc.inc      |   12 ++++++------
 conf/distro/include/sane-toolchain-glibc.inc       |   10 +++++-----
 conf/distro/include/sane-toolchain-uclibc.inc      |    6 +++---
 .../include/sane-toolchain-uclinux-uclibc.inc      |    2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index daab0f8..e22976f 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -3,20 +3,20 @@
 # eglibc:
 # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
-FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
-FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g"
+FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -g"
+FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g"
 
 # gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -Os
-FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g"
 
 # JaMa: I promise to report bug upstream, but as it can take a while to fix it, I'll switch to -O2 here
 # Tested with gcc-4.4.2 and gcc-4.4.3 on armv4t and armv5te and it fails with -Os, with gcc-4.3.3 it works OK with -Os
 # Here is testcase, but you have to rebuild whole libqtxml to test it
 # http://lists.shr-project.org/pipermail/shr-devel/2010-February/002169.html
-FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g"
 # This I've seen only on armv4t, it segfaults when called from pisi, but whole test unit suite can pass
-FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g"
 
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_sparc = "-O2"
diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
index 770aa87..09b88b6 100644
--- a/conf/distro/include/sane-toolchain-glibc.inc
+++ b/conf/distro/include/sane-toolchain-glibc.inc
@@ -7,14 +7,14 @@
 # perl has some problems, see http://bugs.openembedded.net/show_bug.cgi?id=1616
 # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -g"
 
-FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
-FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2"
-FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -g"
+FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2 -g"
+FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g"
 
 # gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -Os
-FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g"
 
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index b61ee36..acb843c 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -23,12 +23,12 @@ PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g"
 BUILD_OPTIMIZATION += "-pipe"
 
 # -Os compiled root file system does not boot for powerpc, root cause it still at large
 # we use -O2 meanwhile
-FULL_OPTIMIZATION_powerpc = "-O2 -pipe"
+FULL_OPTIMIZATION_powerpc = "-O2 -pipe -g"
 
 #Gcc will die with 'internal consistency error when using the above optimizations
 #with gcc-4.2.1-atmel.1.0.3 (and probably most other avr32 gcc ports).
@@ -38,7 +38,7 @@ FULL_OPTIMIZATION_powerpc = "-O2 -pipe"
 #it was removed while debugging an issue that ultimately turned out to be due
 #to the ICE fixed by gcc-pr32889.patch.  It needs to be tested again. 
 #Note that this testing was done without the gcc-pr32889.patch.
-FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
+FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer -g"
 
 TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
index a1e7df0..9490084 100644
--- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
@@ -9,7 +9,7 @@ USE_NLS_gcc-cross = "no"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g"
 BUILD_OPTIMIZATION = "-Os"
 
 #Gcc will die with 'internal consistency error when using the above optimizations
-- 
1.7.4.1



