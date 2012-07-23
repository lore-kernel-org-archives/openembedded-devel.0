Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St6Hf-00063C-LR
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 02:14:00 +0200
Received: by pbbrq2 with SMTP id rq2so8723342pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SMq4XuMHHqzuzkhqyQAGJRoIgrFZvR3yBv5lEzZrJ3U=;
	b=GszRKy+M0MtH/vqihcRrvmVfINRbAgkQ1eM0fejgL7xMX7sf4ZvW69A4p8t73SZE5T
	Vd1Fe/qiCKD3EKvbv9jh3QvYeuMwPLdF0OrucBVrGJKfKrRiymGwlMkE2f4hwEZaW5Cf
	BpU8s+TLMGZXKgAwRAOBV4UngzzMbKSHxWhHS9Wg6Ek+rxMXm5gWSZpzsnDpaP0GFoME
	MguKnSJmTEZgJKjYs6JOg+GR3SpaMnMX/xjT/eLoHWG8exjbB340UXmy364YIVKYhHFV
	LB+Xes0q2wOnI10qfXs5l6yL/wg2mEvxzEXlH0dPF1++3PIyg1fPYb96s/jYy3Zz3mRl
	7eqw==
Received: by 10.68.194.234 with SMTP id hz10mr31145974pbc.126.1343001752811;
	Sun, 22 Jul 2012 17:02:32 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ot4sm8713462pbb.65.2012.07.22.17.02.31
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 17:02:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Jul 2012 17:02:32 -0700
Message-Id: <1343001752-19708-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343001752-19708-1-git-send-email-raj.khem@gmail.com>
References: <1343001752-19708-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 2/2] openjdk-6: Fix cross compilation for e5500 machines
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
X-List-Received-Date: Mon, 23 Jul 2012 00:14:00 -0000

This is only way for compile for now since qemu can not
run the sizers binary for e5500 machines. It segfaults
so we disable generating sizes and also xawt and jawt
which depends on sizers, this lets jre to cross compile
for ppc/e5500

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icedtea-jdk-sizers-crosscompile-hack.patch     |   61 ++++++++++++++++++++
 recipes-core/openjdk/openjdk-6-release-6b24.inc    |   13 ++++-
 2 files changed, 73 insertions(+), 1 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack.patch

diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack.patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack.patch
new file mode 100644
index 0000000..54d6a19
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack.patch
@@ -0,0 +1,61 @@
+Disable xawt and jawt along with sizes generation which does not work well if
+you cant generated sizes in cross env. So for architectures which dont have
+working qemu this is an option
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [Cross-compile specific hack]
+
+--- openjdk/jdk/make/sun/xawt/Makefile.khem	2012-07-21 23:54:47.396405922 -0700
++++ openjdk/jdk/make/sun/xawt/Makefile	2012-07-21 23:55:52.032405922 -0700
+@@ -245,18 +245,19 @@
+ 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
+ 
+ $(SIZES): $(SIZERS)
+-	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
+-	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
+-	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
+-	    $(CHMOD) +w $@;\
+-	else	\
+-	    $(ECHO) GENERATING $@; \
+-	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+-	fi
+-	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+-	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+-	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+-	fi	
++	touch $(SIZES)
++#	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
++#	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
++#	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
++#	    $(CHMOD) +w $@;\
++#	else	\
++#	    $(ECHO) GENERATING $@; \
++#	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++#	fi
++#	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
++#	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
++#	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
++#	fi	
+ 
+ $(TEMPDIR)/.gen.wrappers: $(SIZES) $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
+ 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) WrapperGenerator \
+--- openjdk/jdk/make/sun/Makefile.khem	2011-11-14 14:11:40.000000000 -0800
++++ openjdk/jdk/make/sun/Makefile	2012-07-22 00:42:04.980409296 -0700
+@@ -50,7 +50,7 @@
+     MOTIF_SUBDIRS   = motif12 motif21
+   endif
+   HEADLESS_SUBDIR = headless
+-  XAWT_SUBDIR     = xawt
++  XAWT_SUBDIR     =
+ endif
+ 
+ ifndef OPENJDK
+@@ -65,7 +65,7 @@
+ 	  awt splashscreen $(XAWT_SUBDIR) $(MOTIF_SUBDIRS) \
+           $(HEADLESS_SUBDIR) $(DGA_SUBDIR) \
+ 	  font jpeg cmm applet rmi beans $(JDBC_SUBDIR) \
+-	  jawt text nio launcher management $(ORG_SUBDIR) \
++	  text nio launcher management $(ORG_SUBDIR) \
+           native2ascii serialver tools jconsole
+ 
+ all build clean clobber::
diff --git a/recipes-core/openjdk/openjdk-6-release-6b24.inc b/recipes-core/openjdk/openjdk-6-release-6b24.inc
index b867fb3..1da7ffb 100644
--- a/recipes-core/openjdk/openjdk-6-release-6b24.inc
+++ b/recipes-core/openjdk/openjdk-6-release-6b24.inc
@@ -83,7 +83,12 @@ ICEDTEAPATCHES = "\
         file://icedtea-zero-hotspotfix.patch;apply=no \
         file://icedtea-jdk-powerpc-atomic64.patch;apply=no \
 	"
-
+ICEDTEAPATCHES_append_e5500-64b = " \
+        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=no \
+	"
+ICEDTEAPATCHES_append_e5500 = " \
+        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=no \
+	"
 ICEDTEAPATCHES_append_libc-uclibc = " \
         file://icedtea-hotspot-isfinte.patch;apply=no \
         file://icedtea-hotspot-glibc-version.patch;apply=no \
@@ -119,5 +124,11 @@ DISTRIBUTION_PATCHES_append_libc-uclibc = "\
         patches/icedtea-jdk-unpack-uclibc.patch \
 	patches/icedtea-hotspot-dlvsym-uclibc.patch \
         "
+DISTRIBUTION_PATCHES_append_e5500-64b = " \
+       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
+       "
 
+DISTRIBUTION_PATCHES_append_e5500 = " \
+       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
+       "
 export DISTRIBUTION_PATCHES
-- 
1.7.5.4



