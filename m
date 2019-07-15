Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19D797EE13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 02:50:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2019 19:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,492,1557212400"; d="scan'208";a="172100808"
Received: from lduttal-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.187.17])
	by orsmga006.jf.intel.com with ESMTP; 14 Jul 2019 19:50:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2019 14:50:06 +1200
Message-Id: <f09a1fc3bc023164044170884dff2207e3ab57e4.1563158873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1563158872.git.paul.eggleton@linux.intel.com>
References: <cover.1563158872.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/1] picocom: update to 3.1
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
X-List-Received-Date: Mon, 15 Jul 2019 02:50:40 -0000
Content-Transfer-Encoding: 8bit

There have been a couple of releases since we last upgraded, including
a number of additional features. Changelog is here:

  https://github.com/npat-efault/picocom/releases

Also tweak SUMMARY - I don't think this has been 20k in a while; with
this upgrade the binary alone went from 60k to 70k.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../picocom/0001-Fix-building-with-musl.patch | 118 ++++++++++++++++++
 .../recipes-support/picocom/picocom_git.bb    |  12 +-
 2 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch

diff --git a/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch b/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
new file mode 100644
index 0000000000..5b344b9e83
--- /dev/null
+++ b/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
@@ -0,0 +1,118 @@
+From 9664809da36bd7bada3e44f50cfc042539fb61ee Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 14 Jul 2019 19:13:21 -0700
+Subject: [PATCH] Fix building with musl
+
+Upstream-status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ termios2.c | 27 +++++++++++++++++++++++++++
+ termios2.h |  5 +++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/termios2.c b/termios2.c
+index 97c3be0..88ff6fc 100644
+--- a/termios2.c
++++ b/termios2.c
+@@ -37,6 +37,7 @@
+ #include <errno.h>
+ #include <termios.h>
+ #include <sys/ioctl.h>
++#include <asm/ioctls.h>
+ 
+ /* Contains the definition of the termios2 structure and some related
+    constants that we should normally include from system
+@@ -53,6 +54,10 @@
+ */
+ #define IBAUD0 020000000000
+ 
++#if !defined(__GLIBC__)
++#define __MAX_BAUD B4000000
++#endif
++
+ int
+ tc2setattr(int fd, int optional_actions, const struct termios *tios)
+ {
+@@ -79,8 +84,13 @@ tc2setattr(int fd, int optional_actions, const struct termios *tios)
+     t2.c_cflag = tios->c_cflag;
+     t2.c_lflag = tios->c_lflag;
+     t2.c_line = tios->c_line;
++#if !defined(__GLIBC__)
++    t2.c_ispeed = tios->__c_ispeed;
++    t2.c_ospeed = tios->__c_ospeed;
++#else
+     t2.c_ispeed = tios->c_ispeed;
+     t2.c_ospeed = tios->c_ospeed;
++#endif
+     memcpy(&t2.c_cc[0], &tios->c_cc[0], K_NCCS * sizeof (cc_t));
+ 
+     return ioctl(fd, cmd, &t2);
+@@ -101,8 +111,13 @@ tc2getattr(int fd, struct termios *tios)
+     tios->c_cflag = t2.c_cflag;
+     tios->c_lflag = t2.c_lflag;
+     tios->c_line = t2.c_line;
++#if !defined(__GLIBC__)
++    tios->__c_ispeed = t2.c_ispeed;
++    tios->__c_ospeed = t2.c_ospeed;
++#else
+     tios->c_ispeed = t2.c_ispeed;
+     tios->c_ospeed = t2.c_ospeed;
++#endif
+     memcpy(&tios->c_cc[0], &t2.c_cc[0], K_NCCS * sizeof (cc_t));
+ 
+     for (i = K_NCCS; i < NCCS; i++)
+@@ -131,7 +146,11 @@ cf2setispeed(struct termios *tios, speed_t speed)
+         errno = EINVAL;
+         return -1;
+     }
++#if !defined(__GLIBC__)
++    tios->__c_ispeed = speed;
++#else
+     tios->c_ispeed = speed;
++#endif
+     tios->c_cflag &= ~((CBAUD | CBAUDEX) << IBSHIFT);
+     tios->c_cflag |= (speed << IBSHIFT);
+ 
+@@ -156,7 +175,11 @@ cf2setospeed_custom(struct termios *tios, int speed)
+     }
+     tios->c_cflag &= ~(CBAUD | CBAUDEX);
+     tios->c_cflag |= BOTHER;
++#if !defined(__GLIBC__)
++    tios->__c_ospeed = speed;
++#else
+     tios->c_ospeed = speed;
++#endif
+ 
+     return 0;
+ }
+@@ -177,7 +200,11 @@ cf2setispeed_custom(struct termios *tios, int speed)
+     } else {
+         tios->c_cflag &= ~((CBAUD | CBAUDEX) << IBSHIFT);
+         tios->c_cflag |= (BOTHER << IBSHIFT);
++#if !defined(__GLIBC__)
++        tios->__c_ispeed = speed;
++#else
+         tios->c_ispeed = speed;
++#endif
+     }
+ 
+     return 0;
+diff --git a/termios2.h b/termios2.h
+index e13b0e3..63dd0ce 100644
+--- a/termios2.h
++++ b/termios2.h
+@@ -37,8 +37,13 @@
+ /* And define these new ones */
+ #define cfsetospeed_custom cf2setospeed_custom
+ #define cfsetispeed_custom cf2setispeed_custom
++#if defined(__linux__) && !defined(__GLIBC__)
++#define cfgetospeed_custom(tiop) ((tiop)->__c_ospeed)
++#define cfgetispeed_custom(tiop) ((tiop)->__c_ispeed)
++#else
+ #define cfgetospeed_custom(tiop) ((tiop)->c_ospeed)
+ #define cfgetispeed_custom(tiop) ((tiop)->c_ispeed)
++#endif
+ 
+ /* Replacements for the standard tcsetattr(3), tcgetattr(3)
+  * functions. Same user interface, but these use the new termios2
diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
index e091094cf4..3d26b9364b 100644
--- a/meta-oe/recipes-support/picocom/picocom_git.bb
+++ b/meta-oe/recipes-support/picocom/picocom_git.bb
@@ -1,15 +1,17 @@
-SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
+SUMMARY = "Lightweight and minimal dumb-terminal emulation program"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
-HOMEPAGE = "http://code.google.com/p/picocom/"
+HOMEPAGE = "https://github.com/npat-efault/picocom"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
 
-BASEPV = "2.2"
+BASEPV = "3.1"
 PV = "${BASEPV}+git${SRCPV}"
 
-SRCREV = "deffd18c24145bd6f965f44e735a50b65810ccdc"
+SRCREV = "90385aabe2b51f39fa130627d46b377569f82d4a"
 
-SRC_URI = "git://github.com/npat-efault/picocom"
+SRC_URI = "git://github.com/npat-efault/picocom \
+           file://0001-Fix-building-with-musl.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


