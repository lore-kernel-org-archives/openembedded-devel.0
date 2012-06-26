Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjZS7-0006jp-7Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jun 2012 19:21:23 +0200
Received: by dalh21 with SMTP id h21so160932dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lDGQb0frWw+ht15L1O7mq4Aq2tJlPkgzW4AgEtkCX2Q=;
	b=mYrFKxPLvE/dglHCODE0IHlDvlkqYSGvlin6hYtTJckDx3U3VXrEl4BIAWHjwiKrbA
	XokTNMsWtYFiIK2k0M+fxEXEYzuPDyRCkoAdMtzuJ9IGu65PmxRpvfpi9ot8ogHop6KM
	pebPCuLiUfYrB1tu+VXeYOkCnEhMVdOYW92CBj8Fpl1I0U1TO5J4mrV9xK8ZrQ0IyyVv
	xxLqooV2pEULkPKKpnh6e11O45LG0xdng3g5hotBUG2K+/1+PGoJsmNgQcblYklM4TRw
	iom6LKgLnT9Hvx5jqIeuA7WNshmVG3XTX/0neIncpdVEGWI+hJDjeMCVsMO+ZKTrGPbB
	4jpQ==
Received: by 10.68.125.228 with SMTP id mt4mr54240235pbb.21.1340730630066;
	Tue, 26 Jun 2012 10:10:30 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id iu6sm12377164pbc.35.2012.06.26.10.10.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 10:10:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2012 10:10:17 -0700
Message-Id: <1340730617-27111-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH V2 1/3] cpufrequtils: Fix build without NLS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2012 17:21:23 -0000

uclibc disables NLS and we need to pass the right
define to inform the build system about NLS support
cpufrequtils-nls.patch is applied upstream so lets
remove it from metadata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cpufrequtils-008/cpufrequtils-nls.patch        |   81 --------------------
 .../cpufrequtils/cpufrequtils_008.bb               |    4 +-
 2 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch b/meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch
deleted file mode 100644
index cbc8719..0000000
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-make nls/gettext support optional
-
-patch by Jos van der Ende <seraph@xs4all.nl>
-
-http://bugs.gentoo.org/205576
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2011-06-30 17:50:23.000000000 -0700
-+++ git/Makefile	2011-07-01 07:06:58.300033928 -0700
-@@ -121,6 +121,7 @@
- ifeq ($(strip $(NLS)),true)
- 	INSTALL_NLS += install-gmo
- 	COMPILE_NLS += update-gmo
-+	CFLAGDEF += -DNLS
- endif
- 
- ifeq ($(strip $(CPUFRQ_BENCH)),true)
-Index: git/utils/info.c
-===================================================================
---- git.orig/utils/info.c	2011-06-30 17:50:23.000000000 -0700
-+++ git/utils/info.c	2011-07-01 07:06:58.300033928 -0700
-@@ -10,7 +10,6 @@
- #include <errno.h>
- #include <stdlib.h>
- #include <string.h>
--#include <libintl.h>
- #include <locale.h>
- 
- #include <getopt.h>
-@@ -18,9 +17,18 @@
- #include "cpufreq.h"
- 
- 
-+#ifdef NLS
-+#include <libintl.h>
- #define _(String) gettext (String)
- #define gettext_noop(String) String
- #define N_(String) gettext_noop (String)
-+#else
-+#define gettext_noop(String) String
-+#define _(String) gettext_noop (String)
-+#define gettext(String) gettext_noop (String)
-+#define N_(String) gettext_noop (String)
-+#define textdomain(String)
-+#endif
- 
- #define LINE_LEN 10
- 
-Index: git/utils/set.c
-===================================================================
---- git.orig/utils/set.c	2011-06-30 17:50:23.000000000 -0700
-+++ git/utils/set.c	2011-07-01 07:07:56.980119994 -0700
-@@ -12,16 +12,23 @@
- #include <limits.h>
- #include <string.h>
- #include <ctype.h>
--#include <libintl.h>
- #include <locale.h>
- 
- #include <getopt.h>
- 
- #include "cpufreq.h"
--
--#define _(String) gettext(String)
-+#ifdef NLS
-+#include <libintl.h>
-+#define _(String) gettext (String)
-+#define gettext_noop(String) String
-+#define N_(String) gettext_noop (String)
-+#else
- #define gettext_noop(String) String
--#define N_(String) gettext_noop(String)
-+#define _(String) gettext_noop (String)
-+#define gettext(String) gettext_noop (String)
-+#define N_(String) gettext_noop (String)
-+#define textdomain(String)
-+#endif
- 
- #define NORM_FREQ_LEN 32
- 
diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index 855b9c8..0cc3725 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -11,7 +11,9 @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
 SRC_URI = "git://github.com/emagii/cpufrequtils.git \
           "
 
-PR = "r3"
+CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' == 'no']} "
+
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5



