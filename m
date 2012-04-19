Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SKhBu-0000Yq-Ge
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 04:33:50 +0200
Received: by pbcum15 with SMTP id um15so8233061pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 19:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wphvkkzLeYC7OHKU+++Uv7R6ah3t2ESXrXV7Wau+V1Y=;
	b=qGRd41ecq4o66iT4Hz6mxckkqU4kON7itD5mNmqyYmn3oSPqTeePhtBHhhN0WiOszz
	52yb5JeGQOEmuVMg2xNXHUvpOHsS3whmlx+KxJQhNcrG3prSDlF1OVX5l8woOQRpWp1o
	CFmjImNpKOW4m8OB0EPb0nrH2eKB2B1Ea7hmLjSHl20KBIT9s7c2u5rACyranio7EPqT
	MEDALjllIXsaJbhkhIVwkcWmprBDFrdmMtmOu2qsq1XqEh0vgE/y06pr9Z6VLzMxkRyS
	41iwau69XNigvFgVFaB8mpnHT5JsrH5bHAX3IKBOmuTHmhk5N/5WX8bWOGfrudT6ONf1
	hujQ==
Received: by 10.68.221.133 with SMTP id qe5mr1165596pbc.24.1334802261399;
	Wed, 18 Apr 2012 19:24:21 -0700 (PDT)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id sx2sm832231pbc.26.2012.04.18.19.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 19:24:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2012 19:24:10 -0700
Message-Id: <1334802250-23079-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [toolchain-layer][PATCH] gcc-4.5: Backport cpp honor sysroot patch
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
X-List-Received-Date: Thu, 19 Apr 2012 02:33:50 -0000

This patch is well vetted on gcc-4.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc   |    3 +-
 .../gcc/gcc-4.5/cpp-honour-sysroot.patch           |   36 ++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.5/cpp-honour-sysroot.patch

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
index ee4a434..8fabf30 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r48"
+PR = "r49"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -38,6 +38,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
        file://sh4-multilib.patch \
        file://arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch \
+       file://cpp-honour-sysroot.patch \
        \
        file://linaro/gcc-4.5-linaro-r99297.patch \
        file://linaro/gcc-4.5-linaro-r99298.patch \
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.5/cpp-honour-sysroot.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/cpp-honour-sysroot.patch
new file mode 100644
index 0000000..cf4c77c
--- /dev/null
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/cpp-honour-sysroot.patch
@@ -0,0 +1,36 @@
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location 
+rather than the --sysroot option specified on the commandline. If access to that directory is 
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix, 
+-isystem, -isysroot happen and the correct sysroot is used.
+
+[YOCTO #2074]
+
+Upstream-Status: Pending
+
+RP 2012/04/13
+
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1106,7 +1106,7 @@ static const struct compiler default_com
+                     %W{o*:--output-pch=%*}%V}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 1, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 1, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 1, 0},
+   {".s", "@assembler", 0, 1, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 1, 0},
+--- a/gcc/cp/lang-specs.h
++++ b/gcc/cp/lang-specs.h
+@@ -63,5 +63,5 @@ along with GCC; see the file COPYING3.
+   {".ii", "@c++-cpp-output", 0, 0, 0},
+   {"@c++-cpp-output",
+    "%{!M:%{!MM:%{!E:\
+-    cc1plus -fpreprocessed %i %(cc1_options) %2 %{+e*}\
++    cc1plus -fpreprocessed %i %I %(cc1_options) %2 %{+e*}\
+     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
-- 
1.7.9.5



