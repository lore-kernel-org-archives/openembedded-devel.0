Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF417C86A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 23:01:09 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m3so12272231pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XQuj3WhcDiz5QDt7SyONXQE334jZKK0NH2Zz9iOR6s0=;
	b=ue4d+XwpzcJGEkUY7C2Xg6oCGAC0Ao5L7L5e8A6CyoTlee7KdYw5gL+WcaHuLM035b
	yFF2ZD3YkO2A6/UfO8yvhP9kBHJV53ScKZriX2zLbUB6y4AcSWLwDioJAxoednTesucQ
	MBnTZW/aH3+4iiymlmHgEPhVdvi1tVjN7h0y6Gf+1EycmIVncatfq0qlm4dEW4yi4znN
	zFg9U5cJmo8yJAApmuk0g2pW1OTT5a/GkqqIcVSarjMX5JkgAs3ZaJEdsi508AfpkkO4
	L7kPf9YT/CQwa0SLAmg3cWsOn13Vku+3T4l3eos+Et/CgxmyMFEjg0oDgkX3ZGhwG/GM
	hvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XQuj3WhcDiz5QDt7SyONXQE334jZKK0NH2Zz9iOR6s0=;
	b=Dfl73iF2gaOZdbHva9+Q9W3wsebBC8rlvr+UBXYZIqeR30IHr2l3ISYCW/A/F11oWb
	YvsvFclVWYZ36Zmc4Aw/53NsfBfibsccUaARNL22Ut9SIrxBnSBqZ/wU7atB1g0F1530
	LhB6yguspaEctcK+K3H5zX32vIHm3LxitR4gQo3tMPN7ctro9z3OB6QCV0umujhGhkgW
	CpG3FSDLK9O5W9e1p7w2lwpRhSlPSujJjnkEs8JjG8+/JAQP7z+pEAm3/uXdZcJc/vhB
	PrIgPT01cFscAryY8HFInz8SGk4B/4MwqgF7MJCcISZlluH9TWhgI5Zvq5LXsd+LssOW
	MN+A==
X-Gm-Message-State: APjAAAXk9cJaRhA+mFpGTd4QYiNUIOEvyfHS3hR8xvJi7lNqNnotq0qU
	Od6/JoFNXcYeJ0cJnUKozYoNwdNmlpw=
X-Google-Smtp-Source: APXvYqzqVOkKkjHGLuiIgPxX7qrWVmsPgOqVC4Ic0GiJ3yCvY1ybH3ASKG91wDZJbKFcYZhYoX0R9g==
X-Received: by 2002:a17:90a:1e63:: with SMTP id
	w90mr8140809pjw.31.1568242870205; 
	Wed, 11 Sep 2019 16:01:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id g3sm3104552pjx.32.2019.09.11.16.01.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 16:01:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 16:01:00 -0700
Message-Id: <20190911230101.1628610-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] breakpad: Update dont-clobber-rsp patch to latest
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
X-List-Received-Date: Wed, 11 Sep 2019 23:01:10 -0000
Content-Transfer-Encoding: 8bit

This is based on upstream submission

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/breakpad/dont-clobber-rsp.patch  | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch b/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
index b1c37fc8e9..edf903552d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
@@ -1,3 +1,8 @@
+From d1d7b616219fd47736c804ff4c2f393d7184a75b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Dec 2018 16:58:04 -0800
+Subject: [PATCH] chromium: stack pointer clobber
+
 Do not add stack pointer to clobber list
 
 it was being ignored until gcc 9.0 became capable
@@ -7,9 +12,23 @@ of flagging this silent ignoring via [1]
 
 Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/linux-syscall-support/+/1390160]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/lss/linux_syscall_support.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
+Index: b/src/third_party/lss/linux_syscall_support.h
+===================================================================
 --- a/src/third_party/lss/linux_syscall_support.h
 +++ b/src/third_party/lss/linux_syscall_support.h
+@@ -1957,7 +1957,7 @@ struct kernel_statfs {
+                            LSS_ENTRYPOINT                                     \
+                            "pop %%ebx"                                        \
+                            args                                               \
+-                           : "esp", "memory");                                \
++                           : "memory");                                       \
+       LSS_RETURN(type,__res)
+     #undef  _syscall0
+     #define _syscall0(type,name)                                              \
 @@ -1966,7 +1966,7 @@ struct kernel_statfs {
          __asm__ volatile(LSS_ENTRYPOINT                                       \
                           : "=a" (__res)                                       \
@@ -19,6 +38,33 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          LSS_RETURN(type,__res);                                               \
        }
      #undef  _syscall1
+@@ -2014,7 +2014,7 @@ struct kernel_statfs {
+                              : "i" (__NR_##name), "ri" ((long)(arg1)),        \
+                                "c" ((long)(arg2)), "d" ((long)(arg3)),        \
+                                "S" ((long)(arg4)), "D" ((long)(arg5))         \
+-                             : "esp", "memory");                              \
++                             : "memory");                                     \
+         LSS_RETURN(type,__res);                                               \
+       }
+     #undef  _syscall6
+@@ -2036,7 +2036,7 @@ struct kernel_statfs {
+                              : "i" (__NR_##name),  "0" ((long)(&__s)),        \
+                                "c" ((long)(arg2)), "d" ((long)(arg3)),        \
+                                "S" ((long)(arg4)), "D" ((long)(arg5))         \
+-                             : "esp", "memory");                              \
++                             : "memory");                                     \
+         LSS_RETURN(type,__res);                                               \
+       }
+     LSS_INLINE int LSS_NAME(clone)(int (*fn)(void *), void *child_stack,
+@@ -2122,7 +2122,7 @@ struct kernel_statfs {
+                            : "0"(-EINVAL), "i"(__NR_clone),
+                              "m"(fn), "m"(child_stack), "m"(flags), "m"(arg),
+                              "m"(parent_tidptr), "m"(newtls), "m"(child_tidptr)
+-                           : "esp", "memory", "ecx", "edx", "esi", "edi");
++                           : "memory", "ecx", "edx", "esi", "edi");
+       LSS_RETURN(int, __res);
+     }
+ 
 @@ -2407,7 +2407,7 @@ struct kernel_statfs {
                                 "d"(LSS_SYSCALL_ARG(parent_tidptr)),
                                 "r"(LSS_SYSCALL_ARG(newtls)),
-- 
2.23.0


