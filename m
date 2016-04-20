Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D7E8560119
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:09:56 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p185so5268814pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=qXQHFuLq4z/tMiMEJNlmjEBk7sXiv9AsQ1utbA1fbQk=;
	b=aHiPbLZR3V5YHHOdPMM5USXzj4bYwtkXW2WNMRLgtXoAXLPaBUGXt+pMQIh8439k1x
	ssk2NSry6eGbEoDN7l8v7BSKiDaIrgBBGVXZRuT9Js1NeFrVq8Wa9Fh1yAXpa5/IEitd
	2FcOQr7/GuKWpc+Sy1LHXcxJd8ka2i8hx9nK4r16l5Fa/7mFqR6wPV/SFo6eGHCLjjjr
	xSDDDk5+sPNo+x4tDiTv1lzNgqc1tGwTf4ccCnPrl94lYPEE0pQGEut5f8EEtEEJfLji
	gvxRCwHgjfXzO0iTaJP+KsWYBqGtThFT0M/vH9o6i/k8A/VXTDch7JHIebQBzgN8Qk9R
	A2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qXQHFuLq4z/tMiMEJNlmjEBk7sXiv9AsQ1utbA1fbQk=;
	b=HT3uJuLu4Nvz21hNbstjDiprOu8ziZBghhTHyjuTH7bZP1u5xW06bGAiCkSBq6+fZw
	WQKykaulQAX6Y8rvHG6/VZFbgbsMVPVKyyAxqfnwvp+jiSvsG3h9Bx6/AS0uIWbMSB/k
	tFl5ZUhn3qC5QWDPAdcURNWy8P88ZM/ZHBHTplJyDqVIIsV9t0pTh8Fn4oIOJ7wdRZsZ
	3yvMfYSUmMLdolPkpnE+Y0jI2jPdXZLw9bHsq0R3uEHc/8dsmKMsT9ThYoVIIG/K50kE
	Ly2EDkBX2d7wwgdq4+OwCSEwuPqqsL++2nITiqR6Pe3kWqO4v8GQK+feX95gt7hdS0wE
	DYhg==
X-Gm-Message-State: AOPr4FXoONmpdzkciN3yEAWhn5r1UPppAY2y+nniQhaGjSDqupOWnvQdSUwD7tFWbH7sVQ==
X-Received: by 10.98.66.146 with SMTP id h18mr14783544pfd.27.1461182997062;
	Wed, 20 Apr 2016 13:09:57 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	127sm35400283pfe.72.2016.04.20.13.09.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 13:09:56 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2016 14:09:52 -0600
Message-Id: <1461182993-22950-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-java][PATCH 1/2] openjdk-8: make jar repacking optional
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
X-List-Received-Date: Wed, 20 Apr 2016 20:09:57 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Repacking the runtime jar files takes a long time, and is only done
to save some space. Make it optional to speed up builds that don't
need it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 21 ++++++++++++++++++++-
 recipes-core/openjdk/openjdk-8_72b05.bb  |  7 +------
 recipes-core/openjdk/openjre-8_72b05.bb  |  7 +------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 63572ad..c68ac42 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -6,7 +6,7 @@ DEPENDS = "\
     jpeg libpng krb5 libffi fontconfig freetype \
 "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "repack"
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
@@ -20,6 +20,8 @@ export WANT_LLVM_RELEASE = "3.5.2"
 PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
 PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
 
+PACKAGECONFIG[repack] = ",,,"
+
 require openjdk-8-common.inc
 
 JAVA_HOME[unexport] = "1"
@@ -49,6 +51,23 @@ do_configure_append() {
     sed -i -e 's,POST_STRIP_CMD:=.*,POST_STRIP_CMD:=,g' ${B}/spec.gmk
 }
 
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)} ; then
+      if [ -d ${D}${JDK_HOME} ] ; then
+        find ${D}${JDK_HOME} -name "*.jar" -print0 | \
+          xargs -0 -n1 -P ${@get_jdk8_native_jobs(d)} sh -c ' \
+              echo "Repacking" "$0" ; \
+              pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
+      fi
+      if [ -d ${D}${JRE_HOME} ] ; then
+        find ${D}${JRE_HOME} -name "*.jar" -print0 | \
+          xargs -0 -n1 -P ${@get_jdk8_native_jobs(d)} sh -c ' \
+              echo "Repacking" "$0" ; \
+              pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
+      fi
+    fi
+}
+
 export MAKE_VERBOSE = "y"
 export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace STRIP_POLICY=no_strip"
 
diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb b/recipes-core/openjdk/openjdk-8_72b05.bb
index feaf227..f378b0a 100644
--- a/recipes-core/openjdk/openjdk-8_72b05.bb
+++ b/recipes-core/openjdk/openjdk-8_72b05.bb
@@ -13,14 +13,9 @@ PATCHES_URI_append = "\
     file://openjdk8-fix-adlc-flags.patch;apply=no \
 "
 
-do_compile_append() {
-    find ${B}/images/j2sdk-image -name "*.jar" -print0 | \
-      xargs -0 -n1 ${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest
-}
-
 do_install() {
     rm -rf ${D}${JDK_HOME}
-        mkdir -p ${D}${JDK_HOME}
+    mkdir -p ${D}${JDK_HOME}
     cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
     chown -R root:root ${D}${JDK_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
diff --git a/recipes-core/openjdk/openjre-8_72b05.bb b/recipes-core/openjdk/openjre-8_72b05.bb
index 6202498..6d29d12 100644
--- a/recipes-core/openjdk/openjre-8_72b05.bb
+++ b/recipes-core/openjdk/openjre-8_72b05.bb
@@ -11,14 +11,9 @@ PATCHES_URI_append = "\
     file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_of_local_variable.patch;apply=no \
 "
 
-do_compile_append() {
-    find ${B}/images/j2re-image -name "*.jar" -print0 | \
-      xargs -0 -n1 ${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug
-}
-
 do_install() {
     rm -rf ${D}${JRE_HOME}
-        mkdir -p ${D}${JRE_HOME}
+    mkdir -p ${D}${JRE_HOME}
     cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
     chown -R root:root ${D}${JRE_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
-- 
2.8.1


