Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B25A714AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 06:49:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9H6nXIQ019348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 23:49:33 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 23:49:32 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Oct 2014 02:49:30 -0400
Message-ID: <7c90bebf7ec0eb82906acd5610bfed9713199065.1413528325.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413528325.git.wenzong.fan@windriver.com>
References: <cover.1413528325.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-oe] rsnapshot: fix rsnapshot.conf.default
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
X-List-Received-Date: Fri, 17 Oct 2014 06:49:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This change is used for fixing cmd path in rsnapshot.conf.default.

The options --without-* disable checking command * on host and get
the default path used, otherwise the host path will be injected into
target configs.

The runtime dependencies to ssh, logger, cp, du are optional and
could be customized in rsnapshot.conf, so it's not needed that
using PACKAGECONFIG to define the runtime dependencies.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../rsnapshot/configure-fix-cmd_rsync.patch        |   44 ++++++++++++++++++++
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   12 +++++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch b/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch
new file mode 100644
index 0000000..7b2361b
--- /dev/null
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch
@@ -0,0 +1,44 @@
+From 26ad431e19788898fb4ed19ff91392e8b20f1bab Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 16 Oct 2014 04:06:55 -0400
+Subject: [PATCH] fix cmd_rsync
+
+Don't break configure if rsync is not installed on host.
+
+rsync is a runtime dependency and this change is only used for
+generating rsnapshot.conf.default. It allows cmd_rsync to use
+default path if options --without-rsync is specfied.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.ac |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bc9df9e..2a33d29 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,7 +55,7 @@ AC_ARG_WITH(rsync,
+ 				AC_MSG_ERROR(rsync not found)
+ 			fi
+ 		else
+-			AC_MSG_ERROR(rsync is required)
++			RSYNC=no
+ 		fi
+ 	]
+ )
+@@ -67,7 +67,8 @@ if test "$RSYNC" = ""; then
+ fi
+ dnl bail out if we can't find it
+ if test "$RSYNC" = "no"; then
+-	AC_MSG_ERROR(rsync is required)
++	RSYNC=/usr/bin/rsync
++	AC_SUBST(CMD_RSYNC, "cmd_rsync  $RSYNC")
+ fi
+ 
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index afd3678..3f919b5 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -24,11 +24,19 @@ SRCREV = "1047cbb57937c29233388e2fcd847fecd3babe74"
 PV = "1.3.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
+           file://configure-fix-cmd_rsync.patch \
           "
 
 S = "${WORKDIR}/git"
 
 inherit autotools
 
-PACKAGECONFIG ??= "logger"
-PACKAGECONFIG[logger] = "--with-logger=${bindir}/logger,--without-logger,,util-linux"
+# Fix rsnapshot.conf.default:
+# don't inject the host path into target configs.
+EXTRA_OECONF += "--without-cp \
+                 --without-rm \
+                 --without-du \
+                 --without-ssh \
+                 --without-logger \
+                 --without-rsync \
+                "
-- 
1.7.9.5


