Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA667FAA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 00:49:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,241,1569254400"; d="scan'208";a="77606891"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 08:49:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 870964B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 08:42:02 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 29 Oct 2019 08:49:58 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 29 Oct 2019 08:49:58 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Oct 2019 16:44:14 +0800
Message-ID: <1572338654-7933-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 870964B6EC86.A9A24
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] iscsi-initiator-utils: upgrade 2.0.877 -> 2.0.878
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
X-List-Received-Date: Tue, 29 Oct 2019 00:50:00 -0000
Content-Type: text/plain

1) Upgrade iscsi-initiator-utils from 2.0.877 to 2.0.878.

2) Remove patches have been merged in 2.0.878.
   0001-Fix-i586-build-issues-with-string-length-overflow.patch
   0001-Make-iscsid-systemd-usage-optional.patch
   0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch

3) Fix DEPENDS and EXTRA_OECONF for systemd as in new version systemd is default on.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-build-issues-with-string-length-overflow.patch | 115 ---------------------
 .../0001-Make-iscsid-systemd-usage-optional.patch  |  88 ----------------
 ...g-config-in-Makefiles-for-newer-libraries.patch |  92 -----------------
 ...2.0.877.bb => iscsi-initiator-utils_2.0.878.bb} |  10 +-
 4 files changed, 3 insertions(+), 302 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.0.877.bb => iscsi-initiator-utils_2.0.878.bb} (91%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch
deleted file mode 100644
index f945c63..0000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 24ce8f62e042e69497e1299212504c356179e15b Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Tue, 6 Nov 2018 11:16:06 -0800
-Subject: [PATCH] Fix i586 build issues with string length overflow.
-
-Gcc7 warns of possible string print overflow, on i586,
-when printing password length (via a macro), generating
-errors like:
-
-[   59s]   ^~~~~~~~~~~~~~~~~~~~
-[   59s] In file included from /usr/include/stdio.h:862:0,
-[   59s]                  from idbm.h:27,
-[   59s]                  from context.h:22,
-[   59s]                  from idbm.c:59:
-[   59s] /usr/include/bits/stdio2.h:64:10: note:
-'__builtin___snprintf_chk' output between 2 and 11 bytes into a
-destination of size 8
-[   59s]    return __builtin___snprintf_chk (__s, __n,
-__USE_FORTIFY_LEVEL - 1,
-[   59s]           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-~~~~~~~~~~
-[   59s]         __bos (__s), __fmt, __va_arg_pack ());
-[   59s]         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-[   59s] cc1: all warnings being treated as errors
-[   59s] make[1]: *** [<builtin>: idbm.o] Error 1
-[   59s] make[1]: Leaving directory
-
-The fix is to limit the size of the string printed, so that no
-overflow is possible.
-
-The print macros in usr/idbm.c were updated, as well, to match
-the newer version in libopeniscsiusr/idbm.c, also to help the
-i586 build.
-
-Upstream-Status: Backport[https://github.com/open-iscsi/open-iscsi/commit/24ce8f62e042e69497e1299212504c356179e15b]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- libopeniscsiusr/idbm.c |  2 +-
- usr/idbm.c             | 11 ++++++-----
- 2 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/libopeniscsiusr/idbm.c b/libopeniscsiusr/idbm.c
-index 7724de2..055dd9a 100644
---- a/libopeniscsiusr/idbm.c
-+++ b/libopeniscsiusr/idbm.c
-@@ -676,7 +676,7 @@ updated:
- 	if (!passwd_done && !strcmp(#_param, name)) { \
- 		passwd_done = 1; \
- 		name = #_param "_length"; \
--		snprintf(passwd_len, 8, "%d", (int)strlen(value)); \
-+		snprintf(passwd_len, 8, "%.7d", (int)strlen(value) & 0xffff); \
- 		value = passwd_len; \
- 		goto setup_passwd_len; \
- 	}
-diff --git a/usr/idbm.c b/usr/idbm.c
-index a0207e2..89a6c27 100644
---- a/usr/idbm.c
-+++ b/usr/idbm.c
-@@ -30,6 +30,7 @@
- #include <fcntl.h>
- #include <sys/stat.h>
- #include <sys/file.h>
-+#include <inttypes.h>
- 
- #include "idbm.h"
- #include "idbm_fields.h"
-@@ -65,7 +66,7 @@ static struct idbm *db;
- #define __recinfo_int(_key, _info, _rec, _name, _show, _n, _mod) do { \
- 	_info[_n].type = TYPE_INT; \
- 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
--	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
-+	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIi32, _rec->_name); \
- 	_info[_n].data = &_rec->_name; \
- 	_info[_n].data_len = sizeof(_rec->_name); \
- 	_info[_n].visible = _show; \
-@@ -76,7 +77,7 @@ static struct idbm *db;
- #define __recinfo_uint8(_key, _info, _rec, _name, _show, _n, _mod) do { \
- 	_info[_n].type = TYPE_UINT8; \
- 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
--	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
-+	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIu8, _rec->_name); \
- 	_info[_n].data = &_rec->_name; \
- 	_info[_n].data_len = sizeof(_rec->_name); \
- 	_info[_n].visible = _show; \
-@@ -87,7 +88,7 @@ static struct idbm *db;
- #define __recinfo_uint16(_key, _info, _rec, _name, _show, _n, _mod) do { \
- 	_info[_n].type = TYPE_UINT16; \
- 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
--	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
-+	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIu16, _rec->_name); \
- 	_info[_n].data = &_rec->_name; \
- 	_info[_n].data_len = sizeof(_rec->_name); \
- 	_info[_n].visible = _show; \
-@@ -98,7 +99,7 @@ static struct idbm *db;
- #define __recinfo_uint32(_key, _info, _rec, _name, _show, _n, _mod) do { \
- 	_info[_n].type = TYPE_UINT32; \
- 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
--	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
-+	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIu32, _rec->_name); \
- 	_info[_n].data = &_rec->_name; \
- 	_info[_n].data_len = sizeof(_rec->_name); \
- 	_info[_n].visible = _show; \
-@@ -1041,7 +1042,7 @@ updated:
- 	if (!passwd_done && !strcmp(#_param, name)) { \
- 		passwd_done = 1; \
- 		name = #_param "_length"; \
--		snprintf(passwd_len, 8, "%d", (int)strlen(value)); \
-+		snprintf(passwd_len, 8, "%.7" PRIi32, (int)strlen(value) & 0xffff); \
- 		value = passwd_len; \
- 		goto setup_passwd_len; \
- 	}
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch
deleted file mode 100644
index 08248d3..0000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Make-iscsid-systemd-usage-optional.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 365efb2fd3062065af4b6eb3dc1661b96557dae8 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 21 Aug 2019 16:37:53 +0800
-Subject: [PATCH] Make iscsid systemd usage optional
-
-Upstream-Status: Backport[https://github.com/open-iscsi/open-iscsi
-/commit/f71581bd641dc26d330cb8b97e5ec272dd08f811]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile     |  5 +++++
- usr/Makefile |  2 ++
- usr/iscsid.c | 6 ++++++
- 3 files changed, 13 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index c533e9d..1ef0921 100644
---- a/Makefile
-+++ b/Makefile
-@@ -39,6 +39,11 @@ ifneq (,$(CFLAGS))
- export CFLAGS
- endif
- 
-+# export systemd disablement if set
-+ifneq ($(NO_SYSTEMD),)
-+export NO_SYSTEMD
-+endif
-+
- # Random comments:
- # using '$(MAKE)' instead of just 'make' allows make to run in parallel
- # over multiple makefile.
-diff --git a/usr/Makefile b/usr/Makefile
-index f9445ad..0203127 100644
---- a/usr/Makefile
-+++ b/usr/Makefile
-@@ -41,7 +41,9 @@ CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
- CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
- ISCSI_LIB = -L$(TOPDIR)/libopeniscsiusr -lopeniscsiusr
- LDFLAGS += $(shell $(PKG_CONFIG) --libs libkmod)
-+ifneq ($(NO_SYSTEMD),)
- LDFLAGS += $(shell $(PKG_CONFIG) --libs libsystemd)
-+endif
- PROGRAMS = iscsid iscsiadm iscsistart
- 
- # libc compat files
-diff --git a/usr/iscsid.c b/usr/iscsid.c
-index 0c98440..164325e 100644
---- a/usr/iscsid.c
-+++ b/usr/iscsid.c
-@@ -34,7 +34,9 @@
- #include <sys/wait.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#ifndef	NO_SYSTEMD
- #include <systemd/sd-daemon.h>
-+#endif
- 
- #include "iscsid.h"
- #include "mgmt_ipc.h"
-@@ -339,6 +341,7 @@ static void missing_iname_warn(char *initiatorname_file)
- /* called right before we enter the event loop */
- static void set_state_to_ready(void)
- {
-+#ifndef	NO_SYSTEMD
- 	if (sessions_to_recover)
- 		sd_notify(0, "READY=1\n"
- 				"RELOADING=1\n"
-@@ -346,14 +349,17 @@ static void set_state_to_ready(void)
- 	else
- 		sd_notify(0, "READY=1\n"
- 				"STATUS=Ready to process requests\n");
-+#endif
- }
- 
- /* called when recovery process has been reaped */
- static void set_state_done_reloading(void)
- {
-+#ifndef NO_SYSTEMD
- 	sessions_to_recover = 0;
- 	sd_notifyf(0, "READY=1\n"
- 			"STATUS=Ready to process requests\n");
-+#endif
- }
- 
- int main(int argc, char *argv[])
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch
deleted file mode 100644
index 37b764e..0000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From e9b49664e969fd5cad1abef7b8b59e1fb8d02a47 Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Mon, 12 Nov 2018 13:10:04 -0800
-Subject: [PATCH] Use pkg-config in Makefiles for newer libraries.
-
-These two recently-added libraries can be in different
-locations on different distros, so use pkg-config to
-added the appropriate actions in the make files.
-
-Upstream-Status: Backport[https://github.com/open-iscsi/open-iscsi/commit/
-623a81123c494f5c69dc6616bd72e838862e2f1f#diff-c4bf6688222ad28c9719cfaf88c16329]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libopeniscsiusr/Makefile |  8 +++++++-
- usr/Makefile             | 11 ++++++++---
- 2 files changed, 15 insertions(+), 4 deletions(-)
-
-diff --git a/libopeniscsiusr/Makefile b/libopeniscsiusr/Makefile
-index bf7c96c..a045a45 100644
---- a/libopeniscsiusr/Makefile
-+++ b/libopeniscsiusr/Makefile
-@@ -23,6 +23,8 @@ endif
- INCLUDE_DIR ?= $(prefix)/include
- PKGCONF_DIR ?= $(LIB_DIR)/pkgconfig
- 
-+PKG_CONFIG = /usr/bin/pkg-config
-+
- LIBISCSI_USR_DIR=$(TOPDIR)/libopeniscsiusr
- 
- LIBISCSI_USR_VERSION_MAJOR=0
-@@ -43,13 +45,17 @@ OBJS = context.o misc.o session.o sysfs.o iface.o idbm.o node.o default.o
- 
- CFLAGS ?= -O2 -g
- CFLAGS += -Wall -Werror -Wextra -fvisibility=hidden -fPIC
-+CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
-+
-+LDFLAGS += $(shell $(PKG_CONFIG) --libs libkmod)
- 
- LIBADD =
- 
- all: $(LIBS) $(LIBS_MAJOR) $(TESTS) doc
- 
- $(LIBS): $(OBJS)
--	$(CC) $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname=$@ -o $@ $(OBJS) $(LIBADD)
-+	@echo CFLAGS= $(CFLAGS)
-+	$(CC) $(CFLAGS) -shared -Wl,-soname=$@ -o $@ $(OBJS) $(LDFLAGS) $(LIBADD)
- 	ln -sf $@ $(DEVLIB)
- 
- $(LIBS_MAJOR): $(LIBS)
-diff --git a/usr/Makefile b/usr/Makefile
-index f9445ad..f1c35aa 100644
---- a/usr/Makefile
-+++ b/usr/Makefile
-@@ -32,11 +32,16 @@ IPC_OBJ=ioctl.o
- endif
- endif
- 
-+PKG_CONFIG = /usr/bin/pkg-config
-+
- CFLAGS ?= -O2 -g
- WARNFLAGS ?= -Wall -Wstrict-prototypes
- CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
- 	  -I$(TOPDIR)/libopeniscsiusr
-+CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
- ISCSI_LIB = -L$(TOPDIR)/libopeniscsiusr -lopeniscsiusr
-+LDFLAGS += $(shell $(PKG_CONFIG) --libs libkmod)
-+LDFLAGS += $(shell $(PKG_CONFIG) --libs libsystemd)
- PROGRAMS = iscsid iscsiadm iscsistart
- 
- # libc compat files
-@@ -60,14 +65,14 @@ all: $(PROGRAMS)
- 
- iscsid: $(ISCSI_LIB_SRCS) $(INITIATOR_SRCS) $(DISCOVERY_SRCS) \
- 	iscsid.o session_mgmt.o discoveryd.o mntcheck.o
--	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@  -lisns -lcrypto -lrt -lmount $(ISCSI_LIB)
-+	$(CC) $(CFLAGS) $^ -o $@  -lisns -lcrypto -lrt -lmount $(LDFLAGS) $(ISCSI_LIB)
- 
- iscsiadm: $(ISCSI_LIB_SRCS) $(DISCOVERY_SRCS) iscsiadm.o session_mgmt.o mntcheck.o
--	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lisns -lcrypto -lmount $(ISCSI_LIB)
-+	$(CC) $(CFLAGS) $^ -o $@ -lisns -lcrypto -lmount $(LDFLAGS) $(ISCSI_LIB)
- 
- iscsistart: $(ISCSI_LIB_SRCS) $(INITIATOR_SRCS) $(FW_BOOT_SRCS) \
- 		iscsistart.o statics.o
--	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lrt $(ISCSI_LIB)
-+	$(CC) $(CFLAGS) $^ -o $@ -lrt $(LDFLAGS) $(ISCSI_LIB)
- clean:
- 	rm -f *.o $(PROGRAMS) .depend $(LIBSYS)
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.878.bb
similarity index 91%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.878.bb
index 3cef70f..6dd06f5 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.878.bb
@@ -8,21 +8,19 @@ HOMEPAGE = "http://www.open-iscsi.com/"
 LICENSE = "GPLv2 & LGPLv2.1"
 SECTION = "net"
 DEPENDS = "openssl flex-native bison-native open-isns util-linux kmod"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "120ac127654c4644d46a74799fffe527ab1f4f42"
+SRCREV ?= "288add22d6b61cc68ede358faeec9affb15019cd"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
-           file://0001-Fix-i586-build-issues-with-string-length-overflow.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
-           file://0001-Use-pkg-config-in-Makefiles-for-newer-libraries.patch \
-           file://0001-Make-iscsid-systemd-usage-optional.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
@@ -35,15 +33,13 @@ EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
     --host=${BUILD_SYS} \
 "
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '--without-systemd',     d)}"
 
 EXTRA_OEMAKE = ' \
     OS="${TARGET_SYS}" \
     TARGET="${TARGET_OS}" \
     BASE="${prefix}" \
     MANDIR="${mandir}" \
-    OPTFLAGS="-DNO_SYSTEMD ${CFLAGS}" \
-    PKG_CONFIG="${STAGING_BINDIR_NATIVE}/pkg-config" \
-    NO_SYSTEMD=1 \
 '
 
 do_configure () {
-- 
2.7.4




