Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE7677DA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id z6so17026260pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tP6L+UWKbPwv4ZOhmgDv+CVBGGOULeTBBC8NFZ25Bgs=;
	b=jFW4PxV14omauUJ7vGdhcXoXfpsekJX8sQO4QPA+IEg2g88ZkymCNX46jmGNEeui3H
	NTNaNPSfGcTqwtkJMCiMeL5qT8wfAR/6ZAIIDvfjlmIiNGyhErt3VuoOjm+S3k7RNyEu
	osu4mHDIMNPADp+p3OR9XfRdICFwT0EsLvkKGhi3AL3sE9grfQ9G3dy020+9YY7bd+qw
	TVbXVM3HPTZaLJbfKlhyE32B/t4Th/j0uvSN6jOIA/L131aubCrvkpsyfNquRBXJprqG
	pJKD8MrhpcaTPyCuIOkP4xyQSycWjChhREK81bpaAEufPmSZGb3mJ8gs2dGsYWg2RMQg
	/6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tP6L+UWKbPwv4ZOhmgDv+CVBGGOULeTBBC8NFZ25Bgs=;
	b=QE97LZrR7zbuBIFiYhzCQVSNx/VUvXhwAfAIkxxnPez42YpEuAuWbXl81xYBX8uasM
	6NQXRcKz9E4YsqAlXMvru4lYABmyQRzI2+TdKDj70BwCd6myl+klpe0X8llJNVPfaksf
	kHrlmTXzdKhd8wd/u5wxIAluaLZoFQMH7rrFcQiDGGvha4AGyVXj531Pw65rTgmBhMhL
	ipoNW8Q0BWZTBXhPcymEdcFUmxsX2tdK0hV/8J2w04qVd1y2EKo/lC8UcIRsSy8pM4NF
	khNeRxQIKJ7b7spUmgG6OkyzM4ASKKX3dXKzSoAB9yHLCTiyJ0ut7aupdPdfkfZgfQhn
	6DrQ==
X-Gm-Message-State: AKS2vOwpHOSwGoiqC4zoNXaddP82bPfrJpOYQrZVON2OZWO53nG/6LGH
	GgM6Hh/0WP+92qmT
X-Received: by 10.98.74.92 with SMTP id x89mr22493163pfa.123.1498827617027;
	Fri, 30 Jun 2017 06:00:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:44 -0700
Message-Id: <20170630125957.3342-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/17] freerdp: Fix build on mips
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../freerdp/freerdp/0003-add-missing-define.patch  | 45 ++++++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch b/meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch
new file mode 100644
index 000000000..220edef30
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch
@@ -0,0 +1,45 @@
+libwinpr/comm_seria: fix missing define
+
+FreeRDP uses CMSPAR, which is defined by glibc in bits/termios.h .
+
+glibc has two flavours of bits/termios.h: a genmeric one and an
+architecture-specific one. When installing, glibc will install the
+architecture-specific file if it exists, otherwise it installs the
+generic file. Only Alpha, MIPS, PPC and Sparc have their own
+bits/termios.h.
+
+The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
+do define CMSPAR. However, the MIPS flavour does not define it.
+
+Define CMSPAR to the value from the generic value, which is also the
+value known to the Linux kernel for MIPS.
+
+Fixes:
+    http://autobuild.buildroot.org/results/0b4/0b4793f0bf9f4c57933897f3480054a4e06528ad/
+    http://autobuild.buildroot.org/results/7a2/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
+    http://autobuild.buildroot.org/results/387/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
+    ...
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Peter Korsgaard <jacmet@uclibc.org>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -durN freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c
+--- freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c	2015-09-04 16:20:17.000000000 +0100
++++ freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c	2015-10-04 11:07:41.868513726 +0100
+@@ -27,6 +27,14 @@
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <termios.h>
++
++/* glibc for MIPS has its own bits/termios.h which does not define
++ * CMSPAR, so we vampirise the value from the generic bits/termios.h
++ */
++#ifndef CMSPAR
++#define CMSPAR 010000000000
++#endif
++
+ #include <unistd.h>
+ 
+ #include "comm_serial_sys.h"
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index f2d0a4dad..f0aa1b6ef 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -17,6 +17,7 @@ SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
     file://winpr-makecert-Build-with-install-RPATH.patch \
     file://0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch \
+    file://0003-add-missing-define.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.13.2


