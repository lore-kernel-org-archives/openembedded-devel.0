Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 726EF73D37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:15 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so92476330wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I7LKZQaUvsAMKVrZDLjyHodSU0ZOVDVTQVJrUxfsNTI=;
	b=OvrrkyikbGOWwqSzepRDmnrvKrGIhpaTnCZLDYzJFqM0OpgsBI/v7q2jT4IujBDo2M
	TqZXSiedzub0lX/dNtpi0pNeEnjpciW1ZgV3vcMd5TxzB4zqitk5P5QppVqBSsqrw2y+
	yLcfvTdF8ty6+gs7P1uI3F8QXXxs7fnAQl6gvDbsiistxJjXa7ls3Xd9NIcC/y4kaSnJ
	Ku5IZLJpxxCWPhMa5aJvBiFcGZnd/qZy2FBh/CZ0SzYXnDj1iv17Gc/yyVhnOuxEYKN7
	WMa83j41PvQYA22yUJwjyJHrcNN0pBCLJIm5Eysx6sJmfKqRx4KgksKCe+YkcOXwzNWz
	qtKg==
X-Received: by 10.180.105.227 with SMTP id gp3mr23725346wib.56.1430165596645; 
	Mon, 27 Apr 2015 13:13:16 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:15 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:12:58 +0200
Message-Id: <1430165584-5634-4-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 03/10] icedtea7-native: remove unused patch
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
X-List-Received-Date: Mon, 27 Apr 2015 20:13:16 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../icedtea-disable-desktop-dirs.patch             | 91 ----------------------
 1 file changed, 91 deletions(-)
 delete mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-desktop-dirs.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-desktop-dirs.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-desktop-dirs.patch
deleted file mode 100644
index 739804a..0000000
--- a/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-desktop-dirs.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-diff --git openjdk/jdk/make/common/Subdirs.gmk openjdk/jdk/make/common/Subdirs.gmk
-index f212d50..da6e9e1 100644
---- openjdk/jdk/make/common/Subdirs.gmk
-+++ openjdk/jdk/make/common/Subdirs.gmk
-@@ -88,28 +88,6 @@ done
- @$(ECHO) "Done Processing OTHERSUBDIRS: $(OTHERSUBDIRS)"
- endef
- 
--#
--# Iterate the list specified in SUBDIRS_<group> only if
--# SUBDIRS_<group> is set.
--#
--ifdef SUBDIRS_desktop 
--  define subdirs-desktop-loop
--      @$(call subdirs-group-loop,SUBDIRS_desktop)
--  endef
--else   
--  define subdirs-desktop-loop
--  endef
--endif   # SUBDIRS_desktop 
--
--ifdef SUBDIRS_enterprise 
--  define subdirs-enterprise-loop
--      @$(call subdirs-group-loop,SUBDIRS_enterprise)
--  endef
--else   
--define subdirs-enterprise-loop
--endef
--endif   # SUBDIRS_enterprise 
--
- ifdef SUBDIRS_management 
-   define subdirs-management-loop
-       @$(call subdirs-group-loop,SUBDIRS_management)
-@@ -140,7 +118,7 @@ endif   # SUBDIRS_tools
- #
- # If BUILD_MODULES is not set or it's set to "all",
- # iterate all groups.
--SUBDIRS_all = $(SUBDIRS) $(SUBDIRS_desktop) $(SUBDIRS_enterprise) \
-+SUBDIRS_all = $(SUBDIRS) $(SUBDIRS_enterprise) \
- 	      $(SUBDIRS_management) $(SUBDIRS_misc) $(SUBDIRS_tools)
- 
- define SUBDIRS-loop
-diff --git a/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c b/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c
-index 5de53ca..b598a22 100644
---- a/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c
-+++ b/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c
-@@ -29,7 +29,7 @@
- #include "X11SurfaceData.h"
- 
- /*#include <xcb/xcb.h>*/
--#include <Xrender.h>
-+#include <X11/extensions/Xrender.h>
- 
- #ifndef RepeatNone  /* added in 0.10 */
- #define RepeatNone    0
-diff --git a/jdk/make/sun/xawt/FILES_c_unix.gmk b/jdk/make/sun/xawt/FILES_c_unix.gmk
-index 57b34c3..c629f78 100644
---- a/jdk/make/sun/xawt/FILES_c_unix.gmk
-+++ b/jdk/make/sun/xawt/FILES_c_unix.gmk
-@@ -84,15 +84,8 @@ FILES_c = \
- 	XRSurfaceData.c \
- 	XRBackendNative.c
- 
--ifndef USE_SYSTEM_GTK
- FILES_c += \
- 	gtk_fp.c
--endif
--
--ifndef USE_SYSTEM_CUPS
--FILES_c += \
--	cups_fp.c
--endif
- 
- ifndef USE_SYSTEM_FONTCONFIG
- FILES_c += \
-diff --git a/jdk/make/sun/awt/FILES_c_unix.gmk b/jdk/make/sun/awt/FILES_c_unix.gmk
-index dc1f61e..489abc1 100644
---- a/jdk/make/sun/awt/FILES_c_unix.gmk
-+++ b/jdk/make/sun/awt/FILES_c_unix.gmk
-@@ -230,11 +230,6 @@ FILES_NO_MOTIF_c = \
-         AccelGlyphCache.c \
- 	CUPSfuncs.c
- 
--ifndef USE_SYSTEM_CUPS
--FILES_NO_MOTIF_c += \
--	cups_fp.c
--endif
--
- ifndef USE_SYSTEM_FONTCONFIG
- FILES_NO_MOTIF_c += \
- 	fontconfig_fp.c
-- 
1.9.1


