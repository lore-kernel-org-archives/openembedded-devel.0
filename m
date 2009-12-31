Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NQ9Bl-0003bm-Et
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Dec 2009 01:46:56 +0100
Received: by ywh8 with SMTP id 8so12257936ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 16:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=M8fG2AwR5iH517R3m2pMYhDvUb4Yu1Z23uyyuG43+t4=;
	b=TRrbv6jKWA2b4nMNpHvPyFdMM1YAu7UlgLBDh/PaDKFEt/VWpvXrnshLHeJu50aatc
	xqDGyWBd+R84+2IWju6YhDDg9NENScVPS0NswUOfKewZqPQ/yMU+qUb66sJV+U1UNTNv
	Lqj9rvvPWweg0S6YGMM1nvciR/HZWC3kmayCE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aZ7m6cScvRhuaqRIg9mZSQmM+yjzLJkp6u4TDmfrBbPNy8uhLavGqL33HTIVkIkjKy
	/kO8ZHPejVBZJRBNgmCGrp+RtJAYAwMZLes/v3AoFM23RyHKVQqok5J3QOdsmlt2aM4U
	WdJV+p2mt0rjiNaeZFtUzeXyY23cCAV8926hc=
Received: by 10.101.138.5 with SMTP id q5mr8618613ann.158.1262220293888;
	Wed, 30 Dec 2009 16:44:53 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 5sm5649386yxg.28.2009.12.30.16.44.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 16:44:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2009 16:44:40 -0800
Message-Id: <1262220280-415-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] binutils-2.20: Fix cross native build when using same version on build machine.
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
X-List-Received-Date: Thu, 31 Dec 2009 00:46:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch |   95 ++++++++++++++++++++
 recipes/binutils/binutils_2.20.bb                  |    3 +-
 2 files changed, 97 insertions(+), 1 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.20/binutils_unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch

