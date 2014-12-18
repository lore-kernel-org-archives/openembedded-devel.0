Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D2A2672482
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 06:01:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45403397"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2014 13:58:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBI61Jko012889
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:01:19 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Dec 2014 14:01:56 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Dec 2014 14:01:33 +0800
Message-ID: <1418882493-2437-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] gradm: Add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Dec 2014 06:01:52 -0000
Content-Type: text/plain

gradm is the userspace RBAC parsing and authentication program for
grsecurity. grsecurity aims to be a complete security system. gradm
performs several tasks for the RBAC system including authenticated
via a password to the kernel and parsing rules to be passed to the
kernel.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../gradm/gradm/0001-Makefile-remove-strip.patch   | 61 ++++++++++++++++++++++
 meta-oe/recipes-support/gradm/gradm_3.0.bb         | 50 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-Makefile-remove-strip.patch
 create mode 100644 meta-oe/recipes-support/gradm/gradm_3.0.bb

diff --git a/meta-oe/recipes-support/gradm/gradm/0001-Makefile-remove-strip.patch b/meta-oe/recipes-support/gradm/gradm/0001-Makefile-remove-strip.patch
new file mode 100644
index 0000000..f0c697c
--- /dev/null
+++ b/meta-oe/recipes-support/gradm/gradm/0001-Makefile-remove-strip.patch
@@ -0,0 +1,61 @@
+From fbf7b9e5a8e2978acd5b0a7a8311912a080ee9b9 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Thu, 18 Dec 2014 11:09:01 +0800
+Subject: [PATCH] Makefile: remove strip
+
+Avoid QA error by removing strip from Makefile
+
+[...]
+ERROR: QA Issue: File '/sbin/gradm' from gradm was already stripped,
+this will prevent future debugging! [already-stripped]
+ERROR: QA Issue: File '/sbin/grlearn' from gradm was already stripped,
+this will prevent future debugging! [already-stripped]
+[...]
+
+Upstream-Status: Pending
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+---
+ Makefile | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6c33fee..3570a4e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,7 +24,6 @@ MKNOD=/bin/mknod
+ #CC=/usr/bin/diet /usr/bin/gcc
+ CC=/usr/bin/gcc
+ FIND=/usr/bin/find
+-STRIP=/usr/bin/strip
+ LIBS := $(shell if [ "`uname -m`" != "sparc64" -a "`uname -m`" != "x86_64" ]; then echo "-lfl" ; else echo "" ; fi)
+ OPT_FLAGS := -O2
+ # for older versions of grsecurity, comment the above line and uncomment the below:
+@@ -140,15 +139,12 @@ install: $(GRADM_BIN) gradm.8 policy grlearn
+ 	@mkdir -p $(DESTDIR)/sbin
+ 	@echo "Installing gradm..."
+ 	@$(INSTALL) -m 0755 $(GRADM_BIN) $(DESTDIR)/sbin
+-	@$(STRIP) $(DESTDIR)/sbin/$(GRADM_BIN)
+ 	@if [ -f $(GRADM_PAM) ] ; then \
+ 		echo "Installing gradm_pam..." ; \
+		$(INSTALL) -m 4755 $(GRADM_PAM) $(DESTDIR)/sbin ; \
+-		$(STRIP) $(DESTDIR)/sbin/$(GRADM_PAM) ; \
+ 	fi
+ 	@echo "Installing grlearn..."
+ 	@$(INSTALL) -m 0700 grlearn $(DESTDIR)/sbin
+-	@$(STRIP) $(DESTDIR)/sbin/grlearn
+ 	@mkdir -p -m 700 $(DESTDIR)$(GRSEC_DIR)
+ 	@if [ ! -f $(DESTDIR)$(GRSEC_DIR)/policy ] ; then \
+ 		if [ -f $(DESTDIR)$(GRSEC_DIR)/acl ] ; then \
+@@ -168,6 +164,7 @@ install: $(GRADM_BIN) gradm.8 policy grlearn
+ 			$(MKNOD) -m 0622 $(DESTDIR)/dev/grsec c 1 13 ; \
+ 		fi \
+ 	fi
++	@mkdir -p $(DESTDIR)/etc/udev/rules.d
+ 	@if [ -d $(DESTDIR)/etc/udev/rules.d ] ; then \
+ 		echo "ACTION!=\"add|change\", GOTO=\"permissions_end\"" > $(DESTDIR)/etc/udev/rules.d/80-grsec.rules ; \
+ 		echo "KERNEL==\"grsec\",          MODE=\"0622\"" >> $(DESTDIR)/etc/udev/rules.d/80-grsec.rules ; \
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/gradm/gradm_3.0.bb b/meta-oe/recipes-support/gradm/gradm_3.0.bb
new file mode 100644
index 0000000..2f1d39d
--- /dev/null
+++ b/meta-oe/recipes-support/gradm/gradm_3.0.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Administration program for the grsecurity RBAC syste"
+DESCRIPTION = "\
+gradm is the userspace RBAC parsing and authentication program for \
+grsecurity grsecurity aims to be a complete security system. gradm \
+performs several tasks for the RBAC system including authenticated \
+via a password to the kernel and parsing rules to be passed to the \
+kernel"
+HOMEPAGE = "http://grsecurity.net/index.php"
+SECTION = "admin"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4641e94ec96f98fabc56ff9cc48be14b"
+DEPENDS = "flex-native bison-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = "http://grsecurity.net/stable/${BP}-201408301734.tar.gz \
+           file://0001-Makefile-remove-strip.patch"
+SRC_URI[md5sum] = "79ec912e6544c5e58753f658623763f9"
+SRC_URI[sha256sum] = "b190e5afecdf3ac5020a4e5e4b698645f1c01b20d036129dd8b609c4bd0c319c"
+
+S = "${WORKDIR}/gradm"
+
+inherit autotools-brokensep
+
+do_compile() {
+    oe_runmake 'CC=${CC}'                               \
+               'OPT_FLAGS=${CFLAGS}'                    \
+               'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
+               'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \
+               'BISON=${STAGING_BINDIR_NATIVE}/bison'   \
+               ${@base_contains('DISTRO_FEATURES', 'pam', ' ', 'nopam', d)}
+}
+
+do_install() {
+    oe_runmake 'CC=${CC}'                               \
+               'DESTDIR=${D}'                           \
+               'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
+               'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \
+               'BISON=${STAGING_BINDIR_NATIVE}/bison'   \
+               install
+
+    # The device nodes are generated by postinstall or udev
+    rm -rf ${D}/dev
+}
+
+pkg_postinst_${PN}() {
+    # make sure running on the target
+    if [ x"$D" != "x" ]; then
+        exit 1
+    fi
+    /bin/mknod -m 0622 /dev/grsec c 1 13
+}
-- 
1.8.3.1


