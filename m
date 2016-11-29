Return-Path: <dev@codyps.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id C8BD9719F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 16:48:12 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id j92so30634158ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=WVx3Ha+o1HFTW4Y4hE+GA/qG8gXGzUk7njCiJFuLf2g=;
	b=dLdaHPCDPp3VyDAlpyZ5ksNo3WBb2vxtts7PeVJv+RMZT/+IFEJqtXcYSLNokw7AAc
	rvIITOVeufO3TmowIGZxvQYzcODlbFHzZArNdj/kRTk769FPtwACHSNYXorCjHxgKMZX
	Yx53aZS/wgbUaj4cproOTm9WStCne0eo0BaqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WVx3Ha+o1HFTW4Y4hE+GA/qG8gXGzUk7njCiJFuLf2g=;
	b=VlQ8JyohcWsjZ7yY1gJyRESkqWnw4OQ7zO3z9yd5RLyo+k5qNU71VGZLodOtyWNhRn
	f8/0mkaDcXJ1J+g8c4PI0iwdOzS9i6duRTwTzBHpdCseJjPDY/1SzAMISeV9nd6OAtui
	TawekK09G7b9Qf86J55dBeT3F7y3T4mVR3Wb0VBthNJbeRf9UG2K5X5g0qlVbv9kPZSG
	yF3QcAXaeKEkKyKXgupcOgbILix/WXkIkqFizVehAdZeMmofnfn6LTGsP318ex+8rWCP
	dYppmYxVNPQnjRZ6E9rVamKV2NJiGtbFy9vOIqfcOjpD9cL9iUq5yOJq9+Le1r+wiJK3
	CeSg==
X-Gm-Message-State: AKaTC03bjOSXiPMMkInGjDf2SB/FTZ+cVvCXSdqDfQAVvGTIxKTFsKV221TVjmD5Na1EJA==
X-Received: by 10.107.174.88 with SMTP id x85mr23119452ioe.125.1480438093753; 
	Tue, 29 Nov 2016 08:48:13 -0800 (PST)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52])
	by smtp.gmail.com with ESMTPSA id 19sm12306514ion.9.2016.11.29.08.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 08:48:13 -0800 (PST)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:48:17 -0500
Message-Id: <20161129164817.16671-1-dev@codyps.com>
X-Mailer: git-send-email 2.10.2
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH] move from bb.data.getVar(x, d, 1) to d.getVar(x, True)
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
X-List-Received-Date: Tue, 29 Nov 2016 16:48:12 -0000

bb.data.getVar was removed, need to use the modern mechanism.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 classes/java-library.bbclass              |  4 ++--
 recipes-core/icedtea/icedtea7-native.inc  |  2 +-
 recipes-core/openjdk/openjdk-7-common.inc |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc | 10 +++++-----
 recipes-core/openjdk/openjdk-common.inc   |  6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 144cd2f..58d5a40 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -23,8 +23,8 @@ def java_package_name(d):
   pre=""
   post=""
 
-  bpn = bb.data.getVar('BPN', d, 1)
-  ml = bb.data.getVar('MLPREFIX', d, 1)
+  bpn = d.getVar('BPN', True)
+  ml = d.getVar('MLPREFIX', True)
   if not bpn.startswith("lib"):
     pre='lib'
 
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 727998c..a8428dc 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -211,7 +211,7 @@ do_compile() {
 def jdk_arch(d):
         import bb
 
-        target_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+        target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
 
         if target_arch in ['i386', 'i486', 'i586', 'i686']:
             return "x86"
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index c491195..1ac3154 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -55,7 +55,7 @@ export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 export CACAO_CONFIGURE_ARGS = " \
-    ${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']}"
+    ${@['','--enable-softfloat'][d.getVar('TARGET_FPU', True) == 'soft']}"
 
 JAVA_HOME[unexport] = "1"
 
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index c339985..def779d 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -171,7 +171,7 @@ do_configure_prepend() {
 def get_llvm_configure_arch(d):
     import bb;
 
-    arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     if arch == "x86-64" or arch == "i486" or arch == "i586" or arch == "i686":
         arch = "x86"
     elif arch == "arm":
@@ -181,7 +181,7 @@ def get_llvm_configure_arch(d):
     elif arch == "powerpc" or arch == "powerpc64":
         arch = "powerpc"
     else:
-        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+        bb.warn("%s does not support %s yet" % (d.getVar('PN', True), arch) );
 
     return arch
 
@@ -193,7 +193,7 @@ export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
 def get_jdk_arch(d):
     import bb
 
-    jdk_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
     elif jdk_arch == "powerpc":
@@ -211,8 +211,8 @@ export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
 
-OPENJDK_UPDATE_VERSION = "${@bb.data.getVar('PV', d, 1).split('b')[0]}"
-OPENJDK_BUILD_NUMBER = "b${@bb.data.getVar('PV', d, 1).split('b')[1]}"
+OPENJDK_UPDATE_VERSION = "${@d.getVar('PV', True).split('b')[0]}"
+OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV', True).split('b')[1]}"
 EXTRA_OECONF_append = "\
         --with-build-number=${OPENJDK_BUILD_NUMBER} \
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 6a72572..cdfdda8 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -25,7 +25,7 @@ B = "${S}/build"
 def get_jdk_arch(d):
     import bb
 
-    jdk_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
     elif jdk_arch == "powerpc":
@@ -45,7 +45,7 @@ JDK_FAKE = "${WORKDIR}/fake-jdk"
 def get_llvm_configure_arch(d):
     import bb;
 
-    arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     if arch == "x86-64" or arch == "i486" or arch == "i586" or arch == "i686":
         arch = "x86"
     elif arch == "arm":
@@ -55,7 +55,7 @@ def get_llvm_configure_arch(d):
     elif arch == "powerpc" or arch == "powerpc64":
         arch = "powerpc"
     else:
-        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+        bb.warn("%s does not support %s yet" % (d.getVar('PN', True), arch) );
 
     return arch
 
-- 
2.10.2


