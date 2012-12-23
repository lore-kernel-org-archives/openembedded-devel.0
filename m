Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkqM-0001nr-7w
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:39:58 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so2501105eaa.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5ZVoH7MHJVCNKP65Gdyy7kOoFqtN38P9ItJyBvKu3wE=;
	b=gIi3jtRp34j3DBL95mUADAS/mcaAOoTvxC4UpdSkfWFoFtH999oYEuBicdFuIQOZ80
	lC1yD3WFdKW3+Mck6JxhiRQ8Y/sDloXnMc5UQrlY37BBx2UCGOy65sUYGhwuDppn3IH4
	DEdIG6/Bpnc4x29Nwj9/Q1K5po3QRj9Em+SxSXAc33RhGHQnd7DObnqfjiPZFC3ehSDS
	vtUlmESo98oN1/wjUTSS9vvDf2ScmBGqwqIItsW12WHMTNJ6whzLBSJaJzlOS+TP2dUt
	7osr9cpQC7Da4hqQwAiDOJ9K97zbuURBIrjijneTMw3o8zkSdF+TR1AJ5/xVR15/h2Ef
	KpwQ==
X-Received: by 10.14.214.132 with SMTP id c4mr47864731eep.18.1356265501875;
	Sun, 23 Dec 2012 04:25:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm34557298eeo.8.2012.12.23.04.25.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:46 +0100
Message-Id: <2b3a6f6eed5883844e8371b09b57267f8a0989d0.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 21/30] libgnomecups: fix build with >=glib-2.31
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:34 -0000
X-List-Received-Date: Sun, 23 Dec 2012 12:40:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgnomecups/libgnomecups-0.2.3-glib.h.patch   | 42 ++++++++++++++++++++++
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |  4 +++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch b/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch
new file mode 100644
index 0000000..c7b6165
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch
@@ -0,0 +1,42 @@
+Imported from gentoo:
+
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-print/libgnomecups/files/libgnomecups-0.2.3-glib.h.patch
+
+From d84eee9450b3b6f6155074915efc61bedcc8d446 Mon Sep 17 00:00:00 2001
+From: Dominique Leuenberger <dimstar@opensuse.org>
+Date: Sun, 27 Nov 2011 21:36:41 +0100
+Subject: [PATCH] Fix: Only glib.h can be included
+
+---
+ libgnomecups/gnome-cups-i18n.c |    2 +-
+ libgnomecups/gnome-cups-init.h |    3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libgnomecups/gnome-cups-i18n.c b/libgnomecups/gnome-cups-i18n.c
+index 8987c5c..127756d 100644
+--- a/libgnomecups/gnome-cups-i18n.c
++++ b/libgnomecups/gnome-cups-i18n.c
+@@ -1,5 +1,5 @@
+ #include <config.h>
+-#include <glib/gmacros.h>
++#include <glib.h>
+ #include "gnome-cups-i18n.h"
+ 
+ #ifdef ENABLE_NLS
+diff --git a/libgnomecups/gnome-cups-init.h b/libgnomecups/gnome-cups-init.h
+index 22b682a..c4600fc 100644
+--- a/libgnomecups/gnome-cups-init.h
++++ b/libgnomecups/gnome-cups-init.h
+@@ -1,8 +1,7 @@
+ #ifndef GNOME_CUPS_INIT
+ #define GNOME_CUPS_INIT
+ 
+-#include <glib/gtypes.h>
+-#include <glib/gmacros.h>
++#include <glib.h>
+ 
+ G_BEGIN_DECLS
+ 
+-- 
+1.7.7
+
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
index c932ba0..199ee72 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS="glib-2.0 gtk+ pango cups intltool libgnomeui"
 
+PR = "r1"
+
 inherit gnome pkgconfig
 
 do_compile_append () {
@@ -11,5 +13,7 @@ do_compile_append () {
 	sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old > libgnomecups-1.0.pc
 }
 
+SRC_URI += "file://libgnomecups-0.2.3-glib.h.patch"
+
 SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
 SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
-- 
1.8.0.2



