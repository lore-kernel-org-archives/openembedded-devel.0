Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UF0Ol-00084k-Me
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 11:56:11 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so2051000eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2013 03:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=lOE0eCswPzRPA5YKX9Z7fZlAv2lPmZlNvcyYrPdqm1Y=;
	b=JVjHuZNLRZspiju0XUETzJgcKSZkYw/K1qQRSzjTB4yOW+qBfEdfjuXNmrqrNP94k6
	h2eJ3c+u4sKpzOf7wVmigtJbB59R5saa3LKX3bg1hazaopTkupWCi3uphf9z6BKwyjlj
	4ADOGLX2D2fdFEO9ZU12OZl9VupflGXjsK9BrTwrhJye9bd1i+yIkDXyCoZPQ4iFxcwo
	9sAKTLPPFb36YElOrfanaxX66DPHicNrmgGjXhpSxN2/UGG10DQCfTg2lh2XJ9vTOLHE
	rA+aKdtYINtvY/49QF5rmCfvaT4VZy1+Dk9ZBH20y/5iAQyEGTucjdZ2WvjiVk5OHtPh
	oO7Q==
X-Received: by 10.14.179.5 with SMTP id g5mr35157970eem.41.1362998370150;
	Mon, 11 Mar 2013 03:39:30 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 3sm22742787eej.6.2013.03.11.03.39.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 03:39:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:39:14 +0100
Message-Id: <1362998354-7195-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
References: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnxSb81jXuBEciVtMnrcNPpg4t47MNXW1tt6UYlIjJgRudAUX5cJouQilnewd69Qxp4OGzQ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 2/2] xbmc: add patch to make 'ld-is-gold' work with configure
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
X-List-Received-Date: Mon, 11 Mar 2013 10:56:12 -0000

The custom XBMC XB_FIND_SONAME macro doesn't work with the gold linker, backport a patch to fix it

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |   43 ++++++++++++++++++++
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |    5 ++-
 2 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
new file mode 100644
index 0000000..345e20e
--- /dev/null
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
@@ -0,0 +1,43 @@
+From fd8f73826240aae543a41a2bfeea0056e2fe594d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 11 Mar 2013 11:04:29 +0100
+Subject: [PATCH] configure: cope with ld-is-gold DISTRO_FEATURE
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-Status: backport
+
+ configure.in |   12 +++++++-----
+ 1 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ef94683..c8b459b 100755
+--- a/configure.in
++++ b/configure.in
+@@ -18,9 +18,14 @@ tolower(){
+ # check for library basenames
+ AC_DEFUN([XB_FIND_SONAME],
+ [
++  #set -x
+   if [[ "$host_vendor" != "apple" ]]; then
+     AC_MSG_CHECKING([for lib$2 soname])
+     $1_FILENAME=$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-M 2>/dev/null | grep "^LOAD.*$2" | awk '{V=2; print $V}')
++    if [[ -z $$1_FILENAME ]]; then
++      #try gold linker syntax
++      $1_FILENAME=$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-t 3>&1 1>&2 2>&3 | grep "$2")
++    fi
+     if [[ ! -z $$1_FILENAME ]]; then
+       $1_SONAME=$(objdump -p $$1_FILENAME | grep "SONAME.*$2" | awk '{V=2; print $V}')
+     fi
+@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
+     AC_MSG_RESULT([$$1_SONAME])
+     AC_SUBST($1_SONAME)
+   fi
++  #set +x
+ ])
+ 
+ # Function to push and pop libs and includes for a command
+-- 
+1.7.7.6
+
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 6331306..c2e8ed1 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
            file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
            file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
+           file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch \
            file://configure.in-Avoid-running-code.patch \
           "
 
@@ -22,11 +23,13 @@ inherit autotools gettext python-dir
 
 S = "${WORKDIR}/git"
 
+# breaks compilation
+CCACHE = ""
+
 CACHED_CONFIGUREVARS += " \
  ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
 "
 
-
 EXTRA_OECONF = " \
  --disable-rpath \
  --enable-libusb \
-- 
1.7.7.6



