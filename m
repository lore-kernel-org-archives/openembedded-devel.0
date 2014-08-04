Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D54E760809
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 07:07:39 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so4452177wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 00:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K2oxo3qkegiXGXxZtCEmMhtB4V4el0SsZXuG79woM8A=;
	b=IIbNxTeGCqPiEyItUupcNHiuL1tfO4E9eEn/3yQ8MU8MBHTCi3UhDyRGgrU6PBE5+R
	36JGF2oaP13F8cB6rrEj24I9W5S4W0zpCsCUDIZyhMnjsvFLj6XWqdCtcjzFPlAqeOlh
	O662sQQOqpAWUHy2UDBHDSFU+V7g9zVIv7d/n9LsqXBmp0dRHrf1kaP4mxSO6uFZ2/tV
	OW5lxZzx8OIk1lNmcLqwKIF+YvaHKA3cQCqAWeRCtNRQ49pxCOGsUb7t8e/Y4b7nbO4P
	Rlo5j1x2wjpvdWhcm/sYWc5MZC5IgRqE7oKSQ4eWxAvXmSx2kVjERECIeD5uwG7YXD0V
	jV0w==
X-Gm-Message-State: ALoCoQlMasoD/7WvKEb4j6PlcGBY6CEjanVgvudfM16PeHnQ3SzweiH65TO3KM4EI/LCS0XDZoZ+
X-Received: by 10.194.87.134 with SMTP id ay6mr27667080wjb.84.1407136060099;
	Mon, 04 Aug 2014 00:07:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id lg7sm41354912wjb.9.2014.08.04.00.07.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 00:07:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Aug 2014 09:07:34 +0200
Message-Id: <1407136054-29043-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libusbg: update to latest git and fix S!=B
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
X-List-Received-Date: Mon, 04 Aug 2014 07:07:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libusbg/0001-Fix-out-of-tree-builds.patch      | 39 ++++++++++++++++++++++
 meta-oe/recipes-support/libusbg/libusbg_git.bb     |  8 ++---
 2 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch

diff --git a/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch b/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch
new file mode 100644
index 0000000..6be49fb
--- /dev/null
+++ b/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch
@@ -0,0 +1,39 @@
+From 6118c6ec1291a5c731aa8d4f0c1eb8cce43d47ad Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 4 Aug 2014 09:04:08 +0200
+Subject: [PATCH] Fix out-of-tree builds
+
+The include flag should point to the source directory, not the build
+directory.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Upstream-status: Submitted [https://github.com/libusbg/libusbg/pull/9]
+---
+ examples/Makefile.am | 2 +-
+ src/Makefile.am      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index f9f9407..ef4f81e 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -1,5 +1,5 @@
+ bin_PROGRAMS = show-gadgets gadget-acm-ecm 
+ gadget_acm_ecm_SOURCES = gadget-acm-ecm.c
+ show_gadgets_SOURCES = show-gadgets.c
+-AM_CPPFLAGS=-I../include/
++AM_CPPFLAGS=-I$(top_srcdir)/include/
+ AM_LDFLAGS=-L../src/ -lusbg
+diff --git a/src/Makefile.am b/src/Makefile.am
+index d955a4c..2f71366 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,4 +1,4 @@
+ lib_LTLIBRARIES = libusbg.la
+ libusbg_la_SOURCES = usbg.c
+ libusbg_la_LDFLAGS = -version-info 0:1:0
+-AM_CPPFLAGS=-I../include/
++AM_CPPFLAGS=-I$(top_srcdir)/include/
+-- 
+1.9.0
+
diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
index 280983b..97d60a6 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools
 
-PNBLACKLIST[libusbg] = "BROKEN: Doesn't work with B!=S and nobody sent patch to fix it"
-
 PV = "0.1.0"
-SRCREV = "7e2b04363f319e8936a606bdb122dbde249a2f58"
-SRC_URI = "git://github.com/libusbg/libusbg.git"
+SRCREV = "a826d136e0e8fa53815f1ba05893e6dd74208c15"
+SRC_URI = "git://github.com/libusbg/libusbg.git \
+           file://0001-Fix-out-of-tree-builds.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
1.9.0


