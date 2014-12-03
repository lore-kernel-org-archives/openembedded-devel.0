Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 94538714D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:41:29 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so19893506wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0WlvUsakCtt7QiZ6g0kelnRaE4PVsmxsMyNHcp9/9wM=;
	b=Gk0lscvbvZORvmNGeVn4UWkgZSZBjMMdkOxIdTo3bwXi3iSxdkT3800GmFD22Tj4yz
	/OkjJ8KQzi4mdSRsZlxBzNnlpy5JmR64G2S4+I9H/+mG2cTa6WPpBfgKZ/W2BLUr7uI+
	QhOMFgZQGEbf8/5SH84vFlhnyBfIS4C3fa4h0RR+6wnKZmsFxVdu7ocjveARCF5jrdKh
	6H4FA0WU20Hn+PX+7SNB5sW3XKdylL7XMPRx02PnI2ObEg7nTlkSzPnAsUfpkodTMbcv
	AfEaU0QlyVtk3A1UZDrT+FUP6tFlQFQO4bCrqlEJWPxW6ZdWFWz390k2qdUAp0OQQJ8I
	e9BQ==
X-Gm-Message-State: ALoCoQlR6dUdhGzIbGDPIVKw+Leoah6tEEr+0pciNtS03di92tJCn9UWu3HctP1Qa7vyufnO0WqZ
X-Received: by 10.180.104.197 with SMTP id gg5mr63594063wib.7.1417610489657;
	Wed, 03 Dec 2014 04:41:29 -0800 (PST)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	ry19sm36131260wjb.3.2014.12.03.04.41.28 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 03 Dec 2014 04:41:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Dec 2014 13:41:22 +0100
Message-Id: <1417610482-5790-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH] tvheadend: update to 3.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Dec 2014 12:41:32 -0000

Fetch dvbcan tables using bitbake and reenable the config option.

The license file was renamed and now lists the CLA requirement as well.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 115 ++++++++++++++-------
 .../recipes-dvb/tvheadend/tvheadend_git.bb         |  18 ++--
 2 files changed, 92 insertions(+), 41 deletions(-)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
index 9dfcce0..cac2b90 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
@@ -1,4 +1,4 @@
-From 2ee64b359464b48f751683faa5ded3ee8200fe90 Mon Sep 17 00:00:00 2001
+From e56e244f901ae04e8c681c848d06c1b96b67ca58 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 21 Dec 2012 10:15:42 +0100
 Subject: [PATCH] Move tvheadend specific LD/CFLAGS into a helper variable to
@@ -8,64 +8,109 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 Upstream-Status: Inappropriate [OE specific]
 ---
- Makefile              |   20 ++++++++++----------
- support/configure.inc |    8 ++++----
- 2 files changed, 14 insertions(+), 14 deletions(-)
+ Makefile              | 44 ++++++++++++++++++++++----------------------
+ support/configure.inc |  8 ++++----
+ 2 files changed, 26 insertions(+), 26 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 8c6b293..daf5f14 100644
+index 9931635..5e4aebf 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -27,12 +27,12 @@ PROG = ${BUILDDIR}/tvheadend
+@@ -27,45 +27,45 @@ PROG    := $(BUILDDIR)/tvheadend
  # Common compiler flags
  #
  
+-CFLAGS  += -g -O2 -Wunused-result
 -CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
--CFLAGS  += -Wmissing-prototypes -fms-extensions
--CFLAGS  += -g -funsigned-char -O2 
+-CFLAGS  += -Wmissing-prototypes
+-CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
 -CFLAGS  += -D_FILE_OFFSET_BITS=64
--CFLAGS  += -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
--LDFLAGS += -lrt -ldl -lpthread -lm
+-CFLAGS  += -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
++TVH_CFLAGS  += -g -O2 -Wunused-result
 +TVH_CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
