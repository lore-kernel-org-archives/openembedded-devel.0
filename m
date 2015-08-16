Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 18BCE766DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:39 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so64363283wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v6ubouUQeXIHg6Ck5IMY89xf636YzO6Qe4ifG23GJ4Q=;
	b=Jt7Hu6w5FSTZFgHZvPuLW2eCekw2EcW5yYMBgGhnTP6M7XdzAAwf48mQt6Rm348St/
	WxzTClx7ol3ZPudJCy02BjoruObWCwCAvDMTkCN3wXw4d5mmvuTNNNqZ68CtW5NMtJqM
	yZl6T8DXVUb2TJPNUb4MQ9/8I4zZbh81198COrJUNdF6Jknlbvnt82s3iUkXDc+SiRzt
	K2iSeRh/yxG13PnJosmFAsyQjolS8xDXnDfT0EkhDMuONFsWBCoRP4vmLWKOqeeUHq+k
	GS70wXvxapuEmTtpQEpp4H1Uw6O8R5KYv95KI0CQ4uT1kw03zvG5XugojPhAgKcKB1rN
	ij3Q==
X-Received: by 10.180.20.48 with SMTP id k16mr28063572wie.56.1439754399472;
	Sun, 16 Aug 2015 12:46:39 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:39 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:19 +0200
Message-Id: <1439754023-13290-5-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 4/8] firefox: prevent SIGILL crash #2 with arm build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Aug 2015 19:46:41 -0000

Firefox built with oe-core, daisy, crashes with a SIGILL signal during startup.
No window is drawn, crash starts somewere in js/src/methodjit/MethodJIT.cpp
JaegerCompartment::Initialize()
The patch from https://bugzilla.mozilla.org/show_bug.cgi?id=803601#c28
fixes this.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 ...n-ARMv6-builds-built-with-the-NDK_10.0esr.patch | 89 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_10.0.11esr.bb      |  3 +-
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch

diff --git a/recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch b/recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch
new file mode 100644
index 0000000..e00d2d5
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch
@@ -0,0 +1,89 @@
+firefox crashes with a fix SIGILL abort on start.
+
+This seems to happen only in some setups. (e.g. with gcc provided from
+meta-linaro, 4.8.3, with a meta-fsl-arm setup + meta-browser firefox
+starts correctly (with gcc from oe, meta-oe, 4.8.2))
+
+The following patch fixes this:
+https://hg.mozilla.org/integration/mozilla-inbound/rev/f9be5a3d9b3c
+
+Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
+
+# HG changeset patch
+# User Kartikaya Gupta <kgupta@mozilla.com>
+# Date 1356843815 18000
+# Node ID f9be5a3d9b3ce26ad94e31a4c0275fee19db7ca8
+# Parent  414b431ad3fa831ecf5bf69abd3b5cb8670781db
+Bug 803601 - Prevent SIGILL crashes on ARMv6 builds built with the NDK r8c toolchain (gcc-4.6, gold). r=mjrosenb
+
+diff --git a/js/src/methodjit/MethodJIT.cpp b/js/src/methodjit/MethodJIT.cpp
+--- a/js/src/methodjit/MethodJIT.cpp
++++ b/js/src/methodjit/MethodJIT.cpp
+@@ -671,8 +671,10 @@
+   ".align 2\n" \
+   ".thumb\n" \
+   ".thumb_func\n"
++#define BRANCH_AND_LINK(x) "blx " x
+ #else
+ #define FUNCTION_HEADER_EXTRA
++#define BRANCH_AND_LINK(x) "bl " x
+ #endif
+ 
+ asm (
+@@ -731,9 +733,9 @@
+ "   mov     r10, r1"                            "\n"
+ 
+ "   mov     r0, sp"                             "\n"
+-"   blx  " SYMBOL_STRING_VMFRAME(SetVMFrameRegs)   "\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(SetVMFrameRegs)) "\n "
+ "   mov     r0, sp"                             "\n"
+-"   blx  " SYMBOL_STRING_VMFRAME(PushActiveVMFrame)"\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PushActiveVMFrame)) "\n"
+ 
+     /* Call the compiled JavaScript function. */
+ "   bx     r4"                                  "\n"
+@@ -748,7 +750,7 @@
+ 
+     /* Tidy up. */
+ "   mov     r0, sp"                         "\n"
+-"   blx  " SYMBOL_STRING_VMFRAME(PopActiveVMFrame) "\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PopActiveVMFrame)) "\n"
+ 
+     /* Skip past the parameters we pushed (such as cx and the like). */
+ "   add     sp, sp, #(4*7 + 4*6)"           "\n"
+@@ -767,7 +769,7 @@
+ "   mov     r0, sp"                         "\n"
+ 
+     /* Call the utility function that sets up the internal throw routine. */
+-"   blx  " SYMBOL_STRING_RELOC(js_InternalThrow) "\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_RELOC(js_InternalThrow)) "\n"
+     
+     /* If js_InternalThrow found a scripted handler, jump to it. Otherwise, tidy
+      * up and return. */
+@@ -777,7 +779,7 @@
+ 
+     /* Tidy up, then return '0' to represent an unhandled exception. */
+ "   mov     r0, sp"                         "\n"
+-"   blx  " SYMBOL_STRING_VMFRAME(PopActiveVMFrame) "\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PopActiveVMFrame)) "\n"
+ "   add     sp, sp, #(4*7 + 4*6)"           "\n"
+ "   mov     r0, #0"                         "\n"
+ "   pop     {r4-r11,pc}"                    "\n"
+@@ -801,7 +803,7 @@
+ "   mov     r2, r0"                         "\n"    /* returnReg */
+ "   mov     r1, r5"                         "\n"    /* returnType */
+ "   mov     r0, r4"                         "\n"    /* returnData */
+-"   blx  " SYMBOL_STRING_RELOC(js_InternalInterpret) "\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_RELOC(js_InternalInterpret)) "\n"
+ "   cmp     r0, #0"                         "\n"
+ "   ldr     r10, [sp, #(4*7)]"              "\n"    /* Load (StackFrame*)f->regs->fp_ */
+ "   ldrd    r4, r5, [r10, #(4*6)]"          "\n"    /* Load rval payload and type. */
+@@ -810,7 +812,7 @@
+ "   bxne    r0"                             "\n"
+     /* Tidy up, then return 0. */
+ "   mov     r0, sp"                         "\n"
+-"   blx  " SYMBOL_STRING_VMFRAME(PopActiveVMFrame) "\n"
++"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PopActiveVMFrame)) "\n"
+ "   add     sp, sp, #(4*7 + 4*6)"           "\n"
+ "   mov     r0, #0"                         "\n"
+ "   pop     {r4-r11,pc}"                    "\n"
diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index cb368d0..8a99b77 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -76,7 +76,8 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://freetype-2.5.patch \
            file://x86_64-fix.patch \
            file://vendor.js \
-           file://alignment.patch"
+           file://alignment.patch \
+           file://Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch"
 
 SRC_URI[archive.md5sum] = "2f0e3a1dd7480e03f374c0121b4155e2"
 SRC_URI[archive.sha256sum] = "94b4d5a339d97dc56fd349f93407c3af4f408a4a8409a64e3680d564d37594f8"
-- 
1.8.4.5


