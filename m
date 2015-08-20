Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A8EF073E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:42:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99841083"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Aug 2015 16:45:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7K8g0NT010146
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:42:01 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 20 Aug 2015 16:42:04 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Aug 2015 16:41:49 +0800
Message-ID: <1440060109-1615-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] drbd: upgrade 8.4.4 -> 8.9.3
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
X-List-Received-Date: Thu, 20 Aug 2015 08:42:14 -0000
Content-Type: text/plain

* Change recipe name from drbd to drbd-utils,since
  after 8.4.5, the drbd userland tools had been moved to
  their own repository at http://git.linbit.com/drbd-utils.git
  (tarball at http://oss.linbit.com/drbd)

* Add 0001-Makefile.in-don-t-compile-documentation.patch to
  avoid build Errors.

* Dropped drbd.service,since it is provided by Upstream.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...1-Makefile.in-don-t-compile-documentation.patch | 38 ++++++++++++++++++++++
 .../drbd/{drbd_8.4.4.bb => drbd-utils_8.9.3.bb}    | 35 +++++++-------------
 .../recipes-support/drbd/drbd/drbd.service         | 12 -------
 3 files changed, 49 insertions(+), 36 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch
 rename meta-networking/recipes-support/drbd/{drbd_8.4.4.bb => drbd-utils_8.9.3.bb} (51%)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd/drbd.service

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch
new file mode 100644
index 0000000..1de4a86
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch
@@ -0,0 +1,38 @@
+From feccf89f08a455460668cf286151662e4c1557b3 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 20 Aug 2015 15:32:30 +0900
+Subject: [PATCH] Makefile.in: don't compile documentation
+
+The documentation file is not suitable for cross-compile,
+Errors will occur:
+| /bin/sh: ../../user/v9/drbdsetup: /lib/ld-linux-x86-64.so.2: bad ELF interpreter: No such file or directory
+| ../../user/v9/drbdsetup xml-help disk-options > drbdsetup_xml-help_disk-options.xml
+| /bin/sh: ../../user/v9/drbdsetup: /lib/ld-linux-x86-64.so.2: bad ELF interpreter: No such file or directory
+| /bin/sh: ../../user/v9/drbdsetup: /lib/ld-linux-x86-64.so.2: bad ELF interpreter: No such file or directory
+| make[1]: *** [drbdsetup_xml-help_new-resource.xml] Error 126
+
+so we do not compile it.
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 5365a2c..d5967d8 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -45,7 +45,7 @@ WITH_84_SUPPORT = @WITH_84_SUPPORT@
+ # and not in e.g. dash. I'm too lazy to fix it to be compatible.
+ SHELL=/bin/bash
+ 
+-SUBDIRS     = user/shared user/v9 user/v84 user/v83 scripts documentation/v83 documentation/v84 documentation/v9
++SUBDIRS     = user/shared user/v9 user/v84 user/v83 scripts
+ 
+ REL_VERSION := $(shell $(SED) -ne '/^AC_INIT/{s/^[^,]*, *\([^,]*\) *,.*/\1/;p;q}' configure.ac)
+ ifdef FORCE
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
similarity index 51%
rename from meta-networking/recipes-support/drbd/drbd_8.4.4.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
index 7458707..66b94dd 100644
--- a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
@@ -8,46 +8,33 @@ SECTION = "admin"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-SRC_URI = "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
-           file://drbd.service \
+SRC_URI = "http://oss.linbit.com/drbd/${BP}.tar.gz \
+           file://0001-Makefile.in-don-t-compile-documentation.patch \
           "
-SRC_URI[md5sum] = "b51815343c1a9151e2936b3b97520388"
-SRC_URI[sha256sum] = "a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178f2ef4c15604288f0"
+SRC_URI[md5sum] = "09c9c33c041e1f4f85dd359f9e0b0f24"
+SRC_URI[sha256sum] = "011050578c153bf4fef86e03749304ff9f333b7af3512c5c395e0e870a0445bd"
 
 SYSTEMD_SERVICE_${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 inherit autotools-brokensep systemd
 
-EXTRA_OECONF = "--with-utils                  \
-                --without-km                  \
+EXTRA_OECONF = " \
                 --with-initdir=/etc/init.d    \
                 --without-pacemaker           \
                 --without-rgmanager           \
                 --without-bashcompletion      \
                 --with-distro debian          \
+                --with-initscripttype=both    \
+                --with-systemdunitdir=${systemd_unitdir}/system \
                "
 
-do_configure (){
-    oe_runconf
-}
-
-do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/drbd.service ${D}/${systemd_unitdir}/system
-        install -d ${D}/${libexecdir}
-        install -m 755 ${D}/${sysconfdir}/init.d/drbd ${D}/${libexecdir}/drbd-helper
-
-        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
-            ${D}${systemd_unitdir}/system/drbd.service
-    fi
-}
-
 RDEPENDS_${PN} += "bash perl"
 
 # The drbd items are explicitly put under /lib when installed.
 #
 FILES_${PN} += "/run"
-FILES_${PN} += "/lib/drbd"
-FILES_${PN}-dbg += "/lib/drbd/.debug"
+FILES_${PN} += "${base_libdir}/drbd \
+                ${libdir}/drbd \
+                ${libdir}/tmpfiles.d"
+FILES_${PN}-dbg += "${base_libdir}/drbd/.debug"
diff --git a/meta-networking/recipes-support/drbd/drbd/drbd.service b/meta-networking/recipes-support/drbd/drbd/drbd.service
deleted file mode 100644
index 3543999..0000000
--- a/meta-networking/recipes-support/drbd/drbd/drbd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=DRBD Service
-After=network.target
-
-[Service]
-Type=oneshot
-RemainAfterExit=yes
-ExecStart=@LIBEXECDIR@/drbd-helper start
-ExecStop=@LIBEXECDIR@/drbd-helper stop
-
-[Install]
-WantedBy=multi-user.target
-- 
1.8.4.2


