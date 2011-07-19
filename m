Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Qj9V5-0007vx-CA
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 14:34:11 +0200
Received: by yxi19 with SMTP id 19so1776781yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5r+S/c2lvreCqtY4htN2kfD4hdUvRyqWA+OCvZ0z7QA=;
	b=pyfrMbd7/CT5atPczL6NuPmN2K/oel4DNQG/DT2tGWvv45WzCiDNRk1lE6mpHvVYka
	J+bqySnBsAVig791eOpjV15U1wCApOnis8XDKKpwsDNiFfxvLk7gPUheb6GRLPAAmbVL
	x9EA7OExy2BiPDrPUyf97BMkEfda09oyQuf18=
Received: by 10.150.31.18 with SMTP id e18mr6837537ybe.449.1311078604210;
	Tue, 19 Jul 2011 05:30:04 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id l3sm2357251ybc.12.2011.07.19.05.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jul 2011 05:30:03 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jul 2011 07:29:59 -0500
Message-Id: <1311078599-7474-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] nodejs: Add patch to compile with GCC 4.3.3
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
X-List-Received-Date: Tue, 19 Jul 2011 12:34:11 -0000

* Add a patch to nodejs to allow compiling with GCC versions
  less than or equal to 4.3.3.
* Define the function nodejs_get_gcc_ver to allow applying the
  patch conditionally based on compiler version.
* Patch based on post at https://github.com/joyent/node/issues/883

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...01-Add-missing-compiler-flags-for-GCC-4.3.patch |   34 ++++++++++++++++++++
 recipes/nodejs/nodejs_0.4.0.bb                     |    9 +++++
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nodejs/files/0001-Add-missing-compiler-flags-for-GCC-4.3.patch

diff --git a/recipes/nodejs/files/0001-Add-missing-compiler-flags-for-GCC-4.3.patch b/recipes/nodejs/files/0001-Add-missing-compiler-flags-for-GCC-4.3.patch
new file mode 100644
index 0000000..080b88f
--- /dev/null
+++ b/recipes/nodejs/files/0001-Add-missing-compiler-flags-for-GCC-4.3.patch
@@ -0,0 +1,34 @@
+From 7cb51ed25b688be08825950ce3f5ce2ad38e3f95 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Tue, 12 Jul 2011 11:00:48 -0500
+Subject: [PATCH] Add missing compiler flags for GCC 4.3
+
+* When compiling nodejs for GCC 4.3.3 you need to also add the
+  flag -fno-tree-sink.
+* This patch was taken from the thread at:
+    * https://github.com/joyent/node/issues/883
+* Believe that no action is taken on this change upstream because
+  it is GCC 4.3.3 specific and is not required for GCC 4.5
+
+Upstream-Status: Denied
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ deps/v8/SConstruct |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/deps/v8/SConstruct b/deps/v8/SConstruct
+index b2542fd..31c4c7b 100644
+--- a/deps/v8/SConstruct
++++ b/deps/v8/SConstruct
+@@ -210,6 +210,7 @@ LIBRARY_FLAGS = {
+     },
+     'arch:arm': {
+       'CPPDEFINES':   ['V8_TARGET_ARCH_ARM'],
++      'CCFLAGS': ['-fno-tree-sink'],
+       'unalignedaccesses:on' : {
+         'CPPDEFINES' : ['CAN_USE_UNALIGNED_ACCESSES=1']
+       },
+-- 
+1.7.0.4
+
diff --git a/recipes/nodejs/nodejs_0.4.0.bb b/recipes/nodejs/nodejs_0.4.0.bb
index be3d23e..fe8a878 100644
--- a/recipes/nodejs/nodejs_0.4.0.bb
+++ b/recipes/nodejs/nodejs_0.4.0.bb
@@ -4,11 +4,20 @@ LICENSE = "MIT"
 
 DEPENDS = "openssl"
 
+PR = "r1"
+
+def nodejs_get_gcc_version(d):
+    import subprocess,os,bb
+    if os.path.exists(bb.data.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gcc'):
+        return subprocess.Popen([bb.data.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gcc', '-v'], stderr=subprocess.PIPE).communicate()[1].splitlines()[-1].split()[2]
+
 SRC_URI = " \
   http://nodejs.org/dist/node-v${PV}.tar.gz \
   file://libev-cross-cc_${PV}.patch \
 "
 
+SRC_URI += "${@["", "file://0001-Add-missing-compiler-flags-for-GCC-4.3.patch"][nodejs_get_gcc_version(d) <= "4.3.3"]}"
+
 SRC_URI[md5sum] = "18f89256751f9b8e27dee8494f508171"
 SRC_URI[sha256sum] = "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
 
-- 
1.7.0.4



