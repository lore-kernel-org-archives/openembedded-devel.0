Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 12CD36FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 12:32:54 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l68so26623802wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WrdWYWNKCNxbKFLpy3VjaZ70b5AvKeQQAaikylOLKJs=;
	b=pJkoPQgVNyACr9GgQB5FpuEo28WMARknahttE27DFBJwzrOpvYIPdT8s8AGcJ6PqLP
	vAePeuBSAT979fyKxbHafqxetMr59l2kYM6UNjcmyd1v3SkXLsQV+DNv0g3puQkydfYJ
	TPxDQCGM7OcKgq57mxhaUGcmE4FvH8VAi8f+7t6PTkj0Lfvdc5BPN/jndmfXZoInuZHV
	1n1r6byfdLEWnb0Awq2vJQ9TN9FZOICg3ZNst+CQcJE9ZNoeVeblZdU0KG6Dtx3z3E+6
	JIra0rcyX8g+5SG+qllHI98c9f6fECiGo5HJvb2xs1F9+AO6HpP64MhFT+D9VDAWfv0A
	1a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WrdWYWNKCNxbKFLpy3VjaZ70b5AvKeQQAaikylOLKJs=;
	b=GIeLak0vfZKOZYvBAMrNUQ3DMoqEQsVg5D8tadWXib9Hl+cd4FF4pI5JkLDyN8GFIG
	EAe8nzOoAekOVKYuBNxxfMgNCR9sIzsMupbZ0CWFqCqujhlcFA70f/6gJvfFqxKzbSs9
	yrmCa/ctbrA+2WvlyOG/+vyPEcHJY7IUBM/61fZUebg+CYDZfPrN10DALA833Q6sXxUg
	hhwMmNNKB+i23hslxHHUxpQLaPKdtyehcFzUJuI8RhUOjPDzjAn373RwD2AjHIdrHfap
	YJI2gQIhA6+HzC9CeoEQ34Pa9gVWrza6SuzG4kkkGb0iaAIAhtyDIMGE1mDq6XXe2t1A
	QbDQ==
X-Gm-Message-State: AD7BkJKPiTrQMX2wUcaHQnLbPFvM7hF85sXSc1D0gslWrxY+J9gwrte8uC9RDCFqjvw5dQ==
X-Received: by 10.28.174.8 with SMTP id x8mr3655698wme.49.1457613174795;
	Thu, 10 Mar 2016 04:32:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	js8sm3314462wjc.37.2016.03.10.04.32.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 04:32:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 13:35:51 +0100
Message-Id: <1457613351-26986-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH][meta-oe] luajit: depend on luajit-native to provide host lua
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
X-List-Received-Date: Thu, 10 Mar 2016 12:32:55 -0000

* otherwise minilua for host is built during build of target lua, see
  comment in Makefile:
  # If left blank, minilua is built and used. You can supply an installed
  # copy of (plain) Lua 5.1 or 5.2, plus Lua BitOp. E.g. with: HOST_LUA=lua
* be aware that there is still native buildvm which needs the same headers
  if it fails for you, then you probably need to install libc6-dev:i386
  which installs these headers to hosts /usr/include, some architectures
  are passing HOST_CC="${BUILD_CC} -m32" in EXTRA_OEMAKE, that's why
  you need 32bit headers on 64bit host.
* building native minilua fails on some hosts like this:
  ERROR: luajit-2.0.4-r0 do_compile: oe_runmake failed
  ERROR: luajit-2.0.4-r0 do_compile: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/luajit/2.0.4-r0/temp/log.do_compile.3067)
  ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/luajit/2.0.4-r0/temp/log.do_compile.3067
  Log data follows:
  | DEBUG: Executing shell function do_compile
  | NOTE: make -j 8 CROSS=arm-oe-linux-gnueabi- TARGET_CFLAGS= --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm  -march=armv5te -mthumb TARGET_LDFLAGS= --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm TARGET_SHLDFLAGS= --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm HOST_CC=gcc  -m32
  | ==== Building LuaJIT 2.0.4 ====
  | make -C src
  | make[1]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/luajit/2.0.4-r0/LuaJIT-2.0.4/src'
  | HOSTCC    host/buildvm_asm.o
  | HOSTCC    host/minilua.o
  | HOSTCC    host/buildvm_peobj.o
  | HOSTCC    host/buildvm_lib.o
  | HOSTCC    host/buildvm_fold.o
  | CC        lj_gc.o
  | CC        lj_obj.o
  | CC        lj_char.o
  | In file included from host/buildvm_peobj.c:9:0:
  | host/buildvm.h:9:23: fatal error: sys/types.h: No such file or directory
  |  #include <sys/types.h>
  |                        ^
  | compilation terminated.
  | In file included from host/buildvm_fold.c:6:0:
  | host/buildvm.h:9:23: fatal error: sys/types.h: No such file or directory
  |  #include <sys/types.h>
  |                        ^
  | compilation terminated.
  | In file included from host/buildvm_asm.c:6:0:
  | host/buildvm.h:9:23: fatal error: sys/types.h: No such file or directory
  |  #include <sys/types.h>
  |                        ^
  | compilation terminated.
  | In file included from host/buildvm_lib.c:6:0:
  | host/buildvm.h:9:23: fatal error: sys/types.h: No such file or directory
  |  #include <sys/types.h>
  |                        ^
  | compilation terminated.
  | In file included from /usr/include/limits.h:25:0,
  |                  from /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h:168,
  |                  from /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/syslimits.h:7,
  |                  from /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h:34,
  |                  from host/minilua.c:33:
  | /usr/include/features.h:374:25: fatal error: sys/cdefs.h: No such file or directory
  |  #  include <sys/cdefs.h>
  |                          ^
  | compilation terminated.
  | make[1]: *** [host/buildvm_lib.o] Error 1
  | make[1]: *** Waiting for unfinished jobs....
  | make[1]: *** [host/buildvm_fold.o] Error 1
  | make[1]: *** [host/buildvm_asm.o] Error 1
  | make[1]: *** [host/buildvm_peobj.o] Error 1
  | make[1]: *** [host/minilua.o] Error 1
  | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/luajit/2.0.4-r0/LuaJIT-2.0.4/src'
  | make: *** [default] Error 2
  | ERROR: oe_runmake failed
  | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/luajit/2.0.4-r0/temp/log.do_compile.3067)
  NOTE: recipe luajit-2.0.4-r0: task do_compile: Failed
  ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb, do_compile) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 4a15a4e..9609469 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -31,6 +31,9 @@ EXTRA_OEMAKE_append_powerpc64 = ' HOST_CC="${BUILD_CC}"'
 EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
 
+DEPENDS_append_class_target = " luajit-native"
+EXTRA_OEMAKE_append_class_target = " HOST_LUA=luajit"
+
 do_compile () {
     oe_runmake
 }
-- 
2.7.2


