Return-Path: <joe@deserted.net>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A626071B86
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:11:23 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id b186so29242858iof.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6LDCLcvS/cETxOgv1EIePmqT1ep7jFyc6KmRtnQmP1Q=;
	b=O0+PVS61OTISAmAH6++4NacitnB9jFJtIk3QHk0hiTvmzaIZhIFjGKEolOOrIy7/aq
	vs8b5OtamaJjgLEBnMFil/8hEClbzWTsxpz2mv6m30yNMQPS/oIbX9KTeOvcNSYJgqzI
	zCCe2ipeQtDy0S9JeDAuN4lRfsi2vxEScWtJAVEUfRTDbyMAyr89tWji4ufe9Xw0Yj7w
	hnmgvMiAc1kM9MfGsIq1JUbhDdQ/nst0MX7TLMot3Rw9iEzgw4MIJpL6l43nQu5cYvjP
	udZbcIBvM5W8r/viMWAZmGRQczztWMjxxp7xMeGw3OM7KUPIGT4eLHhXrCV7MyzeEtwS
	SNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6LDCLcvS/cETxOgv1EIePmqT1ep7jFyc6KmRtnQmP1Q=;
	b=pHQ0S5kDP4YLB183Jhei6/+JFasdizjfxW5o9jCaOmyFhQ/57IIx/gwR3K8DnV/dsb
	GVku1T0tPhka5r9QUbCISHBoacTAhgL9+yaR2KnakfliLN2MUCWAD8F3B5QPEUugtNt0
	j5ILTaU/xH/o3zo4H3LiKVo5CFTzjNNgvPyzG48q37vOLtC6fUwSRqQXnbN7gdP8ycR0
	rHvjQz12DmFyEh7n2y4t83EiJ6BBmWoVbEexAAZ3cnJURO4i2lmFOgfCNsDa1Pw0AvgS
	b9enQrfp0xJh8BZ0a6V2Unf+PawUgtdMpCVH7uTLEqm+yXNnka5T/j595hu66WMaaty3
	rM8w==
X-Gm-Message-State: AMCzsaUxqV7ZzJO5SI++pQVbocgitQrKuJ19aALVfNNf98227IO/NcUJ
	oqih1x1tiUVk3woxBgNnl7QhWULX
X-Google-Smtp-Source: ABhQp+Sme6ZK+HS28HqSJjwlh2CvJet5r71hdlY93xKjlnj+l3WQhO/fAceqeUMZsyu8gfqbRrjpHw==
X-Received: by 10.36.34.206 with SMTP id o197mr7360368ito.51.1509387083978;
	Mon, 30 Oct 2017 11:11:23 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	81sm2182416itl.20.2017.10.30.11.11.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 11:11:22 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:11:13 -0400
