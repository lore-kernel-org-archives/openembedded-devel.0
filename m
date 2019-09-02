Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E32F7F39D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 09:40:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x829enBO025152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Sep 2019 02:40:49 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 02:40:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2019 17:40:47 +0800
Message-ID: <1567417247-321554-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] iscsi-initiator-utils: 2.0.876 -> 2.0.877
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
X-List-Received-Date: Mon, 02 Sep 2019 09:40:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Update GPLv2 License information

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Make-iscsid-systemd-usage-optional.patch  | 88 +++++++++++++++++++++
 ...g-config-in-Makefiles-for-newer-libraries.patch | 92 ++++++++++++++++++++++
 ...2.0.876.bb => iscsi-initiator-utils_2.0.877.bb} | 10 ++-
 3 files changed, 187 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.0.876.bb => iscsi-initiator-utils_2.0.877.bb} (92%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch
new file mode 100644
index 0000000..08248d3
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch
@@ -0,0 +1,88 @@
+From 365efb2fd3062065af4b6eb3dc1661b96557dae8 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 21 Aug 2019 16:37:53 +0800
+Subject: [PATCH] Make iscsid systemd usage optional
+
+Upstream-Status: Backport[https://github.com/open-iscsi/open-iscsi
+/commit/f71581bd641dc26d330cb8b97e5ec272dd08f811]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile     |  5 +++++
+ usr/Makefile |  2 ++
+ usr/iscsid.c | 6 ++++++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index c533e9d..1ef0921 100644
+--- a/Makefile
++++ b/Makefile
+@@ -39,6 +39,11 @@ ifneq (,$(CFLAGS))
+ export CFLAGS
+ endif
+ 
++# export systemd disablement if set
++ifneq ($(NO_SYSTEMD),)
++export NO_SYSTEMD
++endif
++
+ # Random comments:
+ # using '$(MAKE)' instead of just 'make' allows make to run in parallel
+ # over multiple makefile.
+diff --git a/usr/Makefile b/usr/Makefile
+index f9445ad..0203127 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -41,7 +41,9 @@ CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
+ CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
+ ISCSI_LIB = -L$(TOPDIR)/libopeniscsiusr -lopeniscsiusr
+ LDFLAGS += $(shell $(PKG_CONFIG) --libs libkmod)
++ifneq ($(NO_SYSTEMD),)
+ LDFLAGS += $(shell $(PKG_CONFIG) --libs libsystemd)
++endif
+ PROGRAMS = iscsid iscsiadm iscsistart
+ 
+ # libc compat files
+diff --git a/usr/iscsid.c b/usr/iscsid.c
+index 0c98440..164325e 100644
+--- a/usr/iscsid.c
++++ b/usr/iscsid.c
+@@ -34,7 +34,9 @@
+ #include <sys/wait.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#ifndef	NO_SYSTEMD
+ #include <systemd/sd-daemon.h>
++#endif
+ 
+ #include "iscsid.h"
+ #include "mgmt_ipc.h"
+@@ -339,6 +341,7 @@ static void missing_iname_warn(char *initiatorname_file)
+ /* called right before we enter the event loop */
+ static void set_state_to_ready(void)
+ {
++#ifndef	NO_SYSTEMD
+ 	if (sessions_to_recover)
+ 		sd_notify(0, "READY=1\n"
+ 				"RELOADING=1\n"
+@@ -346,14 +349,17 @@ static void set_state_to_ready(void)
+ 	else
+ 		sd_notify(0, "READY=1\n"
+ 				"STATUS=Ready to process requests\n");
++#endif
+ }
+ 
+ /* called when recovery process has been reaped */
+ static void set_state_done_reloading(void)
+ {
++#ifndef NO_SYSTEMD
+ 	sessions_to_recover = 0;
+ 	sd_notifyf(0, "READY=1\n"
+ 			"STATUS=Ready to process requests\n");
++#endif
+ }
+ 
+ int main(int argc, char *argv[])
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch
new file mode 100644
index 0000000..37b764e
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch
@@ -0,0 +1,92 @@
+From e9b49664e969fd5cad1abef7b8b59e1fb8d02a47 Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Mon, 12 Nov 2018 13:10:04 -0800
+Subject: [PATCH] Use pkg-config in Makefiles for newer libraries.
+
+These two recently-added libraries can be in different
+locations on different distros, so use pkg-config to
+added the appropriate actions in the make files.
+
+Upstream-Status: Backport[https://github.com/open-iscsi/open-iscsi/commit/
+623a81123c494f5c69dc6616bd72e838862e2f1f#diff-c4bf6688222ad28c9719cfaf88c16329]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libopeniscsiusr/Makefile |  8 +++++++-
+ usr/Makefile             | 11 ++++++++---
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/libopeniscsiusr/Makefile b/libopeniscsiusr/Makefile
+index bf7c96c..a045a45 100644
+--- a/libopeniscsiusr/Makefile
++++ b/libopeniscsiusr/Makefile
+@@ -23,6 +23,8 @@ endif
+ INCLUDE_DIR ?= $(prefix)/include
+ PKGCONF_DIR ?= $(LIB_DIR)/pkgconfig
+ 
++PKG_CONFIG = /usr/bin/pkg-config
++
+ LIBISCSI_USR_DIR=$(TOPDIR)/libopeniscsiusr
+ 
+ LIBISCSI_USR_VERSION_MAJOR=0
+@@ -43,13 +45,17 @@ OBJS = context.o misc.o session.o sysfs.o iface.o idbm.o node.o default.o
+ 
+ CFLAGS ?= -O2 -g
+ CFLAGS += -Wall -Werror -Wextra -fvisibility=hidden -fPIC
++CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
++
++LDFLAGS += $(shell $(PKG_CONFIG) --libs libkmod)
+ 
+ LIBADD =
+ 
+ all: $(LIBS) $(LIBS_MAJOR) $(TESTS) doc
+ 
+ $(LIBS): $(OBJS)
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname=$@ -o $@ $(OBJS) $(LIBADD)
++	@echo CFLAGS= $(CFLAGS)
++	$(CC) $(CFLAGS) -shared -Wl,-soname=$@ -o $@ $(OBJS) $(LDFLAGS) $(LIBADD)
+ 	ln -sf $@ $(DEVLIB)
+ 
+ $(LIBS_MAJOR): $(LIBS)
+diff --git a/usr/Makefile b/usr/Makefile
+index f9445ad..f1c35aa 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -32,11 +32,16 @@ IPC_OBJ=ioctl.o
+ endif
+ endif
+ 
++PKG_CONFIG = /usr/bin/pkg-config
++
+ CFLAGS ?= -O2 -g
+ WARNFLAGS ?= -Wall -Wstrict-prototypes
+ CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
+ 	  -I$(TOPDIR)/libopeniscsiusr
++CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
+ ISCSI_LIB = -L$(TOPDIR)/libopeniscsiusr -lopeniscsiusr
++LDFLAGS += $(shell $(PKG_CONFIG) --libs libkmod)
++LDFLAGS += $(shell $(PKG_CONFIG) --libs libsystemd)
+ PROGRAMS = iscsid iscsiadm iscsistart
+ 
+ # libc compat files
+@@ -60,14 +65,14 @@ all: $(PROGRAMS)
+ 
+ iscsid: $(ISCSI_LIB_SRCS) $(INITIATOR_SRCS) $(DISCOVERY_SRCS) \
+ 	iscsid.o session_mgmt.o discoveryd.o mntcheck.o
+-	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@  -lisns -lcrypto -lrt -lmount $(ISCSI_LIB)
++	$(CC) $(CFLAGS) $^ -o $@  -lisns -lcrypto -lrt -lmount $(LDFLAGS) $(ISCSI_LIB)
+ 
+ iscsiadm: $(ISCSI_LIB_SRCS) $(DISCOVERY_SRCS) iscsiadm.o session_mgmt.o mntcheck.o
+-	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lisns -lcrypto -lmount $(ISCSI_LIB)
++	$(CC) $(CFLAGS) $^ -o $@ -lisns -lcrypto -lmount $(LDFLAGS) $(ISCSI_LIB)
+ 
+ iscsistart: $(ISCSI_LIB_SRCS) $(INITIATOR_SRCS) $(FW_BOOT_SRCS) \
+ 		iscsistart.o statics.o
+-	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lrt $(ISCSI_LIB)
++	$(CC) $(CFLAGS) $^ -o $@ -lrt $(LDFLAGS) $(ISCSI_LIB)
+ clean:
+ 	rm -f *.o $(PROGRAMS) .depend $(LIBSYS)
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
similarity index 92%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
index 48b0783..1ba6ef0 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
@@ -7,11 +7,11 @@ disk access using SCSI commands sent over Internet Protocol networks."
 HOMEPAGE = "http://www.open-iscsi.com/"
 LICENSE = "GPLv2 & LGPLv2.1"
 SECTION = "net"
-DEPENDS = "openssl flex-native bison-native open-isns util-linux"
+DEPENDS = "openssl flex-native bison-native open-isns util-linux kmod"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "bd79e4ed1004a6035d2538a308c5930890421a22"
+SRCREV ?= "120ac127654c4644d46a74799fffe527ab1f4f42"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://0001-Fix-i586-build-issues-with-string-length-overflow.patch \
@@ -21,6 +21,8 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
+           file://0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch \
+           file://0001-Make-iscsid-systemd-usage-optional.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
@@ -39,6 +41,8 @@ EXTRA_OEMAKE = ' \
     TARGET="${TARGET_OS}" \
     BASE="${prefix}" \
     MANDIR="${mandir}" \
+    OPTFLAGS="-DNO_SYSTEMD ${CFLAGS}" \
+    NO_SYSTEMD=1 \
 '
 
 do_configure () {
-- 
2.7.4


