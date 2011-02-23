Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETh-0000td-MW
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:10:02 +0100
Received: by gyg13 with SMTP id 13so1298129gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=yMTrKoJBHjuEhcFmkUQSm1NMJZ6h9yM/axvLt8g8KLc=;
	b=pLS8aAkThiY1umQYnzUqc/6Z2XnF8yTlPHTtyxXn19MZlXNn3pU6rwoBT2BtoigLHf
	uCjQjQQYatMYIdItP1y+9lH/1t52Ua+5Yfs0UAWcqCxtv6+pB7qJ7JeKuUzWw+Jgb3Uc
	5E4YOQgSXlB+sfVOLpejz7wBbGcerGlDuS5Mo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=uZZVK4WcXYY3xS/N+NriAiIsRdrtT/A5QM/5w4N/2lDZUKlZE+HMiCtgkOzFdgsVsI
	01XyCTsVffiz3lrRLxS5unVLpn6LcM+u1dQ7nOM17LjoiYQtfCAIOWaEewMRBH7yTkBT
	WxRVWa+0snVCnZefJmn+AI94z0nqmcV8Wfx48=
Received: by 10.147.35.1 with SMTP id n1mr5966049yaj.32.1298466520703;
	Wed, 23 Feb 2011 05:08:40 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:25 +0000
Message-Id: <1298466445-16486-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-14-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-12-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-13-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-14-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 14/14] libcap2: 2.16 -> 2.20
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
X-List-Received-Date: Wed, 23 Feb 2011 13:10:02 -0000

Fix compilation with newer kernel headers:

| .../tmp/sysroots/.../usr/include/asm/sigcontext.h:28:2: error:
|    expected specifier-qualifier-list before '__u64'
| .../tmp/sysroots/.../usr/include/asm/sigcontext.h:191:2: error:
|    expected specifier-qualifier-list before '__u64'
| make[1]: *** [capsh.o] Error 1

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/libcap/libcap2-2.16/make.patch |   33 --------------------------------
 recipes/libcap/libcap2/make.patch      |   30 +++++++++++++++++++++++++++++
 recipes/libcap/libcap2_2.16.bb         |   28 ---------------------------
 recipes/libcap/libcap2_2.20.bb         |   28 +++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 61 deletions(-)
 delete mode 100644 recipes/libcap/libcap2-2.16/make.patch
 create mode 100644 recipes/libcap/libcap2/make.patch
 delete mode 100644 recipes/libcap/libcap2_2.16.bb
 create mode 100644 recipes/libcap/libcap2_2.20.bb

