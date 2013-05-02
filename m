Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXmuV-00029s-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 08:22:35 +0200
Received: by mail-ea0-f172.google.com with SMTP id r16so89121ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2013 23:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=53ztt6NKUOF+5ESSbgB1XambNad1N/VJ0dPRqXazcSI=;
	b=m3GOT1JcfYnEUg0EOvU67SOXKyusnqSV3fhB2UVVUxi4wzUETJBLL/SeBONsR7ZvC9
	rPP7IZRR2q5Aq6mCCdRlv+j++f8uuipUYkqaVshIYV3MsHMmLI1h5O/9jeiWzB2M7NPL
	e8Bnd8X39lInJK/oL9FJmTyUVmATWBn7RTvoXBl/dVRy56iODdMCwpB3faGzuDyuhib6
	j3LSW/XLdwlij9cXqS6KQyARednkrCbCxTcOfSP5aXpezzN1E63xMzmQOrcINaCUkhFW
	uoQ2hMkqfpIkDHwT5G9guo2Z6YQvLUHmaSPyibFUC+rbNAVhp2KV8flX3v455+TH4WP/
	W5Zg==
X-Received: by 10.15.36.2 with SMTP id h2mr15984030eev.2.1367474678266;
	Wed, 01 May 2013 23:04:38 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id l6sm7435772eem.9.2013.05.01.23.04.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 01 May 2013 23:04:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 May 2013 08:04:20 +0200
Message-Id: <1367474661-2698-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkNG8VbEci2jymJtjB8xdvI2swm50WWUM16943uA8hgkXrK3NYH7+/5S+65WC2U2kR8Ie/5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 1/2] xbmc: add patch to make 'ld-is-gold' work with configure
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
X-List-Received-Date: Thu, 02 May 2013 06:22:46 -0000

The custom XBMC XB_FIND_SONAME macro doesn't work with the gold linker, backport a patch to fix it

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch | 43 ++++++++++++++++++++++
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |  5 ++-
 2 files changed, 47 insertions(+), 1 deletion(-)
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
+Upstream-Stature: backport
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
index b385a89..7d0a1d9 100644
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
1.8.1.4



