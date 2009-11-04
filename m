Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N5bnT-0005R0-2x
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 10:04:58 +0100
Received: by bwz9 with SMTP id 9so8497595bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=1OighuRDS8hdYZmq+QjR2k/Zyt6ecaWDEQ1sDtg/qUs=;
	b=Lc8Uv/DPaptfwRHuOXpGZw+jY7MpvPU41GfIBWWxBCPCJNxXiVnWhgIj2WSdGAYp1D
	gevwCZn3lmAohY6azA8BK0ofli5lAy61x3QS8TMONOkHIn72fL3H3pWqMAr2vzOZYrBT
	8Y+oQFEqeokzsCOKmVBxhNxUvop4f9WS/WAtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gobVD0nhH8h9k8tuEAwaEt6PRck6t/dTMKe4lKDio266glw2Z9VKjs6ldkOaYGCNOv
	R1J1EMWT8T4fR2HUds+aAxtdV4vocdaEH7pqE7xCsGyQ+4ArfNcK4V82wz5PVc55yK3D
	4IsTqqFEBdBBxcatrqCaI9QkT92c0jKUI+vXM=
Received: by 10.204.16.88 with SMTP id n24mr1171739bka.52.1257325422606;
	Wed, 04 Nov 2009 01:03:42 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm260816fxm.11.2009.11.04.01.03.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Nov 2009 01:03:41 -0800 (PST)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2009 10:03:22 +0100
Message-Id: <1257325402-3232-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] eglibc: updated armv4t-interworking.patch
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
X-List-Received-Date: Wed, 04 Nov 2009 09:04:58 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* Updated patch to make SYSCALL_ERROR_HANDLER interworking safe.
* Phil Blundell found and fixed another issue in eglibc armv4t builds.

Signed-off-by: Martin.Jansa <Martin.Jansa@gmail.com>
---
 recipes/eglibc/eglibc_2.10.bb                  |    2 +-
 recipes/eglibc/eglibc_2.9.bb                   |    2 +-
 recipes/eglibc/eglibc_svn.bb                   |    2 +-
 recipes/eglibc/files/armv4t-interworking.patch |   27 +++++++++++++++++++++++-
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index d143b0a..2a62fe3 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.10"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 SVN_REV="9124"
 EGLIBC_BRANCH="eglibc-2_10"
 SRC_URI = "svn://svn.eglibc.org/branches;module=eglibc-2_10;rev=${SVN_REV};proto=svn \
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index 3efcb36..7a82627 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.9"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 SVN_REV="8690"
 EGLIBC_BRANCH="eglibc-2_9"
 SRC_URI = "svn://svn.eglibc.org/branches;module=eglibc-2_9;rev=${SVN_REV};proto=svn \
diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
index 1a91af8..3376839 100644
--- a/recipes/eglibc/eglibc_svn.bb
+++ b/recipes/eglibc/eglibc_svn.bb
@@ -5,7 +5,7 @@ SRCREV = "9170"
 DEFAULT_PREFERENCE = "-1"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.10+svnr${SRCREV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 EGLIBC_BRANCH="trunk"
 SRC_URI = "svn://svn.eglibc.org;module=trunk \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
diff --git a/recipes/eglibc/files/armv4t-interworking.patch b/recipes/eglibc/files/armv4t-interworking.patch
index 55ee856..6ab3061 100644
--- a/recipes/eglibc/files/armv4t-interworking.patch
+++ b/recipes/eglibc/files/armv4t-interworking.patch
@@ -40,7 +40,7 @@ Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
  #endif
  	@ pick the function arg and call address off the stack and execute
  	ldr	r0, [sp, #4]
-+#if defined(__ARM_ARCH_V4T__) && defined(__THUMB_INTERWORK__)
++#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
 +	ldr 	ip, [sp], #8
 +	mov	lr, pc
 +        bx      ip
@@ -51,3 +51,28 @@ Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
  
  	@ and we are done, passing the return value through r0
  	b	PLTJMP(HIDDEN_JUMPTARGET(_exit))
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-09-16 13:58:18.000000000 +0100
++++ libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-11-03 19:17:16.000000000 +0000
+@@ -129,6 +129,11 @@
+        DO_RET(lr);						\
+ 1:     .word C_SYMBOL_NAME(rtld_errno) - 0b - 8;
+ # else
++#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
++#define POP_PC  ldr     lr, [sp], #4; bx lr
++#else
++#define POP_PC  ldr     pc, [sp], #4
++#endif
+ #  define SYSCALL_ERROR_HANDLER					\
+ __local_syscall_error:						\
+ 	str	lr, [sp, #-4]!;					\
+@@ -138,7 +143,7 @@
+ 	rsb	r1, r1, #0;					\
+ 	str	r1, [r0];					\
+ 	mvn	r0, #0;						\
+-	ldr	pc, [sp], #4;
++        POP_PC;
+ # endif
+ #else
+ # define SYSCALL_ERROR_HANDLER	/* Nothing here; code in sysdep.S is used.  */
-- 
1.6.5.2



