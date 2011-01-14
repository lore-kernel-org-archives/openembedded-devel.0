Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PdYgV-0005VO-4f
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 02:42:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D9625314CDE6;
	Fri, 14 Jan 2011 02:42:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CncjLFaygX6R; Fri, 14 Jan 2011 02:41:58 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 3F8DB314CD68;
	Fri, 14 Jan 2011 02:41:57 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 14 Jan 2011 01:41:57 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jan 2011 01:41:56 +0000
Message-Id: <1294969316-3249-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTimjXn3ZN7cfz0P-Yjd5JLJrdfRZuTU2ky20CLqY@mail.gmail.com>
References: <AANLkTimjXn3ZN7cfz0P-Yjd5JLJrdfRZuTU2ky20CLqY@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] libcap2: fix build with and without libpam
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
X-List-Received-Date: Fri, 14 Jan 2011 01:42:35 -0000

* Add libpam to depends if DISTRO_FEATURES contains pam.

* Fixes the following compile error, when libpam-dev is installed
  on the host, but not built for the target:

pam_cap.c:19:34: error: security/pam_modules.h: No such file or directory
pam_cap.c:20:34: error: security/_pam_macros.h: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
CC: Otavio Salvador <otavio@ossystems.com.br>
CC: Tom Rini <tom_rini@mentor.com>
CC: Khem Raj <raj.khem@gmail.com>
---
v3: Use SYSTEM_HEADERS instead of STAGING_INCDIR.

 recipes/libcap/libcap2-2.16/make.patch |   18 ++++++++++++++----
 recipes/libcap/libcap2_2.16.bb         |    6 ++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/recipes/libcap/libcap2-2.16/make.patch b/recipes/libcap/libcap2-2.16/make.patch
index 3672f77..b8508e4 100644
--- a/recipes/libcap/libcap2-2.16/make.patch
+++ b/recipes/libcap/libcap2-2.16/make.patch
@@ -1,6 +1,8 @@
---- libcap-2.16/Make.Rules.orig	2009-03-07 18:50:23.000000000 +0100
-+++ libcap-2.16/Make.Rules	2009-03-07 18:50:44.000000000 +0100
-@@ -45,19 +45,12 @@
+Index: libcap-2.16/Make.Rules
+===================================================================
+--- libcap-2.16.orig/Make.Rules	2008-12-04 08:03:30.000000000 +0100
++++ libcap-2.16/Make.Rules	2011-01-13 22:51:04.568844000 +0100
+@@ -45,25 +45,18 @@
  KERNEL_HEADERS := $(topdir)/libcap/include
  IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
  
@@ -19,5 +21,13 @@
 -LD=$(CC) -Wl,-x -shared
 -LDFLAGS := #-g
  
- SYSTEM_HEADERS = /usr/include
+-SYSTEM_HEADERS = /usr/include
++SYSTEM_HEADERS ?= /usr/include
  INCS=$(topdir)/libcap/include/sys/capability.h
+ LDFLAGS += -L$(topdir)/libcap
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
+-PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
++PAM_CAP := $(shell if [ -f $(SYSTEM_HEADERS)/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
+ INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
+ LIBATTR := yes
diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.bb
index 97b03d5..beb45f2 100644
--- a/recipes/libcap/libcap2_2.16.bb
+++ b/recipes/libcap/libcap2_2.16.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly PO
 PRIORITY = "optional"
 SECTION = "libs"
 LICENSE = "GPL"
-DEPENDS = "bison-native flex-native attr"
-PR = "r2"
+DEPENDS = "bison-native flex-native attr ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+PR = "r3"
 
 BUILD_CFLAGS += "-I${S}/libcap/include"
 CFLAGS += "-I${S}/libcap/include"
@@ -15,6 +15,8 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/libcap2/libca
 
 S = "${WORKDIR}/libcap-${PV}"
 
+EXTRA_OEMAKE = "SYSTEM_HEADERS=${STAGING_INCDIR}"
+
 do_install() {
 	install -d ${D}${includedir}/sys
 	install -m 0644 libcap/include/sys/capability.h ${D}${includedir}/sys/
-- 
1.7.2.3



