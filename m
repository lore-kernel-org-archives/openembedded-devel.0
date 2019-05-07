Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CABF97D5B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykR31Cmz60
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230191;
	bh=jNOfCKPCoZdNcAjrTKMKmCn//Tnjh7Cc7R3gvrBY+ew=;
	h=From:To:Subject:Date:From;
	b=SqwC6eykNyFCa4I/oCGyNupYdQIwZ5g88fd3e5yonn72vlFKWbQ7AIund8Mder2HC
	X9V2t91O5QQGLXFmju3cDjv5rvUBf0mQhKrz9ENr3oT0dvFeZ/sOKe0LIZQQlTTi8g
	QtqHM+xAPK+zhBBJYc2x/dKGMROHi9x63HOx1SOxXSFMYgOTfm71SEGa1AhmjmZNOy
	ad+2qJ8RhSqzJuTivw2pzxMxHOQLUZB8r5JqG3MDZ//Ik4xYwHJsbXXO7XXa9SFLIF
	cWA07SNocik4dUVcShyMckbiOXDlC0SLB5o7uZph/awZltCa+ZvgR3Dbugd3RfYB1n
	sTlzj9ObyU7UwtbJUYPpv+BbZn92752vvd5Ar8a1tgvXvOwHeopirDSyJkUN59hdUb
	Z9p/K9FLKFZ39nGTANjRvVxsS0XU9+kgcsoejyAG0+aO9HYg2AeDxaKSQfjlAkLd7T
	hbl/eF5KGTifB10aCQYt5U2eN1UWVmOlzjzW/Dp/m9oNE1RmJH4xRLlfgzSvBvvRct
	YYENg5E/N+wm/ZcFbzh8L+jx+qIDyO9Vz/74ueRR8hise5DVmEdoznFJa3y5oQtkbt
	UwauPtIPfsiCKatdeiMD+VaYJLsJV2uFUEh9sa39iJH0wYD1cN/nSdi/9XN0sxRfju
	rzEedTRj2eDbb6tpePKCg+rk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:19 +0300
Message-Id: <20190507115630.30368-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gnu-efi: Remove support patch for gcc < 4.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2019 11:56:32 -0000

No host platform that is still supported uses such an old gcc.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnu-efi/gnu-efi/gcc46-compatibility.patch | 35 -------------------
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb     |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
deleted file mode 100644
index 69efd34e24..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8d16ae374c5d4d9fac45c002605a66cfb8c08be5 Mon Sep 17 00:00:00 2001
-From: Steve Langasek <steve.langasek@ubuntu.com>
-Date: Wed, 9 Sep 2015 08:26:06 +0000
-Subject: [PATCH 3/3] gnu-efi, syslinux: Support gcc < 4.7
-
-don't break with old compilers and -DGNU_EFI_USE_MS_ABI
-It's entirely legitimate to request GNU_EFI_USE_MS_ABI even if the current
-compiler doesn't support it, and gnu-efi should transparently fall back to
-using legacy techniques to set the calling convention.  We don't get type
-checking, but at least it will still compile.
-
-Author: Steve Langasek <steve.langasek@ubuntu.com>
-Upstream-Status: Pending
-[Rebased for 3.0.6]
-Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
----
- inc/x86_64/efibind.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/inc/x86_64/efibind.h b/inc/x86_64/efibind.h
-index 4309f9f..02c0af1 100644
---- a/inc/x86_64/efibind.h
-+++ b/inc/x86_64/efibind.h
-@@ -25,8 +25,6 @@ Revision History
- #if defined(GNU_EFI_USE_MS_ABI)
-     #if (defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7)))||(defined(__clang__) && (__clang_major__ > 3 || (__clang_major__ == 3 && __clang_minor__ >= 2)))
-         #define HAVE_USE_MS_ABI 1
--    #else
--        #error Compiler is too old for GNU_EFI_USE_MS_ABI
-     #endif
- #endif
- 
--- 
-2.9.4
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
index 0667191fbe..f844435472 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
-           file://gcc46-compatibility.patch \
            "
 
 SRC_URI[md5sum] = "32af17b917545a693e549af2439c4a99"
-- 
2.17.1


