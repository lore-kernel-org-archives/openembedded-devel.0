Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od7fE-00030g-PN
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 22:19:16 +0200
Received: by ewy7 with SMTP id 7so692333ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xdE66+p3AEsFV/rGLBPLeovFPPd60md8EuvUowAU1yQ=;
	b=XfgVjCT0v2tnhFmvKY6a4puI/xuzJMLaRBUPEHJIA2bsN7KH5g847pu6jMIngfX4KK
	9OlLtURqE/Zzh7v5uYOioeeFns4Q7QfuTvYOFvjJwcJYCKQg47sSPAOWJsOBHxbdiZW0
	CbfvUBrLN3HmkkfZYWG+8+5MsGCHkHL2Hac90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L8OCV7u+3+Vu+6v0x2vQHbLTQykii7NcN/F54QNVSQFDu4OsEorxGuJwG2lzCWUlqp
	nTwZBxk2ZknBA7oDx73rZg2MpnX+V9P2uElL4y7XD6xaoLX+iHwoO4QLZK0ITJrru+85
	r4kOLl9lDJlhNOuRjnR26lZGZTUNp/9Cwk1Jk=
Received: by 10.213.28.5 with SMTP id k5mr5453223ebc.40.1280089139468;
	Sun, 25 Jul 2010 13:18:59 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm4400476eei.18.2010.07.25.13.18.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jul 2010 13:18:59 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jul 2010 22:18:45 +0200
Message-Id: <1280089125-30217-4-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1280089125-30217-3-git-send-email-fransmeulenbroeks@gmail.com>
References: <1280089125-30217-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1280089125-30217-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1280089125-30217-3-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] gcc4.5: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Sun, 25 Jul 2010 20:19:17 -0000

When compiling gcc target code make passes -I(GMPINC)
but this one points to the host dir (it is set to HOST_GMPINC
which in oe points to tmp/sysroots/i686-linux/usr/include).
This patch breaks the env var $(INCLUDES) in two and
only uses the TARGET specific part for compiling libgcc
and the crt stuff.

The patch has been verified by baking the 4.5 recipe with
bitbake -c patch -b gcc_4.5.bb

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gcc/gcc-4.5.inc               |    3 ++-
 recipes/gcc/gcc-4.5/Makefile.in.patch |   30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.5/Makefile.in.patch

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index c671cc8..df44a27 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRCREV = "162398"
 PV = "4.5"
@@ -31,6 +31,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://libstdc++-emit-__cxa_end_cleanup-in-text.patch \
 	   file://arm-bswapsi2.patch \
 	   file://gcc-pr43698-arm-rev-instr.patch \
+	   file://Makefile.in.patch \
 	  "
 
 # Language Overrides
diff --git a/recipes/gcc/gcc-4.5/Makefile.in.patch b/recipes/gcc/gcc-4.5/Makefile.in.patch
new file mode 100644
index 0000000..45df47c
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/Makefile.in.patch
@@ -0,0 +1,30 @@
+Index: gcc-4.5/gcc/Makefile.in
+===================================================================
+--- gcc-4.5.orig/gcc/Makefile.in
++++ gcc-4.5/gcc/Makefile.in
+@@ -656,7 +656,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -1038,10 +1038,14 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC) \
++	   $(CPPINC) $(DECNUMINC) \
+ 	   $(PPLINC) $(CLOOGINC) $(LIBELFINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(COMPILER) -c $(ALL_COMPILERFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
-- 
1.6.4.2



