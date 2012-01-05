Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rivd5-0004Tm-5E
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 23:17:48 +0100
Received: by iakh37 with SMTP id h37so1563522iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 14:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ch3Ven0VLVnuA7EY+zbHLzNCx9tdGJGsyi7Me6t7xKM=;
	b=NgZEI8veX5vmsNjOAlC0DlFmeHmNaGqEY9VE9sGDv54hnaGE7iXhzFX8EF+sEr3o++
	XKnh9oM8Ksys1PGNaUr51eJSRq87UJc2cclqRGJtYmNxU/9BNgCru0C2yHuZ5ca+J5o+
	65qnflEvYm7lOjTVGrKW303ZxgcC+71zBlY0w=
Received: by 10.42.168.202 with SMTP id x10mr3800955icy.4.1325801422962;
	Thu, 05 Jan 2012 14:10:22 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id f32sm202728478ibf.9.2012.01.05.14.10.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 14:10:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2012 14:09:58 -0800
Message-Id: <1325801399-24880-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-java][PATCH 1/2] llvm, openjdk: Use bb.error instread of oefatal
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
X-List-Received-Date: Thu, 05 Jan 2012 22:17:48 -0000

oefatal is not available in oe-core so replace
it with bbfatal in classes and oe.error in recipes
which use it in anonymous python. bb.fatal aborts
parsing. So we want to give an error but not
stop parsing.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/java.bbclass                      |    6 +++---
 recipes-core/llvm/llvm.inc                |    2 +-
 recipes-core/openjdk/openjdk-6-common.inc |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index 6a45065..fe24648 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -39,7 +39,7 @@ oe_jarinstall() {
       destname=$1
       ;;
     -*)
-      oefatal "oe_jarinstall: unknown option: $1"
+      bbfatal "oe_jarinstall: unknown option: $1"
       ;;
     *)
       break;
@@ -105,7 +105,7 @@ oe_makeclasspath() {
               fi
               ;;
           -*)
-              oefatal "oe_makeclasspath: unknown option: $1"
+              bbfatal "oe_makeclasspath: unknown option: $1"
               ;;
           *)
               file=$dir/$1.jar
@@ -146,7 +146,7 @@ oe_java_simple_wrapper() {
       output=$1
       ;;
     -*)
-      oefatal "oe_java_simple_wrapper: unknown option: $1"
+      bbfatal "oe_java_simple_wrapper: unknown option: $1"
       ;;
     *)
       if [ $mainclass ]
diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index c675c4d..5cc9957 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -208,7 +208,7 @@ def get_llvm_arch(d):
   elif arch == "powerpc":
     arch = "PowerPC"
   else:
-    oefatal("Your target architecture is not supported by this recipe");
+    bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
 
   return arch
 
diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 1a3c52b..461ccd9 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -158,7 +158,7 @@ def get_llvm_configure_arch(d):
   elif arch == "powerpc":
     arch = "powerpc"
   else:
-    oefatal("Your target architecture is not supported by this recipe");
+    bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
 
   return arch
 
-- 
1.7.5.4



