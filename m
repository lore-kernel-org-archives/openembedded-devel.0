Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 65B747FCB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 14:10:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b11so3383349wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bdYp6vqRSmTD6D3xvOHMNRUdZ6/yvF/g+L69cGHgvf4=;
	b=BJk4ZwKifs2nKZzlRRbE3atVUdU8tfc9FTePtT5s1rTG79UVb0UbbAvQI9JLOT7ZjD
	kiJBdH46G4Ul2ZAqUCM7BnnOq6kghhV2/ltRJeEFVZPqZnZEdwb6vdOKhdKPROLkq7RI
	qhNUkYsSjlym8SEw3G/9QxQpWJSbucpzzbG0sKlTF/C6Vu5bBgjIxnDY1R7He81z1IZ+
	6kfcgFJ1l434HFY3FmfwJMDbbpATplJiAJ88rOvr8JArhD+nKUXybDuBByR9qZvt5www
	t4nxIfeIXpgM17FtB1uLVM70aTxYEmitEeeERKTvz6yrUsLEEXn2D5jEuDR9lcFLX991
	Iufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bdYp6vqRSmTD6D3xvOHMNRUdZ6/yvF/g+L69cGHgvf4=;
	b=rvBWRvUXo7qV3psOyHi+3tf6lbQpi8JBw4+faDRxwrLv/TX8takxYBumib4wBbUePX
	bSO6L6zrVaVVRejmXAUmpReDmTD7MjYMMK3E/R9b3gyyU5Xa4jG/3jvQNKksKWpTTJQo
	uNhDDtLQoNu7A2hDYwTv8sl5A0cxkWzrkhVS0bu7KRCpd3NRUQO3xf8LTXEFKNRawN4Q
	JxItoYpxs2w41rEVjvFWLO0YgeKJockMdYUPLts2eQ5u0JZGeCIPK5qvxqrvZXRUynQQ
	6dxeVGK9pYCBFaZmyV3iJ21GbRI+dhZZrgJa2VniqF3MYYVdsXWF0Yl/COmwl+7k8qaN
	Ratw==
X-Gm-Message-State: APjAAAWd+spEjFwlwzzQA+dUhV7OGkDuqu1hswTA4rp4lUIN6tnxveBz
	qQXaOiNPptzj7qLydo/rJo5wCjvE
X-Google-Smtp-Source: APXvYqzNzkeHXm1r2IZ2FYX0Zm4FjkvBHb6Tb0VyN5Y8StPQ5SR47fi4ba4Y7LD3EGCwpwEC6xygaA==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr5543660wmb.164.1575987054156; 
	Tue, 10 Dec 2019 06:10:54 -0800 (PST)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:3da3:ea06:8aaf:c536])
	by smtp.gmail.com with ESMTPSA id g25sm3823073wmh.3.2019.12.10.06.10.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 06:10:53 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 15:10:50 +0100
Message-Id: <20191210141050.1494-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-oe][PATCH] boinc: update recipe to version 7.16.3
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
X-List-Received-Date: Tue, 10 Dec 2019 14:10:54 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

---
 .../boinc-client/boinc-AM_CONDITIONAL.patch   | 23 ++++++++++++-------
 .../boinc/boinc-client/gtk-configure.patch    | 21 +++++++++++------
 .../boinc/boinc-client/opengl_m4_check.patch  | 17 ++++++++++----
 ...nc-client_7.12.bb => boinc-client_7.16.bb} |  2 +-
 4 files changed, 43 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.12.bb => boinc-client_7.16.bb} (98%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
index ab8042f72..7c3b0325d 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
+++ b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
@@ -1,21 +1,28 @@
-Add configure check for gtk2+ and objc++
+From 7957756a3dd16498cf7a75e1fb6675a33bc7f3dc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 01:20:33 -0700
+Subject: [PATCH] Add configure check for gtk2+ and objc++
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: boinc-client_release-7.6-7.6.33/configure.ac
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/configure.ac
-+++ boinc-client_release-7.6-7.6.33/configure.ac
-@@ -64,6 +64,7 @@ m4_ifdef([AC_PROG_OBJCXX],[AC_PROG_OBJCX
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d81d795de4..7beeb34ae2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,6 +63,7 @@ m4_pattern_allow([AC_PROG_OBJCXX])
+ m4_ifdef([AC_PROG_OBJCXX],[AC_PROG_OBJCXX],)
  dnl ------
- AC_PROG_F77
  AC_PROG_CPP
 +AC_PROG_OBJCXX
  AC_PROG_MAKE_SET
  SAH_LINKS
  AC_LANG_PUSH(C)
-@@ -1081,6 +1082,8 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test
+@@ -1068,6 +1069,8 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test "x${enable_server}" = xyes  || test "x${
  AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
  AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
  
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
index 4ae8d580d..e060b1a40 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
+++ b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
@@ -1,13 +1,20 @@
-Check for gtk2+ only when manager is enabled
+From d53e9617fb6446780478bb13907efd111f241cd1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 01:20:33 -0700
+Subject: [PATCH] Check for gtk2+ only when manager is enabled
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: boinc-client_release-7.6-7.6.33/configure.ac
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/configure.ac
-+++ boinc-client_release-7.6-7.6.33/configure.ac
-@@ -1033,6 +1033,11 @@ else
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7beeb34ae2..35234c2762 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1018,6 +1018,11 @@ else
    AM_CONDITIONAL([GUI_GTK], false)
  fi
  
@@ -19,7 +26,7 @@ Index: boinc-client_release-7.6-7.6.33/configure.ac
  dnl ---------- libNotify --------------------------------------------------
  if test "${enable_manager}" = yes ; then
    PKG_CHECK_MODULES(LIBNOTIFY, [libnotify])
-@@ -1082,7 +1087,6 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test
+@@ -1069,7 +1074,6 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test "x${enable_server}" = xyes  || test "x${
  AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
  AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
  
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
index 0b057eabc..ad4493f0b 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
+++ b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
@@ -1,13 +1,22 @@
+From 4f2dd929618f149087249f3c90cc056d5080b1e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 01:20:33 -0700
+Subject: [PATCH] boinc: Add recipe for boinc-client
+
 Do not add prefix/lib to library search path
 let sysroot take care of that
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Inappropriate[Cross-compile specific]
 
-Index: boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/m4/ax_check_gl.m4
-+++ boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
+---
+ m4/ax_check_gl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/ax_check_gl.m4 b/m4/ax_check_gl.m4
+index e26ce5b930..1e60c9266a 100644
+--- a/m4/ax_check_gl.m4
++++ b/m4/ax_check_gl.m4
 @@ -58,7 +58,7 @@ else
      else
        ax_try_lib="${ax_lib}"
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
similarity index 98%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
index d472d3269..ce3f691b2 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
@@ -29,7 +29,7 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "bd12338dbd29083daa5a4b022592ca31ff68cd98"
+SRCREV = "a432e1ccbf864f99c7b29a1645de38056915f944"
 BRANCH = "client_release/7/${PV}"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-- 
2.17.1


