Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B177607F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 22:56:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so262816wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 15:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ssUQO+YVMHfG3+zQED0ucvnTzyr/gE/TLeaThUQW2LU=;
	b=HMb7XZLxDnkVwB6q3p3d9nCmONHgenubFz1u7bAwc8q6qRQfNHLbmU5HaXG/sQOo5q
	KY86/qo8Te99YgAEm4nVDbil04R5ULOy04WjrNEWlaXxXA67jfdY/XXNFUfui347WB4X
	rYg3oR/wbCrbfbfWsi1Uv9h8yI+M72rBRvwZeOdFY1TTNq/1KpomP4a8NUEdu9suDVX1
	xem34hxE5s1bo71fi1G89iKNnY6FDoRf5e7zR9GrmKZG31WpeMr8mUAmmqdje6nRKoQn
	KLp5PYzeoBotGZypPQ40eYyOyXIFrpwZH7a6etEcxROK/xrf8kybZQ/CEmLejtw78wnX
	i4vA==
X-Gm-Message-State: ALyK8tIJZynKRdQZRKRkZhule0X/ASDU1CJi2HZ04mNkqFC48pGhX2xJ2XbjfOrSay9l6g==
X-Received: by 10.194.248.38 with SMTP id yj6mr3699583wjc.163.1469055381122;
	Wed, 20 Jul 2016 15:56:21 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id u72sm287690wmf.5.2016.07.20.15.56.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 15:56:20 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 23:56:18 +0100
Message-Id: <1469055378-1937-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] bridge-utils: various build fixes (musl & CFLAGS)
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
X-List-Received-Date: Wed, 20 Jul 2016 22:56:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bridge-utils suffers from a few problems:
- doesn't build on musl
- doesn't respect CFLAGS
- build errors are silently ignored
- doesn't support parallel make

All of these are addressed with the included patches.

Signed-off-by: André Draszik <git@andred.net>
---
 ...ld-error-out-correctly-if-a-submake-fails.patch | 69 ++++++++++++++++++++++
 ...idge-fix-some-build-time-warnings-fcntl.h.patch | 64 ++++++++++++++++++++
 ...idge-fix-some-build-time-warnings-errno.h.patch | 46 +++++++++++++++
 ...dd-missing-include-s-fix-build-against-mu.patch | 47 +++++++++++++++
 ...uild-don-t-ignore-CFLAGS-from-environment.patch | 53 +++++++++++++++++
 .../bridge-utils/bridge-utils_1.5.bb               | 11 +++-
 6 files changed, 287 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
