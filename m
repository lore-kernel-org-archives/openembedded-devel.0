Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpih-0002eM-7J
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:43 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so927806wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=M7Fpq/1p5qFCZsG1u74BoL5OKF156C7XJWHfhwJi3WE=;
	b=OL/Xzikc87wvcyi8pxW9suXBqYCMqDUjLDue4FHfUaHvKlrFpHtwE+u8dG+8jLjxnI
	vZcgm+F3DAyFwtCEdFZ6w1sx5+11d8V7VBDezyPyaydNf+jSS4U0ZKOLjhoSqdGGw00g
	SP0mYEXfpXQ9HCqP1ZFYPAP7jYir5QC2+o+7v6LIgOyPtrm5itcdcjWMrQgBdpizkv56
	jmI5EAGr+ipezW79r8RdxilDN850h3JCjyNYO9bji6UGcwdMCx6W/nF0liyMwz/1QruZ
	rE0BdF3/C/36AnQfKq0BxOIFb91mRRiJHstGMvNsFXtEmVT07E1VdU/vC3tvlOa0GO0J
	FTKA==
Received: by 10.180.104.197 with SMTP id gg5mr6259798wib.9.1344606355837;
	Fri, 10 Aug 2012 06:45:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm11628997wiy.4.2012.08.10.06.45.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:12 +0200
Message-Id: <472689e0ef65d699fe341e4c1621fc63583aaabf.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 17/46] edbus: drop patch applied upstream r74447
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...edbus-configure.ac-fixup-performance_test.patch |   51 --------------------
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    1 -
 2 files changed, 0 insertions(+), 52 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus/0001-edbus-configure.ac-fixup-performance_test.patch

diff --git a/meta-efl/recipes-efl/efl/edbus/0001-edbus-configure.ac-fixup-performance_test.patch b/meta-efl/recipes-efl/efl/edbus/0001-edbus-configure.ac-fixup-performance_test.patch
deleted file mode 100644
index db1b15d..0000000
--- a/meta-efl/recipes-efl/efl/edbus/0001-edbus-configure.ac-fixup-performance_test.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 133d67d43fc21674f525da9ecd530f2b73fbdeea Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 26 Jul 2012 10:35:35 +0200
-Subject: [PATCH] edbus: configure.ac fixup performance_test
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d798484..d0fc4ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,6 +69,7 @@ want_ehal="yes"
- want_enotify="yes"
- want_eofono="yes"
- want_eukit="yes"
-+want_performance_test="yes"
- 
- case "$host_os" in
-    mingw*)
-@@ -78,6 +79,7 @@ case "$host_os" in
-       want_enotify="no"
-       want_eofono="no"
-       want_eukit="no"
-+      want_performance_test="no"
-       ;;
- esac
- 
-@@ -127,7 +129,7 @@ AC_ARG_ENABLE([eukit],
- AC_ARG_ENABLE([performance_test],
-    [AC_HELP_STRING([--disable-performance_test], [Disable performance build])],
-    [enable_performance_test=$enableval],
--   [enable_performance_test="${want_eukit}"])
-+   [enable_performance_test="${want_performance_test}"])
- 
- 
- ### Checks for programs
-@@ -277,7 +279,7 @@ fi
- 
- if test "x${have_edbus_performance_test}" = "xyes" ; then
-    PKG_CHECK_MODULES([EDBUS_PERFORMANCE_TEST],
--      [ecore >= 1.2.0 eina >= 1.2.0 dbus-1 >= 0.62 ecore-evas >= 1.2.0 elementary],
-+      [ecore >= 1.6.99 eina >= 1.6.99 dbus-1 >= 0.62 ecore-evas >= 1.6.99 elementary >= 1.6.99],
-       [have_edbus_performance_test="yes"],
-       [have_edbus_performance_test="no"])
- fi
--- 
-1.7.8.6
-
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index c22fcaf..d40deb2 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -8,6 +8,5 @@ DEFAULT_PREFERENCE = "-1"
 EXTRA_OECONF += "--disable-performance_test"
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
-  file://0001-edbus-configure.ac-fixup-performance_test.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.8.6



