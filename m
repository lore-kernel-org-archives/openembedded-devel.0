Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B857D6174D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:49:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNqY2zS6z4n
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318169;
	bh=YWiN2gzO0t1TNWnOfTXjfXBOuCVORZtulf85293ARI4=;
	h=From:To:Subject:Date:From;
	b=D46RHaPXcuXV7ltAOndSkDSAGdEaaiTCBVDMWFoNTZA/CXSOEq6vwFQP7adp73Gmy
	AUZY3htYvImOJZvvPo5QBSNU/VF7ENAm5UAi0qG/tCmWscFBbGLy4t6oKsCkaEY+A+
	Bd8ePN4RjXYzKN6qu/LhVLRqQPODRhRZmADnM5P/MHSqlUKimgOwMGnPZrB08ZR5JU
	xKwG7cLW0AYRz9G/eSwMVkAleil6V1iof96PlXnS8mHdD/rhY1L1UXL3y+oOAqPeGp
	NNjKmMYeS2OP2NQrK9hO0758HOxyu/D0PpCYw5KjdVx4ec/GUTUC/8IF3LoIgPsRIa
	DoLL32LysZNiQRg10CX2OAk4okkQAU1N8FQJH2iRtYawLxqMTejmYDK0LU5xim1w+a
	IiOi9fMJRPwO0PuHM7gb+xzgbK5QjysKqNrdhtas3biXVe4bNTOGn65qM5PdGVsQ/7
	CugzLYYLSTv4fGs477Eni6kYQ1FPvNxnYoSVTRc079wDzF7H0tbwAx8Vb4KFq4r9QB
	GwsTlY68kZANrLPmMNEvHLL+D4MLDRGcjXAwMS4FaYzNjERXfMugOq2hm4OHj9SH7d
	yVSzMt8lg73nyVuS/huMHrfzoxJdje5YD1jRBzNo28iRRYA9LX4vANCxO44K2o5irn
	ZoRg6xu/mvSPMbZGedJSuyaE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:49:27 +0200
Message-Id: <20200221204927.13293-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][warrior][PATCH] networkmanager: Upgrade 1.16.0 -> 1.16.4
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
X-List-Received-Date: Fri, 21 Feb 2020 20:49:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade on the 1.16 stable branch.

Removed patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../networkmanager/0003-dlopen-failure.patch  | 34 -------------------
 ...ger_1.16.0.bb => networkmanager_1.16.4.bb} |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.16.0.bb => networkmanager_1.16.4.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
deleted file mode 100644
index e99c22710..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 18:18:06 +0100
-Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
- LD_LIBS="none required"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 487a266..96ae4f7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -235,6 +235,7 @@ dnl
- dnl Checks for libdl - on certain platforms its part of libc
- dnl
- AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
-+AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
- AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
- 
- PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
--- 
-2.14.3
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.4.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.4.bb
index 9f01f1bc1..8d222ed2b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.4.bb
@@ -26,15 +26,14 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
-    file://0003-dlopen-failure.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
 
-SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
-SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
+SRC_URI[md5sum] = "cde5a88043f69ceec4c2ae3c298d9805"
+SRC_URI[sha256sum] = "130272a279aa26e197e544a270a832ee97ae6833504ff3a41c8ef9eeaed0d1f0"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
-- 
2.17.1


