Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QrleH-00033H-La
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 08:55:17 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPS00353Z0A4VR4@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Aug 2011 01:50:34 -0500 (CDT)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DAEFF14AF56; Fri,
	12 Aug 2011 02:50:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2011 02:50:26 -0400
Message-id: <1313131826-22097-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.6
In-reply-to: <4E44CAC2.6010300@gmail.com>
References: <4E44CAC2.6010300@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][PATCH] gcc-4.5: update 64bithack.patch to skip changing GLIBC_DYNAMIC_LINKER64
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
X-List-Received-Date: Fri, 12 Aug 2011 06:55:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

GLIBC_DYNAMIC_LINKER* is now updated by do_headerfix() from oe-core

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/gcc/gcc-4.5/64bithack.patch   |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
index 067676a..b5ba8a4 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
@@ -18,16 +18,3 @@ Index: gcc-4.5.0/gcc/config/i386/t-linux64
  
  LIBGCC = stmp-multilib
  INSTALL_LIBGCC = install-multilib
-Index: gcc-4.5.0/gcc/config/i386/linux64.h
-===================================================================
---- gcc-4.5.0.orig/gcc/config/i386/linux64.h	2010-08-10 15:49:06.000000000 +0100
-+++ gcc-4.5.0/gcc/config/i386/linux64.h	2010-08-10 15:49:16.000000000 +0100
-@@ -59,7 +59,7 @@
-    done.  */
- 
- #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 "/lib/ld-linux-x86-64.so.2"
- 
- #if TARGET_64BIT_DEFAULT
- #define SPEC_32 "m32"
-- 
1.7.0.4



