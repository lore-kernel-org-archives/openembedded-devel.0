Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA9A72743
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381114"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:48 +0000
Message-Id: <75997a9d3f6e41037fe35f9a3c6efce0360dadbd.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/10] lcdproc: update to 0.5.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 11:01:06 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../lcdproc/lcdproc/automake-111-fix.patch          | 21 ---------------------
 .../lcdproc/{lcdproc_0.5.5.bb => lcdproc_0.5.6.bb}  |  6 ++----
 2 files changed, 2 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
 rename meta-oe/recipes-extended/lcdproc/{lcdproc_0.5.5.bb => lcdproc_0.5.6.bb} (75%)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
deleted file mode 100644
index 061cc22..0000000
--- a/meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Description: With automake 1.11.3, pkglib_PROGRAMS is not valid anymore, 
- so work around this by using my_execbin_PROGRAMS.
-Author: Andreas Moog <amoog@ubuntu.com>
-Bug-Ubuntu: https://bugs.launchpad.net/bugs/934265
-
-Upstream-Status: Backport 
-
-Index: lcdproc-0.5.5/server/drivers/Makefile.am
-===================================================================
---- lcdproc-0.5.5.orig/server/drivers/Makefile.am	2012-02-26 14:04:37.000000000 +0100
-+++ lcdproc-0.5.5/server/drivers/Makefile.am	2012-02-26 14:13:17.764467350 +0100
-@@ -20,7 +20,8 @@
- 
- ## Keep the lists sorted!
- 
--pkglib_PROGRAMS = @DRIVERS@
-+my_execbindir = $(pkglibdir)
-+my_execbin_PROGRAMS = @DRIVERS@
- EXTRA_PROGRAMS = bayrad CFontz CFontz633 CFontzPacket curses debug CwLnx ea65 EyeboxOne g15 glcdlib glk hd44780 icp_a106 imon imonlcd IOWarrior irman joy lb216 lcdm001 lcterm lirc lis MD8800 mdm166a ms6931 mtc_s16209x MtxOrb mx5000 NoritakeVFD picolcd pyramid sed1330 sed1520 serialPOS serialVFD shuttleVFD stv5730 SureElec svga t6963 text tyan sli ula200 xosd i2500vfd irtrans
- noinst_LIBRARIES = libLCD.a libbignum.a
- 
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
similarity index 75%
rename from meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
rename to meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
index 6d66af6..4761ef7 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
@@ -1,9 +1,7 @@
 require lcdproc5.inc
 
-SRC_URI += "file://automake-111-fix.patch"
-
-SRC_URI[md5sum] = "c92d4529d36eeec6d9d6fd0a4aa3ec82"
-SRC_URI[sha256sum] = "b136b47d7bf585a003334f432d8730a36ef5ed1cd520084b919667d825e48d42"
+SRC_URI[md5sum] = "df4f5c2c7285eaf6979b9c7768b4877f"
+SRC_URI[sha256sum] = "bd2f43c30ff43b30f43110abe6b4a5bc8e0267cb9f57fa97cc5e5ef9488b984a"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
-- 
1.9.3


