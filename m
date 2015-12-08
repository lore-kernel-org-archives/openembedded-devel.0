Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 926F6605BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Dec 2015 03:50:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1306430"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2015 11:50:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 40CF940427F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Dec 2015 11:49:59 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 8 Dec 2015 11:49:58 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Dec 2015 06:49:44 +0300
Message-ID: <1449546584-1804-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-Information: Please contact the ISP for more information
X-yoursite-MailScanner-ID: 40CF940427F0.AF1FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] sessreg: add a patch to avoid build errors.
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
X-List-Received-Date: Tue, 08 Dec 2015 03:50:17 -0000
Content-Type: text/plain

Do not build man dir since it is always build failed.
This is not a good way,but can remove sessreg form PNBLACKLIST.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../sessreg/0001-Makefile.am-Error-Fix.patch       | 33 ++++++++++++++++++++++
 meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb |  7 +----
 2 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
new file mode 100644
index 0000000..2072853
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
@@ -0,0 +1,33 @@
+From 088bb4cef2c93bef312b076a8c7a3c798cbf2f19 Mon Sep 17 00:00:00 2001
+From: daicy <daicy@cn.fujitsu.com>
+Date: Tue, 8 Dec 2015 11:45:01 +0900
+Subject: [PATCH] Makefile.am: Error Fix
+
+Do not compile man dir since error always occur.
+ | sed: file filenames.sed line 3: unterminated `s' command
+ | make[2]: *** [sessreg.1] Error 1
+It is not a good way.But can remove it from PNBLACKLIST.
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cddffd0..94f7048 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,7 +18,7 @@
+ #  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+ #  PERFORMANCE OF THIS SOFTWARE.
+ 
+-SUBDIRS = man
++#SUBDIRS = man
+ bin_PROGRAMS = sessreg
+ 
+ AM_CFLAGS = $(CWARNFLAGS) $(SESSREG_CFLAGS)
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
index 2ae25b3..2e25b7d 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
@@ -3,11 +3,6 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
-
+SRC_URI += "file://0001-Makefile.am-Error-Fix.patch"
 SRC_URI[md5sum] = "e238c89dabc566e1835e1ecb61b605b9"
 SRC_URI[sha256sum] = "551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c"
-
-# | sed: file filenames.sed line 3: unterminated `s' command
-# | make[2]: *** [sessreg.1] Error 1
-# | make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/sessreg/1.1.0-r0/build/man'
-PNBLACKLIST[sessreg] ?= "BROKEN: fails to generate man pages"
-- 
1.8.4.2




