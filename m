Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 73F8575A06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 21:44:08 +0000 (UTC)
Received: by iefd2 with SMTP id d2so7177442ief.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 14:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gKUyxFdZ23FsjJPUfWOZfmGg8mOl5IrJ3O/RpQ/sK34=;
	b=gzsHvcftSHNmNrLci3NCDkN2QIkwXJCbZ0huV8pBT29rfggjiS56SjrGnW56sdKIk/
	70IOFy6OqvltSyBCBvP6CLNs27+EvZlTtMtakBXsxMkFeC8KvqDzQ/lJaS177a80bYUq
	2kTEYF8nWz/tVywGoAHpzdgqOBW0kvI3qhr4RLcecGkAkSgZK8zYzDXAEPQao8d4LL/y
	dJ4j5QM8KS69jgLSM+cdt4367ksP5uAhIq9sUzQYvv9Qa2Hd/3CGt3vFvgnnRTJ3JkAg
	0mrMviT0ZKZWl103EZPr63VWDW5GMOIklQssamebMaR8oYJh9EdhHen99Fd/KFov5aSW
	RKoA==
X-Received: by 10.50.66.167 with SMTP id g7mr242433igt.22.1434663849641;
	Thu, 18 Jun 2015 14:44:09 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	y124sm5740311iod.13.2015.06.18.14.44.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jun 2015 14:44:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2015 14:43:50 -0700
Message-Id: <1434663830-14847-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] llvm3.3: fix error output from configure if CFLAGS is set
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
X-List-Received-Date: Thu, 18 Jun 2015 21:44:11 -0000

Error is cosmetic, but distracting. Backport upstream fix.

  | .../build-vbox32/tmp/work/core2-32-rdk-linux-musl/llvm3.3/3.3-r0/llvm-3.3.src/configure: line 1990: -O2: command not found
  | .../build-vbox32/tmp/work/core2-32-rdk-linux-musl/llvm3.3/3.3-r0/llvm-3.3.src/configure: line 1991: -O2: command not found

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...r-output-from-configure-if-CFLAGS-is-set-.patch | 52 ++++++++++++++++++++++
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb           |  3 ++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch

diff --git a/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch b/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch
new file mode 100644
index 0000000..44387e8
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch
@@ -0,0 +1,52 @@
+From d4bf7a3853dab12c11cbfc8088fd76f548a8d017 Mon Sep 17 00:00:00 2001
+From: Patrik Hagglund <patrik.h.hagglund@ericsson.com>
+Date: Tue, 24 Sep 2013 11:38:45 +0000
+Subject: [PATCH] Remove error output from configure if CFLAGS is set (r174313).
+
+This fixes PR16724.
+
+git-svn-id: https://llvm.org/svn/llvm-project/llvm/trunk@191289 91177308-0d34-0410-b5e6-96231b3b80d8
+
+https://github.com/llvm-mirror/llvm/commit/d4bf7a3853dab12c11cbfc8088fd76f548a8d017
+
+Upstream-Status: Backport
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ autoconf/configure.ac | 4 ++--
+ configure             | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/autoconf/configure.ac b/autoconf/configure.ac
+index f9c365c..45f2fe4 100644
+--- a/autoconf/configure.ac
++++ b/autoconf/configure.ac
+@@ -61,8 +61,8 @@ fi
+ 
+ dnl Default to empty (i.e. assigning the null string to) CFLAGS and CXXFLAGS,
+ dnl instead of the autoconf default (for example, '-g -O2' for CC=gcc).
+-${CFLAGS=}
+-${CXXFLAGS=}
++: ${CFLAGS=}
++: ${CXXFLAGS=}
+ 
+ dnl We need to check for the compiler up here to avoid anything else
+ dnl starting with a different one.
+diff --git a/configure b/configure
+index f3a6594..9090cda 100755
+--- a/configure
++++ b/configure
+@@ -1992,8 +1992,8 @@ echo "$as_me: error: Already configured in ${srcdir}" >&2;}
+   fi
+ fi
+ 
+-${CFLAGS=}
+-${CXXFLAGS=}
++: ${CFLAGS=}
++: ${CXXFLAGS=}
+ 
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 4617efa..f0598a7 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -3,7 +3,10 @@ require llvm.inc
 DEPENDS += "zlib"
 EXTRA_OECONF += "--enable-zlib"
 
+SRC_URI += "file://Remove-error-output-from-configure-if-CFLAGS-is-set-.patch"
+
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
+
 SRC_URI[md5sum] = "40564e1dc390f9844f1711c08b08e391"
 SRC_URI[sha256sum] = "68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578"
 
-- 
1.9.1


