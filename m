Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 652E971AA7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c4so445373pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YzK3d3tTGTCqQSxd6oqSUhUXJBVzoC2t1acxg3H5OwM=;
	b=rXihKH70de+AGjUaR9PDXLuivsi542+vAACpIiq+dd/RbaMom9gO8gHW9/YTAREgFu
	NEWSRleAwOvlrXPifUXylSKs5hd2QtagdV2d3CsVi6z5eelEbxLzm8fwkGoCFTrvF4cZ
	UVegkd8vWuWoIMsgmGLj3KKQG8x/GdgLBZMd02KIfo1jIlSGfid6I7nRuE0KztAfCuvU
	o3rMFpJaFGRHcEiUdR0PL5xSh8DUhr5dNbGI/6tgundp5QCGYhR2CzU/kW5l4I0hrsLm
	RbESbWoHWyadSJRLHOZCPSY4x6XbbQKCBlw/xqhgDk77U8CPhU/0Gzv5kx3NX2x+tepz
	zkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YzK3d3tTGTCqQSxd6oqSUhUXJBVzoC2t1acxg3H5OwM=;
	b=eld53rAVVDzaIQm4UIixz4iykayDOdCPHpmxuoRRh96rdn5QC0W1ylgb0O+BNAfWc0
	CEsiRHWhJtfKlmPQKmnWiDElan0vXwRkZnnL0kOpQobqaurLTNR3R+rSmwwvyNZ1sAHB
	YFXXvJ5IgeZ46SSNlhWwv8ZPWdFxsy9XcFl2B27nxIqNka5GtcmlLxVYYQJl7B9U1Wuh
	RuY+I4PPa4zklK6sWZOxqraM4OnYq7B26f5s50lR6r4MQMy2HfIACTfFJDHR1+dUHD4I
	1Z8Z73ue/nJaFviq2DhOD5jsnYUy6Yoh7W6359BFD7p4wcV6ERgRxcs6ydT/UmBVZqHn
	ejlA==
X-Gm-Message-State: AKaTC03bXfsAnykhKntdKmmCKkaifcMTqkyNTcxlwC5CdRTaTWXuvHlkpI0CO87EpqmFnQ==
X-Received: by 10.99.126.94 with SMTP id o30mr3575492pgn.66.1479892973007;
	Wed, 23 Nov 2016 01:22:53 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:06 -0800
Message-Id: <20161123092209.23699-46-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 46/49] tvheadend: Update to 4.0.9
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tvheadend/0001-Fix-checks-for-sse2-mmx.patch   | 40 ++++++++++
 ...efile-Ignore-warning-about-wrong-includes.patch | 31 ++++++++
 ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 92 ----------------------
 .../0001-disable-varargs-warning-on-clang.patch    | 32 ++++++++
 .../0001-dvr-Use-labs-instead-of-abs.patch         | 37 +++++++++
 ...verride-forced-overrdiing-og-CC-STRIP-and.patch | 40 ++++++++++
 .../tvheadend/0002-fix-issues-with-gcc6.patch      | 46 -----------
 .../recipes-dvb/tvheadend/tvheadend_git.bb         | 15 ++--
 8 files changed, 189 insertions(+), 144 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Fix-checks-for-sse2-mmx.patch
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Makefile-Ignore-warning-about-wrong-includes.patch
 delete mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-disable-varargs-warning-on-clang.patch
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-dvr-Use-labs-instead-of-abs.patch
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch
 delete mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Fix-checks-for-sse2-mmx.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Fix-checks-for-sse2-mmx.patch
