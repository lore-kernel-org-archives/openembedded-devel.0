Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDml-0001Ap-Gl
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:52:14 +0200
Received: by mail-pd0-f182.google.com with SMTP id 14so398898pdj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HwJHd4cOyI5s+wQGzt0O4VzvkhtqlK0TTCVnFM5YO4c=;
	b=A6fZUVcw+vbt+A+1vjLpGiMGqmIWjdUlUdLUVc0sxJsQMglExHW0Fyrx/1f2ZxG5vf
	w6eEPWleqdPkS+x95uyolmvvs2kAVDKTiNBUuHfpRL7ng5RMkoZMukji3579cPv9v07I
	DLTTQUhVmQJyXqgYTU7fqqGyA8v7SWKLBgBLUWFLIxipn0rXz90v8rbEQaNzvEhZCr8D
	E8fBouRyynm6iXxUZEpXOlb466wYvAoO9xXgStE4sdKMIsBZqsTog23VRBHX3uwdmmda
	ub7lSBn5XKKekJ7UlpRX0iRLOOIyfInoJC4Fs7KmvKgqHf2Aj4khxeAAFBLCEeBC0+0H
	yO3Q==
X-Received: by 10.68.103.36 with SMTP id ft4mr76324257pbb.2.1367339658878;
	Tue, 30 Apr 2013 09:34:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bs3sm29085851pbb.36.2013.04.30.09.34.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:34:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:53 +0200
Message-Id: <6970589fe80bf2286d87aea08abf7380ece12586.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 03/12] llvm2.9: try to fix thumb build and disable it after failure
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
X-List-Received-Date: Tue, 30 Apr 2013 16:52:18 -0000

* khem: could you check what I'm doing wrong? This is out of my league..

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/llvm/llvm2.9/0019-issue6065.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb           |  9 ++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch

diff --git a/meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch b/meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch
new file mode 100644
index 0000000..aff3d1d
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch
@@ -0,0 +1,35 @@
+--- llvm-2.9.orig/lib/Target/ARM/ARMJITInfo.cpp	2013-04-19 14:49:28.063566919 +0200
++++ llvm-2.9/lib/Target/ARM/ARMJITInfo.cpp	2013-04-19 15:24:31.065435029 +0200
+@@ -59,7 +59,17 @@
+     // for the real target function right now. We have to act as if this
+     // whole compilation callback doesn't exist as far as the caller is
+     // concerned, so we can't just preserve the callee saved regs.
++    // stmdb introduced in http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?diff_format=h&r1=57911&r2=57910&pathrev=57911
++    // but fails on armv4t
++    // | {standard input}: Assembler messages:
++    // | {standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
++    // | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r1,r2,r3,lr}'
++    // | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
++#ifndef __thumb__
+     "stmdb sp!, {r0, r1, r2, r3, lr}\n"
++#else
++    "push {r0, r1, r2, r3, lr}\n"
++#endif
+ #if (defined(__VFP_FP__) && !defined(__SOFTFP__))
+     "fstmfdd sp!, {d0, d1, d2, d3, d4, d5, d6, d7}\n"
+ #endif
+@@ -99,8 +109,14 @@
+     // The above twiddling of the saved return addresses allows us to
+     // deallocate everything, including the LR the stub saved, with two
+     // updating load instructions.
++#ifndef __thumb__
+     "ldmia  sp!, {r0, r1, r2, r3, lr}\n"
+     "ldr    pc, [sp], #4\n"
++#else
++    // thumb dont allow lr and pc to be poped in the same instruction.
++    "pop {r0, r1, r2, r3, lr}\n"
++    "pop {pc}\n"
++#endif
+       );
+ #else  // Not an ARM host
+   void ARMCompilationCallback() {
diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index d5b8c01..dc7f873 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -4,6 +4,15 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://0035-gcc-4.7.patch"
 
+# 0019-issue6065.patch is still needed but a bit modified, because it was resolved by
+# http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?r1=120304&r2=124694&pathrev=124694
+# http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?diff_format=h&r1=57911&r2=57910&pathrev=57911
+# and still it fails with 
+# {standard input}:31: Error: invalid register list to push/pop instruction -- `pop {r0,r1,r2,r3,lr}'
+# make[2]: *** [lib/Target/ARM/CMakeFiles/LLVMARMCodeGen.dir/ARMJITInfo.cpp.o] Error 1
+# SRC_URI += "file://0019-issue6065.patch"
+ARM_INSTRUCTION_SET = "arm"
+
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
 
 PARALLEL_MAKE_virtclass-native = ""
-- 
1.8.2.1



