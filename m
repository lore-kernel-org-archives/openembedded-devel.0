Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C73E719A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 21:55:28 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id he10so27021325wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 13:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4laTli0GPndCEYCngTe4qrpz1UgvXLiKQe7oEcCMv8s=;
	b=b0iW6S6J0nC39Ed1OOucKWTHVmoso04iyppPoyu18wnH8OWmoUEdFtrzxjrZlD01F4
	5c7zVrRDK0mRBnDVJQfZTPcPN9wETkoE4MTUMxFfSSCqcyyBATdPL/+/yGDB4PfJV72R
	RDM/Yl971FlHHOD5ZLlT7pfTJ/BMsJSojJOgp0+xpiJX+VSR/n8Qvw6oSM3uxz13t5Bh
	uA9rV3hokClnIQIlDAp/uS74uVcaqB3GSXAf/4nF8KCVVF6M6w6qwM+rQqglucQ1uYvK
	o07nHcipwTAEFlRdAe4eindhWT8NBFaLfTTH1Max2i+uvUBkusCB+SCjj9XeKfkulT5u
	AmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4laTli0GPndCEYCngTe4qrpz1UgvXLiKQe7oEcCMv8s=;
	b=XHfkX9zLyx3o+meoCgZ3Lt5UqmK6ApuvOYEU0A1pUiBsD57+IznU6zKUJnW5w5lfgI
	4Gyc9YdFWviXmlU/2kLgK9TRlmRzJRuTp3YwkY5fx1mUwvprdq8JExyHGbYhtnOJFJgB
	FXlMIfU6QuPY+bkY7VbPOMz2aJxfLyKUwG4hlD2hF+aNV3OGQltRmJX6XYZhZZe1iN9e
	d7GQhtWaT3R1hWxLZ3lkdPj92Q+FMlybsqo/ufwa5PyY49xmCu/1fxiwIxcJm2N6vyZB
	X1S6JOktB3pg3WkTtypLCXS7xgiCjHxqCSznodLEjJEJh46Zr7lmehd8J37hplwnpiZo
	vHyQ==
X-Gm-Message-State: AKaTC01h4JabwFaM4LAbXpvy42DfdEbQ/5gdGLz2L1LqMmDWlygmMch/jj/YKFbCoIESPg==
X-Received: by 10.194.120.226 with SMTP id lf2mr51716872wjb.130.1480974929403; 
	Mon, 05 Dec 2016 13:55:29 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	d64sm714372wmh.3.2016.12.05.13.55.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 13:55:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2016 22:55:12 +0100
Message-Id: <1480974912-6768-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-java][PATCH] fix/enhance getVar usage
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
X-List-Received-Date: Mon, 05 Dec 2016 21:55:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* replace 'bb.data.getVar' by 'd.getVar'. This fixes build with latest master
* Expand parameter is optional now / default is true

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 classes/java-library.bbclass              |  4 ++--
 recipes-core/icedtea/icedtea7-native.inc  |  2 +-
 recipes-core/openjdk/openjdk-7-common.inc |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc | 14 +++++++-------
 recipes-core/openjdk/openjdk-common.inc   |  6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 144cd2f..4f30d51 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -23,8 +23,8 @@ def java_package_name(d):
   pre=""
   post=""
 
-  bpn = bb.data.getVar('BPN', d, 1)
-  ml = bb.data.getVar('MLPREFIX', d, 1)
+  bpn = d.getVar('BPN')
+  ml = d.getVar('MLPREFIX')
   if not bpn.startswith("lib"):
     pre='lib'
 
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 727998c..401aaf7 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -211,7 +211,7 @@ do_compile() {
 def jdk_arch(d):
         import bb
 
-        target_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+        target_arch = d.getVar('TRANSLATED_TARGET_ARCH')
 
         if target_arch in ['i386', 'i486', 'i586', 'i686']:
             return "x86"
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index c491195..ab3b30d 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -55,7 +55,7 @@ export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 export CACAO_CONFIGURE_ARGS = " \
-    ${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']}"
+    ${@['','--enable-softfloat'][d.getVar('TARGET_FPU') == 'soft']}"
 
 JAVA_HOME[unexport] = "1"
 
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index c339985..bdcfbfd 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -171,7 +171,7 @@ do_configure_prepend() {
 def get_llvm_configure_arch(d):
     import bb;
 
-    arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if arch == "x86-64" or arch == "i486" or arch == "i586" or arch == "i686":
         arch = "x86"
     elif arch == "arm":
@@ -181,7 +181,7 @@ def get_llvm_configure_arch(d):
     elif arch == "powerpc" or arch == "powerpc64":
         arch = "powerpc"
     else:
-        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+        bb.warn("%s does not support %s yet" % (d.getVar('PN'), arch) );
 
     return arch
 
@@ -193,7 +193,7 @@ export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
 def get_jdk_arch(d):
     import bb
 
-    jdk_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
     elif jdk_arch == "powerpc":
@@ -211,8 +211,8 @@ export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
 
-OPENJDK_UPDATE_VERSION = "${@bb.data.getVar('PV', d, 1).split('b')[0]}"
-OPENJDK_BUILD_NUMBER = "b${@bb.data.getVar('PV', d, 1).split('b')[1]}"
+OPENJDK_UPDATE_VERSION = "${@d.getVar('PV').split('b')[0]}"
+OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV').split('b')[1]}"
 EXTRA_OECONF_append = "\
         --with-build-number=${OPENJDK_BUILD_NUMBER} \
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
@@ -248,10 +248,10 @@ def version_specific_cflags(d):
         # in the cross case, trust that GCCVERSION is correct. This won't
         # work if the native toolchain is Clang, but as of this writing that
         # doesn't work anyway.
-        version = d.getVar('GCCVERSION', expand=True)[0]
+        version = d.getVar('GCCVERSION')[0]
 
     if version.isdigit():
-        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
+        extraflags = d.getVar('FLAGS_GCC%d' % int(version)) or ''
         return extraflags
     return ''
 
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 6a72572..dfc9476 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -25,7 +25,7 @@ B = "${S}/build"
 def get_jdk_arch(d):
     import bb
 
-    jdk_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
     elif jdk_arch == "powerpc":
@@ -45,7 +45,7 @@ JDK_FAKE = "${WORKDIR}/fake-jdk"
 def get_llvm_configure_arch(d):
     import bb;
 
-    arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    arch = d.getVar('TRANSLATED_TARGET_ARCH')
     if arch == "x86-64" or arch == "i486" or arch == "i586" or arch == "i686":
         arch = "x86"
     elif arch == "arm":
@@ -55,7 +55,7 @@ def get_llvm_configure_arch(d):
     elif arch == "powerpc" or arch == "powerpc64":
         arch = "powerpc"
     else:
-        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+        bb.warn("%s does not support %s yet" % (d.getVar('PN'), arch) );
 
     return arch
 
-- 
2.5.5


