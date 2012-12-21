Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tm3OD-00050O-Ui
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:16:16 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so2482844eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 06:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=kV4OIgPvawZJBHIjD172seek7av6w3G0slAT4zjwwfo=;
	b=ph6dlArzF3OiKrlUPN3GWvc8Nc2q7gzZWhc8+FT2Ka0DJQRBKdKR9BKPzCMBtC7IiY
	KXlktCXYb9GdzaYwbF/nCtms6HkwA2YOsbSbFpaDZQrCj7yNd1Lvtulk4/Sf5muruDGu
	W9j4/YLSO9/PJ2eoZcfgyJjgysvj/Ape6xabBMGBygPuYMXBpIewaVZXOOXjZky/20ns
	2olh7ehZei2LEkDTHDfnRxgfrnbGvP6Jx/KPO01MQxdARdeqtkcU4bftwgSyu5emyBGx
	RoApmTkm1Qo6Ap5u8QDwhLq9hrvjQPYDsK0i0QO3WELPTBSTbUknBGEIC+36GLEfVQ5n
	rWAQ==
X-Received: by 10.14.0.3 with SMTP id 3mr32077152eea.16.1356098468184;
	Fri, 21 Dec 2012 06:01:08 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w44sm21810573eep.6.2012.12.21.06.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 06:01:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:00:46 +0100
Message-Id: <1356098450-27475-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn0iYFdB04uzc4nmiFys08fGvxNXmemY6PHeONaCIfL5nnndHSkqoXKYj4XIz7jSSBgJRuI
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 2/6] tvheadend: add git version
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
X-List-Received-Date: Fri, 21 Dec 2012 14:16:28 -0000

From the homepage:

	"Tvheadend is a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources."

No startup scripts or config files are currently provided.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...end-specific-LD-CFLAGS-into-a-helper-vari.patch |   92 ++++++++++++++++++++
 .../recipes-dvb/tvheadend/tvheadend_git.bb         |   30 +++++++
 2 files changed, 122 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
new file mode 100644
index 0000000..943e102
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
@@ -0,0 +1,92 @@
+From 2ee64b359464b48f751683faa5ded3ee8200fe90 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 21 Dec 2012 10:15:42 +0100
+Subject: [PATCH] Move tvheadend specific LD/CFLAGS into a helper variable to
+ avoid being overwritten
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Upstream-status: Inappropriate [OE specific]
+---
+ Makefile              |   20 ++++++++++----------
+ support/configure.inc |    8 ++++----
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8c6b293..daf5f14 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,12 +27,12 @@ PROG = ${BUILDDIR}/tvheadend
+ # Common compiler flags
+ #
+ 
+-CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
+-CFLAGS  += -Wmissing-prototypes -fms-extensions
+-CFLAGS  += -g -funsigned-char -O2 
+-CFLAGS  += -D_FILE_OFFSET_BITS=64
+-CFLAGS  += -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
+-LDFLAGS += -lrt -ldl -lpthread -lm
++TVH_CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
++TVH_CFLAGS  += -Wmissing-prototypes -fms-extensions
++TVH_CFLAGS  += -g -funsigned-char -O2 
++TVH_CFLAGS  += -D_FILE_OFFSET_BITS=64
++TVH_CFLAGS  += -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
++TVH_LDFLAGS += -lrt -ldl -lpthread -lm
+ 
+ #
+ # Other config
+@@ -179,8 +179,8 @@ SRCS-${CONFIG_CWC}  += src/ffdecsa/ffdecsa_interface.c \
+ 	src/ffdecsa/ffdecsa_int.c
+ SRCS-${CONFIG_MMX}  += src/ffdecsa/ffdecsa_mmx.c
+ SRCS-${CONFIG_SSE2} += src/ffdecsa/ffdecsa_sse2.c
+-${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : CFLAGS += -mmmx
+-${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : CFLAGS += -msse2
++${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : TVH_CFLAGS += -mmmx
++${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : TVH_CFLAGS += -msse2
+ endif
+ 
+ # File bundles
+@@ -217,12 +217,12 @@ all: ${PROG}
+ 
+ # Binary
+ ${PROG}: $(OBJS) $(ALLDEPS)
+-	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
++	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) $(LDFLAGS)
+ 
+ # Object
+ ${BUILDDIR}/%.o: %.c
+ 	@mkdir -p $(dir $@)
+-	$(CC) -MD -MP $(CFLAGS) -c -o $@ $(CURDIR)/$<
++	$(CC) -MD -MP $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $(CURDIR)/$<
+ 
+ # Add-on
+ ${BUILDDIR}/%.so: ${SRCS_EXTRA}
+diff --git a/support/configure.inc b/support/configure.inc
+index 0130880..332511e 100644
+--- a/support/configure.inc
++++ b/support/configure.inc
+@@ -464,8 +464,8 @@ ifeq (\$(origin CC),default)
+ CC        = ${CC}
+ endif
+ PYTHON   ?= ${PYTHON}
+-CFLAGS   += ${CFLAGS}
+-LDFLAGS  += ${LDFLAGS}
++TVH_CFLAGS   += ${CFLAGS}
++TVH_LDFLAGS  += ${LDFLAGS}
+ prefix    = ${prefix}
+ bindir    = ${bindir}
+ mandir    = ${mandir}
+@@ -482,8 +482,8 @@ EOF
+   # Add package config
+   for pkg in ${PACKAGES[*]}; do
+     cat >>${CONFIG_MK} <<EOF
+-LDFLAGS += $(pkg-config --libs $pkg)
+-CFLAGS  += $(pkg-config --cflags $pkg)
++TVH_LDFLAGS += $(pkg-config --libs $pkg)
++TVH_CFLAGS  += $(pkg-config --cflags $pkg)
+ EOF
+   done
+ 
+-- 
+1.7.7.6
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
new file mode 100644
index 0000000..212bca1
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Tvheadend TV streaming server"
+HOMEPAGE = "https://www.lonelycoder.com/redmine/projects/tvheadend"
+
+DEPENDS = "avahi zlib openssl python-native"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9eef91148a9b14ec7f9df333daebc746"
+
+SRC_URI = "git://github.com/tvheadend/tvheadend.git \
+           file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch \
+          "
+SRCREV = "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
+PV = "3.3"
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+	./configure --prefix=${prefix} \
+	            --libdir=${libdir} \
+	            --bindir=${bindir} \
+	            --datadir=${datadir} \
+	            --arch=${TARGET_ARCH} \
+	            --disable-bundle
+}
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${datadir}/${BPN}"
-- 
1.7.7.6



