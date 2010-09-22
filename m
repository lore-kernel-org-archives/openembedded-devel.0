Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OyXQq-0000gU-Hw
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 00:04:54 +0200
Received: by pzk37 with SMTP id 37so284912pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=YJCv0Cc+9YkM6inTfQnuHxFhvkp8FrygMuGGwJZpXvY=;
	b=DCM1WGT0tWLEq2WFmPumgzooAvhg9fkqPPmnOVDDxg5XuTaz8Wlk74TjNN/CenujPS
	5tN1o0xLaGH8q1AZLbq/6AoqylOnVa0A9zEzzjwZEjSmrUBsbCWVa0UvO1SnSwbifM/x
	2J3To+Egpy+WvHfXABBITq4N9IJp+/lymHR6M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eKQQ01PKd0O2W1lIWIwbJxh6G+vjxJr3UKj21dj99WhQ2zaQCTcaU7M5QrV3EJLmOy
	mDWlrh3OJevLpnxF9QBB4Bd1OMCls1RSpnripeAjAR33r9XpwxWOuBSxsmbVGLeVLh0x
	hskAYLeUuCrR7Q0IyqfYP+bmDF7d/f3svjEJU=
Received: by 10.142.210.8 with SMTP id i8mr701349wfg.214.1285193083406;
	Wed, 22 Sep 2010 15:04:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o9sm37691wfd.16.2010.09.22.15.04.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Sep 2010 15:04:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Sep 2010 15:04:39 -0700
Message-Id: <1285193079-6696-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libnl_1.1.bb: Fix the build when libnl2 is staged
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
X-List-Received-Date: Wed, 22 Sep 2010 22:04:54 -0000

Currently linker would search for libnl in sysroot
first before linking in the one thats build with libnl
this patch directs ld to link in with the one thats
build and not look for the one in sysroot.

As a result we can compile libnl and libnl2 alongside

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnl/files/dont-link-libnl-from-sysroot.patch |   26 ++++++++++++++++++++
 recipes/libnl/libnl_1.1.bb                         |    6 +---
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 recipes/libnl/files/dont-link-libnl-from-sysroot.patch

diff --git a/recipes/libnl/files/dont-link-libnl-from-sysroot.patch b/recipes/libnl/files/dont-link-libnl-from-sysroot.patch
new file mode 100644
index 0000000..beb6361
--- /dev/null
+++ b/recipes/libnl/files/dont-link-libnl-from-sysroot.patch
@@ -0,0 +1,26 @@
+Index: libnl-1.1/src/Makefile
+===================================================================
+--- libnl-1.1.orig/src/Makefile	2008-01-14 07:48:45.000000000 -0800
++++ libnl-1.1/src/Makefile	2010-09-22 14:58:46.820826001 -0700
+@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
+     include ../Makefile.opts
+ endif
+ 
+-LDFLAGS	+= -L../lib -lnl utils.o
++LDFLAGS	+= ../lib/libnl.so utils.o
+ CIN 	:= $(wildcard nl-*.c) $(wildcard genl-*.c) $(wildcard nf-*.c)
+ TOOLS	:= $(CIN:%.c=%)
+ 
+Index: libnl-1.1/tests/Makefile
+===================================================================
+--- libnl-1.1.orig/tests/Makefile	2008-01-14 07:48:45.000000000 -0800
++++ libnl-1.1/tests/Makefile	2010-09-22 14:58:46.820826001 -0700
+@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
+     include ../Makefile.opts
+ endif
+ 
+-LDFLAGS	+= -L../lib -lnl ../src/utils.o
++LDFLAGS	+= ../lib/libnl.so ../src/utils.o
+ CIN 	:= $(wildcard test-*.c)
+ TOOLS	:= $(CIN:%.c=%)
+ 
diff --git a/recipes/libnl/libnl_1.1.bb b/recipes/libnl/libnl_1.1.bb
index 06059ca..f1b2a9d 100644
--- a/recipes/libnl/libnl_1.1.bb
+++ b/recipes/libnl/libnl_1.1.bb
@@ -3,10 +3,7 @@ SECTION = "libs/network"
 LICENSE = "LGPL"
 HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 
-# If you get errors like : undefined reference to `nl_handle_alloc
-# do a bitbake -c clean libnl2
-
-PR = "r3"
+PR = "r4"
 
 inherit autotools pkgconfig
 
@@ -18,6 +15,7 @@ SRC_URI = "\
   file://fix-includes.patch \
   file://respect-ldflags.patch \
   file://netlink-local-fix.patch \
+  file://dont-link-libnl-from-sysroot.patch \
 "
 
 
-- 
1.7.1



