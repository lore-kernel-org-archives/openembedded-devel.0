Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qcgsf-000173-Qu
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 18:47:49 +0200
Received: by iwn4 with SMTP id 4so3223601iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pox0z3sqBEt5/XE2/mBNkw5cjTMW2B4o8EY+ugwgLLI=;
	b=VHYJQRO0cSZpRrxdYhYIZF07nIhc9ofAVQlPZbU0iqyYNyN0WpHMdBOTNAmH30ifP2
	NMDlubXqZrhBUDePG8ffv30QEZSeYa7HAbriLM2o8RmvL7dQE1Z4Ip1UUIUKZPkHHs2X
	TOm/ES9/CLk4nSNgR2QR8jDOD7oIh+JOidon8=
Received: by 10.231.74.84 with SMTP id t20mr2995887ibj.38.1309538185900;
	Fri, 01 Jul 2011 09:36:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j1sm1949813ibg.38.2011.07.01.09.36.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 09:36:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2011 09:36:11 -0700
Message-Id: <1309538171-28964-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309538171-28964-1-git-send-email-raj.khem@gmail.com>
References: <1309538171-28964-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] cpufrequtils: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 01 Jul 2011 16:47:50 -0000

We make nls optional

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cpufrequtils-008/cpufrequtils-nls.patch        |   81 ++++++++++++++++++++
 .../cpufrequtils/cpufrequtils_008.bb               |    6 +-
 2 files changed, 86 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch b/meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch
new file mode 100644
index 0000000..cbc8719
--- /dev/null
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils-008/cpufrequtils-nls.patch
@@ -0,0 +1,81 @@
+make nls/gettext support optional
+
+patch by Jos van der Ende <seraph@xs4all.nl>
+
+http://bugs.gentoo.org/205576
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2011-06-30 17:50:23.000000000 -0700
++++ git/Makefile	2011-07-01 07:06:58.300033928 -0700
+@@ -121,6 +121,7 @@
+ ifeq ($(strip $(NLS)),true)
+ 	INSTALL_NLS += install-gmo
+ 	COMPILE_NLS += update-gmo
++	CFLAGDEF += -DNLS
+ endif
+ 
+ ifeq ($(strip $(CPUFRQ_BENCH)),true)
+Index: git/utils/info.c
+===================================================================
+--- git.orig/utils/info.c	2011-06-30 17:50:23.000000000 -0700
++++ git/utils/info.c	2011-07-01 07:06:58.300033928 -0700
+@@ -10,7 +10,6 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <libintl.h>
+ #include <locale.h>
+ 
+ #include <getopt.h>
+@@ -18,9 +17,18 @@
+ #include "cpufreq.h"
+ 
+ 
++#ifdef NLS
++#include <libintl.h>
+ #define _(String) gettext (String)
+ #define gettext_noop(String) String
+ #define N_(String) gettext_noop (String)
++#else
++#define gettext_noop(String) String
++#define _(String) gettext_noop (String)
++#define gettext(String) gettext_noop (String)
++#define N_(String) gettext_noop (String)
++#define textdomain(String)
++#endif
+ 
+ #define LINE_LEN 10
+ 
+Index: git/utils/set.c
+===================================================================
+--- git.orig/utils/set.c	2011-06-30 17:50:23.000000000 -0700
++++ git/utils/set.c	2011-07-01 07:07:56.980119994 -0700
+@@ -12,16 +12,23 @@
+ #include <limits.h>
+ #include <string.h>
+ #include <ctype.h>
+-#include <libintl.h>
+ #include <locale.h>
+ 
+ #include <getopt.h>
+ 
+ #include "cpufreq.h"
+-
+-#define _(String) gettext(String)
++#ifdef NLS
++#include <libintl.h>
++#define _(String) gettext (String)
++#define gettext_noop(String) String
++#define N_(String) gettext_noop (String)
++#else
+ #define gettext_noop(String) String
+-#define N_(String) gettext_noop(String)
++#define _(String) gettext_noop (String)
++#define gettext(String) gettext_noop (String)
++#define N_(String) gettext_noop (String)
++#define textdomain(String)
++#endif
+ 
+ #define NORM_FREQ_LEN 32
+ 
diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index a28ab83..d795e54 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -6,7 +6,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRCREV = "adb7e044755aa06b12212d05c4acbcccb023d2cd"
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
+           file://cpufrequtils-nls.patch \
+          "
+
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1



