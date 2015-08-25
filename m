Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C34BB72B1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 01:57:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99977017"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2015 10:00:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7P1v5uA031874
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:57:05 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 25 Aug 2015 09:57:10 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:56:16 +0800
Message-ID: <1440496576-29419-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH V2] sysdig: 0.1.101 -> 0.1.102
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
X-List-Received-Date: Tue, 25 Aug 2015 01:57:36 -0000
Content-Type: text/plain

upgrade sysdig to 0.1.102, and using GIT source instead of archive.

Because the bug had been fixed at upstream before 0.1.102 released,
so get rid of 01-donot-set-default-value-to-va_list.patch.

Please obtain detail from
https://github.com/draios/sysdig/commit/3cf4db08314b8559405198fb998eab421fec4b7d

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../01-donot-set-default-value-to-va_list.patch    | 22 --------------
 meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb  | 34 ----------------------
 meta-oe/recipes-extended/sysdig/sysdig_git.bb      | 32 ++++++++++++++++++++
 3 files changed, 32 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig_git.bb

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch b/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch
deleted file mode 100644
index 9cb6378..0000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-fix build error as following.
-
-  sysdig-0.1.101/userspace/libsinsp/ctext.h:376:50: error: could not convert '0' from 'int' to 'va_list {aka __va_list}'
-  |    int8_t vprintf(const char*format, va_list ap = 0);
-  |                                                   ^
-  | make[2]: *** [userspace/libsinsp/CMakeFiles/sinsp.dir/ctext.cpp.o] Error 1
-
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp sysdig-0.1.101.orig/userspace/libsinsp/ctext.h sysdig-0.1.101/userspace/libsinsp/ctext.h
---- sysdig-0.1.101.orig/userspace/libsinsp/ctext.h	2015-06-04 02:58:51.000000000 +0800
-+++ sysdig-0.1.101/userspace/libsinsp/ctext.h	2015-07-02 09:18:14.154627357 +0800
-@@ -373,7 +373,7 @@ class ctext
- 		// application to this library seamlessly.
- 		//
- 		int8_t printf(const char*format, ...);
--		int8_t vprintf(const char*format, va_list ap = 0);
-+		int8_t vprintf(const char*format, va_list ap);
- 
- 		//
- 		// nprintf is identical to the printf above EXCEPT for
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
deleted file mode 100644
index 789fd47..0000000
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "A New System Troubleshooting Tool Built for the Way You Work"
-DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
-system state and activity from a running Linux instance, then save, \
-filter and analyze."
-HOMEPAGE = "http://www.sysdig.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-inherit cmake pkgconfig
-
-DEPENDS = "luajit zlib ncurses"
-RDEPENDS_${PN} = "bash"
-
-
-SRC_URI = "https://github.com/draios/sysdig/archive/${PV}.tar.gz \
-           file://01-donot-set-default-value-to-va_list.patch \
-          "
-
-SRC_URI[md5sum] = "5fe96a3a0fd98b2157a40cb29af41afc"
-SRC_URI[sha256sum] = "6995e39be565514901b5cb587689ee2efbf8359293e4e597362382cccf0e9db6"
-
-DIR_ETC="/etc"
-EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
-                  -DUSE_BUNDLED_ZLIB="OFF" \
-                  -DBUILD_DRIVER="OFF" \
-                  -DUSE_BUNDLED_NCURSES="OFF" \
-                  -DDIR_ETC="${DIR_ETC}" \
-                '
-
-FILES_${PN} += " \
-    ${DIR_ETC}/* \
-    ${datadir}/zsh/* \ 
-    ${prefix}/src/*  \
-"
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
new file mode 100644
index 0000000..62aa433
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "A New System Troubleshooting Tool Built for the Way You Work"
+DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
+system state and activity from a running Linux instance, then save, \
+filter and analyze."
+HOMEPAGE = "http://www.sysdig.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake pkgconfig
+
+DEPENDS = "luajit zlib ncurses"
+RDEPENDS_${PN} = "bash"
+
+SRC_URI = "git://github.com/draios/sysdig.git;branch=master"
+SRCREV = "b7394e29ced4f1a991af03c0381a5828abcbab7a"
+PV = "0.1.102+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DIR_ETC="/etc"
+EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
+                  -DUSE_BUNDLED_ZLIB="OFF" \
+                  -DBUILD_DRIVER="OFF" \
+                  -DUSE_BUNDLED_NCURSES="OFF" \
+                  -DDIR_ETC="${DIR_ETC}" \
+                '
+
+FILES_${PN} += " \
+    ${DIR_ETC}/* \
+    ${datadir}/zsh/* \ 
+    ${prefix}/src/*  \
+"
-- 
1.9.1


