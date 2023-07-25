Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602F5C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 06:57:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.14920.1690268262031448694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 23:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="113982817"
X-IronPort-AV: E=Sophos;i="6.01,230,1684767600"; 
   d="scan'208";a="113982817"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 15:57:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 46637CA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 15:57:37 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 737CBD9461
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 15:57:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F83386FD5;
	Tue, 25 Jul 2023 15:57:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v3] wtmpdb: add new recipe
Date: Tue, 25 Jul 2023 14:57:22 +0800
Message-Id: <1690268242-25714-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690268242-25714-1-git-send-email-wangmy@fujitsu.com>
References: <1690268242-25714-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27772.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27772.005
X-TMASE-Result: 10--0.929500-10.000000
X-TMASE-MatchedRID: dEuj5lzoN6YS5iXdhf8hbirLqyE6Ur/j1QQ6Jx/fflYg9R3V8qg5xHU3
	oKSu0J1x28kKXD7bCdnS1Xndr/786gV2NKF6aideCtzGvPCy/m42ZWOmuJUS2bgbJOZ434Bs1as
	UUCqp+8frME+4JvD76erQYIW9fMLFFLe/cH9ifKnwgrvJFY9E0Vr2hZxjCLzq6Mw4RnkAvRK+Yp
	N3FsaoshiiX4NkQGpTo09oL6lFHvWPnoiNOctH6dfeP+V/VXws2FA7wK9mP9eA2/jHbG7JUNArX
	FJyn/T4kPI1/ZdqoS0MMV3HqxQ6epcLewwAa76fWTWEh5N2a9Gqqr1rAAunEOKYpwtG+wHV8RlS
	w+odtQGzxtrcK0Z+TAcxJ7EWCZcOTvHzGcGqiILdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07foJlcuVXWZJ+F18J3oqvvLp1dwp1rM7jR2PzyNqgOO2tqZ6HQwos48KLA1rTUO4P1ovs4
	aHXl0G9PXAxG6r1IRFnu+L+ruzcaVEXIRFz8AR8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AE
	OLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 06:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104011

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...emove-lto-to-fix-link-error-of-clang.patch | 31 ++++++++++++++++
 .../recipes-extended/wtmpdb/wtmpdb_0.7.1.bb   | 36 +++++++++++++++++++
 2 files changed, 67 insertions(+)
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
index 0000000000..cffae2d432
--- /dev/null
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
@@ -0,0 +1,36 @@
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
+inherit meson pkgconfig systemd features_check
+
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
+REQUIRED_DISTRO_FEATURES = "pam"
+
+SYSTEMD_SERVICE:${PN} = "wtmpdb-update-boot.service wtmpdb-rotate.service"
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


