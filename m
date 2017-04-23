Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 159B177BB4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 06:55:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u65so11652563wmu.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TLusmp4Lb6kuGr54Ez9Le+kitLBzZiCB08iX4YluiuU=;
	b=Y0xgM7y9/DxdQu4WTY0wHVDB57Z0csEhfhdV6UlIU23eLn9pCXD6sHpJ4oNLiWtnUj
	tU+oeLMlWnp4D9RW1HhApLyP8yjQPGF9tKEIhmvcX/puuLihY8jijBjZ+/C8wKRD2YIb
	/YJyJ8vRDS5i6JvEKUXfVGFfbRynqcII8nGyyRk+ptrrFzxQJpJa0iblu8eAaXrSancB
	TzAsdA5AZEMOv4COlsy1BlQ1StUhPvkycMHpoLIvaGQvd/JN9+iJBLs+QZ0lvClgfLjO
	lMM886PXAf5vHiD/qVT9QXv2lapm/+PP2FYJs16dXw17awQfmaoaLm7VTOwJthDJ4tH1
	X0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TLusmp4Lb6kuGr54Ez9Le+kitLBzZiCB08iX4YluiuU=;
	b=SqoIzKEtJVAjHsVldtsexgyrNqUW3nMf9q4hV5iH49ummYVUhgQ4hGd6+IrbrmymPf
	D7B+cGT6DqkSuwj67oZloEE6chEX6Q6kyrJhs9wkTdNIenSwsmialSfhK0qT0q/aByn5
	X09AWFvuSurZCTh95GOWWheMK+qqA1a71L3GRBXf/w+sfi/dc9RFbK9yZDcxpDJuQEnk
	sQsqMe6HGJT/5cMEYCPsd8mCEbgVqUHf0CbnNkmIpL2R7yV7L02ChPjgaQyUZT4Gtu3P
	JA71IuPxCIfG+XU/D4ZLZcCjW/KwKqK4LOfFeN9jlu9eucWrvHPVVWgprCxNZndZXUx3
	uv3g==
X-Gm-Message-State: AN3rC/7VzXddEmlAqFjawrO86311k/cM1ptpUNgwf1WCr2qN4Y76Wk1w
	6Be+6/NqUkVbXA==
X-Received: by 10.28.128.197 with SMTP id b188mr4907674wmd.115.1492930531865; 
	Sat, 22 Apr 2017 23:55:31 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154])
	by smtp.gmail.com with ESMTPSA id 81sm8059503wmj.9.2017.04.22.23.55.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Apr 2017 23:55:31 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 08:54:55 +0200
Message-Id: <1492930496-6082-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
References: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java][PATCH 4/5] openjdk-8/openjre-8: merge some redundant code
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
X-List-Received-Date: Sun, 23 Apr 2017 06:55:31 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A identical PATCHES_URI_append is being set both in openjdk-8 and
openjre-8, merge them into openjdk-8-cross.inc.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 14 ++++++++++++++
 recipes-core/openjdk/openjdk-8_102b14.bb | 14 --------------
 recipes-core/openjdk/openjre-8_102b14.bb | 14 --------------
 3 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 3973fcf..247438f 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -1,6 +1,20 @@
 JDK_HOME = "${libdir_jvm}/openjdk-8"
 JRE_HOME = "${libdir_jvm}/openjre-8"
 
+# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
+# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append = "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
+    file://openjdk8-fix-shark-build.patch;apply=no \
+    file://openjdk8-fix-shark-stdc++11.patch;apply=no \
+    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
+    file://openjdk8-fix-adlc-flags.patch;apply=no \
+    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
+    file://openjdk8-fix-zero-mode-crash.patch;apply=no \
+    file://openjdk8-add-missing-linker-flags.patch;apply=no \
+"
+
 DEPENDS = "\
     openjdk-8-native zip-native ant-native libxslt \
     jpeg libpng krb5 libffi fontconfig freetype \
diff --git a/recipes-core/openjdk/openjdk-8_102b14.bb b/recipes-core/openjdk/openjdk-8_102b14.bb
index 210c897..efed329 100644
--- a/recipes-core/openjdk/openjdk-8_102b14.bb
+++ b/recipes-core/openjdk/openjdk-8_102b14.bb
@@ -1,20 +1,6 @@
 require openjdk-8-release-102b14.inc
 require openjdk-8-cross.inc
 
-# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
-# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
-# by Roman Kennke (rkennke at redhat.com)
-PATCHES_URI_append = "\
-    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
-    file://openjdk8-fix-shark-build.patch;apply=no \
-    file://openjdk8-fix-shark-stdc++11.patch;apply=no \
-    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
-    file://openjdk8-fix-adlc-flags.patch;apply=no \
-    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
-    file://openjdk8-fix-zero-mode-crash.patch;apply=no \
-    file://openjdk8-add-missing-linker-flags.patch;apply=no \
-"
-
 do_install() {
     rm -rf ${D}${JDK_HOME}
     mkdir -p ${D}${JDK_HOME}
diff --git a/recipes-core/openjdk/openjre-8_102b14.bb b/recipes-core/openjdk/openjre-8_102b14.bb
index 88160e1..f47c62c 100644
--- a/recipes-core/openjdk/openjre-8_102b14.bb
+++ b/recipes-core/openjdk/openjre-8_102b14.bb
@@ -1,20 +1,6 @@
 require openjdk-8-release-102b14.inc
 require openjdk-8-cross.inc
 
-# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
-# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
-# by Roman Kennke (rkennke at redhat.com)
-PATCHES_URI_append = "\
-    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
-    file://openjdk8-fix-shark-build.patch;apply=no \
-    file://openjdk8-fix-shark-stdc++11.patch;apply=no \
-    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
-    file://openjdk8-fix-adlc-flags.patch;apply=no \
-    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
-    file://openjdk8-fix-zero-mode-crash.patch;apply=no \
-    file://openjdk8-add-missing-linker-flags.patch;apply=no \
-"
-
 do_install() {
     rm -rf ${D}${JRE_HOME}
     mkdir -p ${D}${JRE_HOME}
-- 
2.7.4