new file mode 100644
index 0000000..c6897b4
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
@@ -0,0 +1,69 @@
+From 5e102b453e254d16af1f95053134f58348e0f83a Mon Sep 17 00:00:00 2001
+From: root <git@andred.net>
+Date: Wed, 20 Jul 2016 23:40:30 +0100
+Subject: [PATCH 1/5] build: error out correctly if a submake fails
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Due to use of a for loop, return status from submake was always
+ignored.
+
+In the context of build-systems like OE this causes them to not
+detect any errors and continue happily, resulting in a successful,
+but incomplete, build.
+
+Fix by having a nicer Makefile.in which now has rules for the
+individual targets (directories) so that make itself can
+figure out all the dependencies and build those targets as
+needed rather than using a for loop to iterate over the
+directories in a shell and thus loosing the return status of
+the command inside the loop.
+
+This has the added advantage that parallel builds work now.
+
+Upstream-Status: Pending
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+ Makefile.in | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6028513..dab88bb 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -13,11 +13,11 @@ distdir = $(PACKAGE)-$(VERSION)
+ 
+ SUBDIRS=libbridge brctl doc
+ 
+-all:
+-	for x in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$x ; done
++all: override ACTION=
++all: $(SUBDIRS)
+ 
+-clean:
+-	for x in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$x clean ; done
++clean: override ACTION=clean
++clean: $(SUBDIRS)
+ 
+ distclean:	clean
+ 	rm -f config.log
+@@ -30,6 +30,12 @@ maintainer-clean: distclean
+ 	rm -f libbridge/Makefile
+ 	rm -f doc/Makefile
+ 
+-install:
+-	for x in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$x install; done
++install: override ACTION=install
++install: $(SUBDIRS)
+ 
++
++brctl: libbridge
++$(SUBDIRS):
++	$(MAKE) $(MFLAGS) -C $@ $(ACTION)
++
++.PHONY: $(SUBDIRS)
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
new file mode 100644
index 0000000..25d08ab
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
@@ -0,0 +1,64 @@
+From 68fafc4ea10365ac2e74ab7c660d097696857677 Mon Sep 17 00:00:00 2001
+From: root <git@andred.net>
+Date: Wed, 20 Jul 2016 23:40:32 +0100
+Subject: [PATCH 2/5] libbridge: fix some build-time warnings (fcntl.h)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There are build-time warnings at the moment when building
+against musl, as the code here #include's the wrong file,
+sys/fcntl.h instead of fcntl.h
+
+In file included from libbridge_devif.c:26:0:
+<sysroot>/usr/include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
+ #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
+  ^~~~~~~
+In file included from libbridge_if.c:23:0:
+<sysroot>/usr/include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
+ #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
+  ^~~~~~~
+
+glibc headers silently redirect sys/fcntl.h to fcntl.h so the
+issue is not seen there.
+
+Let's fix the #include's to so as to use the correct ones
+and silence the compiler.
+
+Upstream-Status: Pending
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+ libbridge/libbridge_devif.c | 2 +-
+ libbridge/libbridge_if.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
+index 1e83925..2cf78f6 100644
+--- a/libbridge/libbridge_devif.c
++++ b/libbridge/libbridge_devif.c
+@@ -23,7 +23,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <dirent.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ 
+ #include "libbridge.h"
+ #include "libbridge_private.h"
+diff --git a/libbridge/libbridge_if.c b/libbridge/libbridge_if.c
+index 77d3f8a..9cf4bac 100644
+--- a/libbridge/libbridge_if.c
++++ b/libbridge/libbridge_if.c
+@@ -20,7 +20,7 @@
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <sys/ioctl.h>
+ 
+ #include "libbridge.h"
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
new file mode 100644
index 0000000..72f2a62
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
@@ -0,0 +1,46 @@
+From 2b9dc245f93ab27d7da42a16ddbb9212888006e4 Mon Sep 17 00:00:00 2001
+From: root <git@andred.net>
+Date: Wed, 20 Jul 2016 23:40:33 +0100
+Subject: [PATCH 3/5] bridge: fix some build-time warnings (errno.h)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There is a build-time warning at the moment when building
+against musl, as the code here #include's the wrong file,
+sys/errno.h instead of errno.h
+
+In file included from brctl.c:22:0:
+<sysroot>/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
+ #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
+  ^~~~~~~
+
+glibc headers silently redirect sys/errno.h to errno.h so the
+issue is not seen there.
+
+Let's fix the #include's to so as to use the correct ones
+and silence the compiler.
+
+Upstream-Status: Pending
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+ brctl/brctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/brctl/brctl.c b/brctl/brctl.c
+index 46ca352..8855234 100644
+--- a/brctl/brctl.c
++++ b/brctl/brctl.c
+@@ -19,7 +19,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <getopt.h>
+ 
+ #include "libbridge.h"
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
new file mode 100644
index 0000000..565186e
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
@@ -0,0 +1,47 @@
+From c45b73829a8b8c7924df528baa7e16498f917288 Mon Sep 17 00:00:00 2001
+From: root <git@andred.net>
+Date: Wed, 20 Jul 2016 23:40:33 +0100
+Subject: [PATCH 4/5] libbridge: add missing #include's (fix build against
+ musl)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes error like:
+
+In file included from libbridge_devif.c:28:0:
+libbridge.h:45:17: error: field 'max_age' has incomplete type
+  struct timeval max_age;
+                 ^~~~~~~
+In file included from libbridge_devif.c:28:0:
+libbridge.h:51:2: error: unknown type name 'u_int16_t'
+  u_int16_t root_port;
+  ^~~~~~~~~
+
+These types are not standard C but rather Posix,
+for struct timeval see:
+http://pubs.opengroup.org/onlinepubs/7908799/xsh/systime.h.html
+
+Upstream-Status: Pending
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+ libbridge/libbridge.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
+index 53ec869..b0727c1 100644
+--- a/libbridge/libbridge.h
++++ b/libbridge/libbridge.h
+@@ -20,6 +20,8 @@
+ #define _LIBBRIDGE_H
+ 
+ #include <sys/socket.h>
++#include <sys/time.h>
++#include <sys/types.h>
+ #include <linux/in6.h>
+ #include <linux/if.h>
+ #include <linux/if_bridge.h>
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
new file mode 100644
index 0000000..9f2155e
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
@@ -0,0 +1,53 @@
+From 7bc1932cabfafca8c68e18bd43e3d203c70d2dd8 Mon Sep 17 00:00:00 2001
+From: root <git@andred.net>
+Date: Wed, 20 Jul 2016 23:40:33 +0100
+Subject: [PATCH 5/5] build: don't ignore CFLAGS from environment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We need to take them into account so as to behave nicely towards
+build environments which expect to be able to set them, e.g. for
+optimisation flags, or debug options.
+
+Therefore they need to be added to the compiler command line of
+every source file, and in addition, the same CFLAGS that were
+used during compilation must also always be used during linking!
+
+Upstream-Status: Pending
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+ brctl/Makefile.in     | 2 +-
+ libbridge/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/brctl/Makefile.in b/brctl/Makefile.in
+index e1956d6..eff260c 100644
+--- a/brctl/Makefile.in
++++ b/brctl/Makefile.in
+@@ -34,7 +34,7 @@ install: $(PROGRAMS)
+ 	$(INSTALL) -m 755 $(PROGRAMS) $(DESTDIR)$(sbindir)
+ 
+ brctl:	$(brctl_OBJECTS) ../libbridge/libbridge.a
+-	$(CC) $(LDFLAGS) $(brctl_OBJECTS) $(LIBS) -o brctl
++	$(CC) $(CFLAGS) $(LDFLAGS) $(brctl_OBJECTS) $(LIBS) -o brctl
+ 
+ %.o: %.c brctl.h
+ 	$(CC) $(CFLAGS) $(INCLUDE) -c $< 
+diff --git a/libbridge/Makefile.in b/libbridge/Makefile.in
+index 20512c4..4e1cddc 100644
+--- a/libbridge/Makefile.in
++++ b/libbridge/Makefile.in
+@@ -5,7 +5,7 @@ AR=ar
+ RANLIB=@RANLIB@
+ 
+ CC=@CC@
+-CFLAGS = -Wall -g $(KERNEL_HEADERS)
++CFLAGS = -Wall -g $(KERNEL_HEADERS) @CFLAGS@
+ 
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
index 04f863b..6032ab0 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
@@ -1,8 +1,13 @@
 require bridge-utils.inc
 
-SRC_URI += "file://kernel-headers.patch"
-
-PARALLEL_MAKE = ""
+SRC_URI += "\
+    file://kernel-headers.patch \
+    file://0001-build-error-out-correctly-if-a-submake-fails.patch \
+    file://0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch \
+    file://0003-bridge-fix-some-build-time-warnings-errno.h.patch \
+    file://0004-libbridge-add-missing-include-s-fix-build-against-mu.patch \
+    file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 
-- 
2.8.1


