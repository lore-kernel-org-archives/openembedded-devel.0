Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10C3A787D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 05:44:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2N5iWTm013193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 22:44:32 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 22 Mar 2018 22:44:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Mar 2018 13:41:10 +0800
Message-ID: <20180323054110.748-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] haveged: update to 1.9.2
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
X-List-Received-Date: Fri, 23 Mar 2018 05:44:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Drop the patch remove-systemd-unit-503.patch and init script
  haveged.sysvinit, and use PACKAGECONFIG to set the correct
  sevice file or init script for systemd or sysvinit.

* Add SuccessExitStatus to fix the failure when the service
  is stopped.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../haveged/haveged/haveged.sysvinit               | 35 ----------------------
 .../haveged/haveged/remove-systemd-unit-503.patch  | 20 -------------
 .../haveged/{haveged_1.9.1.bb => haveged_1.9.2.bb} | 21 +++++++------
 3 files changed, 10 insertions(+), 66 deletions(-)
 delete mode 100755 meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit
 delete mode 100644 meta-oe/recipes-extended/haveged/haveged/remove-systemd-unit-503.patch
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.1.bb => haveged_1.9.2.bb} (61%)

diff --git a/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit b/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit
deleted file mode 100755
index 98b8857e7..000000000
--- a/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit
+++ /dev/null
@@ -1,35 +0,0 @@
-#!/bin/sh
-
-PATH=/bin:/usr/bin:/sbin:/usr/sbin
-
-pidfile=/var/run/haveged.pid
-
-# source function library
-. /etc/init.d/functions
-
-case "$1" in
-    start)
-    echo -n "Starting havege entropy daemon... "
-    start-stop-daemon --start --quiet --pidfile $pidfile --name haveged --startas haveged --  -w 1024 -v 0 && success || failure
-    echo
-    ;;
-    stop)
-    echo -n "Stopping havege entropy daemon... "
-    start-stop-daemon --stop --quiet --pidfile $pidfile --name haveged
-    success
-    echo
-    ;;
-    restart)
-    $0 stop
-    sleep 1
-    $0 start
-    ;;
-    status)
-    status haveged
-    ;;
-    *)
-    echo "Usage: /etc/init.d/haveged {start|stop|restart|status}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-oe/recipes-extended/haveged/haveged/remove-systemd-unit-503.patch b/meta-oe/recipes-extended/haveged/haveged/remove-systemd-unit-503.patch
deleted file mode 100644
index df27bcb09..000000000
--- a/meta-oe/recipes-extended/haveged/haveged/remove-systemd-unit-503.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/init.d/Makefile.am	2014-01-02 18:55:53.000000000 +0100
-+++ b/init.d/Makefile.am	2014-08-11 10:59:40.000000000 +0200
-@@ -34,11 +34,11 @@
- 	$(do_subst) < $(srcdir)/$(src_tmpl) > haveged.service;
- 
- install-data-hook:
--if ENABLE_SYSTEMD_LOOKUP
--	install -p -m644 haveged.service `pkg-config --variable=systemdsystemunitdir systemd`/haveged.service;
--else
--	install -p -m644 haveged.service ($unit_dir)/haveged.service;
--endif
--	systemctl enable haveged.service;
-+#if ENABLE_SYSTEMD_LOOKUP
-+#	install -p -m644 haveged.service `pkg-config --variable=systemdsystemunitdir systemd`/haveged.service;
-+#else
-+#	install -p -m644 haveged.service ($unit_dir)/haveged.service;
-+#endif
-+#	systemctl enable haveged.service;
- 
- endif
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
similarity index 61%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
index 419c85f51..d0e9fdaa7 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
@@ -5,23 +5,22 @@ HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
-    file://remove-systemd-unit-503.patch \
-    file://haveged.sysvinit \
-"
+SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "015ff58cd10607db0e0de60aeca2f5f8"
-SRC_URI[sha256sum] = "9c2363ed9542a6784ff08e247182137e71f2ddb79e8e6c1ac4ad50d21ced3715"
+SRC_URI[md5sum] = "fb1d8b3dcbb9d06b30eccd8aa500fd31"
+SRC_URI[sha256sum] = "f77d9adbdf421b61601fa29faa9ce3b479d910f73c66b9e364ba8642ccbfbe70"
 
 inherit autotools update-rc.d systemd
 
 EXTRA_OECONF = "\
-    --enable-init=service.redhat \
     --enable-nistest=yes \
     --enable-olt=yes \
     --enable-threads=no \
 "
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--enable-init=service.redhat --enable-initdir=${systemd_system_unitdir}, --enable-init=sysv.redhat, systemd"
+
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME = "haveged"
 INITSCRIPT_PARAMS_${PN} = "defaults 9"
@@ -30,10 +29,10 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "haveged.service"
 
 do_install_append() {
-    install -D -m 755 ${WORKDIR}/haveged.sysvinit ${D}${sysconfdir}/init.d/haveged
-
-    mkdir -p ${D}${systemd_unitdir}/system
-    install -p -m644 ${B}/init.d/haveged.service ${D}${systemd_unitdir}/system
+    # The exit status is 143 when the service is stopped
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        sed -i '/ExecStart/a SuccessExitStatus=143' ${D}${systemd_system_unitdir}/haveged.service
+    fi
 }
 
 MIPS_INSTRUCTION_SET = "mips"
-- 
2.11.0