Message-Id: <1509387073-21934-7-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 6/6] bridge-utils: update to v1.6
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
X-List-Received-Date: Mon, 30 Oct 2017 18:11:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Updating to the latest version (1.6) and taking the opportunity to clean
up the old patches, switch to the upstream git repo for SRC_URI and make
the requested change to the older AR patch from a while back.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-support/bridge-utils/bridge-utils.inc  | 28 -------
 ...ld-error-out-correctly-if-a-submake-fails.patch | 69 -----------------
 ...idge-fix-some-build-time-warnings-fcntl.h.patch | 64 ----------------
 ...idge-fix-some-build-time-warnings-errno.h.patch | 46 ------------
 ...dd-missing-include-s-fix-build-against-mu.patch | 47 ------------
 ...uild-don-t-ignore-CFLAGS-from-environment.patch | 29 ++------
 ...ridge-Modifying-the-AR-to-cross-toolchain.patch | 51 +++++++++++++
 ...5-check-error-returns-from-write-to-sysfs.patch | 87 ----------------------
 ...5-fix-error-message-for-incorrect-command.patch | 33 --------
 ...utils-1.5-fix-incorrect-command-in-manual.patch | 33 --------
 .../bridge-utils/bridge-utils/kernel-headers.patch | 29 +++++---
 .../bridge-utils/bridge-utils_1.5.bb               | 16 ----
 .../bridge-utils/bridge-utils_1.6.bb               | 35 +++++++++
 13 files changed, 114 insertions(+), 453 deletions(-)
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils.inc
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
deleted file mode 100644
index 0fb18d5..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Tools for ethernet bridging"
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
-SECTION = "net"
-LICENSE = "GPLv2"
-
-DEPENDS = "sysfsutils"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz \
-          file://bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch \
-          file://bridge-utils-1.5-fix-error-message-for-incorrect-command.patch \
-          file://bridge-utils-1.5-fix-incorrect-command-in-manual.patch \
-"
-
-inherit autotools-brokensep update-alternatives
-
-ALTERNATIVE_${PN} = "brctl"
-ALTERNATIVE_PRIORITY[brctl] = "100"
-ALTERNATIVE_LINK_NAME[brctl] = "${sbindir}/brctl"
-
-EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
-
-do_install_append () {
-    install -d ${D}/${datadir}/bridge-utils
-    install -d ${D}/${sysconfdir}/network/if-pre-up.d
-    install -d ${D}/${sysconfdir}/network/if-post-down.d
-}
-
-RRECOMMENDS_${PN} = "kernel-module-bridge"
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
deleted file mode 100644
index c6897b4..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 5e102b453e254d16af1f95053134f58348e0f83a Mon Sep 17 00:00:00 2001
-From: root <git@andred.net>
-Date: Wed, 20 Jul 2016 23:40:30 +0100
-Subject: [PATCH 1/5] build: error out correctly if a submake fails
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Due to use of a for loop, return status from submake was always
-ignored.
-
-In the context of build-systems like OE this causes them to not
-detect any errors and continue happily, resulting in a successful,
-but incomplete, build.
-
-Fix by having a nicer Makefile.in which now has rules for the
-individual targets (directories) so that make itself can
-figure out all the dependencies and build those targets as
-needed rather than using a for loop to iterate over the
-directories in a shell and thus loosing the return status of
-the command inside the loop.
-
-This has the added advantage that parallel builds work now.
-
-Upstream-Status: Pending
-
-Signed-off-by: André Draszik <git@andred.net>
----
- Makefile.in | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6028513..dab88bb 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -13,11 +13,11 @@ distdir = $(PACKAGE)-$(VERSION)
- 
- SUBDIRS=libbridge brctl doc
- 
--all:
--	for x in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$x ; done
-+all: override ACTION=
-+all: $(SUBDIRS)
- 
--clean:
--	for x in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$x clean ; done
-+clean: override ACTION=clean
-+clean: $(SUBDIRS)
- 
- distclean:	clean
- 	rm -f config.log
-@@ -30,6 +30,12 @@ maintainer-clean: distclean
- 	rm -f libbridge/Makefile
- 	rm -f doc/Makefile
- 
--install:
--	for x in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$x install; done
-+install: override ACTION=install
-+install: $(SUBDIRS)
- 
-+
-+brctl: libbridge
-+$(SUBDIRS):
-+	$(MAKE) $(MFLAGS) -C $@ $(ACTION)
-+
-+.PHONY: $(SUBDIRS)
--- 
-2.8.1
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
deleted file mode 100644
index 25d08ab..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 68fafc4ea10365ac2e74ab7c660d097696857677 Mon Sep 17 00:00:00 2001
-From: root <git@andred.net>
-Date: Wed, 20 Jul 2016 23:40:32 +0100
-Subject: [PATCH 2/5] libbridge: fix some build-time warnings (fcntl.h)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-There are build-time warnings at the moment when building
-against musl, as the code here #include's the wrong file,
-sys/fcntl.h instead of fcntl.h
-
-In file included from libbridge_devif.c:26:0:
-<sysroot>/usr/include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
- #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
-  ^~~~~~~
-In file included from libbridge_if.c:23:0:
-<sysroot>/usr/include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
- #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
-  ^~~~~~~
-
-glibc headers silently redirect sys/fcntl.h to fcntl.h so the
-issue is not seen there.
-
-Let's fix the #include's to so as to use the correct ones
-and silence the compiler.
-
-Upstream-Status: Pending
-
-Signed-off-by: André Draszik <git@andred.net>
----
- libbridge/libbridge_devif.c | 2 +-
- libbridge/libbridge_if.c    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
-index 1e83925..2cf78f6 100644
---- a/libbridge/libbridge_devif.c
-+++ b/libbridge/libbridge_devif.c
-@@ -23,7 +23,7 @@
- #include <errno.h>
- #include <string.h>
- #include <dirent.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- 
- #include "libbridge.h"
- #include "libbridge_private.h"
-diff --git a/libbridge/libbridge_if.c b/libbridge/libbridge_if.c
-index 77d3f8a..9cf4bac 100644
---- a/libbridge/libbridge_if.c
-+++ b/libbridge/libbridge_if.c
-@@ -20,7 +20,7 @@
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #include <sys/ioctl.h>
- 
- #include "libbridge.h"
--- 
-2.8.1
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
deleted file mode 100644
index 72f2a62..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 2b9dc245f93ab27d7da42a16ddbb9212888006e4 Mon Sep 17 00:00:00 2001
-From: root <git@andred.net>
-Date: Wed, 20 Jul 2016 23:40:33 +0100
-Subject: [PATCH 3/5] bridge: fix some build-time warnings (errno.h)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-There is a build-time warning at the moment when building
-against musl, as the code here #include's the wrong file,
-sys/errno.h instead of errno.h
-
-In file included from brctl.c:22:0:
-<sysroot>/usr/include/sys/errno.h:1:2: warning: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
- #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
-  ^~~~~~~
-
-glibc headers silently redirect sys/errno.h to errno.h so the
-issue is not seen there.
-
-Let's fix the #include's to so as to use the correct ones
-and silence the compiler.
-
-Upstream-Status: Pending
-
-Signed-off-by: André Draszik <git@andred.net>
----
- brctl/brctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/brctl/brctl.c b/brctl/brctl.c
-index 46ca352..8855234 100644
---- a/brctl/brctl.c
-+++ b/brctl/brctl.c
-@@ -19,7 +19,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <getopt.h>
- 
- #include "libbridge.h"
--- 
-2.8.1
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
deleted file mode 100644
index 565186e..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c45b73829a8b8c7924df528baa7e16498f917288 Mon Sep 17 00:00:00 2001
-From: root <git@andred.net>
-Date: Wed, 20 Jul 2016 23:40:33 +0100
-Subject: [PATCH 4/5] libbridge: add missing #include's (fix build against
- musl)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes error like:
-
-In file included from libbridge_devif.c:28:0:
-libbridge.h:45:17: error: field 'max_age' has incomplete type
-  struct timeval max_age;
-                 ^~~~~~~
-In file included from libbridge_devif.c:28:0:
-libbridge.h:51:2: error: unknown type name 'u_int16_t'
-  u_int16_t root_port;
-  ^~~~~~~~~
-
-These types are not standard C but rather Posix,
-for struct timeval see:
-http://pubs.opengroup.org/onlinepubs/7908799/xsh/systime.h.html
-
-Upstream-Status: Pending
-
-Signed-off-by: André Draszik <git@andred.net>
----
- libbridge/libbridge.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
-index 53ec869..b0727c1 100644
---- a/libbridge/libbridge.h
-+++ b/libbridge/libbridge.h
-@@ -20,6 +20,8 @@
- #define _LIBBRIDGE_H
- 
- #include <sys/socket.h>
-+#include <sys/time.h>
-+#include <sys/types.h>
- #include <linux/in6.h>
- #include <linux/if.h>
- #include <linux/if_bridge.h>
--- 
-2.8.1
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
index 9f2155e..0a72c6b 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
@@ -1,7 +1,7 @@
-From 7bc1932cabfafca8c68e18bd43e3d203c70d2dd8 Mon Sep 17 00:00:00 2001
-From: root <git@andred.net>
-Date: Wed, 20 Jul 2016 23:40:33 +0100
-Subject: [PATCH 5/5] build: don't ignore CFLAGS from environment
+From 9d63838d12c772dfe33371e2bb8b8191625539f2 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Mon, 30 Oct 2017 13:37:48 -0400
+Subject: [PATCH] build: don't ignore CFLAGS from environment
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -17,10 +17,10 @@ used during compilation must also always be used during linking!
 Upstream-Status: Pending
 
 Signed-off-by: André Draszik <git@andred.net>
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 ---
- brctl/Makefile.in     | 2 +-
- libbridge/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ brctl/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/brctl/Makefile.in b/brctl/Makefile.in
 index e1956d6..eff260c 100644
