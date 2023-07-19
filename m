Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE50C001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 08:30:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.9355.1689755438657425624
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jul 2023 01:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="125152910"
X-IronPort-AV: E=Sophos;i="6.01,216,1684767600"; 
   d="scan'208";a="125152910"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:30:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 73414CD6C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 17:30:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9A9ED67A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 17:30:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BD8C22CAD7;
	Wed, 19 Jul 2023 17:30:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] wtmpdb: add new recipe
Date: Wed, 19 Jul 2023 16:30:22 +0800
Message-Id: <1689755422-8405-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689755422-8405-1-git-send-email-wangmy@fujitsu.com>
References: <1689755422-8405-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27760.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27760.006
X-TMASE-Result: 10--2.128400-10.000000
X-TMASE-MatchedRID: ct/97+KAdbcS5iXdhf8hbirLqyE6Ur/j1QQ6Jx/fflYg9R3V8qg5xHU3
	oKSu0J1x28kKXD7bCdnS1Xndr/786gV2NKF6aideCtzGvPCy/m42ZWOmuJUS2bgbJOZ434Bs1as
	UUCqp+8frME+4JvD76erQYIW9fMLFFLe/cH9ifKnwgrvJFY9E0Vr2hZxjCLzq6Mw4RnkAvRK+Yp
	N3FsaoshiiX4NkQGpTo09oL6lFHvWPnoiNOctH6dfeP+V/VXws2FA7wK9mP9eA2/jHbG7JUNArX
	FJyn/T4kPI1/ZdqoS0MMV3HqxQ6erkB96ykJWH5WCjDJRYeAZ241iXfjivJzD4tlpFReMb7Tn97
	XQYd1B23uOUnceT0ci5rYfHE0OO95UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLNbUJ4
	mhQxzFUpZ96ZfulXSOUDzhYLUI3bGK4GfTc0UaI5KJ/Tgpjpyu0P+QuAqoFKx+e/4HrY/P/m+Hx
	HZJwbuOVxi/JuNj/SIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 08:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103957

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...emove-lto-to-fix-link-error-of-clang.patch | 31 +++++++++++++++++
 .../recipes-extended/wtmpdb/wtmpdb_0.7.1.bb   | 33 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch
 create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb

diff --git a/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch b/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch
new file mode 100644
index 0000000000..ef188e7a15
--- /dev/null
+++ b/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch
@@ -0,0 +1,31 @@
+From 9840939789dec9153150e8f9ae34de4171a5c15e Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 19 Jul 2023 07:31:32 +0000
+Subject: [PATCH] remove lto to fix link error of clang
+
+error message:
+| tests/tst-dlopen.p/tst-dlopen.c.o: file not recognized: file format not recognized
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
+index 6fe8045..166a15b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -28,7 +28,6 @@ add_project_arguments(['-D_GNU_SOURCE=1',
+                        '-D_TIME_BITS=64'], language : 'c')
+ 
+ possible_cc_flags = [
+-                  '-flto=auto',
+                   '-ffat-lto-objects',
+ 		  '-fstack-protector-strong',
+ 		  '-funwind-tables',
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
new file mode 100644
index 0000000000..5e7f0d86da
--- /dev/null
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Y2038 safe version of wtmp"
+HOMEPAGE = "https://github.com/thkukuk/wtmpdb"
+DESCRIPTION = "last reports the login and logout times of users and when the machine got rebooted."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
+SECTION = "libs"
+
+SRCREV = "502b19a41c7a3b1b5e70969b18088683825f71f8"
+
+SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https \
+           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd
+
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
+
+SYSTEMD_SERVICE:${PN} = "wtmpdb-update-boot.service wtmpdb-rotate.service"
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


