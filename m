Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71AE660620
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:50 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s29so694341lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DS2+FAlW67446D7xwf2JYPT15WOlFiL8K55PxI5M+yg=;
	b=rcY2zGJ9kqRQuXDrI3rEKQq6mUj5iS/W3X1ooWfj5PjKzWyhTDZi++dgCe4QLwJhrr
	5A2A2hmpamt+8WE2HbHUoexvvZZnWM7rbdr4K90zGHtoW2cbMfnMMPzm9jsexcKrmm1e
	oVqlMAgVPa8POhcjFv33erP+ZEoZtASv4/TAfzJBeYln5mTcsnjvejhYTsV+i3gtM4o9
	XS8r77LARSX1Z/l1Q+hq092yKmb0PgxXfvqXA3pg8koCNpZV8H3XolwpD/NQ82tkt9jl
	9ngL2eAHflkfLohbDRreGfCbnlOC9cP31y18/WNJlmp2th68qZI4MHyAHgF2SSAKN5x9
	uTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DS2+FAlW67446D7xwf2JYPT15WOlFiL8K55PxI5M+yg=;
	b=ecb/xtqKIEn6/gwfqNfzhaBng+fGnpCWeurLrFvylKscACygZedOGWCrWo84d+U3qg
	1ImHBIthHa6VETei4+eNk8nq33mPe/03WIESQ/ZmwEo4j86aGnjsY+74r6KPGvY7jKu9
	LVNYNbueDPCugcYbwdELI2v7t6TZCuTCLaBDCwhIlxT7whF4ngJ5yn4EOJTw79fkQs1n
	TU3MRIR+JYyG6fESZKEwnZ70W1lLlCX67+kWB7pC63tpOveKn7mDv5DCcNTVJUWPAGDy
	2QRG8fn5342aiGo1t9OAlt2SZcOgrTtBU7ieUtz2E0thSkboqDkpZ8jTrazWDjGoBQVN
	EVmQ==
X-Gm-Message-State: AA6/9RkJub8WNDYJ2s1OTrq6YyLxvfnZXqnc1qb/UF2HQnGOZgis/f7UrVBTHIbpKVnxUw==
X-Received: by 10.28.174.76 with SMTP id x73mr1214649wme.60.1474955751625;
	Mon, 26 Sep 2016 22:55:51 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:26 +0200
Message-Id: <1474955733-30185-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] exo: update to 0.11.1
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../exo/exo/reduce-build-to-exo-csource-only.patch | 28 +++++++++++++++-------
 .../exo/{exo_0.10.6.bb => exo_0.11.1.bb}           |  4 ++--
 2 files changed, 22 insertions(+), 10 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.6.bb => exo_0.11.1.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index 246511c..8073fca 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  Makefile.am  | 10 +---------
- configure.ac | 20 --------------------
- 2 files changed, 1 insertion(+), 29 deletions(-)
+ configure.ac | 26 --------------------------
+ 2 files changed, 1 insertion(+), 35 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index ad7c6ce..3acd94a 100644
+index 9979b36..05d594e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,15 +1,7 @@
@@ -40,7 +40,7 @@ index ad7c6ce..3acd94a 100644
  distclean-local:
  	rm -rf *.cache *~
 diff --git a/configure.ac b/configure.ac
-index bb9be05..23471d0 100644
+index b66c92b..5243132 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -116,15 +116,6 @@ AC_PROG_CC()
@@ -59,7 +59,7 @@ index bb9be05..23471d0 100644
  
  dnl ***************************************
  dnl *** Check for standard header files ***
-@@ -171,17 +162,6 @@ dnl ***********************************
+@@ -171,29 +162,12 @@ dnl ***********************************
  dnl *** Check for required packages ***
  dnl ***********************************
  XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.30.0])
@@ -69,14 +69,26 @@ index bb9be05..23471d0 100644
 -XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
 -XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.10.0])
 -XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.30.0], [gio-unix], [GIO-Unix features])
--
+ 
+ dnl ***********************************************************
+ dnl *** Optional support for a GTK+3 version of the library ***
+ dnl ***********************************************************
+-XDT_CHECK_OPTIONAL_PACKAGE([GTK3],
+-                           [gtk+-3.0], [3.6.0], [gtk3],
+-                           [GTK+ 3 support])
+-XDT_CHECK_OPTIONAL_PACKAGE([LIBXFCE4UI2],
+-                           [libxfce4ui-2], [4.12.0], [libxfce4ui2],
+-                           [GTK+ 3 support: libxfce4ui-2])
+ AM_CONDITIONAL([ENABLE_GTK3_LIBRARY], [test "x$GTK3_FOUND" = "xyes" && test "x$LIBXFCE4UI2_FOUND" = "xyes" ])
+ 
 -dnl *********************
 -dnl *** Check for X11 ***
 -dnl *********************
 -XDT_CHECK_LIBX11_REQUIRE()
- 
+-
  dnl *************************
  dnl *** Check for gtk-doc ***
+ dnl *************************
 -- 
-1.9.3
+2.5.5
 
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.6.bb b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.10.6.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
index f1b5ae5..92155f2 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.6.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
@@ -17,8 +17,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "895e4f38d2cfe58d69679e2902a335a5"
-SRC_URI[sha256sum] = "1cc0e5a432e050a5e5aa64d126b988f4440da4f27474aaf42a4d8e13651d0752"
+SRC_URI[md5sum] = "866292556586facb034191aa66431697"
+SRC_URI[sha256sum] = "c70c47f690284a5cb4f507dd89088efbdd8123506f924e33a5f97aab74eb97d4"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.5.5


