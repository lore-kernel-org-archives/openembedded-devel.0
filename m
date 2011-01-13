Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PdVbs-00022q-Co
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:25:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 587BB314CE10;
	Thu, 13 Jan 2011 23:25:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id eP43Bz+nnSdi; Thu, 13 Jan 2011 23:25:00 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 4D593314CE05;
	Thu, 13 Jan 2011 23:24:58 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 13 Jan 2011 22:24:58 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 22:24:58 +0000
Message-Id: <1294957498-10913-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <4D2F6EAC.40209@mentor.com>
References: <4D2F6EAC.40209@mentor.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libcap2: fix build with and without libpam
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
X-List-Received-Date: Thu, 13 Jan 2011 22:25:36 -0000

* Add libpam to depends if DISTRO_FEATURES contains pam.

* Fixes the following compile error, when libpam-dev is installed
  on the host, but not built for the target:

pam_cap.c:19:34: error: security/pam_modules.h: No such file or
directory
pam_cap.c:20:34: error: security/_pam_macros.h: No such file or
directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
CC: Otavio Salvador <otavio@ossystems.com.br>
CC: Tom Rini <tom_rini@mentor.com>
---
v2: Updated patch to fix both the dependency problem and
    the compile error without libpam.

 recipes/libcap/libcap2-2.16/make.patch |   15 ++++++++++++---
 recipes/libcap/libcap2_2.16.bb         |    6 ++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/recipes/libcap/libcap2-2.16/make.patch b/recipes/libcap/libcap2-2.16/make.patch
index 3672f77..2d88ad9 100644
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
  
@@ -21,3 +23,10 @@
  
  SYSTEM_HEADERS = /usr/include
  INCS=$(topdir)/libcap/include/sys/capability.h
+ LDFLAGS += -L$(topdir)/libcap
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
+-PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
++PAM_CAP := $(shell if [ -f $(STAGING_INCDIR)/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
+ INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
+ LIBATTR := yes
diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.bb
index 97b03d5..33594de 100644
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
 
+EXTRA_OEMAKE = "STAGING_INCDIR=${STAGING_INCDIR}"
+
 do_install() {
 	install -d ${D}${includedir}/sys
 	install -m 0644 libcap/include/sys/capability.h ${D}${includedir}/sys/
-- 
1.7.2.3



