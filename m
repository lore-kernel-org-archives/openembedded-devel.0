Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B04578991
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:52:06 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id u46so5889339wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g6X6XwRyGOzvvt2GgNm1PbI8SPaA5q1h71nF8isSmmY=;
	b=B0EUzWnOgkAuuispLhS7FBrxcd3doZnH25xiTj5VGOaPush6k1h9WvOnjweuRT+ks/
	PsJYt7P2zqj8fFUu8dS8juWgynzCh+kaIEIRHcmpYa5Wl0Z9HabtNgt1zCjzGBOIMgoh
	tPbK4UIbS4GBCfHkryA9gq61/ogDGKFfZ4iTLOjFm41Z/YuEQ5LOt2n09aW2EOcuEmbO
	+/WBIl4LaDBS6PoEHWtwLhRH/4lpRH9vyQy/pKNl8PiEEejjKdvHT6LtpiV4+8CxwiRZ
	LRFRwCanlthPMX91nCJ4PK38cijievavSI5WDLTdFoJw+9vDI4L9QehN8+7W2a02jJbv
	gisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g6X6XwRyGOzvvt2GgNm1PbI8SPaA5q1h71nF8isSmmY=;
	b=CwFHWNVSasseI5atxlyYaaEwCLFJX7zjw2ngzDw2rwneRgJU1mgRDDt+2+xlvIBd/I
	JALriTLnTNVm4Xzgg3uiqJxFS1q7FpDR54yriiN01kcVgrz4gz7V6JmpZfxPuvDwadX0
	pN3nJQAp/0iVb9zUXdMOdVHbUTglbwUrVfAuSQ5+2ekvxbTCdN+rffg13ctPtfP0IBVo
	p1BHWlBpFz0213HdirQpEdxFFig3iAy4+x+F9aqQ0ZDmUQ0R1YbqvtW9yP+JW3swzLOB
	KZfiz2VTY+F7ik+hz1DGruX+CnbK4bBcAl/ywBr0OxlZGTY5I72+k0l8QTbyswU4YfYP
	QakQ==
X-Gm-Message-State: AElRT7Eb4Squg+Fy2JpdDXMnzBQzH2OJrsPF9dAGoommNcp+spnVoKbp
	AAgg0ShCzRf3/CQdDGBzyDNPsg==
X-Google-Smtp-Source: AG47ELsFlyUN9GH4hA1vge51X0h99LdfUvumorxfQfpNI017BDP4t69G7DgtNVnqjNP3KB+0MzNZ1Q==
X-Received: by 10.223.151.69 with SMTP id r63mr16215944wrb.47.1521651127217;
	Wed, 21 Mar 2018 09:52:07 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 96sm4286498wrk.54.2018.03.21.09.52.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 09:52:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:52:02 +0000
Message-Id: <20180321165202.1777-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180321165202.1777-1-Martin.Jansa@gmail.com>
References: <20180321165202.1777-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] pidgin: refresh patches
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
X-List-Received-Date: Wed, 21 Mar 2018 16:52:06 -0000

WARNING: pidgin-2.12.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch sanitize-configure.ac.patch
patching file configure.ac
Hunk #1 succeeded at 642 with fuzz 1 (offset 170 lines).
Hunk #2 succeeded at 2397 (offset 537 lines).
Hunk #3 succeeded at 2429 (offset 537 lines).

Now at patch sanitize-configure.ac.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pidgin/pidgin/pidgin-cross-python-265.patch    | 18 +++++++++++++-----
 .../pidgin/pidgin/purple-OE-branding-25.patch      | 18 +++++++++++++-----
 .../pidgin/pidgin/sanitize-configure.ac.patch      | 22 ++++++++++++++++------
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
index 72bf4ed41b..312fc8593f 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
@@ -1,9 +1,17 @@
-Use pkg-config instead of ${PYTHON}-config to find python
+From 855cc20bafa30597ae7a62f7672d42654b25cde0 Mon Sep 17 00:00:00 2001
+From: Herrie <github.com@herrie.org>
+Date: Mon, 24 Jul 2017 21:30:16 +0200
+Subject: [PATCH] Use pkg-config instead of ${PYTHON}-config to find python
 
