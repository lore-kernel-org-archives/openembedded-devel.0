Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.29637.1599956486275479406
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 17:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8E209FF803;
	Sun, 13 Sep 2020 00:21:22 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] htop: Update to 3.0.1
Date: Sat, 12 Sep 2020 17:20:48 -0700
Message-Id: <20200913002048.3032194-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patches that are no longer needed. Upstream development has moved
to GitHub and homepage has moved. License remains GPLv2, but file
changed due to whitespace removal. The --enable-proc setting was
removed, so remove the PACKAGECONFIG. The config.h file does not exist
in the repo, so it's no longer necessary to remove it before configure.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../0001-Ask-for-python3-specifically.patch   | 26 ----------------
 .../htop/files/htop-gcc10.patch               | 31 -------------------
 .../htop/{htop_2.2.0.bb => htop_3.0.1.bb}     | 21 +++++--------
 3 files changed, 7 insertions(+), 71 deletions(-)
 delete mode 100644 meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch
 delete mode 100644 meta-oe/recipes-support/htop/files/htop-gcc10.patch
 rename meta-oe/recipes-support/htop/{htop_2.2.0.bb => htop_3.0.1.bb} (61%)

diff --git a/meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch b/meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch
deleted file mode 100644
index 6153bdedb..000000000
--- a/meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 08aca4816cc798fce58b6235c26585a0063fa8af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Nov 2019 10:43:49 -0800
-Subject: [PATCH] Ask for python3 specifically
-
-python2 is on its way out
-
-Upstream-Status: Submitted [https://github.com/hishamhm/htop/pull/968]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- scripts/MakeHeader.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/MakeHeader.py b/scripts/MakeHeader.py
-index 7c48fdd..7a7586d 100755
---- a/scripts/MakeHeader.py
-+++ b/scripts/MakeHeader.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- import os, sys, string, io
- try:
-    from StringIO import StringIO
--- 
-2.24.0
-
diff --git a/meta-oe/recipes-support/htop/files/htop-gcc10.patch b/meta-oe/recipes-support/htop/files/htop-gcc10.patch
deleted file mode 100644
index 5be06277d..000000000
--- a/meta-oe/recipes-support/htop/files/htop-gcc10.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix build with -fno-common
-
-Upstream-Staus: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/CRT.h
-+++ b/CRT.h
-@@ -140,7 +140,7 @@ extern const char **CRT_treeStr;
- 
- extern int CRT_delay;
- 
--int* CRT_colors;
-+extern int* CRT_colors;
- 
- extern int CRT_colorSchemes[LAST_COLORSCHEME][LAST_COLORELEMENT];
- 
-@@ -150,13 +150,13 @@ extern int CRT_scrollHAmount;
- 
- extern int CRT_scrollWheelVAmount;
- 
--char* CRT_termType;
-+extern char* CRT_termType;
- 
- // TODO move color scheme to Settings, perhaps?
- 
- extern int CRT_colorScheme;
- 
--void *backtraceArray[128];
-+extern void *backtraceArray[128];
- 
- #if HAVE_SETUID_ENABLED
- 
diff --git a/meta-oe/recipes-support/htop/htop_2.2.0.bb b/meta-oe/recipes-support/htop/htop_3.0.1.bb
similarity index 61%
rename from meta-oe/recipes-support/htop/htop_2.2.0.bb
rename to meta-oe/recipes-support/htop/htop_3.0.1.bb
index c608077de..d677e36c0 100644
--- a/meta-oe/recipes-support/htop/htop_2.2.0.bb
+++ b/meta-oe/recipes-support/htop/htop_3.0.1.bb
@@ -1,28 +1,25 @@
 SUMMARY = "Interactive process viewer"
-HOMEPAGE = "http://hisham.hm/htop"
+HOMEPAGE = "https://htop.dev"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4099d367cd5e59b6d4fc1ee33accb891"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
+SRC_URI = "git://github.com/htop-dev/htop.git \
            file://0001-Use-pkg-config.patch \
-           file://0001-Ask-for-python3-specifically.patch \
-           file://htop-gcc10.patch \
            "
-SRC_URI[md5sum] = "0d816b6beed31edc75babcfbf863ffa8"
-SRC_URI[sha256sum] = "d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57"
+SRCREV = "dace850fa6e27b5626115b366059258cfe4d60c9"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "proc \
-                   cgroup \
+PACKAGECONFIG ??= "cgroup \
                    taskstats \
                    unicode \
                    linux-affinity \
                    delayacct"
-PACKAGECONFIG[proc] = "--enable-proc,--disable-proc"
 PACKAGECONFIG[openvz] = "--enable-openvz,--disable-openvz"
 PACKAGECONFIG[cgroup] = "--enable-cgroup,--disable-cgroup"
 PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
@@ -32,7 +29,3 @@ PACKAGECONFIG[linux-affinity] = "--enable-linux-affinity,--disable-linux-affinit
 PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc"
 PACKAGECONFIG[setuid] = "--enable-setuid,--disable-setuid"
 PACKAGECONFIG[delayacct] = "--enable-delayacct,--disable-delayacct,libnl"
-
-do_configure_prepend () {
-    rm -rf ${S}/config.h
-}
-- 
2.26.2

