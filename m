Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.22731.1628514947126888888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L6/n8I7G;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id n12so11340687wrr.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Aug 2021 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y8xWIYws9BYEvvItzCTbvSwtS2wRhCpV/s8hm7UYsBs=;
        b=L6/n8I7Gv6RMkFlEWRNOr0BJ83Ep9auEENHpQxQ4uLos2sYs2E2k03JIaVRRrkAA+b
         fLhuVZrSsYkFvzy/s1dS39lsa+to23tT6jnu5Eb/pqJg7ODWQpXhkxtvrfftdjJIj1Pu
         b6P8PZeRlQzxgyxJ5HVPxNp94jBbgCNYo/6qNcm9z/asd/SQEwTmtP8s0cI3CMwyTVFb
         ESB3ccV90OuERhAyTmQDb6cjIe/Gq0dVSKPw1pqqeGCegvPT93vte4yPXsQnSyKnDzes
         QiZin4SvdHAMyAOehfPWg/935u1FTEvyLtMp1kJsxk9TW4dEMBKgJmTy/ROW/Mwp2AMw
         ZSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8xWIYws9BYEvvItzCTbvSwtS2wRhCpV/s8hm7UYsBs=;
        b=lZSftoQlj6Fxq+i+zLV7E3lW69bbU+6L56WzthaASqzj6wYVkuKy3csibdI5vGRqq7
         3uMRg+o309iNFEisZ3tbXJ/ZFlAhF68wfwCdKn7Sv3TkzmxDq1VYzAXF7cyQRQK6xJ2L
         Cen7/FdVd4AnlL5cDNJWBxUmpNSYgKLwEsnxUWe9lITDZ89TceVOyi1Y5PhZ3RtZ2oEt
         H82rebE8eTsG7cdoWqF1hyn4SajWFLelDS2Of6ViIYqZ4qgPdSROx0FWkM0kfCFciLo+
         u+iHOyCpvpENlp/uhSQU7srGvBwHLWQzW5YwghtQUECWNalq2QqeCN6dD0e7lkPVI6Qq
         Wg1w==
X-Gm-Message-State: AOAM531PCLWwH5bqbu7/T4gqDBAX2SxH28aEe5dF2/e23KJbMaQcRlTS
	TVh4DyvD9gT2+utm+EfCmUI098sgE9o=
X-Google-Smtp-Source: ABdhPJyHJO8dPCe9dqCzVSd5eEMdTYd3ONZBurusmiqpanu70wvGYMuZwGLkk08YMPszPVnBGYnVRQ==
X-Received: by 2002:a5d:5090:: with SMTP id a16mr25057845wrt.21.1628514945513;
        Mon, 09 Aug 2021 06:15:45 -0700 (PDT)
Return-Path: <aj.bagwell@gmail.com>
Received: from localhost.localdomain (cpc108959-cmbg20-2-0-cust309.5-4.cable.virginm.net. [80.0.21.54])
        by smtp.gmail.com with ESMTPSA id w5sm22866523wro.45.2021.08.09.06.15.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Aug 2021 06:15:45 -0700 (PDT)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH 2/2] all: manual fixes for new override syntax
Date: Mon,  9 Aug 2021 14:09:38 +0100
Message-Id: <20210809130938.12027-3-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
References: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 classes/java-library.bbclass                      | 4 ++--
 recipes-core/ant/ant-native_1.8.1.bb              | 4 ++--
 recipes-core/junit/junit_3.8.2.bb                 | 4 ++--
 recipes-core/openjdk/openjdk-8-release-common.inc | 3 ++-
 recipes-core/xml-commons/xom_1.2.10.bb            | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 62fabec..67541d2 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -54,14 +54,14 @@ ALTJARFILENAMES = "${BPN}.jar"
 
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
-do:removebinaries() {
+do_deletebinaries() {
   find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
                   -name "*.jar" -exec rm {} \;
   find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
                   -name "*.class" -exec rm {} \;
 }
 
-addtask removebinaries after do_unpack before do_patch
+addtask deletebinaries after do_unpack before do_patch
 
 do_install:append() {
   oe_jarinstall ${JARFILENAME} ${ALTJARFILENAMES}
diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index fa37dd1..8814039 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
 	junit-native jdepend-native commons-net-native commons-logging-native \
 	"
 
-do:removecruft() {
+do_deletecruft() {
 	# Removes thing that need proprietary Jar files or are otherwise problematic
 	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/image
 	rm -rf ${S}/src/main/org/apache/tools/ant/types/optional/image
@@ -30,7 +30,7 @@ do:removecruft() {
 	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/NetRexxC.java
 }
 
-addtask removecruft before do_patch after do:removebinaries
+addtask deletecruft before do_patch after do_deletebinaries
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index 4f10575..feaddc3 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -16,14 +16,14 @@ inherit java-library
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
 	mkdir -p src
-	# Prevent deletion by do:removebinaries.
+	# Prevent deletion by do_deletebinraries.
 	if [ -e src.jar ]; then
 		mv src.jar src.zip
 	fi
 	unzip -o src.zip -d src
 }
 
-addtask unpackpost before do:removebinaries after do_unpack
+addtask unpackpost before do_deletebinraries after do_unpack
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index 6c7bdd2..ff8d96e 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -1,3 +1,4 @@
+
 PATCHES_URI = "\
     file://0001-Allow-using-a-system-installed-libjpeg.patch \
     file://0002-Allow-using-a-system-installed-libpng.patch \
@@ -56,7 +57,7 @@ PATCHES_URI:append:libc-musl = "\
     ${DISABLE_AGENT_BUILD_PT2} \
     file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch \
     ${REMOVE_GLIBC_DEPENDENCIES_PT2} \
-    file://musl-0007-hotspot-os_linux:x86-remove-glibc-dependencies-fpu_c.patch \
+    file://musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch \
     file://musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch \
     file://musl-0009-jdk-musl-has-gethostby_r.patch \
 "
diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 5a71655..2520405 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -36,7 +36,7 @@ do_move_jaxen() {
 
 }
 
-addtask move_jaxen after do:removebinaries before do_patch
+addtask move_jaxen after do_deletebinraries before do_patch
 
 do_compile() {
     mkdir -p build
-- 
2.17.1