-+TVH_CFLAGS  += -Wmissing-prototypes -fms-extensions
-+TVH_CFLAGS  += -g -funsigned-char -O2 
++TVH_CFLAGS  += -Wmissing-prototypes
++TVH_CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
 +TVH_CFLAGS  += -D_FILE_OFFSET_BITS=64
-+TVH_CFLAGS  += -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
-+TVH_LDFLAGS += -lrt -ldl -lpthread -lm
++TVH_CFLAGS  += -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
+ ifeq ($(CONFIG_ANDROID),yes)
+-LDFLAGS += -ldl -lm
++TVH_LDFLAGS += -ldl -lm
+ else
+-LDFLAGS += -ldl -lpthread -lm
++TVH_LDFLAGS += -ldl -lpthread -lm
+ endif
+ ifeq ($(CONFIG_LIBICONV),yes)
+-LDFLAGS += -liconv
++TVH_LDFLAGS += -liconv
+ endif
+ ifeq ($(PLATFORM), darwin)
+-LDFLAGS += -framework CoreServices
++TVH_LDFLAGS += -framework CoreServices
+ else
+ ifeq ($(CONFIG_ANDROID),no)
+-LDFLAGS += -lrt
++TVH_LDFLAGS += -lrt
+ endif
+ endif
  
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
+ ifeq ($(COMPILER), clang)
+-CFLAGS  += -Wno-microsoft -Qunused-arguments -Wno-unused-function
+-CFLAGS  += -Wno-unused-value -Wno-tautological-constant-out-of-range-compare
+-CFLAGS  += -Wno-parentheses-equality -Wno-incompatible-pointer-types
++TVH_CFLAGS  += -Wno-microsoft -Qunused-arguments -Wno-unused-function
++TVH_CFLAGS  += -Wno-unused-value -Wno-tautological-constant-out-of-range-compare
++TVH_CFLAGS  += -Wno-parentheses-equality -Wno-incompatible-pointer-types
+ endif
+ 
+ ifeq ($(CONFIG_LIBFFMPEG_STATIC),yes)
+-CFLAGS  += -I${ROOTDIR}/libav_static/build/ffmpeg/include
+-LDFLAGS += -L${ROOTDIR}/libav_static/build/ffmpeg/lib -Wl,-Bstatic \
++TVH_CFLAGS  += -I${ROOTDIR}/libav_static/build/ffmpeg/include
++TVH_LDFLAGS += -L${ROOTDIR}/libav_static/build/ffmpeg/lib -Wl,-Bstatic \
+            -lavresample -lswresample -lswscale \
+            -lavutil -lavformat -lavcodec -lavutil \
+            -lvorbisenc -lvorbis -logg -lx264 -lvpx \
+            -Wl,-Bdynamic
+ endif
+ ifeq ($(CONFIG_HDHOMERUN_STATIC),yes)
+-CFLAGS  += -I${ROOTDIR}/libhdhomerun_static
+-LDFLAGS += -L${ROOTDIR}/libhdhomerun_static/libhdhomerun \
++TVH_CFLAGS  += -I${ROOTDIR}/libhdhomerun_static
++TVH_LDFLAGS += -L${ROOTDIR}/libhdhomerun_static/libhdhomerun \
+            -Wl,-Bstatic -lhdhomerun -Wl,-Bdynamic
+ endif
+ 
+@@ -340,8 +340,8 @@ SRCS-yes += src/descrambler/ffdecsa/ffdecsa_interface.c \
+ 	    src/descrambler/ffdecsa/ffdecsa_int.c
+ SRCS-${CONFIG_MMX}  += src/descrambler/ffdecsa/ffdecsa_mmx.c
+ SRCS-${CONFIG_SSE2} += src/descrambler/ffdecsa/ffdecsa_sse2.c
+-${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_mmx.o  : CFLAGS += -mmmx
+-${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_sse2.o : CFLAGS += -msse2
++${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_mmx.o  : TVH_TVH_CFLAGS += -mmmx
++${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_sse2.o : TVH_TVH_CFLAGS += -msse2
  endif
  
- # File bundles
-@@ -217,12 +217,12 @@ all: ${PROG}
+ # libaesdec
+@@ -402,12 +402,12 @@ reconfigure:
  
  # Binary
- ${PROG}: $(OBJS) $(ALLDEPS)
+ ${PROG}: check_config $(OBJS) $(ALLDEPS)
 -	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
-+	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) $(LDFLAGS)
++	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) $(LDFLAGS)
  
  # Object
  ${BUILDDIR}/%.o: %.c
  	@mkdir -p $(dir $@)
--	$(CC) -MD -MP $(CFLAGS) -c -o $@ $(CURDIR)/$<
-+	$(CC) -MD -MP $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $(CURDIR)/$<
+-	$(CC) -MD -MP $(CFLAGS) -c -o $@ $<
++	$(CC) -MD -MP $(TVH_CFLAGS) $(TVH_CFLAGS) $(TVH_CFLAGS) $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $<
  
  # Add-on
  ${BUILDDIR}/%.so: ${SRCS_EXTRA}
 diff --git a/support/configure.inc b/support/configure.inc
-index 0130880..332511e 100644
+index f7cfcd3..e3a2dd7 100755
 --- a/support/configure.inc
 +++ b/support/configure.inc
-@@ -464,8 +464,8 @@ ifeq (\$(origin CC),default)
+@@ -455,8 +455,8 @@ ifeq (\$(origin CC),default)
  CC        = ${CC}
  endif
  PYTHON   ?= ${PYTHON}
@@ -76,10 +121,10 @@ index 0130880..332511e 100644
  prefix    = ${prefix}
  bindir    = ${bindir}
  mandir    = ${mandir}
-@@ -482,8 +482,8 @@ EOF
+@@ -478,8 +478,8 @@ EOF
    # Add package config
    for pkg in ${PACKAGES[*]}; do
-     cat >>${CONFIG_MK} <<EOF
+     cat >>"${CONFIG_MK}" <<EOF
 -LDFLAGS += $(pkg-config --libs $pkg)
 -CFLAGS  += $(pkg-config --cflags $pkg)
 +TVH_LDFLAGS += $(pkg-config --libs $pkg)
@@ -88,5 +133,5 @@ index 0130880..332511e 100644
    done
  
 -- 
-1.7.7.6
+1.9.0
 
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 65d43c6..8539927 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -1,26 +1,32 @@
 SUMMARY = "Tvheadend TV streaming server"
 HOMEPAGE = "https://www.lonelycoder.com/redmine/projects/tvheadend"
 
-DEPENDS = "avahi zlib openssl python-native"
+DEPENDS = "avahi zlib openssl python-native libav"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9eef91148a9b14ec7f9df333daebc746"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
-SRC_URI = "git://github.com/tvheadend/tvheadend.git \
+SRC_URI = "git://github.com/tvheadend/tvheadend.git;name=tvh \
+           git://linuxtv.org/dtv-scan-tables.git;name=dvb;destsuffix=git/data/dvb-scan \
            file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch \
 "
-SRCREV = "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
-PV = "3.3"
+SRCREV_tvh = "a95ef0b237a01e6fe6a29c0cd76f98a3a216c1ce"
+SRCREV_dvb = "82115b4a1f1039d5a2f93f2b7ddc4b2d2713b7ae"
+SRCREV_FORMAT = "tvh"
+
+PV = "3.9+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 do_configure() {
+    # The fetcher ensures the mux list is up to date
+    sed -i -e 's:exit 1:exit 0:g' ${S}/support/getmuxlist
+
     ./configure --prefix=${prefix} \
                 --libdir=${libdir} \
                 --bindir=${bindir} \
                 --datadir=${datadir} \
                 --arch=${TARGET_ARCH} \
-                --disable-dvbscan \
                 --disable-bundle
 }
 
-- 
1.9.0


