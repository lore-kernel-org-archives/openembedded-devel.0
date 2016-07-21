Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80C596072C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 10:27:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6LARY5Q026247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 03:27:37 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 21 Jul 2016 03:27:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jul 2016 18:25:00 +0800
Message-ID: <1469096700-11775-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] makedumpfile: add makedumpfile 1.6.0
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
X-List-Received-Date: Thu, 21 Jul 2016 10:27:40 -0000
Content-Type: text/plain

* Add makedumpfile 1.6.0
* Create alias for target such as powerpc as powerpc32
* Remove hardcode CFLAGS
* Add CFLAGS_COMMON to instead of CFLAGS so can flexibly
  customize CFLAGS and not hardcode the CFLAGS as previously
* Forcibly to link dynamic library as the poky build
  system doesn't build static library by default

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...0001-makedumpfile-replace-hardcode-CFLAGS.patch | 134 +++++++++++++++++++++
 .../makedumpfile/makedumpfile_1.6.0.bb             |  60 +++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
new file mode 100644
index 0000000..d599a91
--- /dev/null
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -0,0 +1,134 @@
+From 3c2f4ff583a156a7ed2fa0cc002a413c391d063d Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 21 Jul 2016 18:06:21 +0800
+Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
+
+* Create alias for target such as powerpc as powerpc32
+* Remove hardcode CFLAGS
+* Add CFLAGS_COMMON to instead of CFLAGS so can flexibly
+  customize CFLAGS and not hardcode the CFLAGS as previously
+* Forcibly to link dynamic library as the poky build
+  system doesn't build static library by default
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile | 46 +++++++++++++++++++++++-----------------------
+ 1 file changed, 23 insertions(+), 23 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7dde3e4..c5286ac 100644
+--- a/Makefile
++++ b/Makefile
+@@ -8,13 +8,6 @@ ifeq ($(strip $CC),)
+ CC	= gcc
+ endif
+ 
+-CFLAGS = -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
+-	  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE \
+-	  -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(DATE)"'
+-CFLAGS_ARCH	= -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
+-		    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+-# LDFLAGS = -L/usr/local/lib -I/usr/local/include
+-
+ HOST_ARCH := $(shell uname -m)
+ # Use TARGET as the target architecture if specified.
+ # Defaults to uname -m
+@@ -22,29 +15,36 @@ ifeq ($(strip($TARGET)),)
+ TARGET := $(HOST_ARCH)
+ endif
+ 
+-ARCH := $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
+-			       -e s/arm.*/arm/ -e s/sa110/arm/ \
+-			       -e s/s390x/s390/ -e s/parisc64/parisc/ \
+-			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)
++ARCH := $(shell echo __${TARGET}__  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
++		       -e s/arm.*/arm/ -e s/sa110/arm/ \
++		       -e s/s390x/s390/ -e s/parisc64/parisc/ \
++		       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ \
++		       -e s/_powerpc_/_powerpc32_/)
+ 
+ CROSS :=
+ ifneq ($(TARGET), $(HOST_ARCH))
+ CROSS := -U__$(HOST_ARCH)__
+ endif
+ 
+-CFLAGS += -D__$(ARCH)__ $(CROSS)
+-CFLAGS_ARCH += -D__$(ARCH)__ $(CROSS)
++CFLAGS_ARCH += -D$(ARCH) $(CROSS)
+ 
+-ifeq ($(ARCH), powerpc64)
+-CFLAGS += -m64
++ifeq ($(ARCH), __powerpc64__)
+ CFLAGS_ARCH += -m64
+ endif
+ 
+-ifeq ($(ARCH), powerpc32)
+-CFLAGS += -m32
++ifeq ($(ARCH), __powerpc32__)
+ CFLAGS_ARCH += -m32
+ endif
+ 
++CFLAGS_ARCH += $(CFLAGS) \
++		-D_FILE_OFFSET_BITS=64 \
++		-D_LARGEFILE_SOURCE \
++		-D_LARGEFILE64_SOURCE
++
++CFLAGS_COMMON = $(CFLAGS_ARCH) \
++		-DVERSION='"$(VERSION)"' \
++		-DRELEASE_DATE='"$(DATE)"'
++
+ SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
+ SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c
+ OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
+@@ -54,17 +54,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+ 
+ LIBS = -ldw -lbz2 -lebl -ldl -lelf -lz
+ ifneq ($(LINKTYPE), dynamic)
+-LIBS := -static $(LIBS)
++LIBS := $(LIBS)
+ endif
+ 
+ ifeq ($(USELZO), on)
+ LIBS := -llzo2 $(LIBS)
+-CFLAGS += -DUSELZO
++CFLAGS_COMMON += -DUSELZO
+ endif
+ 
+ ifeq ($(USESNAPPY), on)
+ LIBS := -lsnappy $(LIBS)
+-CFLAGS += -DUSESNAPPY
++CFLAGS_COMMON += -DUSESNAPPY
+ endif
+ 
+ LIBS := -lpthread $(LIBS)
+@@ -72,14 +72,14 @@ LIBS := -lpthread $(LIBS)
+ all: makedumpfile
+ 
+ $(OBJ_PART): $(SRC_PART)
+-	$(CC) $(CFLAGS) -c -o ./$@ $(VPATH)$(@:.o=.c)
++	$(CC) $(CFLAGS_COMMON) -c -o ./$@ $(VPATH)$(@:.o=.c)
+ 
+ $(OBJ_ARCH): $(SRC_ARCH)
+ 	@mkdir -p $(@D)
+ 	$(CC) $(CFLAGS_ARCH) -c -o ./$@ $(VPATH)$(@:.o=.c)
+ 
+ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+-	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(LIBS)
++	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(LIBS)
+ 	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
+ 	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
+ 	mv temp.8 makedumpfile.8
+@@ -90,7 +90,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+ 	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
+ 
+ eppic_makedumpfile.so: extension_eppic.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
++	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
+ 
+ clean:
+ 	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8.gz makedumpfile.conf.5.gz
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
new file mode 100644
index 0000000..db13885
--- /dev/null
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
@@ -0,0 +1,60 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+# Previous versions of this recipe built a local version of elfutils.  This
+# should not be necessary unless we require a newer version of elfutils than
+# is provided by default, and that is not the case.
+#
+SUMMARY = "VMcore extraction tool"
+DESCRIPTION = "\
+	This program is used to extract a subset of the memory available either \
+	via /dev/mem or /proc/vmcore (for crashdumps). It is used to get memory \
+	images without extra uneeded information (zero pages, userspace programs, \
+	etc). \
+	"
+HOMEPAGE = "http://makedumpfile.sourceforge.net"
+
+DEPENDS = "bzip2 zlib elfutils"
+RDEPENDS_${PN}-tools = "perl ${PN}"
+
+# arm would compile but has never been tested upstream.  mips would not compile.
+#
+COMPATIBLE_HOST = "(x86_64|i.86|powerpc).*-linux"
+
+PACKAGES =+ "${PN}-tools"
+FILES_${PN}-tools = "${bindir}/*.pl"
+
+SRC_URI = "\
+	${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
+	file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+	"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "GPLv2.0"
+
+SRC_URI[md5sum] = "041c5c6de2c3066600e4ca646c2397d6"
+SRC_URI[sha256sum] = "e3147abc52df2ceac1e9affef45bf37e2f2e1d9979bc94a761ee11e4044072ac"
+
+SECTION = "base"
+
+# If we do not specify TARGET, makedumpfile will build for the host but use the
+# target gcc.
+#
+EXTRA_OEMAKE = "\
+	LINKTYPE=static \
+	TARGET=${TARGET_ARCH} \
+	"
+
+do_install () {
+	mkdir -p ${D}/usr/bin
+	install -m 755 ${S}/makedumpfile ${D}/usr/bin
+	install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin
+
+	mkdir -p ${D}/usr/share/man/man8
+	install -m 644 ${S}/makedumpfile.8.gz ${D}/usr/share/man/man8
+
+	mkdir -p ${D}/usr/share/man/man5
+	install -m 644 ${S}/makedumpfile.conf.5.gz ${D}/usr/share/man/man5
+
+	mkdir -p ${D}/etc/
+	install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.conf.sample
+}
-- 
2.8.1


