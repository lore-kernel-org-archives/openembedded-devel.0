Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ln80f-00086B-H9
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 10:05:53 +0100
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 58AB268322;
	Fri, 27 Mar 2009 12:03:58 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2009 12:03:58 +0300
Message-Id: <1238144638-7541-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] busybox: update appletlib dependency patch
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
X-List-Received-Date: Fri, 27 Mar 2009 09:05:54 -0000

Previous version still failed from time to time on clean-start builds
with 4 bitbake threads and '-j16'. Building busybox as sole target worked
well.

The reason is that previous version introduced a race between applets make
processes spawned from top-level Makefile and from libbb Makefile.

Fix it with high-level dependency that doesn't create races.
---
 .../files/busybox-appletlib-dependency.patch       |   24 +++++++++++--------
 1 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/recipes/busybox/files/busybox-appletlib-dependency.patch b/recipes/busybox/files/busybox-appletlib-dependency.patch
index 85a61e8..3efd4c0 100644
--- a/recipes/busybox/files/busybox-appletlib-dependency.patch
+++ b/recipes/busybox/files/busybox-appletlib-dependency.patch
@@ -1,11 +1,15 @@
---- a/libbb/Kbuild	2008-11-09 20:28:09.000000000 +0300
-+++ b/libbb/Kbuild	2009-02-17 17:41:48.718747865 +0300
-@@ -147,3 +147,8 @@ lib-$(CONFIG_PGREP) += xregcomp.o
- lib-$(CONFIG_PKILL) += xregcomp.o
- lib-$(CONFIG_DEVFSD) += xregcomp.o
- lib-$(CONFIG_FEATURE_FIND_REGEX) += xregcomp.o
+Index: busybox-1.13.2/Makefile
+===================================================================
+--- busybox-1.13.2.orig/Makefile	2009-03-19 15:44:37.419270265 +0300
++++ busybox-1.13.2/Makefile	2009-03-19 15:45:57.737521296 +0300
+@@ -471,6 +471,10 @@
+ 		util-linux/ \
+ 		util-linux/volume_id/ \
+ 
++# Lib interdeps
++# libbb uses headers generated in applets
++libbb: applets
 +
-+libbb/appletlib.o: include/usage_compressed.h include/applet_tables.h
-+
-+include/usage_compressed.h include/applet_tables.h:
-+        $(Q)$(MAKE) $(build)=applets $@
+ endif # KBUILD_EXTMOD
+ 
+ ifeq ($(dot-config),1)
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



