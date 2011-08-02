Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1QoJK8-0000oJ-6n
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 20:04:12 +0200
Received: by fxg11 with SMTP id 11so80303fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4W5SznFnDMEYX4I90k92Q4tEWPdb+HVrOHWZrb25Zcw=;
	b=TPiNqFKVixn9rWOwLg39PCqRWeI6CuXoPVbAua3NHlpG+AlKXw//k2Kx3vpZb9JTWK
	1yguvj0XfUa1jCWh1HGeuzkhMq6uHvbW+2lZ95DB2sewDZ0C2sKJPLtX1G6/I33mcqUF
	/ZN/ipXH9oKljGpjQO5H7x4AyKliGLT9oCqNw=
Received: by 10.223.8.201 with SMTP id i9mr7965518fai.45.1312307990817;
	Tue, 02 Aug 2011 10:59:50 -0700 (PDT)
Received: from localhost.localdomain (pD957CD12.dip.t-dialin.net
	[217.87.205.18])
	by mx.google.com with ESMTPS id f27sm2888fak.7.2011.08.02.10.59.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 10:59:47 -0700 (PDT)
From: Josua Mayer <josua.mayer97@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2011 19:59:21 +0200
Message-Id: <1312307961-985-1-git-send-email-josua.mayer97@googlemail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH] linux-x86_2.6.20: fix build
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
X-List-Received-Date: Tue, 02 Aug 2011 18:04:12 -0000

From: = <=>

* fix compile error about PATH_MAX not beeing defined
* copied patch from recipes/linux/linux-2.6.20
  git://github.com/openembedded/openembedded as of
    commit 0b521d7bcfbb6f26bb2d3ad55add6a3f677a199d

Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
---
 ...ude-limits.h-in-sumversion.c-for-PATH_MAX.patch |   29 ++++++++++++++++++++
 recipes/linux/linux-x86_2.6.20.bb                  |    4 ++-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-x86-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch

diff --git a/recipes/linux/linux-x86-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch b/recipes/linux/linux-x86-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch
new file mode 100644
index 0000000..4871601
--- /dev/null
+++ b/recipes/linux/linux-x86-2.6.20/0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch
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
diff --git a/recipes/linux/linux-x86_2.6.20.bb b/recipes/linux/linux-x86_2.6.20.bb
index b630780..8d4fc99 100644
--- a/recipes/linux/linux-x86_2.6.20.bb
+++ b/recipes/linux/linux-x86_2.6.20.bb
@@ -3,7 +3,9 @@ SECTION = "kernel"
 LICENSE = "GPLv2"
 PR = "r5"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 " 
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
+	file://0001-kbuild-include-limits.h-in-sumversion.c-for-PATH_MAX.patch \
+" 
 
 SRC_URI_append_x86 = "file://i486-defconfig"
 SRC_URI_append_i586 = "file://i586-defconfig"
-- 
1.7.5.3



