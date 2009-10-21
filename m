Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0Z6S-0000hn-9p
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 13:11:43 +0200
Received: (qmail 31229 invoked by uid 813007); 21 Oct 2009 11:10:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 11:10:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 13:12:28 +0200
Message-Id: <1256123548-1160-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255966150-1854-3-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-3-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.20: added patch to fix PATH_MAX related build error
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
X-List-Received-Date: Wed, 21 Oct 2009 11:11:43 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 ...ude-limits.h-in-sumversion.c-for-PATH_MAX.patch |   29 ++++++++++++++++++++
 recipes/linux/linux_2.6.20.bb                      |    1 +
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch

diff --git a/recipes/linux/linux-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch b/recipes/linux/linux-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch
new file mode 100644
index 0000000..4871601
--- /dev/null
+++ b/recipes/linux/linux-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch
@@ -0,0 +1,29 @@
+From fc31c7716355a226b8ed4e16f4581e5c8fa53570 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 17 May 2007 14:57:20 -0400
+Subject: [PATCH] kbuild: include limits.h in sumversion.c for PATH_MAX
+
+POSIX says limits.h defines PATH_MAX so we should include it (which fixes
+compiling on some systems like OS X).
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
+---
+ scripts/mod/sumversion.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
+index 6873d5a..d9cc690 100644
+--- a/scripts/mod/sumversion.c
++++ b/scripts/mod/sumversion.c
+@@ -7,6 +7,7 @@
+ #include <ctype.h>
+ #include <errno.h>
+ #include <string.h>
++#include <limits.h>
+ #include "modpost.h"
+ 
+ /*
+-- 
+1.6.3.3
+
diff --git a/recipes/linux/linux_2.6.20.bb b/recipes/linux/linux_2.6.20.bb
index c701a3b..07c85bc 100644
--- a/recipes/linux/linux_2.6.20.bb
+++ b/recipes/linux/linux_2.6.20.bb
@@ -9,6 +9,7 @@ PR = "r9"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.21.bz2;patch=1 \
+	   file://0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch;patch=1 \
            file://defconfig"
 
 SRC_URI_append_n2100 = "\
-- 
1.6.5





