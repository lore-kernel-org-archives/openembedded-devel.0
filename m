Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7575607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uivo028317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:44 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:45 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:35 +0800
Message-ID: <90d12492dc5e4148c631e85843e0d9ae750447dc.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 15/15] openjdk hotspot build system std.h fix
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:44 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Backport from upstream from jdk9
Hotspot build system looking for sdt.h in the wrong place

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      |  2 ++
 .../patches-openjdk-7/icedtea-dtrace-std_h.patch   | 40 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-dtrace-std_h.patch

diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
index 1431301..047aac4 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -57,6 +57,7 @@ ICEDTEAPATCHES = "\
     file://icedtea-crosscompile-fix.patch;apply=no \
     file://icedtea-xawt-crosscompile-fix.patch;apply=no \
     file://icedtea-jdk-unzip.patch;apply=no \
+    file://icedtea-dtrace-std_h.patch;apply=no \
 "
 
 DISTRIBUTION_PATCHES = "\
@@ -66,6 +67,7 @@ DISTRIBUTION_PATCHES = "\
     patches/icedtea-crosscompile-fix.patch \
     patches/icedtea-xawt-crosscompile-fix.patch \
     patches/icedtea-jdk-unzip.patch \
+    patches/icedtea-dtrace-std_h.patch \
 "
 
 export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-dtrace-std_h.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-dtrace-std_h.patch
new file mode 100644
index 0000000..9ec59b7
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-dtrace-std_h.patch
@@ -0,0 +1,40 @@
+openjdk hotspot build system std.h fix
+
+Backport from upstream from jdk9
+
+    OpenJDK / jdk9 / hs-rt / hotspot
+    
+    changeset 6671:465eb6bc50d1
+    
+    8046818: Hotspot build system looking for sdt.h in the wrong place
+    Reviewed-by: sla, dholmes
+    author	mikael
+    date	Thu, 03 Jul 2014 09:16:56 -0700 (14 months ago)
+    parents	35de71d2af77
+    children	da4514678bcf
+    files	make/linux/makefiles/dtrace.make
+    diffstat	1 files changed, 8 insertions(+), 1 deletions(-) [+]
+
+Upstream-Status: Backport
+---
+ openjdk/hotspot/make/linux/makefiles/dtrace.make |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+--- openjdk/hotspot/make/linux/makefiles/dtrace.make
++++ openjdk/hotspot/make/linux/makefiles/dtrace.make
+@@ -40,7 +40,14 @@
+ ifneq ($(ALT_SDT_H),)
+   SDT_H_FILE = $(ALT_SDT_H)
+ else
+-  SDT_H_FILE = /usr/include/sys/sdt.h
++  ifeq ($(USE_CLANG), true)
++    # Clang doesn't support the -print-sysroot option and there is no known equivalent
++    # option, so fall back to using / as sysroot
++    SDT_SYSROOT=
++  else
++    SDT_SYSROOT=$(shell $(CXX) -print-sysroot)
++  endif
++  SDT_H_FILE = $(SDT_SYSROOT)/usr/include/sys/sdt.h
+ endif
+ DTRACE_ENABLED = $(shell test -f $(SDT_H_FILE) && echo $(SDT_H_FILE))
+ REASON = "$(SDT_H_FILE) not found"
-- 
1.9.1