@@ -35,19 +35,6 @@ index e1956d6..eff260c 100644
  
  %.o: %.c brctl.h
  	$(CC) $(CFLAGS) $(INCLUDE) -c $< 
-diff --git a/libbridge/Makefile.in b/libbridge/Makefile.in
-index 20512c4..4e1cddc 100644
---- a/libbridge/Makefile.in
-+++ b/libbridge/Makefile.in
-@@ -5,7 +5,7 @@ AR=ar
- RANLIB=@RANLIB@
- 
- CC=@CC@
--CFLAGS = -Wall -g $(KERNEL_HEADERS)
-+CFLAGS = -Wall -g $(KERNEL_HEADERS) @CFLAGS@
- 
- prefix=@prefix@
- exec_prefix=@exec_prefix@
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch
new file mode 100644
index 0000000..3f65761
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch
@@ -0,0 +1,51 @@
+From c924f66743c054d7ebafef90ca1bbebc96732357 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Mon, 30 Oct 2017 13:48:33 -0400
+Subject: [PATCH] libbridge: Modifying the AR to cross toolchain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Makefile uses the host “ar” tool when it should be using the ar from
+the target toolchain.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ configure.ac          | 1 +
+ libbridge/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8b2e2ea..8426b7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -12,6 +12,10 @@ dnl Checks for programs.
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_RANLIB
++AN_MAKEVAR([AR], [AC_PROG_AR])
++AN_PROGRAM([ar], [AC_PROG_AR])
++AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
++AC_PROG_AR
+ 
+ dnl Checks for header files.
+ AC_HEADER_STDC
+diff --git a/libbridge/Makefile.in b/libbridge/Makefile.in
+index 7932bfe..bd55e9b 100644
+--- a/libbridge/Makefile.in
++++ b/libbridge/Makefile.in
+@@ -1,7 +1,7 @@
+ 
+ KERNEL_HEADERS=-I@KERNEL_HEADERS@
+ 
+-AR=ar
++AR=@AR@
+ RANLIB=@RANLIB@
+ 
+ CC=@CC@
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
deleted file mode 100644
index d00af9c..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-utils.git/diff/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch?id=b0d10717fd7cebf5d85eed3f941b409fa0384f08]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
-From bb9970a9df95837e39d680021b1f73d231e85406 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <shemminger@vyatta.com>
-Date: Tue, 3 May 2011 09:52:43 -0700
-Subject: [PATCH 3/3] Check error returns from write to sysfs
-
-Add helper function to check write to sysfs files.
-
-Signed-off-by: Petr Sabata <contyk@redhat.com>
----
- libbridge/libbridge_devif.c |   37 +++++++++++++++++++++++--------------
- 1 files changed, 23 insertions(+), 14 deletions(-)
-
-diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
-index aa8bc36..1e83925 100644
---- a/libbridge/libbridge_devif.c
-+++ b/libbridge/libbridge_devif.c
-@@ -280,25 +280,38 @@ fallback:
- 	return old_get_port_info(brname, port, info);
- }
- 
-+static int set_sysfs(const char *path, unsigned long value)
-+{
-+	int fd, ret = 0, cc;
-+	char buf[32];
-+
-+	fd = open(path, O_WRONLY);
-+	if (fd < 0)
-+		return -1;
-+
-+	cc = snprintf(buf, sizeof(buf), "%lu\n", value);
-+	if (write(fd, buf, cc) < 0)
-+		ret = -1;
-+	close(fd);
-+
-+	return ret;
-+}
-+
- 
- static int br_set(const char *bridge, const char *name,
- 		  unsigned long value, unsigned long oldcode)
- {
- 	int ret;
- 	char path[SYSFS_PATH_MAX];
--	FILE *f;
- 
--	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/%s", bridge, name);
-+	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/bridge/%s",
-+		 bridge, name);
- 
--	f = fopen(path, "w");
--	if (f) {
--		ret = fprintf(f, "%ld\n", value);
--		fclose(f);
--	} else {
-+	if ((ret = set_sysfs(path, value)) < 0) {
- 		/* fallback to old ioctl */
- 		struct ifreq ifr;
- 		unsigned long args[4] = { oldcode, value, 0, 0 };
--		
-+
- 		strncpy(ifr.ifr_name, bridge, IFNAMSIZ);
- 		ifr.ifr_data = (char *) &args;
- 		ret = ioctl(br_socket_fd, SIOCDEVPRIVATE, &ifr);
-@@ -348,14 +361,10 @@ static int port_set(const char *bridge, const char *ifname,
- {
- 	int ret;
- 	char path[SYSFS_PATH_MAX];
--	FILE *f;
- 
- 	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/brport/%s", ifname, name);
--	f = fopen(path, "w");
--	if (f) {
--		ret = fprintf(f, "%ld\n", value);
--		fclose(f);
--	} else {
-+
-+	if ((ret = set_sysfs(path, value)) < 0) {
- 		int index = get_portno(bridge, ifname);
- 
- 		if (index < 0)
--- 
-1.7.5.2
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
deleted file mode 100644
index 2d0494e..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-utils.git/diff/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch?id=b0d10717fd7cebf5d85eed3f941b409fa0384f08]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
-From c7ed0996ef58b497d3d30be802ab5ae6c37099b5 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <shemminger@vyatta.com>
-Date: Tue, 3 May 2011 09:49:57 -0700
-Subject: [PATCH 2/3] Fix error message for incorrect command
-
-Debian bug 406907
-Error message was refering to incorrect command argument.
-
-Signed-off-by: Petr Sabata <contyk@redhat.com>
----
- brctl/brctl.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/brctl/brctl.c b/brctl/brctl.c
-index 454b8dd..46ca352 100644
---- a/brctl/brctl.c
-+++ b/brctl/brctl.c
-@@ -69,7 +69,7 @@ int main(int argc, char *const* argv)
- 	argc -= optind;
- 	argv += optind;
- 	if ((cmd = command_lookup(*argv)) == NULL) {
--		fprintf(stderr, "never heard of command [%s]\n", argv[1]);
-+		fprintf(stderr, "never heard of command [%s]\n", *argv);
- 		goto help;
- 	}
- 	
--- 
-1.7.5.2
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
deleted file mode 100644
index 6f6d6d4..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-utils.git/diff/bridge-utils-1.5-fix-incorrect-command-in-manual.patch?id=b0d10717fd7cebf5d85eed3f941b409fa0384f08]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
-From 8ef7b77562b636efcbd8b759eb324d6c069200f2 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <shemminger@vyatta.com>
-Date: Tue, 3 May 2011 09:48:40 -0700
-Subject: [PATCH 1/3] Fix incorrect command in manual
-
-Command is "setageing" not "setageingtime"; fix man page.
-Debian bug report.
-
-Signed-off-by: Petr Sabata <contyk@redhat.com>
----
- doc/brctl.8 |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/doc/brctl.8 b/doc/brctl.8
-index d904047..771f323 100644
---- a/doc/brctl.8
-+++ b/doc/brctl.8
-@@ -89,7 +89,7 @@ data. Machines can move to other ports, network cards can be replaced
- .B brctl showmacs <brname>
- shows a list of learned MAC addresses for this bridge.
- 
--.B brctl setageingtime <brname> <time>
-+.B brctl setageing <brname> <time>
- sets the ethernet (MAC) address ageing time, in seconds. After <time>
- seconds of not having seen a frame coming from a certain address, the
- bridge will time out (delete) that address from the Forwarding
--- 
-1.7.5.2
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
index de36f05..8a23a30 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
@@ -1,22 +1,33 @@
-include missing kernel header
+From 824f838cc9c7b8a44174358446993d61be7bbb3f Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Mon, 30 Oct 2017 13:18:20 -0400
+Subject: [PATCH] include missing kernel header
 
 Fixes errors like
 
 | /b/kraj/jlinux-next/poky/build/tmp-eglibc/sysroots/re-64b/usr/include/linux/if_bridge.h:172:20: error: field 'ip6' has incomplete type
 | In file included from ../libbridge/libbridge.h:24:0,
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: bridge-utils-1.5/libbridge/libbridge.h
-===================================================================
---- bridge-utils-1.5.orig/libbridge/libbridge.h	2011-03-28 17:52:54.000000000 -0700
-+++ bridge-utils-1.5/libbridge/libbridge.h	2013-03-04 21:16:25.781188309 -0800
-@@ -20,6 +20,7 @@
- #define _LIBBRIDGE_H
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ libbridge/libbridge.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
+index c038b92..fd09306 100644
+--- a/libbridge/libbridge.h
++++ b/libbridge/libbridge.h
+@@ -24,6 +24,7 @@
+ #include <sys/time.h>
+ #include <netinet/in.h>
  
- #include <sys/socket.h>
 +#include <linux/in6.h>
  #include <linux/if.h>
  #include <linux/if_bridge.h>
  
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
deleted file mode 100644
index 6032ab0..0000000
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require bridge-utils.inc
-
-SRC_URI += "\
-    file://kernel-headers.patch \
-    file://0001-build-error-out-correctly-if-a-submake-fails.patch \
-    file://0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch \
-    file://0003-bridge-fix-some-build-time-warnings-errno.h.patch \
-    file://0004-libbridge-add-missing-include-s-fix-build-against-mu.patch \
-    file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
-"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
-
-SRC_URI[md5sum] = "ec7b381160b340648dede58c31bb2238"
-SRC_URI[sha256sum] = "42f9e5fb8f6c52e63a98a43b81bd281c227c529f194913e1c51ec48a393b6688"
-
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
new file mode 100644
index 0000000..1c87c48
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Tools for ethernet bridging"
+HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
+SECTION = "net"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
+
+SRCREV = "42c1aefc303fdf891fbb099ea51f00dca83ab606"
+
+SRC_URI = "\
+    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git \
+    file://kernel-headers.patch \
+    file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
+    file://0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
+"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "sysfsutils"
+
+inherit autotools-brokensep update-alternatives
+
+ALTERNATIVE_${PN} = "brctl"
+ALTERNATIVE_PRIORITY[brctl] = "100"
+ALTERNATIVE_LINK_NAME[brctl] = "${sbindir}/brctl"
+
+EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
+
+do_install_append () {
+    install -d ${D}/${datadir}/bridge-utils
+    install -d ${D}/${sysconfdir}/network/if-pre-up.d
+    install -d ${D}/${sysconfdir}/network/if-post-down.d
+}
+
+RRECOMMENDS_${PN} = "kernel-module-bridge"
-- 
2.7.4


