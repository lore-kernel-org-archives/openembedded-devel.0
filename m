Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6FB77150
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jun 2016 11:57:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m124so8739650wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2016 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SOYsYwvwYEmd5q/QWNDXZEg5JRYwS/w7w6oY1yV8Vfo=;
	b=jiXfkYQ8H+Ye1shxWxCO4ZRSMNBWK0D+H+HIxBitUfL3GHOdjpVmYEyQvcsgTbSAoj
	bOzMHEFm3QIxWuImLLYDHgzHN7Jk0EHPKIyga/A9oEP00YWwTBuUfWyFsV2QVgcw8w7T
	kQ0rByslSgqej+2crvFBJUSyLl4T/YvMgQQkrgsBNOkkcnNTTcX/1uRsck0UnKrkqPce
	YDpk8ETKXcbC0LR3UJOJCwhfU8Xb2bDW1ty4aQA5KeWtmBHsHiVW/fOH6xKu2otf817I
	svz65jeZI8+VEd/0b8igeZDM6CuGsq1Ar4idbPLEA/ZUC3AcUMPIa5ENqhvRMHT+Aq84
	PpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=SOYsYwvwYEmd5q/QWNDXZEg5JRYwS/w7w6oY1yV8Vfo=;
	b=JhB92FRM40V+Rqhyb7v9Q89YPKQwne6F+y4b34LLVYAGM0VA3BHvm1V91NiDhExDVt
	geXp5buSTlhpErYYxdPFXNikUs9qoy12WjUUFvvFBiz7bimVmD+NXoH4IpeTRUZbYDL6
	tkLpEpJ7SLtoDdq5SgvahORIHT+V1i6v63LJ8ie4rKEwJkHRk6UVTS9A/WP/o9gE5jdy
	QUlrdvq02ujI6Oqsc6xkd+znBkJCTRQCiWOJj3cHTLxPCN4YSfpkadMbUdbW7keVHdU3
	SAd0D9wppdJTJyc3fOpLe2UTZ1YwyM6AFFEWowvTuXb5rJ01kG6YJ4yE/JjTkl/PK17w
	Yhuw==
X-Gm-Message-State: ALyK8tLTRtHUCqU3979kqMYLF/CPg/TDPXjbdSeOFf9kGcagN8EY3p16cEoLd0NvjC8uOw==
X-Received: by 10.28.173.66 with SMTP id w63mr7757008wme.14.1465127869668;
	Sun, 05 Jun 2016 04:57:49 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	a140sm8962352wme.18.2016.06.05.04.57.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Jun 2016 04:57:48 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Jun 2016 12:58:04 +0100
Message-Id: <1465127884-29231-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] toybox: Upgrade to 0.7.1
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
X-List-Received-Date: Sun, 05 Jun 2016 11:57:50 -0000

The previous patches are now included in the upstream 0.7.1 release. Two new
patches are needed, both of which have been submitted upstream:

* The version should report as 0.7.1 not 0.7.0.

* grep didn't print any output due to printf choking on a field width
  of INT_MAX/2. When trim is not set we can drop the field width
  instead of using a huge default width.

The unstripped toybox binary has moved from "toybox_unstripped" to
"generated/unstripped/toybox".

