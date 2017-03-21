Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B3EF371B1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o126so20595116pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bA6GdlZsZ+dmpSo6O048UMVYQfLgqxBjWvhal0y9Ivc=;
	b=DjvFgrDl35qKOPqdi0jdVhEaTCjwPnfsXG3MJuGKaKUOs4QZQBAJLOIPSUgiZpBU+M
	zrn8J0YVwpr8DjxRTDL2WAULIFQEzGI75SthbwVAgZNUxeRjNZvizbpC7Pz5EZ1Yp+hD
	ekuEIyDKEQSLYUbTxrDxP5eKQysbHM+IilWmF+MP2412EI8VV97UsdicSstpaRFn8QFm
	6DZFfh4y5ZpEgRmCY+6jU9AlD5CXDvepEKQD7hPzDMy4VGzD5m3zm1dOWr+t5FswwQJy
	cyqqM5rBKvo/WUIQ+2MueLSdLvndx5oedCv4zVh8BB00/4lcNwrbiDtG9NmUbXwd5pRd
	mg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bA6GdlZsZ+dmpSo6O048UMVYQfLgqxBjWvhal0y9Ivc=;
	b=TyZh5P46H0Lks5vDvMFkGfEiv1IARYw6xm0CJMIbOo+QSc0C470jIipgxU4AtW50+F
	p7cAsvt6d803t791BvDNj3E1y/XH2QdkqtHWgTChUfQs4Y9EhCPM2C2Jyujxxt9u7b1+
	RKrPgCX5tsYkZBVcphsrRcvRg+fVuHNa473S4Ku7f1Zy5q3oOtMkMPJ3K+3z7ZG9sUiy
	nWkNVU+LIEPx2J+LjCAB/fN7KcVgwKeYrPg4OrSwRi5n3xg/yZdSAvAVR9ggxMA7yUjU
	AWp3q9QZqYDntw3qXsPoOiyMCPKoP0QbSpl/xjqO7haZUpDiIH9KR5yS8bGH5zXVwJCq
	jVMQ==
X-Gm-Message-State: AFeK/H1hUNnE/nBsszSQ4ceOnaHatRS3r0o8XB0v0/ywVLlWapw2DMM7wsjQNoYsuSND1A==
X-Received: by 10.99.233.17 with SMTP id i17mr36510711pgh.76.1490077957055;
	Mon, 20 Mar 2017 23:32:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:20 -0700
Message-Id: <20170321063227.11565-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [meta-oe][PATCH 1/8] atop: Fix build with musl
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../atop/0001-include-missing-header-files.patch   | 97 ++++++++++++++++++++++
 .../atop/{atop_2.2.3.bb => atop_git.bb}            |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch
 rename meta-oe/recipes-support/atop/{atop_2.2.3.bb => atop_git.bb} (97%)

diff --git a/meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch b/meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch
new file mode 100644
index 000000000..3708f60ba
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch
@@ -0,0 +1,97 @@
+From 7b651793269b6b86f12c43c30b751b86def27222 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 17:56:40 -0700
+Subject: [PATCH] include missing header files
+
+fixes build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ deviate.c     | 1 +
+ procdbase.c   | 2 +-
+ showgeneric.c | 2 +-
+ showlinux.c   | 2 +-
+ showprocs.c   | 2 +-
+ showsys.c     | 2 +-
+ 6 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/deviate.c b/deviate.c
+index 7cf1b49..8e615af 100644
+--- a/deviate.c
++++ b/deviate.c
+@@ -178,6 +178,7 @@ static const char rcsid[] = "$Id: deviate.c,v 1.45 2010/10/23 14:02:03 gerlof Ex
+ #include <stdio.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <stdlib.h>
+ #include <unistd.h>
+ #include <limits.h>
+ #include <memory.h>
+diff --git a/procdbase.c b/procdbase.c
+index 9cab347..0487d26 100644
+--- a/procdbase.c
++++ b/procdbase.c
+@@ -67,7 +67,7 @@ static const char rcsid[] = "$Id: procdbase.c,v 1.8 2010/04/23 12:19:35 gerlof E
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <string.h>
+-#include <malloc.h>
++#include <stdlib.h>
+ 
+ #include "atop.h"
+ #include "photoproc.h"
+diff --git a/showgeneric.c b/showgeneric.c
+index 775afa8..3d5be0e 100644
+--- a/showgeneric.c
++++ b/showgeneric.c
+@@ -268,7 +268,7 @@ static const char rcsid[] = "$Id: showgeneric.c,v 1.71 2010/10/25 19:08:32 gerlo
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <string.h>
+-#include <termio.h>
++#include <termios.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+diff --git a/showlinux.c b/showlinux.c
+index 6e60754..aba2ee6 100644
+--- a/showlinux.c
++++ b/showlinux.c
+@@ -274,7 +274,7 @@ static const char rcsid[] = "$Id: showlinux.c,v 1.70 2010/10/23 14:04:12 gerlof
+ #include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <termio.h>
++#include <termios.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+diff --git a/showprocs.c b/showprocs.c
+index 5194524..f0169ad 100644
+--- a/showprocs.c
++++ b/showprocs.c
+@@ -94,7 +94,7 @@ static const char rcsid[] = "$Id: showprocs.c,v 1.15 2011/09/05 11:44:16 gerlof
+ #include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <termio.h>
++#include <termios.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+diff --git a/showsys.c b/showsys.c
+index 26331be..5a05fe5 100644
+--- a/showsys.c
++++ b/showsys.c
+@@ -80,7 +80,7 @@ static const char rcsid[] = "XXXXXX";
+ #include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <termio.h>
++#include <termios.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-support/atop/atop_2.2.3.bb b/meta-oe/recipes-support/atop/atop_git.bb
similarity index 97%
rename from meta-oe/recipes-support/atop/atop_2.2.3.bb
rename to meta-oe/recipes-support/atop/atop_git.bb
index a36f08dd7..1ab9e7cf9 100644
--- a/meta-oe/recipes-support/atop/atop_2.2.3.bb
+++ b/meta-oe/recipes-support/atop/atop_git.bb
@@ -20,6 +20,7 @@ ATOP_VER = "${@'-'.join(d.getVar('PV').rsplit('.', 1))}"
 SRC_URI = " \
     http://www.atoptool.nl/download/${BPN}-${ATOP_VER}.tar.gz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://volatiles.atop.conf', 'file://volatiles.99_atop', d)} \
+    file://0001-include-missing-header-files.patch \
     file://remove-bashisms.patch \
     file://fix-permissions.patch \
     file://sysvinit-implement-status.patch \
-- 
2.12.0


