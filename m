Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B08D65E0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2014 01:12:55 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id fa1so2438116pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 18:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sfecqr9c35ZuBwQg8uJrb1Ch2eHOOAt9jctr0faeKho=;
	b=aoCZTm6DMC5hPOubKLj1pUkkJPZLD45ivcYXFRP93wC3sXOkJx2IpMsSaJTdPesBN1
	Ci0DzvYlSexXLgL21DtwkKo+/c9d/RGwW81yH0bxssACORhJ8IovkU9fMRbalQfqS9o0
	cEJm3y6dVHM+sdjI/WNrUCkCjMLdrhoecAMvuebAMH2y6jlr2O/GhLRDBvgIIIzvyCw3
	PzLeafD7K3dD4LrKMAug20npzYjzDnEe7ER4lEcEsIFCLluTKA+1qX43rgVh89ci2+zM
	PRrFouRZNYEfGGATwWbJFFwMrbSBO+6HHz1HReyjB1H9ZoxS5gEFgcSwiuvNR6OuSH0o
	FlYg==
X-Received: by 10.70.133.136 with SMTP id pc8mr19644646pdb.0.1410570777572;
	Fri, 12 Sep 2014 18:12:57 -0700 (PDT)
Received: from horton.arnolds.bogus (gatekeeper.gentoogeek.org.
	[66.159.242.209])
	by mx.google.com with ESMTPSA id ig4sm4982597pbb.55.2014.09.12.18.12.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Sep 2014 18:12:56 -0700 (PDT)
From: Steve Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Sep 2014 18:15:55 -0700
Message-Id: <1410570955-15096-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 2.0.4
Cc: "S. Lockwood-Childs" <sjl@vctlabs.com>
Subject: [meta-oe][PATCH 2/2] vala-terminal: patch Makefile.am for B!=S
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
X-List-Received-Date: Sat, 13 Sep 2014 01:12:56 -0000

vala-terminal was blacklisted because it failed to compile with
separate source and build dirs; patch Makefile.am to fix that by
adding missing $(srcdir) prefixes

Upstream-Status: Pending

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
Signed-off-by: Steve Arnold <stephen.arnold42@gmail.com>
---
 .../files/automake-separate-build.patch            | 25 ++++++++++++++++++++++
 .../vala-terminal/vala-terminal_git.bb             |  7 +++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/vala-terminal/files/automake-separate-build.patch

diff --git a/meta-oe/recipes-support/vala-terminal/files/automake-separate-build.patch b/meta-oe/recipes-support/vala-terminal/files/automake-separate-build.patch
new file mode 100644
index 0000000..3ecdee8
--- /dev/null
+++ b/meta-oe/recipes-support/vala-terminal/files/automake-separate-build.patch
@@ -0,0 +1,25 @@
+--- src/Makefile.am.orig	2014-08-30 11:49:01.893118629 -0700
++++ src/Makefile.am	2014-08-30 11:49:09.201116496 -0700
+@@ -12,13 +12,13 @@
+ 	-include $(CONFIG_HEADER) \
+ 	$(NULL)
+ 
+-BUILT_SOURCES = src/.stamp
++BUILT_SOURCES = $(srcdir)/src/.stamp
+ 
+ bin_PROGRAMS = vala-terminal
+ 
+ vala_terminal_VALASOURCES = \
+-	src/terminal.vala \
+-	src/mainwindow.vala \
++	$(srcdir)/src/terminal.vala \
++	$(srcdir)/src/mainwindow.vala \
+ 	$(NULL)
+ 
+ vala_terminal_SOURCES = \
+@@ -54,4 +54,4 @@
+                        intltool-extract \
+                        intltool-merge \
+                        intltool-update \
+-                       mkinstalldirs src/*.c
++                       mkinstalldirs $(srcdir)/src/*.c
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 78af9b6..de4d5ee 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -8,12 +8,13 @@ PV = "1.3+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-PNBLACKLIST[vala-terminal] = "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
 
 inherit autotools perlnative vala
 
-SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"
-S = "${WORKDIR}/git"
+SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master \
+           file://automake-separate-build.patch \
+          "
+S = "${WORKDIR}/git" 
 
 RDEPENDS_${PN} = "ttf-liberation-mono"
 RREPLACES_${PN} = "openmoko-terminal2"
-- 
2.0.4