Additionally, the swapon command is now disabled as it does not support the '-a'
option used by initscripts.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../toybox/toybox/0001-Fix-TOYBOX_VERSION.patch    | 29 ++++++++
 .../toybox/toybox/0001-Fix-segfault-in-login.patch | 33 ---------
 .../0002-Add-b-and-F-arguments-to-hostname.patch   | 84 ----------------------
 .../toybox/0002-Fix-trimmed-printf-in-grep.patch   | 34 +++++++++
 .../toybox/{toybox_0.7.0.bb => toybox_0.7.1.bb}    | 21 +++---
 5 files changed, 76 insertions(+), 125 deletions(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.7.0.bb => toybox_0.7.1.bb} (72%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch b/meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch
new file mode 100644
index 0000000..8af4305
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch
@@ -0,0 +1,29 @@
+From 209fad8ebd17bf46d0431dafbb547f429a3cffdf Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sat, 4 Jun 2016 15:05:49 +0100
+Subject: [PATCH 1/2] Fix TOYBOX_VERSION
+
+The latest tagged version is 0.7.1.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Submitted
+---
+ main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/main.c b/main.c
+index eeae2f3..bedb333 100644
+--- a/main.c
++++ b/main.c
+@@ -6,7 +6,7 @@
+ #include "toys.h"
+ 
+ #ifndef TOYBOX_VERSION
+-#define TOYBOX_VERSION "0.7.0"
++#define TOYBOX_VERSION "0.7.1"
+ #endif
+ 
+ // Populate toy_list[].
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch b/meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
deleted file mode 100644
index 939885b..0000000
--- a/meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 863b129441c12eb75d63e4f4fe9a8f7df81607fd Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sun, 1 May 2016 14:50:59 +0100
-Subject: [PATCH] Fix segfault in login
-
-Fix a bug in readfileat where *plen would be corrupted if you didn't supply
-your own buffer (because ibuf is 0 in that case, not a pointer to the start
-of the allocated space). This caused a segfault in the 'login' program.
-
-Partial backport of upstream commit 81f31e463bd982a8344ea8681938eb43c9114652
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Backport
----
- lib/lib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/lib.c b/lib/lib.c
-index 6559030..e5bb605 100644
---- a/lib/lib.c
-+++ b/lib/lib.c
-@@ -475,7 +475,7 @@ char *readfileat(int dirfd, char *name, char *ibuf, off_t *plen)
-     rbuf = buf+rlen;
-     len -= rlen;
-   }
--  *plen = len = rlen+(buf-ibuf);
-+  *plen = len = rlen+(rbuf-buf);
-   close(fd);
- 
-   if (rlen<0) {
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch b/meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
deleted file mode 100644
index e300494..0000000
--- a/meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 151f576ab1fba44137beaeb95620b7942662b4d3 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sun, 1 May 2016 15:42:57 +0100
-Subject: [PATCH] Add -b and -F arguments to hostname
-
-These arguments are required to correctly set the hostname at boot time.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Submitted
----
- toys/lsb/hostname.c | 42 ++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 40 insertions(+), 2 deletions(-)
-
-diff --git a/toys/lsb/hostname.c b/toys/lsb/hostname.c
-index 23467fb..ebfc803 100644
---- a/toys/lsb/hostname.c
-+++ b/toys/lsb/hostname.c
-@@ -4,23 +4,61 @@
-  *
-  * http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/hostname.html
- 
--USE_HOSTNAME(NEWTOY(hostname, NULL, TOYFLAG_BIN))
-+USE_HOSTNAME(NEWTOY(hostname, "bF:", TOYFLAG_BIN))
- 
- config HOSTNAME
-   bool "hostname"
-   default y
-   help
--    usage: hostname [newname]
-+    usage: hostname [-b] [-F FILENAME] [newname]
- 
-     Get/Set the current hostname
-+
-+    -b  Set hostname to 'localhost' if otherwise unset
-+    -F  Set hostname to contents of FILENAME
- */
- 
- #define FOR_hostname
- #include "toys.h"
- 
-+GLOBALS(
-+  char *fname;
-+)
-+
- void hostname_main(void)
- {
-   const char *hostname = toys.optargs[0];
-+
-+  if (toys.optflags & FLAG_F) {
-+    char *buf;
-+    if ((hostname = buf = readfile(TT.fname, 0, 0))) {
-+      size_t len = strlen(hostname);
-+      char *end = buf + len - 1;
-+
-+      /* Trim trailing whitespace. */
-+      while (len && isspace(*end)) {
-+        *end-- = '\0';
-+        len--;
-+      }
-+      if (!len) {
-+        free(buf);
-+        hostname = NULL;
-+        if (!(toys.optflags & FLAG_b))
-+          error_exit("empty file '%s'", TT.fname);
-+      }
-+    } else if (!(toys.optflags & FLAG_b))
-+      error_exit("failed to read '%s'", TT.fname);
-+  }
-+
-+  if (!hostname && toys.optflags & FLAG_b) {
-+    /* Do nothing if hostname already set. */
-+    if (gethostname(toybuf, sizeof(toybuf))) perror_exit("get failed");
-+    if (strnlen(toybuf, sizeof(toybuf))) exit(0);
-+
-+    /* Else set hostname to localhost. */
-+    hostname = "localhost";
-+  }
-+
-   if (hostname) {
-     if (sethostname(hostname, strlen(hostname)))
-       perror_exit("set failed '%s'", hostname);
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch b/meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch
new file mode 100644
index 0000000..37808d0
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch
@@ -0,0 +1,34 @@
+From 9c51a0d7690fb3b08871dae2486af4032d8442fb Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sat, 4 Jun 2016 15:42:48 +0100
+Subject: [PATCH 2/2] Fix trimmed printf in grep
+
+Using a default trim value of INT_MAX/2 when printing a line causes nothing to
+be printed on a system built using OpenEmbedded for the qemux86 target. This may
+also affect other systems.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Submitted
+---
+ toys/posix/grep.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/toys/posix/grep.c b/toys/posix/grep.c
+index 2ca02d2..f38c538 100644
+--- a/toys/posix/grep.c
++++ b/toys/posix/grep.c
+@@ -74,7 +74,10 @@ static void outline(char *line, char dash, char *name, long lcount, long bcount,
+   if (!line || (lcount && (toys.optflags&FLAG_n)))
+     printf("%ld%c", lcount, line ? dash : TT.outdelim);
+   if (bcount && (toys.optflags&FLAG_b)) printf("%ld%c", bcount-1, dash);
+-  if (line) xprintf("%.*s%c", trim ? trim : INT_MAX/2, line, TT.outdelim);
++  if (line) {
++    if (trim) xprintf("%.*s%c", trim, line, TT.outdelim);
++    else xprintf("%s%c", line, TT.outdelim);
++  }
+ }
+ 
+ // Show matches in one file
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.0.bb b/meta-oe/recipes-core/toybox/toybox_0.7.1.bb
similarity index 72%
rename from meta-oe/recipes-core/toybox/toybox_0.7.0.bb
rename to meta-oe/recipes-core/toybox/toybox_0.7.1.bb
index d7b469a..defca70 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.0.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.1.bb
@@ -4,30 +4,35 @@ DEPENDS = "attr"
 
 SRC_URI = " \
     http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-    file://0001-Fix-segfault-in-login.patch \
-    file://0002-Add-b-and-F-arguments-to-hostname.patch \
+    file://0001-Fix-TOYBOX_VERSION.patch \
+    file://0002-Fix-trimmed-printf-in-grep.patch \
 "
 
-SRC_URI[md5sum] = "d86c78624b47625c2f0fc64eda599443"
-SRC_URI[sha256sum] = "65428816f88ad3fe92b67df86dc05427c8078fe03843b8b9715fdfa6d29c0f97"
+SRC_URI[md5sum] = "e959e5ff8c6806781eb06e56f302a393"
+SRC_URI[sha256sum] = "5bb3069f58faf12940d5cfde3209ac7f63210bebdd9023979b0c20cede126ea7"
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
 
 SECTION = "base"
 
+TOYBOX_BIN = "generated/unstripped/toybox"
+
 do_configure() {
     oe_runmake defconfig
 
     # Disable killall5 as it isn't managed by update-alternatives
     sed -e 's/CONFIG_KILLALL5=y/# CONFIG_KILLALL5 is not set/' -i .config
+
+    # Disable swapon as it doesn't handle the '-a' argument used during boot
+    sed -e 's/CONFIG_SWAPON=y/# CONFIG_SWAPON is not set/' -i .config
 }
 
 do_compile() {
-    oe_runmake toybox_unstripped
+    oe_runmake ${TOYBOX_BIN}
 
     # Create a list of links needed
-    oe_runmake generated/instlist
+    ${BUILD_CC} -I . scripts/install.c -o generated/instlist
     ./generated/instlist long | sed -e 's#^#/#' > toybox.links
 }
 
@@ -35,9 +40,9 @@ do_install() {
     # Install manually instead of using 'make install'
     install -d ${D}${base_bindir}
     if grep -q "CONFIG_TOYBOX_SUID=y" ${B}/.config; then
-        install -m 4755 ${B}/toybox_unstripped ${D}${base_bindir}/toybox
+        install -m 4755 ${B}/${TOYBOX_BIN} ${D}${base_bindir}/toybox
     else
-        install -m 0755 ${B}/toybox_unstripped ${D}${base_bindir}/toybox
+        install -m 0755 ${B}/${TOYBOX_BIN} ${D}${base_bindir}/toybox
     fi
 
     install -d ${D}${sysconfdir}
-- 
2.1.4