new file mode 100644
index 0000000..3283a5b
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Fix-checks-for-sse2-mmx.patch
@@ -0,0 +1,40 @@
+From f0dab6d6fe4b0aae4394eee93be86e9747c6ed5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Nov 2016 05:07:38 +0000
+Subject: [PATCH] Fix checks for sse2/mmx
+
+Just checking for cmdline options is not enough
+its better to check for builtin defines to be
+sure, clang does not error out on sse2 options on
+arm e.g. and it ends up doing SSE2 stuff for arm
+which is not desired
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 47d2cf2..4be000c 100755
+--- a/configure
++++ b/configure
+@@ -118,8 +118,14 @@ fi
+ # Valiate compiler
+ check_cc || die 'No C compiler found'
+ check_cc_header execinfo
+-check_cc_option mmx
+-check_cc_option sse2
++check_cc_snippet mmx '#ifndef __MMX__
++error "MMX not supported"
++#endif
++'
++check_cc_snippet sse2 '#ifndef __SSE2__
++error "SSE2 not supported"
++#endif
++'
+ 
+ if check_cc '
+ #if !defined(__clang__)
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Makefile-Ignore-warning-about-wrong-includes.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Makefile-Ignore-warning-about-wrong-includes.patch
new file mode 100644
index 0000000..248a5e6
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Makefile-Ignore-warning-about-wrong-includes.patch
@@ -0,0 +1,31 @@
+From 7d672305c7ad2f716dfe1c487b525a1a92954d4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Nov 2016 06:22:36 +0000
+Subject: [PATCH] Makefile: Ignore warning about wrong includes
+
+It happens on musl especially
+usr/include/sys/poll.h:1:2: error: redirecting incorrect #include <sys/poll.h> to <poll.h> [-Werror,-W#warnings]
+| #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+|  ^
+| In file included from src/avahi.c:48:
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index f41ef1a..cc7b249 100644
+--- a/Makefile
++++ b/Makefile
+@@ -54,6 +54,7 @@ CFLAGS  += -Wno-microsoft -Qunused-arguments -Wno-unused-function
+ CFLAGS  += -Wno-unused-value -Wno-tautological-constant-out-of-range-compare
+ CFLAGS  += -Wno-parentheses-equality -Wno-incompatible-pointer-types
+ CFLAGS  += -Wno-error=varargs
++CFLAGS  += -Wno-error=\#warnings
+ endif
+ 
+ ifeq ($(CONFIG_LIBFFMPEG_STATIC),yes)
+-- 
+1.8.3.1
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
deleted file mode 100644
index 9dfcce0..0000000
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 2ee64b359464b48f751683faa5ded3ee8200fe90 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 21 Dec 2012 10:15:42 +0100
-Subject: [PATCH] Move tvheadend specific LD/CFLAGS into a helper variable to
- avoid being overwritten
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: Inappropriate [OE specific]
----
- Makefile              |   20 ++++++++++----------
- support/configure.inc |    8 ++++----
- 2 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 8c6b293..daf5f14 100644
---- a/Makefile
-+++ b/Makefile
-@@ -27,12 +27,12 @@ PROG = ${BUILDDIR}/tvheadend
- # Common compiler flags
- #
- 
--CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
--CFLAGS  += -Wmissing-prototypes -fms-extensions
--CFLAGS  += -g -funsigned-char -O2 
--CFLAGS  += -D_FILE_OFFSET_BITS=64
--CFLAGS  += -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
--LDFLAGS += -lrt -ldl -lpthread -lm
-+TVH_CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
-+TVH_CFLAGS  += -Wmissing-prototypes -fms-extensions
-+TVH_CFLAGS  += -g -funsigned-char -O2 
-+TVH_CFLAGS  += -D_FILE_OFFSET_BITS=64
-+TVH_CFLAGS  += -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
-+TVH_LDFLAGS += -lrt -ldl -lpthread -lm
- 
- #
- # Other config
-@@ -179,8 +179,8 @@ SRCS-${CONFIG_CWC}  += src/ffdecsa/ffdecsa_interface.c \
- 	src/ffdecsa/ffdecsa_int.c
- SRCS-${CONFIG_MMX}  += src/ffdecsa/ffdecsa_mmx.c
- SRCS-${CONFIG_SSE2} += src/ffdecsa/ffdecsa_sse2.c
--${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : CFLAGS += -mmmx
--${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : CFLAGS += -msse2
-+${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : TVH_CFLAGS += -mmmx
-+${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : TVH_CFLAGS += -msse2
- endif
- 
- # File bundles
-@@ -217,12 +217,12 @@ all: ${PROG}
- 
- # Binary
- ${PROG}: $(OBJS) $(ALLDEPS)
--	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
-+	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) $(LDFLAGS)
- 
- # Object
- ${BUILDDIR}/%.o: %.c
- 	@mkdir -p $(dir $@)
--	$(CC) -MD -MP $(CFLAGS) -c -o $@ $(CURDIR)/$<
-+	$(CC) -MD -MP $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $(CURDIR)/$<
- 
- # Add-on
- ${BUILDDIR}/%.so: ${SRCS_EXTRA}
-diff --git a/support/configure.inc b/support/configure.inc
-index 0130880..332511e 100644
---- a/support/configure.inc
-+++ b/support/configure.inc
-@@ -464,8 +464,8 @@ ifeq (\$(origin CC),default)
- CC        = ${CC}
- endif
- PYTHON   ?= ${PYTHON}
--CFLAGS   += ${CFLAGS}
--LDFLAGS  += ${LDFLAGS}
-+TVH_CFLAGS   += ${CFLAGS}
-+TVH_LDFLAGS  += ${LDFLAGS}
- prefix    = ${prefix}
- bindir    = ${bindir}
- mandir    = ${mandir}
-@@ -482,8 +482,8 @@ EOF
-   # Add package config
-   for pkg in ${PACKAGES[*]}; do
-     cat >>${CONFIG_MK} <<EOF
--LDFLAGS += $(pkg-config --libs $pkg)
--CFLAGS  += $(pkg-config --cflags $pkg)
-+TVH_LDFLAGS += $(pkg-config --libs $pkg)
-+TVH_CFLAGS  += $(pkg-config --cflags $pkg)
- EOF
-   done
- 
--- 
-1.7.7.6
-
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-disable-varargs-warning-on-clang.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-disable-varargs-warning-on-clang.patch
new file mode 100644
index 0000000..a4c4c4d
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-disable-varargs-warning-on-clang.patch
@@ -0,0 +1,32 @@
+From 906d95695af95970bf551ea55b6c3e70332c6b97 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Nov 2016 05:22:32 +0000
+Subject: [PATCH] disable varargs warning on clang
+
+The issue is that 'len' is an unsigned char and we violate the promotion rules
+for passing the value to va_start.
+
+passing an object that undergoes defau
+lt argument promotion to 'va_start' has undefined behavior [-Wvarargs]
+|   va_start(ap, len);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 8c5e380..f41ef1a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -53,6 +53,7 @@ ifeq ($(COMPILER), clang)
+ CFLAGS  += -Wno-microsoft -Qunused-arguments -Wno-unused-function
+ CFLAGS  += -Wno-unused-value -Wno-tautological-constant-out-of-range-compare
+ CFLAGS  += -Wno-parentheses-equality -Wno-incompatible-pointer-types
++CFLAGS  += -Wno-error=varargs
+ endif
+ 
+ ifeq ($(CONFIG_LIBFFMPEG_STATIC),yes)
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-dvr-Use-labs-instead-of-abs.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-dvr-Use-labs-instead-of-abs.patch
new file mode 100644
index 0000000..ea34cdb
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-dvr-Use-labs-instead-of-abs.patch
@@ -0,0 +1,37 @@
+From a715671eadcbf989fdaf05f62e71b93ac1749615 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Nov 2016 06:08:31 +0000
+Subject: [PATCH] dvr: Use labs() instead of abs()
+
+Makes clang happy
+
+dvr/dvr_db.c:853:10: error: absolute value function
+'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
+if ((abs(de->de_start - e->start) < 600) && (abs(de->de_stop - e->stop) < 600)) {
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dvr/dvr_db.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dvr/dvr_db.c b/src/dvr/dvr_db.c
+index 165caa6..5656569 100644
+--- a/src/dvr/dvr_db.c
++++ b/src/dvr/dvr_db.c
+@@ -414,11 +414,11 @@ dvr_entry_fuzzy_match(dvr_entry_t *de, epg_broadcast_t *e)
+   /* Wrong length (+/-20%) */
+   t1 = de->de_stop - de->de_start;
+   t2  = e->stop - e->start;
+-  if ( abs(t2 - t1) > (t1 / 5) )
++  if ( labs(t2 - t1) > (t1 / 5) )
+     return 0;
+ 
+   /* Outside of window */
+-  if (abs(e->start - de->de_start) > de->de_config->dvr_update_window)
++  if (labs(e->start - de->de_start) > de->de_config->dvr_update_window)
+     return 0;
+   
+   /* Title match (or contains?) */
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch
new file mode 100644
index 0000000..484e723
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch
@@ -0,0 +1,40 @@
+From c3767e189e90965407937b6178adbbd8cdafe31d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Nov 2016 05:59:10 +0000
+Subject: [PATCH] hdhomerun: Override forced overrdiing og CC/STRIP and CFLAGS
+
+This is required for cross compiling otherwise it ends up
+using build host gcc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.hdhomerun | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.hdhomerun b/Makefile.hdhomerun
+index 943ffec..8bd14ff 100644
+--- a/Makefile.hdhomerun
++++ b/Makefile.hdhomerun
+@@ -18,8 +18,8 @@
+ 
+ include $(dir $(lastword $(MAKEFILE_LIST))).config.mk
+ 
+-unexport CFLAGS
+-unexport LDFLAGS
++#unexport CFLAGS
++#unexport LDFLAGS
+ 
+ define DOWNLOAD
+ 	@mkdir -p $(LIBHDHRDIR)/build
+@@ -75,6 +75,8 @@ $(LIBHDHRDIR)/$(LIBHDHR)/.tvh_download:
+ 	$(call DOWNLOAD,$(LIBHDHR_URL),$(LIBHDHRDIR)/$(LIBHDHR_TB),$(LIBHDHR_SHA1))
+ 	$(call UNTAR,$(LIBHDHR_TB),z)
+ 	ln -sf libhdhomerun $(LIBHDHRDIR)/$(LIBHDHR)
++	@sed -i -e "s/CC.*:=/CC ?=/" $(LIBHDHRDIR)/$(LIBHDHR)/Makefile
++	@sed -i -e "s/STRIP.*:=/STRIP ?=/" $(LIBHDHRDIR)/$(LIBHDHR)/Makefile
+ 	@touch $@
+ 
+ $(LIBHDHRDIR)/$(LIBHDHR)/.tvh_build: \
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch
deleted file mode 100644
index 55b9249..0000000
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch
+++ /dev/null
@@ -1,46 +0,0 @@
---- git/src/htsmsg.c.orig	2016-06-17 11:47:53.026921237 -0400
-+++ git/src/htsmsg.c	2016-06-17 11:49:03.086922457 -0400
-@@ -574,13 +574,13 @@
-     case HMF_MAP:
-       printf("MAP) = {\n");
-       htsmsg_print0(&f->hmf_msg, indent + 1);
--      for(i = 0; i < indent; i++) printf("\t"); printf("}\n");
-+      for(i = 0; i < indent; i++) {printf("\t");} printf("}\n");
-       break;
- 
-     case HMF_LIST:
-       printf("LIST) = {\n");
-       htsmsg_print0(&f->hmf_msg, indent + 1);
--      for(i = 0; i < indent; i++) printf("\t"); printf("}\n");
-+      for(i = 0; i < indent; i++) {printf("\t");} printf("}\n");
-       break;
-       
-     case HMF_STR:
---- git/src/dvb/dvb_tables.c.orig	2016-06-17 11:51:09.142924652 -0400
-+++ git/src/dvb/dvb_tables.c	2016-06-17 11:54:33.962928219 -0400
-@@ -935,10 +935,10 @@
-     onid = (ptr[24] << 8) | ptr[25];
-     
-     /* Search all muxes on adapter */
--    LIST_FOREACH(tdmi, &tda->tda_muxes, tdmi_adapter_link)
--      if(tdmi->tdmi_transport_stream_id == tsid && tdmi->tdmi_network_id == onid);
--	break;
--    
-+    LIST_FOREACH(tdmi, &tda->tda_muxes, tdmi_adapter_link) {
-+      if(tdmi->tdmi_transport_stream_id == tsid && tdmi->tdmi_network_id == onid)
-+    	break;
-+    }
-     if(tdmi == NULL)
-       continue;
- 
---- git/src/epggrab/module/eit.c.orig	2016-06-17 11:49:57.726923409 -0400
-+++ git/src/epggrab/module/eit.c	2016-06-17 11:50:14.526923701 -0400
-@@ -214,7 +214,7 @@
-   if (m && m->enabled) cptr = _eit_freesat_conv;
-   else
-     m = epggrab_module_find_by_id("uk_freeview");
--    if (m && m->enabled) cptr = _eit_freesat_conv;
-+  if (m && m->enabled) cptr = _eit_freesat_conv;
- 
-   /* Convert */
-   return dvb_get_string_with_len(dst, dstlen, src, srclen, charset, cptr);
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index bd5062c..170536a 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -4,14 +4,17 @@ HOMEPAGE = "https://www.lonelycoder.com/redmine/projects/tvheadend"
 DEPENDS = "avahi zlib openssl python-native"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9eef91148a9b14ec7f9df333daebc746"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
-SRC_URI = "git://github.com/tvheadend/tvheadend.git \
-           file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch \
-           file://0002-fix-issues-with-gcc6.patch \
+SRC_URI = "git://github.com/tvheadend/tvheadend.git;branch=release/4.0 \
+           file://0001-Fix-checks-for-sse2-mmx.patch \
+           file://0001-disable-varargs-warning-on-clang.patch \
+           file://0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch \
+           file://0001-dvr-Use-labs-instead-of-abs.patch \
+           file://0001-Makefile-Ignore-warning-about-wrong-includes.patch \
 "
-SRCREV = "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
-PV = "3.3"
+SRCREV = "64fec8120158de585e18be705055259484518d94"
+PV = "4.0.9+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.10.2


