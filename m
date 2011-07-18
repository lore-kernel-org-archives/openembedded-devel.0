Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1QivTn-0006zc-8v
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 23:35:55 +0200
Received: by gxk3 with SMTP id 3so1547263gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 14:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mpHCFAilx7aGpfRSkws1jK3yhaINfGThIEgw0UAtpfM=;
	b=oVwpbAYEraWFz8HcxvBmPi56fx3eIPc5rEVQ7xK9grBCacIzkpxambaVQzTVUCV0kH
	0botnyiC5ACExROwJgjK05Wq+84PrvEm8p5vk8B4jlOd+kzEwSNZPosA5hgQ6vZqLFA7
	nycIpzbzKndPZPhBD/E01m8xAcRb7589s8gxs=
Received: by 10.236.182.130 with SMTP id o2mr8690119yhm.77.1311024710267;
	Mon, 18 Jul 2011 14:31:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id o47sm111273yhn.2.2011.07.18.14.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 14:31:48 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2011 16:31:45 -0500
Message-Id: <1311024705-23811-1-git-send-email-Chase.Maupin@ti.com>
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
X-List-Received-Date: Mon, 18 Jul 2011 21:35:55 -0000

* Add a patch to nodejs to allow compiling with GCC versions
  less than or equal to 4.3.3.
* Define the function nodejs_get_gcc_ver to allow applying the
  patch conditionally based on compiler version.
* Patch based on post at https://github.com/joyent/node/issues/883

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...01-Add-missing-compiler-flags-for-GCC-4.3.patch |   34 ++++++++++++++++++++
 recipes/nodejs/nodejs_0.4.2.bb                     |   10 ++++++
 2 files changed, 44 insertions(+), 0 deletions(-)
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
diff --git a/recipes/nodejs/nodejs_0.4.2.bb b/recipes/nodejs/nodejs_0.4.2.bb
index 40787b4..a06247b 100644
--- a/recipes/nodejs/nodejs_0.4.2.bb
+++ b/recipes/nodejs/nodejs_0.4.2.bb
@@ -4,11 +4,21 @@ LICENSE = "MIT"
 
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
 
+# This patch should only be applied for earlier GCC versions.
+SRC_URI += "${@["", "file://0001-Add-missing-compiler-flags-for-GCC-4.3.patch"][nodejs_get_gcc_version(d) <= "4.3.3"]}"
+
 SRC_URI[md5sum] = "9e9e791e125f6a601ebc663dc99c72a8"
 SRC_URI[sha256sum] = "09b1100ca6828eedbe52418fbeb3352d71c0b1ff3344c44a5af3efb80c5b908c"
 
-- 
1.7.0.4



