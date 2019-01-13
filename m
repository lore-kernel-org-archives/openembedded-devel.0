Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id D06D36E47A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 11:13:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h50so16470430ede.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 03:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4GmrL+n/tb6pZuAajAjtwpcAVRsiUwoGjF9jDzPP2Ak=;
	b=rMrZlIePEbm6eFF1lcOrwwbQ7uB1o9vnsRe9SQS3rRu8cB+6XzCDUy9j6W13kScoiC
	9AaNjDOenondUuyxOJ6WieDK1BLpAw+vlWAJdM45p+uCbwHkzOFrggVNmK/h1CgBqOCF
	tVDUmjWai1e0bnjl6Ra6hRZx3YNAMb2h62HG69BwC3pgAwuAOfDhNP7/w6V6YpDuvOcP
	6dS0AphA2JiL3tshxD1yzqf4OICaGDQfb9IjOp2FG5nhqGmV8VEL0XPdW4gTlYwN9n26
	7EEdjRhdO4NUwWIpa9dZnncHuHkR7cpk6KDodto6Gh9vyPyhookjdZ25x/MaYRdPBk6a
	zXcA==
X-Gm-Message-State: AJcUukeXppgrxB844Z7ZYldwblw3GHIghERndMRz1PV63Is7geajl+9a
	lmdMhoNglxx8r7km1adENFVXCVkS
X-Google-Smtp-Source: ALg8bN4HvgRWha/Xo3AknriZce++PBdD/7z6v0Mvwk9UkOkAi2zYfQl1//6a9AF64YmJLV4gXVSR8Q==
X-Received: by 2002:a50:de49:: with SMTP id a9mr19634321edl.18.1547377990119; 
	Sun, 13 Jan 2019 03:13:10 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm2267327ejz.2.2019.01.13.03.13.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 03:13:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 11:13:08 +0000
Message-Id: <20190113111308.19021-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] remove True option to getVar calls
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
X-List-Received-Date: Sun, 13 Jan 2019 11:13:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

getVar() has been defaulting to expanding by default for
a long time (2016), thus remove the True option from
getVar() calls with a regex search and replace.

Search & replace made using the following command:
    sed -e 's|\(d\.getVar \?\)( \?\([^,()]*\), \?True)|\1(\2)|g' \
        -i $(git grep -E 'getVar ?\( ?([^,()]*), ?True\)' \
             | cut -d':' -f1 \
             | sort -u)

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 classes/java-library.bbclass              |  4 ++--
 classes/openjdk-build-helper.bbclass      | 10 +++++-----
 recipes-core/openjdk/openjdk-7-common.inc |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc |  4 ++--
 recipes-core/openjdk/openjdk-8-cross.inc  | 10 +++++-----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index e0159ba..d801930 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -27,8 +27,8 @@ def java_package_name(d):
   pre=""
   post=""
 
-  bpn = d.getVar('BPN', True)
-  ml = d.getVar('MLPREFIX', True)
+  bpn = d.getVar('BPN')
+  ml = d.getVar('MLPREFIX')
   if not bpn.startswith("lib"):
     pre='lib'
 
diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
index 01ed591..8d83e02 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -9,7 +9,7 @@ EXTRA_OEMAKE_remove_task-install = "${PARALLEL_MAKEINST}"
 # In OE we have PARALLEL_MAKE which is the actual option passed to make,
 # e.g. "-j 4".
 def openjdk_build_helper_get_parallel_make(d):
-    pm = d.getVar('PARALLEL_MAKE', True);
+    pm = d.getVar('PARALLEL_MAKE');
     if not pm or '-j' not in pm:
         return 1
 
@@ -55,7 +55,7 @@ def openjdk_build_helper_get_target_cflags(d):
 def openjdk_build_helper_get_jdk_arch(d):
     import bb
 
-    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
     elif jdk_arch == "powerpc":
@@ -73,7 +73,7 @@ def openjdk_build_helper_get_jdk_arch(d):
 def openjdk_build_helper_get_llvm_configure_arch(d):
     import bb;
 
-    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if arch in ['i386', 'i486', 'i586', 'i686', 'x86-64']:
         arch = "x86"
     elif arch in ['mipsel', 'mips']:
@@ -84,7 +84,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
         arch = "arm"
     else:
         if 'shark' in d.getVar('PACKAGECONFIG').split():
-            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN', True), arch) );
+            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN'), arch) );
 
     return arch
 
@@ -93,7 +93,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
 def openjdk_build_helper_get_icedtea_arch(d):
     import bb;
 
-    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if arch == "x86-64":
         arch = "amd64"
     elif arch in ['i386', 'i486', 'i586', 'i686']:
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 794bf58..d59a57a 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -93,7 +93,7 @@ export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 export CACAO_CONFIGURE_ARGS = " \
-    ${@['','--enable-softfloat'][d.getVar('TARGET_FPU', True) == 'soft']}"
+    ${@['','--enable-softfloat'][d.getVar('TARGET_FPU') == 'soft']}"
 
 JAVA_HOME[unexport] = "1"
 
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 4d8f935..1fbe7fe 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -163,8 +163,8 @@ export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
 
-OPENJDK_UPDATE_VERSION = "${@d.getVar('PV', True).split('b')[0]}"
-OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV', True).split('b')[1]}"
+OPENJDK_UPDATE_VERSION = "${@d.getVar('PV').split('b')[0]}"
+OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV').split('b')[1]}"
 EXTRA_OECONF_append = "\
         --with-build-number=${OPENJDK_BUILD_NUMBER} \
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d04b0d3..7d6c1a5 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -108,14 +108,14 @@ EXTRA_OEMAKE_append = '\
 '
 
 python remove_debuglink() {
-    dvar = d.getVar('PKGD', True)
-    objcopy = d.getVar("OBJCOPY", True)
+    dvar = d.getVar('PKGD')
+    objcopy = d.getVar("OBJCOPY")
 
     # Remove the previous debuglink if it has existed, because it has a different file name with that we will add.
-    if d.getVar('PN', True).find("jre") != -1:
-        file = dvar + d.getVar("JRE_HOME", True) + "/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
+    if d.getVar('PN').find("jre") != -1:
+        file = dvar + d.getVar("JRE_HOME") + "/lib/" + d.getVar("JDK_ARCH") + "/server/libjvm.so"
     else:
-        file = dvar + d.getVar("JDK_HOME", True) + "/jre/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
+        file = dvar + d.getVar("JDK_HOME") + "/jre/lib/" + d.getVar("JDK_ARCH") + "/server/libjvm.so"
 
     cmd = "'%s' --remove-section .gnu_debuglink '%s'" % (objcopy, file)
     oe.utils.getstatusoutput(cmd)
-- 
2.20.1


