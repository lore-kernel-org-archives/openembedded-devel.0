Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 38C5E6B7C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:29 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so5853610eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lxqdIf1NK5fITD8ZiRuWun9B6R/4gEEpyIaTkLhNg9c=;
	b=vtBV3uS6eetEXUGz2TmvoczN2qqDdwsDj6KxgxcHYs727ctO5IO9P4p3IWnpUVGjo6
	kU9BrdJEWGcgiFEYIWDAkoOclkONiZZchzWWvd0mYQjbnMSQFKx+SXyxjhQnd+o9OqLU
	MMxKfyvAeZWZ8MMzBnYLf5rL3VsioljnPgveIpYPZG4IHOBTIoEIQGvPkDgJZZ7GEAT8
	FOO+9z1R2e2lpqN9/kuPhbbNcw346LXOCw+gmlV6UqzfFzyd/66gYMiwopo4EntsSeKc
	f4Q/ehMfrD1PGe10J267gxsF8GJLeQhQ7crVMtggFJkrw5F39xAGiwrOWN9Ms+GpX5TO
	cKeg==
X-Received: by 10.14.193.132 with SMTP id k4mr10933327een.55.1388581049937;
	Wed, 01 Jan 2014 04:57:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	l4sm126875684een.13.2014.01.01.04.57.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:22 +0100
Message-Id: <1388581046-8713-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/8] navit: Fix build with newer freetype
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../navit/navit/freetype-include-path.patch              | 16 ++++++++++++++++
 meta-oe/recipes-navigation/navit/navit_svn.bb            |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch

diff --git a/meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch b/meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch
new file mode 100644
index 0000000..b3763b0
--- /dev/null
+++ b/meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch
@@ -0,0 +1,16 @@
+Description: Fix FTBFS caused by freetype headers path change.
+Author: Gilles Filippini <pini@debian.org>
+Bug-Debian: http://bugs.debian.org/733378
+Index: navit/navit/font/freetype/font_freetype.c
+===================================================================
+--- navit.orig/navit/font/freetype/font_freetype.c	2013-09-23 10:43:32.000000000 +0200
++++ navit/navit/font/freetype/font_freetype.c	2013-12-30 19:54:45.000000000 +0100
+@@ -32,7 +32,7 @@
+ #if USE_FRIBIDI
+ #include <fribidi.h>
+ #endif
+-#include <freetype/ftglyph.h>
++#include <ftglyph.h>
+ #include "point.h"
+ #include "graphics.h"
+ #include "debug.h"
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index 6e81a4b..2661507 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -6,4 +6,5 @@ PR = "${INC_PR}.3"
 
 S = "${WORKDIR}/${PN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
+    file://freetype-include-path.patch \
 "
-- 
1.8.4.3