diff --git a/recipes/binutils/binutils-2.20/binutils_unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch b/recipes/binutils/binutils-2.20/binutils_unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch
new file mode 100644
index 0000000..535d714
--- /dev/null
+++ b/recipes/binutils/binutils-2.20/binutils_unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch
@@ -0,0 +1,95 @@
+Description:
+
+This patch is needed in situations where build system is running same version of
+binutils that is intended to be built  cross-native ( build != host = target)
+ and has shared libraries enabled. binutils/binutils
+Makefile has some tools which are built to run on build system. Toplevel makefile
+for binutils passes HOST_EXPORTS to sub-makefiles which also include RPATH_ENVVARS
+containing LD_LIBRARY_PATH which is modified so that it also includes host libraries
+like opcodes and libbfd which are just built for the host system. 
+
+Now the problem is that same LD_LIBRARY_PATH value gets set in environment even
+for the tools that are being built for build system using CC_FOR_BUILD and the tools
+like as,ld it invokes from build machine get the LD_LIBRARY_PATH set to search
+the newly build host libraries like opcodes and bfd and if host is like a big endian
+system say (mips-linux) the build system linker and assembler do not run because
+ld.so tries to load these shared libraries instead of the ones from /usr/lib for 
+the build tools. 
+
+This patch fixes the issue by clearing LD_LIBRARY_PATH for BUILD tools
+
+This patch would be needed on other versions of binutils. I just cared about 2.20
+May be upstream is also interested in such a patch.
+
+-Khem
+
+Index: binutils-2.20/binutils/Makefile.am
+===================================================================
+--- binutils-2.20.orig/binutils/Makefile.am	2009-12-30 15:30:35.302438121 -0800
++++ binutils-2.20/binutils/Makefile.am	2009-12-30 15:33:09.154420373 -0800
+@@ -251,24 +251,24 @@ sysroff.h: sysinfo$(EXEEXT_FOR_BUILD) sy
+ 	./sysinfo$(EXEEXT_FOR_BUILD) -d <$(srcdir)/sysroff.info >sysroff.h
+ 
+ sysinfo$(EXEEXT_FOR_BUILD): sysinfo.o syslex.o
+-	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ sysinfo.o syslex.o
++	LD_LIBRARY_PATH= $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ sysinfo.o syslex.o
+ 
+ syslex.o: syslex.c sysinfo.h config.h
+ 	if [ -r syslex.c ]; then \
+-	  $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) syslex.c -Wno-error ; \
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) syslex.c -Wno-error ; \
+ 	else \
+-	  $(CC_FOR_BUILD) -c -I. -I$(srcdir) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/syslex.c -Wno-error ;\
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. -I$(srcdir) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/syslex.c -Wno-error ;\
+ 	fi
+ 
+ sysinfo.o: sysinfo.c
+ 	if [ -r sysinfo.c ]; then \
+-	  $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) sysinfo.c -Wno-error ; \
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) sysinfo.c -Wno-error ; \
+ 	else \
+-	  $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/sysinfo.c -Wno-error ; \
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/sysinfo.c -Wno-error ; \
+ 	fi
+ 
+ bin2c$(EXEEXT_FOR_BUILD):
+-	$(CC_FOR_BUILD) -o $@ $(AM_CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(srcdir)/bin2c.c $(srcdir)/version.c
++	LD_LIBRARY_PATH= $(CC_FOR_BUILD) -o $@ $(AM_CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(srcdir)/bin2c.c $(srcdir)/version.c
+ 
+ embedspu: embedspu.sh
+ 	sed "s@^program_transform_name=@program_transform_name=$(program_transform_name)@" < $< > $@
+Index: binutils-2.20/binutils/Makefile.in
+===================================================================
+--- binutils-2.20.orig/binutils/Makefile.in	2009-12-30 15:30:44.582922535 -0800
++++ binutils-2.20/binutils/Makefile.in	2009-12-30 15:33:47.322422313 -0800
+@@ -1193,24 +1193,24 @@ sysroff.h: sysinfo$(EXEEXT_FOR_BUILD) sy
+ 	./sysinfo$(EXEEXT_FOR_BUILD) -d <$(srcdir)/sysroff.info >sysroff.h
+ 
+ sysinfo$(EXEEXT_FOR_BUILD): sysinfo.o syslex.o
+-	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ sysinfo.o syslex.o
++	LD_LIBRARY_PATH= $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ sysinfo.o syslex.o
+ 
+ syslex.o: syslex.c sysinfo.h config.h
+ 	if [ -r syslex.c ]; then \
+-	  $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) syslex.c -Wno-error ; \
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) syslex.c -Wno-error ; \
+ 	else \
+-	  $(CC_FOR_BUILD) -c -I. -I$(srcdir) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/syslex.c -Wno-error ;\
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. -I$(srcdir) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/syslex.c -Wno-error ;\
+ 	fi
+ 
+ sysinfo.o: sysinfo.c
+ 	if [ -r sysinfo.c ]; then \
+-	  $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) sysinfo.c -Wno-error ; \
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) sysinfo.c -Wno-error ; \
+ 	else \
+-	  $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/sysinfo.c -Wno-error ; \
++	  LD_LIBRARY_PATH= $(CC_FOR_BUILD) -c -I. $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(srcdir)/sysinfo.c -Wno-error ; \
+ 	fi
+ 
+ bin2c$(EXEEXT_FOR_BUILD):
+-	$(CC_FOR_BUILD) -o $@ $(AM_CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(srcdir)/bin2c.c $(srcdir)/version.c
++	LD_LIBRARY_PATH= $(CC_FOR_BUILD) -o $@ $(AM_CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(srcdir)/bin2c.c $(srcdir)/version.c
+ 
+ embedspu: embedspu.sh
+ 	sed "s@^program_transform_name=@program_transform_name=$(program_transform_name)@" < $< > $@
diff --git a/recipes/binutils/binutils_2.20.bb b/recipes/binutils/binutils_2.20.bb
index 6961377..6863582 100644
--- a/recipes/binutils/binutils_2.20.bb
+++ b/recipes/binutils/binutils_2.20.bb
@@ -2,7 +2,7 @@ require binutils.inc
 LICENSE = "GPLv3"
 
 INC_PR = "r1"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI = "\
      ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
@@ -14,6 +14,7 @@ SRC_URI = "\
      file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
      file://ld-stub-crash.patch;patch=1;pnum=0 \
      file://binutils-arm-non-empty-know.patch;patch=1 \
+     file://binutils_unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch;patch=1 \
      "
 
 # powerpc patches
-- 
1.6.3.3



