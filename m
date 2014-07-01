Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4B7607E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:48:38 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 131so6006037ykp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=GND9J27fWJ5x/3jc72TjaMgIA2QlsDjSs3CtqIimZAs=;
	b=YFmsqelspWhchri2UIcTlL9ODODzOLJafMnpykozxkYoIAT8oT5BHn4W/XOZ/yi+8x
	07c7l01CMzG7HpbXV8zvBJbJIGaLwdWMo4pCQsTj+vHk5+H63cKj7SjGn7jOI4PoWpV1
	MD3L1TZIqA7mC3ehp7w2qL7QGHljoM3PW9gS6Xvd10lFbKiRmbvcLyKX3jiiPnoVNiaL
	PrIQLsoEJ3NsH90AT4fmvHW8tyUWtWkFRY1gDfHWz93TGs6Rph+7voTDH5+xqT8P9W8l
	apN23n/V0Cg7YYiPtjBONq0+xgAKim4xjBFLCv0nw5r2zNR3zu8ES56VYoGYt5DNxYk7
	m0PQ==
X-Received: by 10.236.81.1 with SMTP id l1mr73859008yhe.27.1404247719544;
	Tue, 01 Jul 2014 13:48:39 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	d46sm29905036yha.10.2014.07.01.13.48.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 13:48:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 5E3D51BB37355; Tue,  1 Jul 2014 17:48:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  1 Jul 2014 17:48:33 -0300
Message-Id: <1404247713-19094-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] linuxptp: Use environment compiler settings
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
X-List-Received-Date: Tue, 01 Jul 2014 20:48:48 -0000

If the machine uses hard floating point, the build fails as below:

arm-oel-linux-gnueabi-gcc -Wall ...
In file included from .../build/tmp/sysroots/imx6qsabresd/usr/include/features.h:402:0,
                 from .../build/tmp/sysroots/imx6qsabresd/usr/include/errno.h:28,
                 from clock.c:19:
.../build/tmp/sysroots/imx6qsabresd/usr/include/gnu/stubs.h:7:29:
    fatal error: gnu/stubs-soft.h: No such file or directory
 # include <gnu/stubs-soft.h>

This patch fixes the build system to reuse the CC variable and also
passes over the defined CFLAGS so the choosen optimization and build
options are respected.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...build-Allow-CC-and-prefix-to-be-overriden.patch |   37 ++++++++++++++++++++
 .../recipes-connectivity/linuxptp/linuxptp_1.4.bb  |    7 ++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
new file mode 100644
index 0000000..b1d96ae
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
@@ -0,0 +1,37 @@
+From af485c638c61fa883212ea424e676fbf90bee594 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Tue, 1 Jul 2014 17:37:31 -0300
+Subject: [PATCH] build: Allow CC and prefix to be overriden
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makefile b/makefile
+index 22e7d0d..809cc8f 100644
+--- a/makefile
++++ b/makefile
+@@ -18,7 +18,7 @@
+ KBUILD_OUTPUT =
+ 
+ DEBUG	=
+-CC	= $(CROSS_COMPILE)gcc
++CC	?= $(CROSS_COMPILE)gcc
+ VER     = -DVER=$(version)
+ CFLAGS	= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
+ LDLIBS	= -lm -lrt $(EXTRA_LDFLAGS)
+@@ -35,7 +35,7 @@ incdefs := $(shell $(srcdir)/incdefs.sh)
+ version := $(shell $(srcdir)/version.sh $(srcdir))
+ VPATH	= $(srcdir)
+ 
+-prefix	= /usr/local
++prefix	?= /usr/local
+ sbindir	= $(prefix)/sbin
+ mandir	= $(prefix)/man
+ man8dir	= $(mandir)/man8
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
index 10d6744..4ee0c88 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz"
+SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
+           file://build-Allow-CC-and-prefix-to-be-overriden.patch"
 
 SRC_URI[md5sum] = "a37ad2b2ef7d1ebc4d64a66d3fe55cdf"
 SRC_URI[sha256sum] = "6cfd5291fb7394cc9f25458927874a203971b66b76d1c9d6568e007d0cbd81f2"
 
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
-		EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC'"
+EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
+		EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
 
 do_install () {
     install -d ${D}/${bindir}
-- 
1.7.10.4


