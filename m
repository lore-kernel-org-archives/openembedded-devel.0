Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ED8C00528
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 06:57:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14919.1690268261650669373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 23:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="104539220"
X-IronPort-AV: E=Sophos;i="6.01,230,1684767600"; 
   d="scan'208";a="104539220"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 15:57:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4130FC3F84
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 15:57:36 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C713D20B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 15:57:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 81EE186FD5;
	Tue, 25 Jul 2023 15:57:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v3] lastlog2: add new recipe
Date: Tue, 25 Jul 2023 14:57:21 +0800
Message-Id: <1690268242-25714-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27772.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27772.005
X-TMASE-Result: 10--0.986500-10.000000
X-TMASE-MatchedRID: ct/97+KAdbcS5iXdhf8hbirLqyE6Ur/j1QQ6Jx/fflY6FHRWx2FGsOvn
	/O99cHKFCC8aAmGeO6lKC565Je+gkgV2NKF6aideCtzGvPCy/m42ZWOmuJUS2bgbJOZ434Bs1as
	UUCqp+8frME+4JvD76erQYIW9fMLFFLe/cH9ifKnwgrvJFY9E0Vr2hZxjCLzq6Mw4RnkAvRK+Yp
	N3FsaosrEzThseKC1B5kXtru4Z36mzVFZ6osYjDtfeP+V/VXwsBpEC0DNwn/pQnnYsWF8zq5Xwt
	1rkqwjU55Pjz4VwpmyKs4UrBoivbbtj8w9EqUz1WCjDJRYeAZ241iXfjivJzD4tlpFReMb7Tn97
	XQYd1B23uOUnceT0ci5rYfHE0OO95UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLM1ZSt
	BnXnusiEE1X6LLoNqEnZgyQw9SlddH7uLADKW/0i0ojo+YaFrSqzPLsi8f3tHLST1swLtfWSwZz
	JTTKtm7bCgcTrQ5Y+IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 06:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104010

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...emove-lto-to-fix-link-error-of-clang.patch | 31 ++++++++++++++++
 .../lastlog2/lastlog2_1.1.0.bb                | 36 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch
 create mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb

diff --git a/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch b/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch
new file mode 100644
index 0000000000..71c3de9748
--- /dev/null
+++ b/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch
@@ -0,0 +1,31 @@
+From 692523d2f8bf0ce893a781761154db4277f0fceb Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 19 Jul 2023 07:11:15 +0000
+Subject: remove lto to fix link error of clang
+
+error message:
+| tests/tst-y2038-64bit-time_t.p/tst-y2038-64bit-time_t.c.o: file not recognized: file format not recognized
+| clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c521577..13d993b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,7 +26,6 @@ add_project_arguments(['-D_GNU_SOURCE=1',
+                        '-DPROJECT_VERSION="@0@"'.format(meson.project_version()) ], language : 'c')
+ 
+ possible_cc_flags = [
+-                  '-flto=auto',
+                   '-ffat-lto-objects',
+ 		  '-fstack-protector-strong',
+ 		  '-funwind-tables',
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
new file mode 100644
index 0000000000..757af0073a
--- /dev/null
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Y2038 safe version of lastlog"
+HOMEPAGE = "https://github.com/thkukuk/lastlog2"
+DESCRIPTION = "lastlog reports the last login of a given user or of all users who did ever login on a system."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
+SECTION = "libs"
+
+SRCREV = "585153a577788c590370d20e40263b61238dfab3"
+
+SRC_URI = "git://github.com/thkukuk/lastlog2.git;branch=main;protocol=https \
+           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd features_check
+
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
+REQUIRED_DISTRO_FEATURES = "pam"
+
+SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
+
+EXTRA_OEMESON = " -Dpamlibdir=${libdir}"
+
+do_install:append () {
+      if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
+          # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
+          # without usrmerge distro feature enabled
+          install -d `dirname ${D}${systemd_unitdir}`
+          mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+      fi
+}
+
+FILES:${PN} += " ${systemd_system_unitdir} "
+FILES:${PN} += " ${libdir} "
+FILES:${PN} += " ${nonarch_libdir}/tmpfiles.d/* "
-- 
2.34.1


