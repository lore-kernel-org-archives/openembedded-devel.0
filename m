Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SVRIv-0004G2-4K
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 19:49:29 +0200
Received: by yhjj56 with SMTP id j56so3331982yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=O1VxvgbcuddxtEgRviEOqoqC1nH8H2Khbt/19IZHiJs=;
	b=O+jZ0FIwCdrL17WgIXb0Zxea45jbfgY0zaWgtz74ZrXrdZljeNc1TorISD4R5mE68r
	sAA9msZzqyUJ1EkHUKfa4TX6aK+XqkJ6+Lr2oXs0yIRqXUVaHneUHRUe+Kj0gWDYXKpi
	5rSPF1LPZw/lIOD8HA4sNUJKixi4L5rcUhLreZKWYmQ4qMX1otRKFP7JQmYSIbfhwid6
	ymP2REQKOAFVdb0r9+KMuuglL7o+t5hC4OLrozixikQBxudMaZY477yen2Z5zbR/L/T3
	Nu+/EklsClpM/OmtHWsn0W557kZlJP/YaOEhBosOWFg1Fxc7LwbzI7MVIcuBRAxXyIwy
	FS7w==
Received: by 10.236.190.138 with SMTP id e10mr13117902yhn.131.1337362764626;
	Fri, 18 May 2012 10:39:24 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b8sm17834081anm.4.2012.05.18.10.39.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 10:39:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2012 14:39:16 -0300
Message-Id: <420cab725743f2126ecb613b53f7288ba629c740.1337362658.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1337362658.git.otavio@ossystems.com.br>
References: <cover.1337362658.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] nodejs: update to 0.6.18 and fix hardfloat detection
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
X-List-Received-Date: Fri, 18 May 2012 17:49:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../nodejs/nodejs/fix-hardfloat-detection.patch    |   22 ++++++++++++++++++++
 .../nodejs/{nodejs_0.6.17.bb => nodejs_0.6.18.bb}  |   12 ++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.6.17.bb => nodejs_0.6.18.bb} (84%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
new file mode 100644
index 0000000..36e8bf1
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
@@ -0,0 +1,22 @@
+Fix hardfloat detection
+
+gcc has a builtin define to denote hard abi when in use, e.g. when
+using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
+we should check that to determine which calling convention is in use
+and not __VFP_FP__ which merely indicates presence of VFP unit
+
+The fix has been provided by Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Forwarded
+
+--- a/deps/v8/src/platform-linux.cc	2012-05-17 12:52:59.329519921 -0700
++++ b/deps/v8/src/platform-linux.cc	2012-05-17 12:54:02.037521511 -0700
+@@ -212,7 +212,7 @@
+ // calling this will return 1.0 and otherwise 0.0.
+ static void ArmUsingHardFloatHelper() {
+   asm("mov r0, #0");
+-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
+   // Load 0x3ff00000 into r1 using instructions available in both ARM
+   // and Thumb mode.
+   asm("mov r1, #3");
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
similarity index 84%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
index 1be5ce1..d5785d2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
@@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
 
 DEPENDS = "openssl"
 
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
-SRC_URI[md5sum] = "55641d5d280cdd4e0c030c203107599d"
-SRC_URI[sha256sum] = "8dfe5948de27e37a14af184f06e7bd89a23c3b248af44c8ef5cffcd0e4c65778"
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://gcc-4.7.patch"
+
+SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
+SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -42,14 +44,14 @@ do_configure () {
 }
 
 do_compile_virtclass-native () {
-  make
+  make BUILDTYPE=Release
 }
 
 do_compile () {
   export PATH=${WORKDIR}:${PATH}
   export CC=gcc
   export CXX=g++
-  make
+  make BUILDTYPE=Release
 }
 
 do_install () {
-- 
1.7.2.5



