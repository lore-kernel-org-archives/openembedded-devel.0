Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NxINk-0007Ye-PT for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 13:16:35 +0200
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 81CE1140B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 13:13:00 +0200 (CEST)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Apr 2010 13:12:55 +0200
Message-Id: <1270120375-11311-2-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1270120375-11311-1-git-send-email-zlo@zlo.nu>
References: <1270119942-11215-1-git-send-email-zlo@zlo.nu>
	<1270120375-11311-1-git-send-email-zlo@zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] freetype 2.3.5/2.3.6: Import GetDescender() fix from Savannah from ftcalc.c 1.79 for bug report #23556.
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
X-List-Received-Date: Thu, 01 Apr 2010 11:17:13 -0000
X-List-Received-Date: Thu, 01 Apr 2010 11:17:13 -0000

From: Marc Olzheim <marc@iphion.nl>

This was fixed by freetype a month after the release of 2.3.6.
---
 .../freetype-2.3.5/ftcalc_getdescender.patch       |   13 +++++++++++++
 .../freetype-2.3.6/ftcalc_getdescender.patch       |   13 +++++++++++++
 recipes/freetype/freetype_2.3.5.bb                 |    3 ++-
 recipes/freetype/freetype_2.3.6.bb                 |    3 ++-
 4 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 recipes/freetype/freetype-2.3.5/ftcalc_getdescender.patch
 create mode 100644 recipes/freetype/freetype-2.3.6/ftcalc_getdescender.patch

diff --git a/recipes/freetype/freetype-2.3.5/ftcalc_getdescender.patch b/recipes/freetype/freetype-2.3.5/ftcalc_getdescender.patch
new file mode 100644
index 0000000..3311343
--- /dev/null
+++ b/recipes/freetype/freetype-2.3.5/ftcalc_getdescender.patch
@@ -0,0 +1,13 @@
+--- freetype-2.3.5/src/base/ftcalc.c	2007-06-11 07:51:49.000000000 +0200
++++ freetype-2.3.5/src/base/ftcalc.c	2008-06-28 00:14:23.000000000 +0200
+@@ -430,8 +430,8 @@
+       "shll  $16, %%edx\n"
+       "addl  %%edx, %%eax\n"
+       "mov   %%eax, %0\n"
+-      : "=r"(result)
+-      : "a"(a), "d"(b)
++      : "=a"(result), "+d"(b)
++      : "a"(a)
+       : "%ecx"
+     );
+     return result;
diff --git a/recipes/freetype/freetype-2.3.6/ftcalc_getdescender.patch b/recipes/freetype/freetype-2.3.6/ftcalc_getdescender.patch
new file mode 100644
index 0000000..a1ede28
--- /dev/null
+++ b/recipes/freetype/freetype-2.3.6/ftcalc_getdescender.patch
@@ -0,0 +1,13 @@
+--- freetype-2.3.6/src/base/ftcalc.c	2008-05-08 22:44:41.000000000 +0200
++++ freetype-2.3.6/src/base/ftcalc.c	2008-06-28 00:14:23.000000000 +0200
+@@ -430,8 +430,8 @@
+       "shll  $16, %%edx\n"
+       "addl  %%edx, %%eax\n"
+       "mov   %%eax, %0\n"
+-      : "=r"(result)
+-      : "a"(a), "d"(b)
++      : "=a"(result), "+d"(b)
++      : "a"(a)
+       : "%ecx"
+     );
+     return result;
diff --git a/recipes/freetype/freetype_2.3.5.bb b/recipes/freetype/freetype_2.3.5.bb
index 596d191..a6944ff 100644
--- a/recipes/freetype/freetype_2.3.5.bb
+++ b/recipes/freetype/freetype_2.3.5.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
 LICENSE = "freetype"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
+           file://ftcalc_getdescender.patch;patch=1 \
            file://fix-x86_64-build.patch;patch=1 \
            file://no-hardcode.patch;patch=1 \
 	  "
diff --git a/recipes/freetype/freetype_2.3.6.bb b/recipes/freetype/freetype_2.3.6.bb
index 0ee2414..e84cacf 100644
--- a/recipes/freetype/freetype_2.3.6.bb
+++ b/recipes/freetype/freetype_2.3.6.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
 LICENSE = "freetype"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
+  file://ftcalc_getdescender.patch;patch=1 \
   file://no-hardcode.patch;patch=1 \
   file://fix-configure.patch;patch=1 \
   file://libtool-tag.patch;patch=1 \
-- 
1.6.3.3