diff --git a/recipes/libcap/libcap2-2.16/make.patch b/recipes/libcap/libcap2-2.16/make.patch
deleted file mode 100644
index b8508e4..0000000
--- a/recipes/libcap/libcap2-2.16/make.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Index: libcap-2.16/Make.Rules
-===================================================================
---- libcap-2.16.orig/Make.Rules	2008-12-04 08:03:30.000000000 +0100
-+++ libcap-2.16/Make.Rules	2011-01-13 22:51:04.568844000 +0100
-@@ -45,25 +45,18 @@
- KERNEL_HEADERS := $(topdir)/libcap/include
- IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
- 
--CC := gcc
--CFLAGS := -O2
--BUILD_CC := $(CC)
--BUILD_CFLAGS := $(CFLAGS) $(IPATH)
--AR := ar
--RANLIB := ranlib
-+LD=$(CC) -Wl,-x -shared
- DEBUG = -g #-DDEBUG
- WARNINGS=-fPIC -Wall -Wwrite-strings \
-         -Wpointer-arith -Wcast-qual -Wcast-align \
-         -Wstrict-prototypes -Wmissing-prototypes \
-         -Wnested-externs -Winline -Wshadow
--LD=$(CC) -Wl,-x -shared
--LDFLAGS := #-g
- 
--SYSTEM_HEADERS = /usr/include
-+SYSTEM_HEADERS ?= /usr/include
- INCS=$(topdir)/libcap/include/sys/capability.h
- LDFLAGS += -L$(topdir)/libcap
- CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
--PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
-+PAM_CAP := $(shell if [ -f $(SYSTEM_HEADERS)/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
- INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
- DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
- LIBATTR := yes
diff --git a/recipes/libcap/libcap2/make.patch b/recipes/libcap/libcap2/make.patch
new file mode 100644
index 0000000..57a2cae
--- /dev/null
+++ b/recipes/libcap/libcap2/make.patch
@@ -0,0 +1,30 @@
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -47,25 +47,18 @@
+ KERNEL_HEADERS := $(topdir)/libcap/include
+ IPATH += -fPIC -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
+ 
+-CC := gcc
+-CFLAGS := -O2
+-BUILD_CC := $(CC)
+-BUILD_CFLAGS := $(CFLAGS) $(IPATH)
+-AR := ar
+-RANLIB := ranlib
+ DEBUG = -g #-DDEBUG
+ WARNINGS=-Wall -Wwrite-strings \
+         -Wpointer-arith -Wcast-qual -Wcast-align \
+         -Wstrict-prototypes -Wmissing-prototypes \
+         -Wnested-externs -Winline -Wshadow
+ LD=$(CC) -Wl,-x -shared
+-LDFLAGS := #-g
+ 
+-SYSTEM_HEADERS = /usr/include
++SYSTEM_HEADERS ?= /usr/include
+ INCS=$(topdir)/libcap/include/sys/capability.h
+ LDFLAGS += -L$(topdir)/libcap
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG)
+-PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
++PAM_CAP := $(shell if [ -f $(SYSTEM_HEADERS)/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
+ INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
+ LIBATTR := yes
diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.bb
deleted file mode 100644
index beb45f2..0000000
--- a/recipes/libcap/libcap2_2.16.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly POSIX 6) draft 15 capabilities."
-PRIORITY = "optional"
-SECTION = "libs"
-LICENSE = "GPL"
-DEPENDS = "bison-native flex-native attr ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r3"
-
-BUILD_CFLAGS += "-I${S}/libcap/include"
-CFLAGS += "-I${S}/libcap/include"
-LDFLAGS =+ "-L../libcap"
-
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/libcap2/libcap-${PV}.tar.bz2 \
-	   file://make.patch \
-	"
-
-S = "${WORKDIR}/libcap-${PV}"
-
-EXTRA_OEMAKE = "SYSTEM_HEADERS=${STAGING_INCDIR}"
-
-do_install() {
-	install -d ${D}${includedir}/sys
-	install -m 0644 libcap/include/sys/capability.h ${D}${includedir}/sys/
-	install -d ${D}${libdir}
-	oe_libinstall -s -C libcap libcap ${D}${libdir}
-}
-
-SRC_URI[md5sum] = "6e2c9d0f3c3118e41cd07288ba9577ce"
-SRC_URI[sha256sum] = "9c5a41a5577d6f702fe4d29e92f91f1d586a2ef272f6b7fa137bae3f0e76cc2f"
diff --git a/recipes/libcap/libcap2_2.20.bb b/recipes/libcap/libcap2_2.20.bb
new file mode 100644
index 0000000..8f7dc3b
--- /dev/null
+++ b/recipes/libcap/libcap2_2.20.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly POSIX 6) draft 15 capabilities."
+PRIORITY = "optional"
+SECTION = "libs"
+LICENSE = "GPL"
+DEPENDS = "bison-native flex-native attr ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+PR = "r0"
+
+BUILD_CFLAGS += "-I${S}/libcap/include"
+CFLAGS += "-I${S}/libcap/include"
+LDFLAGS =+ "-L../libcap"
+
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/libcap2/libcap-${PV}.tar.bz2 \
+	   file://make.patch \
+	"
+
+SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
+SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"
+
+S = "${WORKDIR}/libcap-${PV}"
+
+EXTRA_OEMAKE = "SYSTEM_HEADERS=${STAGING_INCDIR}"
+
+do_install() {
+	install -d ${D}${includedir}/sys
+	install -m 0644 libcap/include/sys/capability.h ${D}${includedir}/sys/
+	install -d ${D}${libdir}
+	oe_libinstall -s -C libcap libcap ${D}${libdir}
+}
-- 
1.7.2.3



