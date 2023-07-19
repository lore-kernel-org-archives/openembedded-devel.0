Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD57C001E0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 08:30:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.9281.1689755437628619830
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jul 2023 01:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="124533752"
X-IronPort-AV: E=Sophos;i="6.01,216,1684767600"; 
   d="scan'208";a="124533752"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:30:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E896E42B0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 17:30:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CFA9ED67A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 17:30:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A6EF22CAD7;
	Wed, 19 Jul 2023 17:30:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] lastlog2: add new recipe
Date: Wed, 19 Jul 2023 16:30:21 +0800
Message-Id: <1689755422-8405-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27760.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27760.006
X-TMASE-Result: 10--2.185400-10.000000
X-TMASE-MatchedRID: Kkkx1MdXpTwS5iXdhf8hbirLqyE6Ur/j1QQ6Jx/fflY6FHRWx2FGsOvn
	/O99cHKFCC8aAmGeO6lKC565Je+gkgV2NKF6aideCtzGvPCy/m42ZWOmuJUS2bgbJOZ434Bs1as
	UUCqp+8frME+4JvD76erQYIW9fMLFFLe/cH9ifKnwgrvJFY9E0Vr2hZxjCLzq6Mw4RnkAvRK+Yp
	N3FsaosrEzThseKC1B5kXtru4Z36mzVFZ6osYjDtfeP+V/VXwsBpEC0DNwn/pQnnYsWF8zq5Xwt
	1rkqwjU55Pjz4VwpmzDNc/pokfo6eUc54eY5wy0f598+KnsMOixRdmbSxs2Xp5X8TY4kgLrlIOV
	A+gJRdKxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcouuJj+HgtwDLJMVUyLJv1imh0K
	q1HsjQNeeSAx9UHOW2dMpGmIWTkAUnJD33AfoiLMTZZZChJozPHeSiZV8FgY4ruBvuloRh/6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 08:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103956

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...emove-lto-to-fix-link-error-of-clang.patch | 31 +++++++++++++++++
 .../lastlog2/lastlog2_1.1.0.bb                | 33 +++++++++++++++++++
 2 files changed, 64 insertions(+)
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
index 0000000000..969ceaa166
--- /dev/null
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
@@ -0,0 +1,33 @@
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
+inherit meson pkgconfig systemd
+
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
+
+SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
+
+EXTRA_OEMESON = " -Dpamlibdir=${libdir}"
+
+do_install:append () {
+      # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
+      # without usrmerge distro feature enabled
+      install -d `dirname ${D}${systemd_unitdir}`
+      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+}
+
+FILES:${PN} += " ${systemd_system_unitdir} "
+FILES:${PN} += " ${libdir} "
+FILES:${PN} += " ${nonarch_libdir}/tmpfiles.d/* "
-- 
2.34.1


