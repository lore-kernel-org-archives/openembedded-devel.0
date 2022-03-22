Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0873EC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 02:22:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4981.1647915725269572221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 19:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22M2M2W9011787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 19:22:02 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 21 Mar 2022 19:22:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 19:22:01 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 21 Mar 2022 19:22:01 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] haveged: update from 1.9.14 to 1.9.17
Date: Mon, 21 Mar 2022 19:22:00 -0700
Message-ID: <20220322022201.16957-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 02:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96122

Remove the daemon support code since this feature is deprecated by merging
the ideas from the HAVEGE algorithm into the kernel:

   297bdf1 Update README.md
   Starting from Linux kernel v5.6, the HAVEGED **service** has become obsolete.
   The userspace application as well as the haveged library are not affected.
   ...

Update the HOMEPAGE link to https.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../haveged/haveged_1.9.14.bb                 | 47 -------------------
 .../haveged/haveged_1.9.17.bb                 | 26 ++++++++++
 2 files changed, 26 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
 create mode 100644 meta-oe/recipes-extended/haveged/haveged_1.9.17.bb

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
deleted file mode 100644
index 3e4edae9d..000000000
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "haveged - A simple entropy daemon"
-DESCRIPTION = "The haveged project is an attempt to provide an easy-to-use, unpredictable random number generator based upon an adaptation of the HAVEGE algorithm. Haveged was created to remedy low-entropy conditions in the Linux random device that can occur under some workloads, especially on headless servers."
-AUTHOR = "Gary Wuertz"
-HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-# v1.9.14
-SRCREV = "4da3080ad4587860e5da73072d6ed54d0052938c"
-SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
-"
-S = "${WORKDIR}/git"
-
-UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
-
-inherit autotools update-rc.d systemd
-
-EXTRA_OECONF = "\
-    --enable-nistest=yes \
-    --enable-olt=yes \
-    --enable-threads=no \
-"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--enable-init=service.fedora --enable-initdir=${systemd_system_unitdir}, --enable-init=sysv.redhat, systemd"
-
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME = "haveged"
-INITSCRIPT_PARAMS:${PN} = "defaults 9"
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE:${PN} = "haveged.service"
-
-do_install:append() {
-    # The exit status is 143 when the service is stopped
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        sed -i '/ExecStart/a SuccessExitStatus=143' ${D}${systemd_system_unitdir}/haveged.service
-        # Hybrid systemd-sysvinit distros must install the initscript manually
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-            install -d ${D}${INIT_D_DIR}
-            sed -e "s,@SBINDIR@,${sbindir},g" <${S}/init.d/sysv.redhat >${D}${INIT_D_DIR}/haveged
-            chmod 755 ${D}${INIT_D_DIR}/haveged
-        fi
-    fi
-}
-
-MIPS_INSTRUCTION_SET = "mips"
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
new file mode 100644
index 000000000..25007c777
--- /dev/null
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
@@ -0,0 +1,26 @@
+SUMMARY = "haveged - A simple entropy daemon"
+DESCRIPTION = "The haveged project is an attempt to provide an easy-to-use, unpredictable random number generator based upon an adaptation of the HAVEGE algorithm. Haveged was created to remedy low-entropy conditions in the Linux random device that can occur under some workloads, especially on headless servers."
+
+AUTHOR = "Gary Wuertz"
+HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+# v1.9.17
+SRCREV = "1ff76272aba9803501e6f473dd5083f0e09289ac"
+SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
+"
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+    --enable-nistest=yes \
+    --enable-olt=yes \
+    --enable-threads=no \
+"
+
+MIPS_INSTRUCTION_SET = "mips"
-- 
2.31.1


