Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PusBW-0002iN-KV
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 20:58:12 +0100
Received: by fxm8 with SMTP id 8so377580fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 11:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=WnguIJJN/B/7zsFWmjhBsBON2GYazjwGCYenBHhiy1g=;
	b=F1RofdDM2rmiZLxBvB+iSruORZh4WcXnqNAVVxa2YG3D4hzVgn9n0DGN5mzCRAGaoP
	aL/epG5yS2uEiUimnU25nMIKFzyU/tv1Fsbt6CJdVDfFGhpyXI0jRjRe8AGEoAAts6r8
	PFmJihg4BE/4Eo6iWf9g43NVa2/oacYXknNy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RMpOFYq1D7AJblS2loybr6pT+l04zpX2B6oC4BaQj7y2gNjsw3nSGvikVTOr4ud3QX
	gT7Dk69OOd8cnDVxTppTq5rOLyujmLcsT5birK8xgtYUkVwrwwFGRZ9sWcBi1mnesthz
	K9mRlB8E4xvBXTreinGP7fRWk4kxQQ+lTj3SU=
Received: by 10.223.83.203 with SMTP id g11mr322094fal.137.1299095761335;
	Wed, 02 Mar 2011 11:56:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y3sm189191fai.38.2011.03.02.11.55.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 11:55:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 20:55:53 +0100
Message-Id: <1299095753-324-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] sane-toolchain-*: define DEBUG_FLAGS and add it to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Wed, 02 Mar 2011 19:58:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/bitbake.conf                                  |    5 +++--
 conf/distro/include/sane-toolchain-eglibc.inc      |   12 ++++++------
 conf/distro/include/sane-toolchain-glibc.inc       |   10 +++++-----
 conf/distro/include/sane-toolchain-uclibc.inc      |    6 +++---
 .../include/sane-toolchain-uclinux-uclibc.inc      |    2 +-
 5 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 0c11cdb..f23dd05 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -543,10 +543,11 @@ EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
 # Optimization flags.
 ##################################################################
 
+DEBUG_FLAGS = "-g"
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
-DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
+DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}"
 SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) == '1'], d, 1)}"
-BUILD_OPTIMIZATION = "-O2 -g"
+BUILD_OPTIMIZATION = "-O2 ${DEBUG_FLAGS}"
 
 ##################################################################
 # Bootstrap stuff.
diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index daab0f8..d38ca5d 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -3,20 +3,20 @@
 # eglibc:
 # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
-FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
-FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os ${DEBUG_FLAGS}"
+FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 ${DEBUG_FLAGS}"
+FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
 
 # gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -Os
-FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
 
 # JaMa: I promise to report bug upstream, but as it can take a while to fix it, I'll switch to -O2 here
 # Tested with gcc-4.4.2 and gcc-4.4.3 on armv4t and armv5te and it fails with -Os, with gcc-4.3.3 it works OK with -Os
 # Here is testcase, but you have to rebuild whole libqtxml to test it
 # http://lists.shr-project.org/pipermail/shr-devel/2010-February/002169.html
-FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
 # This I've seen only on armv4t, it segfaults when called from pisi, but whole test unit suite can pass
-FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
 
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_sparc = "-O2"
diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
index 770aa87..29c201b 100644
--- a/conf/distro/include/sane-toolchain-glibc.inc
+++ b/conf/distro/include/sane-toolchain-glibc.inc
@@ -7,14 +7,14 @@
 # perl has some problems, see http://bugs.openembedded.net/show_bug.cgi?id=1616
 # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 ${DEBUG_FLAGS}"
 
-FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
-FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2"
-FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 ${DEBUG_FLAGS}"
+FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2 ${DEBUG_FLAGS}"
+FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
 
 # gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -Os
-FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
 
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index b61ee36..b51cdaf 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -23,12 +23,12 @@ PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe ${DEBUG_FLAGS}"
 BUILD_OPTIMIZATION += "-pipe"
 
 # -Os compiled root file system does not boot for powerpc, root cause it still at large
 # we use -O2 meanwhile
-FULL_OPTIMIZATION_powerpc = "-O2 -pipe"
+FULL_OPTIMIZATION_powerpc = "-O2 -pipe ${DEBUG_FLAGS}"
 
 #Gcc will die with 'internal consistency error when using the above optimizations
 #with gcc-4.2.1-atmel.1.0.3 (and probably most other avr32 gcc ports).
@@ -38,7 +38,7 @@ FULL_OPTIMIZATION_powerpc = "-O2 -pipe"
 #it was removed while debugging an issue that ultimately turned out to be due
 #to the ICE fixed by gcc-pr32889.patch.  It needs to be tested again. 
 #Note that this testing was done without the gcc-pr32889.patch.
-FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
+FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer ${DEBUG_FLAGS}"
 
 TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
index a1e7df0..8ebaf15 100644
--- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
@@ -9,7 +9,7 @@ USE_NLS_gcc-cross = "no"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe ${DEBUG_FLAGS}"
 BUILD_OPTIMIZATION = "-Os"
 
 #Gcc will die with 'internal consistency error when using the above optimizations
-- 
1.7.4.1