-diff -uNr pidgin-2.10.12.orig/configure.ac pidgin-2.10.12/configure.ac
---- pidgin-2.10.12.orig/configure.ac	2016-01-01 00:19:40.000000000 +0100
-+++ pidgin-2.10.12/configure.ac	2016-05-05 16:55:13.258945925 +0200
-@@ -1585,20 +1585,15 @@
+---
+ configure.ac | 21 ++++++++-------------
+ 1 file changed, 8 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d20a18e..c741829 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1567,20 +1567,15 @@ AM_CONDITIONAL(ENABLE_DBUS, test "x$enable_dbus" = "xyes")
  dnl Check for Python headers (currently useful only for libgnt)
  dnl (Thanks to XChat)
  if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
diff --git a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
index 293ef709d1..9a24fbbc5f 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
@@ -1,8 +1,16 @@
-Index: pidgin-2.5.0/libpurple/protocols/irc/irc.h
-===================================================================
---- pidgin-2.5.0.orig/libpurple/protocols/irc/irc.h	2008-08-19 01:53:38.000000000 +0000
-+++ pidgin-2.5.0/libpurple/protocols/irc/irc.h	2008-08-27 11:15:58.000000000 +0000
-@@ -36,9 +36,9 @@
+From 43e9db656431ffb22b429d5fca4ce3b4af21bc9e Mon Sep 17 00:00:00 2001
+From: Herrie <github.com@herrie.org>
+Date: Mon, 24 Jul 2017 21:30:16 +0200
+
+---
+ libpurple/protocols/irc/irc.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libpurple/protocols/irc/irc.h b/libpurple/protocols/irc/irc.h
+index fde35c4..66e52dd 100644
+--- a/libpurple/protocols/irc/irc.h
++++ b/libpurple/protocols/irc/irc.h
+@@ -40,9 +40,9 @@
  
  #define IRC_DEFAULT_CHARSET "UTF-8"
  #define IRC_DEFAULT_AUTODETECT FALSE
diff --git a/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch b/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
index a77d64f40b..84dbcdc276 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
@@ -1,6 +1,16 @@
---- /tmp/configure.ac	2007-05-08 17:29:02.000000000 +0200
-+++ pidgin-2.0.0/configure.ac	2007-05-08 17:30:30.325251000 +0200
-@@ -472,7 +472,7 @@
+From c3058f9eadaf5ff28ba776cfed54b609a93a1249 Mon Sep 17 00:00:00 2001
+From: Herrie <github.com@herrie.org>
+Date: Mon, 24 Jul 2017 21:30:16 +0200
+
+---
+ configure.ac | 10 +---------
+ 1 file changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b8acd2a..d20a18e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -642,7 +642,7 @@ if test "x$enable_consoleui" = "xyes"; then
  	if test "x$enable_consoleui" = "xyes"; then
  		dnl # Some distros put the headers in ncursesw/, some don't
  		found_ncurses_h=no
@@ -8,8 +18,8 @@
 +		for location in $ac_ncurses_includes $NCURSES_HEADERS 
  		do
  			f="$location/ncurses.h"
- 			AC_CHECK_HEADER($f,[
-@@ -1860,10 +1860,6 @@
+ 			orig_CFLAGS="$CFLAGS"
+@@ -2397,10 +2397,6 @@ if test "$kerberos" != "no" ; then
  			KRB4_CFLAGS="$KRB4_CFLAGS -I${kerberos}/include/kerberosIV"
  		fi
  		KRB4_LDFLAGS="-L${kerberos}/lib"
@@ -20,7 +30,7 @@
  	fi
  	AC_DEFINE(ZEPHYR_USES_KERBEROS, 1, [Define if kerberos should be used in Zephyr.])
  
-@@ -1896,10 +1892,6 @@
+@@ -2433,10 +2429,6 @@ if test "$zephyr" != "no" ; then
  		ZEPHYR_LDFLAGS="-L${zephyr}/lib"
  	elif test -d /usr/athena/include/zephyr ; then
  		ZEPHYR_CFLAGS="-I/usr/athena/include"
-- 
2.15.1


