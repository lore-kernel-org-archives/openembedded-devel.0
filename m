Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE0AC76E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 06:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7F606G0009539
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 23:00:06 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 23:00:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:14 +0800
Message-ID: <20160815054527.14199-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471240191.git.jackie.huang@windriver.com>
References: <cover.1471240191.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 6/6] samba: upgrade to 4.4.5
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
X-List-Received-Date: Mon, 15 Aug 2016 06:00:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* This is a security release in order to address the following defect:
  - CVE-2016-2119 (Client side SMB2/3 required signing can be downgraded)

* Detail release note:
  - https://www.samba.org/samba/history/samba-4.4.5.html

* Removed part of the 10-use-only-libsystemd.patch
  which has been fixed in new version.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../00-fix-typos-in-man-pages.patch                |  0
 ...006-avoid-using-colon-in-the-checking-msg.patch |  0
 .../10-use-only-libsystemd.patch                   | 51 ----------------------
 .../16-do-not-check-xsltproc-manpages.patch        |  0
 ...-import-target-module-while-cross-compile.patch |  0
 .../21-add-config-option-without-valgrind.patch    |  0
 .../volatiles.03_samba                             |  0
 .../samba/{samba_4.4.2.bb => samba_4.4.5.bb}       |  4 +-
 8 files changed, 2 insertions(+), 53 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/00-fix-typos-in-man-pages.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/0006-avoid-using-colon-in-the-checking-msg.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/10-use-only-libsystemd.patch (35%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/16-do-not-check-xsltproc-manpages.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/20-do-not-import-target-module-while-cross-compile.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/21-add-config-option-without-valgrind.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/volatiles.03_samba (100%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.4.2.bb => samba_4.4.5.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/00-fix-typos-in-man-pages.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/00-fix-typos-in-man-pages.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/00-fix-typos-in-man-pages.patch
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/00-fix-typos-in-man-pages.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/0006-avoid-using-colon-in-the-checking-msg.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/0006-avoid-using-colon-in-the-checking-msg.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/0006-avoid-using-colon-in-the-checking-msg.patch
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/0006-avoid-using-colon-in-the-checking-msg.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
similarity index 35%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
index 81621ff..0ddc941 100644
--- a/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch
+++ b/meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
@@ -1,54 +1,3 @@
-diff -ur samba-4.4.2/lib/util/become_daemon.c samba-4.4.2/lib/util/become_daemon.c
---- samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:33:24.000000000 +0200
-+++ samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:26:50.275177918 +0200
-@@ -24,7 +24,7 @@
- #include "includes.h"
- #include "system/filesys.h"
- #include "system/locale.h"
--#if HAVE_LIBSYSTEMD_DAEMON
-+#if HAVE_LIBSYSTEMD
- #include <systemd/sd-daemon.h>
- #endif
- #include "lib/util/close_low_fd.h"
-@@ -69,9 +69,9 @@
- 	if (do_fork) {
- 		newpid = fork();
- 		if (newpid) {
--#if HAVE_LIBSYSTEMD_DAEMON
-+#if HAVE_LIBSYSTEMD
- 			sd_notifyf(0, "READY=0\nSTATUS=Starting process...\nMAINPID=%lu", (unsigned long) newpid);
--#endif /* HAVE_LIBSYSTEMD_DAEMON */
-+#endif /* HAVE_LIBSYSTEMD */
- 			_exit(0);
- 		}
- 	}
-@@ -98,7 +98,7 @@
- 
- _PUBLIC_ void exit_daemon(const char *msg, int error)
- {
--#ifdef HAVE_LIBSYSTEMD_DAEMON
-+#ifdef HAVE_LIBSYSTEMD
- 	if (msg == NULL) {
- 		msg = strerror(error);
- 	}
-@@ -117,7 +117,7 @@
- 	if (name == NULL) {
- 		name = "Samba";
- 	}
--#ifdef HAVE_LIBSYSTEMD_DAEMON
-+#ifdef HAVE_LIBSYSTEMD
- 	sd_notifyf(0, "READY=1\nSTATUS=%s: ready to serve connections...", name);
- #endif
- 	DEBUG(0, ("STATUS=daemon '%s' finished starting up and ready to serve "
-@@ -129,7 +129,7 @@
- 	if (name == NULL) {
- 		name = "Samba";
- 	}
--#ifdef HAVE_LIBSYSTEMD_DAEMON
-+#ifdef HAVE_LIBSYSTEMD
- 	sd_notifyf(0, "\nSTATUS=%s: %s", name, msg);
- #endif
- 	DEBUG(0, ("STATUS=daemon '%s' : %s", name, msg));
 diff -ur samba-4.4.2/lib/util/debug.c samba-4.4.2/lib/util/debug.c
 --- samba-4.4.2/lib/util/debug.c	2016-05-08 18:33:24.000000000 +0200
 +++ samba-4.4.2/lib/util/debug.c	2016-05-08 18:27:09.341481492 +0200
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/16-do-not-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/16-do-not-check-xsltproc-manpages.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/16-do-not-check-xsltproc-manpages.patch
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/16-do-not-check-xsltproc-manpages.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/20-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/20-do-not-import-target-module-while-cross-compile.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/20-do-not-import-target-module-while-cross-compile.patch
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/20-do-not-import-target-module-while-cross-compile.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/21-add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/21-add-config-option-without-valgrind.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/21-add-config-option-without-valgrind.patch
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/21-add-config-option-without-valgrind.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/volatiles.03_samba b/meta-networking/recipes-connectivity/samba/samba-4.4.5/volatiles.03_samba
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.2/volatiles.03_samba
rename to meta-networking/recipes-connectivity/samba/samba-4.4.5/volatiles.03_samba
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 1a5d54f..3b6c52d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -21,8 +21,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
           "
 
-SRC_URI[md5sum] = "03a65a3adf08ceb1636ad59d234d7f9d"
-SRC_URI[sha256sum] = "eaecd41a85ebb9507b8db9856ada2a949376e9d53cf75664b5493658f6e5926a"
+SRC_URI[md5sum] = "6950c5e9f7bdeb8a610c2ca957a15be4"
+SRC_URI[sha256sum] = "b876ef2e63f66265490e80a122e66ef2d7616112b839df68f56ac2e1ce17a7bd"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
-- 
1.9.1


