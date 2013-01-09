Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tt4q2-0002P9-Gw
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 00:13:46 +0100
Received: by mail-pb0-f53.google.com with SMTP id jt11so1236080pbb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 14:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Vc66buUN65kHR2jTv1a+ErPqiNMdCbW/TNa32Nuwlyc=;
	b=jErvECXRX0BlLaU2ym22/NPjdWWEiWMcYTqgt8iHEiQFxwcpOBXOuqEzJYaQJSm3Wj
	oGqp47mDmUHlX0dh8uFyvCXli/tkL+5/Ts9V8Kj/Unnoq0FPRXEm2AHpj2RtkNPf5PxA
	ORj8qiT3L+L9mCZPXworyVugf9UMmwVsvRuk2Lh2q4ZonHmHUZK+N+3HsT8YL0xSZ9VQ
	zTc+wLC7wEGkuIGqQ26ONYKlsEVZ+awhmPhXZQLYBYL0TLewjcnyKgmPF6CHtunAUX9h
	oAgFDLkZ/wbOKZodYNvffrJp2jBF/0K6tAf3Lg0wR9ZvtxgVNxE2tecNTBEwT2dSCtNd
	C6HQ==
X-Received: by 10.68.241.65 with SMTP id wg1mr217286721pbc.141.1357772305136; 
	Wed, 09 Jan 2013 14:58:25 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id uk9sm42347803pbc.63.2013.01.09.14.58.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 14:58:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, eric@eukrea.com,
	denis@eukrea.com, otavio@ossystems.com.br
Date: Wed,  9 Jan 2013 14:58:01 -0800
Message-Id: <1357772281-15932-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-browser][PATCH] nss: Fix build for 64bit targets
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
X-List-Received-Date: Wed, 09 Jan 2013 23:13:56 -0000

it would fair to compile for x86-64 since native flags
would pass 64bit flags but internally it would append
32bit flags to linker cmdline since we did not ask for
64bit build.

This patch asks for 64bit build on x86_64 and additionally
nullifies ARCHFLAG when NATIVE_CC is set, ARCHFLAG is
one which sets the 32bit/64bit ness of ABI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-support/nss/nss-3.13.3/native_cc.patch |   27 ++++++++++++++++++++----
 recipes-support/nss/nss_3.13.3.bb              |   11 +++++++---
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/recipes-support/nss/nss-3.13.3/native_cc.patch b/recipes-support/nss/nss-3.13.3/native_cc.patch
index e0c2232..41d4980 100644
--- a/recipes-support/nss/nss-3.13.3/native_cc.patch
+++ b/recipes-support/nss/nss-3.13.3/native_cc.patch
@@ -1,7 +1,12 @@
+we need to override ARCHFLAG as well since this is set to either -m32 or -m64
+and LDFLAGS add it explicitly which means when NATIVE_CC is defined then we build
+the objects as 64bit but link them to be 32bit binary which may not fly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Index: mozilla/security/coreconf/mkdepend/Makefile
 ===================================================================
---- mozilla.orig/security/coreconf/mkdepend/Makefile	2012-02-20 18:18:35.237845874 +0100
-+++ mozilla/security/coreconf/mkdepend/Makefile	2012-02-20 18:19:15.977844984 +0100
+--- mozilla.orig/security/coreconf/mkdepend/Makefile	2013-01-09 13:23:51.747694602 -0800
++++ mozilla/security/coreconf/mkdepend/Makefile	2013-01-09 13:56:27.003734720 -0800
 @@ -64,11 +64,11 @@
  endif
  
@@ -18,8 +23,8 @@ Index: mozilla/security/coreconf/mkdepend/Makefile
  include $(DEPTH)/coreconf/rules.mk
 Index: mozilla/security/coreconf/nsinstall/Makefile
 ===================================================================
---- mozilla.orig/security/coreconf/nsinstall/Makefile	2012-02-20 18:18:28.693846017 +0100
-+++ mozilla/security/coreconf/nsinstall/Makefile	2012-02-20 18:19:40.881844444 +0100
+--- mozilla.orig/security/coreconf/nsinstall/Makefile	2013-01-09 13:23:51.747694602 -0800
++++ mozilla/security/coreconf/nsinstall/Makefile	2013-01-09 13:56:11.775734407 -0800
 @@ -58,11 +58,11 @@
  endif
  
@@ -34,3 +39,17 @@ Index: mozilla/security/coreconf/nsinstall/Makefile
  endif
  
  include $(DEPTH)/coreconf/rules.mk
+Index: mozilla/security/coreconf/Linux.mk
+===================================================================
+--- mozilla.orig/security/coreconf/Linux.mk	2013-01-09 13:50:01.427726808 -0800
++++ mozilla/security/coreconf/Linux.mk	2013-01-09 13:55:58.815734141 -0800
+@@ -98,6 +98,9 @@
+ endif
+ endif
+ 
++ifdef NATIVE_FLAGS
++    override ARCHFLAG=
++endif
+ 
+ LIBC_TAG		= _glibc
+ 
diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
index bb602b1..8b5c663 100644
--- a/recipes-support/nss/nss_3.13.3.bb
+++ b/recipes-support/nss/nss_3.13.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Mozilla's SSL and TLS implementation"
 HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
 
-PR = "r1"
+PR = "r2"
 
 LICENSE = "MPL1.1 GPL LGPL"
 LIC_FILES_CHKSUM = "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
@@ -24,6 +24,9 @@ TD = "${S}/tentative-dist"
 
 PARALLEL_MAKE = ""
 
+USE64BIT_x86-64 = "USE_64=1"
+USE64BIT ?= ""
+
 do_compile() {
 #	sed -e 's:SOURCE_PREFIX = $(CORE_DEPTH)/\.\./dist:SOURCE_PREFIX = $(CORE_DEPTH)/dist:' -i ${S}/security/coreconf/source.mk
 	make -C security/nss \
@@ -49,7 +52,8 @@ do_compile() {
 		CXX="${CXX}" \
 		RANLIB="${RANLIB}" \
 		NATIVE_CC="${BUILD_CC}" \
-		NATIVE_FLAGS="${BUILD_CFLAGS}"
+		NATIVE_FLAGS="${BUILD_CFLAGS}" \
+		${USE64BIT}
 }
 
 do_install() {
@@ -67,7 +71,8 @@ do_install() {
 		NSS_USE_SYSTEM_SQLITE=1 \
 		NSS_ENABLE_ECC=1 \
 		SOURCE_LIB_DIR="${TD}/${libdir}" \
-		SOURCE_BIN_DIR="${TD}/${bindir}"
+		SOURCE_BIN_DIR="${TD}/${bindir}" \
+		${USE64BIT}
 
 	install -d ${D}/${libdir}
 
-- 
1.7.9.5



