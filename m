Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qcnde-0001bx-2h
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 02:00:46 +0200
Received: by pzk36 with SMTP id 36so1087568pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6thAfurwJ0A2sOOHgJOwm3gio1x2cfRVi/yT5vAsbEU=;
	b=CNhExSNK/xB8+FD+IVIncbYNA6MEJv+xcdWnuo6qjCP0qzJIdD+KFT9I4eHyIyUo2j
	7lgvwcEScGf3oWOupy9hDTxmOz8KH0zBrIs6861w39yeRz9U6HQCjPqagx0wJSiXUVzN
	i6SVIJQfxLrGFAIt1GPLw1gHjGEJyutq/ae4o=
Received: by 10.142.135.4 with SMTP id i4mr1638374wfd.34.1309564620289;
	Fri, 01 Jul 2011 16:57:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k4sm2253885pbl.43.2011.07.01.16.56.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 16:56:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:56:48 -0700
Message-Id: <1309564608-32683-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309564608-32683-1-git-send-email-raj.khem@gmail.com>
References: <1309564608-32683-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gcc-4.5: Edit defaults.h in ${B} instead of ${S}, and t-oe in ${B}
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
X-List-Received-Date: Sat, 02 Jul 2011 00:00:46 -0000

This patches are from oe-core needed after shared sourcedir changes to
oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |    3 +-
 .../gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch |   57 ++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 30a9692..abd3088 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-INC_PR = "r38"
+INC_PR = "r39"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -216,6 +216,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://gcc-poison-parameters.patch \
        file://gcc-ppc-config-fix.patch \
        file://gcc-ppc-include-config-linux.h.patch \
+       file://use-defaults.h-and-t-oe-in-B.patch \
        "
 
 # Language Overrides
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch
new file mode 100644
index 0000000..c93e6ca
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Pending
+
+Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
+the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+---
+ gcc/Makefile.in  |    2 +-
+ gcc/configure    |    4 ++--
+ gcc/configure.ac |    4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index d91f93a..03ee2bd 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -461,7 +461,7 @@ LIMITS_H_TEST = [ -f $(SYSTEM_HEADER_DIR)/limits.h ]
+ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+diff --git a/gcc/configure b/gcc/configure
+index f440fa2..dafb0c1 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -10838,8 +10838,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index d003091..ba422e6 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1652,8 +1652,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+-- 
+1.7.1
+
-- 
1.7.4.1



