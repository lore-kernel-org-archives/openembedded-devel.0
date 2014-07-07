Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1B88270381
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:28 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id b13so4193346wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N97pT8M6kW5LALf4fwS1h422bhl1ISJ1h8pciMVNSjk=;
	b=XJDhpVUM6ku+U754UiSt9HvK6Z52SWoPu6+oaEnSrxuaEPF3gzeRz3iQu2idu5k/K9
	b+5k0oN5IHjea6mThMOJitXqFx+aQHd29lZ3/+uCg9fevQR315jxl5q7eZwIM9Cm+PN2
	/mElmrSH8ulAiQmZPiqwiZq5gpYG+C0wOW6X0SLMqdrhyMIlhrvtxPrzqihfi7ztgw2/
	lUuDcWhu4yB0fYQ69/PzqxwMAFo5+NKRU0lF/8PTNJsSvkbUjCL/jWQVNvuZ9ZyLD3+r
	bw2W/W7ruHSLseTuPAQgngJtgXztXGn+LfEfCo92BEO6sHhy1GuIjGddxsYSPzJd4Exw
	vKGg==
X-Received: by 10.180.84.168 with SMTP id a8mr74402642wiz.36.1404729929574;
	Mon, 07 Jul 2014 03:45:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm2727299wia.11.2014.07.07.03.45.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:16 +0200
Message-Id: <1404729919-2903-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/7] libsdl-ttf: fix build without freetype-config
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../use.pkg-config.for.freetype2.patch             | 57 ++++++++++++++++++++++
 .../libsdl-ttf/libsdl-ttf_2.0.10.bb                |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/use.pkg-config.for.freetype2.patch

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/use.pkg-config.for.freetype2.patch
new file mode 100644
index 0000000..8a11f66
--- /dev/null
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/use.pkg-config.for.freetype2.patch
@@ -0,0 +1,57 @@
+freetype-config was removed from oe-core in
+
+commit 5870bd272b0b077d0826fb900b251884c1c05061
+Author: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date:   Thu May 22 10:59:33 2014 +0100
+
+    binconfig-disabled: Add class and use
+
+diff --git a/configure.in b/configure.in
+index 408e8d6..5f9e730 100644
+--- a/configure.in
++++ b/configure.in
+@@ -86,39 +86,11 @@ case "$host" in
+ esac
+ AM_CONDITIONAL(USE_VERSION_RC, test x$use_version_rc = xtrue)
+ 
+-dnl Check for the FreeType 2 library
+-dnl
+-dnl Get the cflags and libraries from the freetype-config script
+-dnl
+-AC_ARG_WITH(freetype-prefix,[  --with-freetype-prefix=PFX   Prefix where FREETYPE is 
+-installed (optional)],
+-            freetype_prefix="$withval", freetype_prefix="")
+-AC_ARG_WITH(freetype-exec-prefix,[  --with-freetype-exec-prefix=PFX Exec prefix 
+-where FREETYPE is installed (optional)],
+-            freetype_exec_prefix="$withval", freetype_exec_prefix="")
+-
+-if test x$freetype_exec_prefix != x ; then
+-     freetype_args="$freetype_args --exec-prefix=$freetype_exec_prefix"
+-     if test x${FREETYPE_CONFIG+set} != xset ; then
+-        FREETYPE_CONFIG=$freetype_exec_prefix/bin/freetype-config
+-     fi
+-fi
+-if test x$freetype_prefix != x ; then
+-     freetype_args="$freetype_args --prefix=$freetype_prefix"
+-     if test x${FREETYPE_CONFIG+set} != xset ; then
+-        FREETYPE_CONFIG=$freetype_prefix/bin/freetype-config
+-     fi
+-fi
+-AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
+-no_freetype=""
+-if test "$FREETYPE_CONFIG" = "no" ; then
+-    AC_MSG_ERROR([
+-*** Unable to find FreeType2 library (http://www.freetype.org/)
+-])
+-else
+-    CFLAGS="$CFLAGS `$FREETYPE_CONFIG $freetypeconf_args --cflags`"
+-    LIBS="$LIBS `$FREETYPE_CONFIG $freetypeconf_args --libs`"
+-fi
++PKG_CHECK_MODULES(FREETYPE2, freetype2, 
++    CFLAGS="$CFLAGS $FREETYPE2_CFLAGS"
++    LIBS="$LIBS $FREETYPE2_LIBS",
++    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.freetype.org/)])
++)
+ 
+ dnl Check for SDL
+ SDL_VERSION=2.0.0
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index 0127b31..47026a2 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -8,6 +8,7 @@ PR = "r2"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
            file://configure.patch \
+           file://use.pkg-config.for.freetype2.patch \
 "
 
 S = "${WORKDIR}/SDL_ttf-${PV}"
-- 
2.0.0


