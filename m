Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id ECCDA7070B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 10:49:08 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so12840044wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J2GCgpUjiYjyoGiwwh0PzcKAw3TUameNa0HsfD9cjVc=;
	b=DuGR/xz17RNP70lNsarWYVZkssHdfrckiFtiCZxzJ5jQloKcysLUp4BW2r9vJDQfQp
	UTqs7C23MwnnKU2rISS5Q3FIAor1RtI5AO/TkjPl8TTsSJy6Y6IU6Zd4aP+cDvKkMxO7
	FAzoG1+llgZq99y8U1yvSElJ3koGXNnLscGyr2QHd55FPPyUXjkMalqtoDuB15UXSppr
	lzKns0uIu86W+YZoxOG2AAwmfRfFZNnDE2wMPS82XulhrXRbKOVjetiWZLo6hWOEtGyl
	k9TstrO3hybifLwizA2ZGi3AqEcMUajtbO4U4uLwpI4fLoL63quqZ2PDZ1ws263riOSf
	Y57A==
X-Received: by 10.194.57.67 with SMTP id g3mr21846501wjq.60.1408963749208;
	Mon, 25 Aug 2014 03:49:09 -0700 (PDT)
Received: from localhost.localdomain (pD9F9BCF9.dip0.t-ipconnect.de.
	[217.249.188.249]) by mx.google.com with ESMTPSA id
	wb10sm92011685wjc.36.2014.08.25.03.49.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 03:49:08 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Aug 2014 12:48:11 +0200
Message-Id: <1408963691-15683-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-oe][PATCH v2] md5deep: Add recipe for md5deep package version 4.4
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
X-List-Received-Date: Mon, 25 Aug 2014 10:49:10 -0000

I need to build hashdeep/md5deep within OE to include it in my images. This recipe enables OE to cross-compile md5deep. I needed to add the patch as do_configure_qa is complaining about cross-compilation errors otherwise. I added a pull request for the issue with the variable expansion to hashdeep as well.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../md5deep/files/wrong-variable-expansion.patch   | 39 ++++++++++++++++++++++
 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    | 16 +++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
 create mode 100644 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb

diff --git a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
new file mode 100644
index 0000000..3a4c4f4
--- /dev/null
+++ b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
@@ -0,0 +1,39 @@
+--- a/configure.ac	2014-08-22 12:22:54.290884351 +0200
++++ b/configure.ac	2014-08-22 12:23:15.822306295 +0200
+@@ -42,18 +42,6 @@
+      ;;		 		     
+ esac
+ 
+-
+-# Bring additional directories where things might be found into our
+-# search path. I don't know why autoconf doesn't do this by default
+-if test x"${mingw}" == "xno" ; then
+-  for spfx in /usr/local /opt/local /sw ; do
+-    echo checking ${spfx}/include
+-    if test -d ${spfx}/include; then
+-        CPPFLAGS="-I${spfx}/include $CPPFLAGS"
+-        LDFLAGS="-L${spfx}/lib $LDFLAGS"
+-    fi
+-  done
+-fi
+ #
+ #
+ ################################################################
+@@ -71,7 +59,7 @@
+ 
+ if test $mingw = "no" ; then
+   # add the warnings we don't want to do on mingw
+-  $WARNINGS_TO_TEST="$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Weffc++"
++  WARNINGS_TO_TEST="$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Weffc++"
+ fi
+ 
+ for option in $WARNINGS_TO_TEST
+@@ -105,7 +93,7 @@
+ 
+ if test $mingw = "no" ; then
+   # add the warnings we don't want to do on mingw
+-  $WARNINGS_TO_TEST="$WARNINGS_TO_TEST  -Weffc++"
++  WARNINGS_TO_TEST="$WARNINGS_TO_TEST  -Weffc++"
+ fi
+ 
+ for option in $WARNINGS_TO_TEST
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
new file mode 100644
index 0000000..960e00f
--- /dev/null
+++ b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
@@ -0,0 +1,16 @@
+SUMMARY = "md5deep and hashdeep to compute and audit hashsets of amounts of files."
+DESCRIPTION = "md5deep is a set of programs to compute MD5, SHA-1, SHA-256, Tiger, or Whirlpool message digests on an arbitrary number of files. This package also includes hashdeep which is also able to audit hashsets."
+AUTHOR = "Jesse Kornblum, Simson L. Garfinkel"
+HOMEPAGE = "http://md5deep.sourceforge.net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9190f660105b9a56cdb272309bfd5491"
+# Release 4.4
+SRCREV = "cd2ed7416685a5e83eb10bb659d6e9bec01244ae"
+
+SRC_URI = "git://github.com/jessek/hashdeep.git \
+        file://wrong-variable-expansion.patch \
+        "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
1.8.1.rc3


