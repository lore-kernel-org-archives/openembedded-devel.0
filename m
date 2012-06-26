Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjYHi-0003Vh-5P
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jun 2012 18:06:34 +0200
Received: by dalh21 with SMTP id h21so75105dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gDgrdewov0Gq7BP61QyxuclinNUXpMqG2Ib0ZHOKQ3E=;
	b=MplWmEVPeK8e+23Smh9TjVXfg8zNolByV0eBXzTvxWk35P+slEDV9Nt558QFnxiX6w
	m5CHCuL2MLZe56e8qrWxHXFY3ZpHz3rcc9XVujRUfIW7B9r4cxJulSZ0SPko5QBjNN/k
	efA9HQ1E5N9BivcHz0mT1Fa4/2qXKWBMPE6sFxzSwZFKzW+5olIkMfr0UYTe6MRk77v+
	KC6d7YKE5Al0/pzCvxYfEcWdeymdbGm03iOgIJ1FJmdhAMkJu/0pimcuGQyQLx4+siDs
	UAhDH0kOIHVDGv7WuZNgooo9fh/f9UIh2WhUzAIUP74cMf5u5D5Oa6wjyVIbN7ummHRD
	msTw==
Received: by 10.68.213.234 with SMTP id nv10mr53240190pbc.56.1340726140894;
	Tue, 26 Jun 2012 08:55:40 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id wf7sm12210523pbc.34.2012.06.26.08.55.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 08:55:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2012 08:55:22 -0700
Message-Id: <1340726124-30861-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/3] cpufrequtils: Fix build without NLS
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
X-List-Received-Date: Tue, 26 Jun 2012 16:06:34 -0000

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
index 855b9c8..b5327c3 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -11,7 +11,9 @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
 SRC_URI = "git://github.com/emagii/cpufrequtils.git \
           "
 
-PR = "r3"
+CFLAGS += "${@['-DNLS', '-UNLS']['${USE_NLS}' == 'no']}"
+
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5



