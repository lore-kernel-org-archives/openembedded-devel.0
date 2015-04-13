Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 12C246AC24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:49 +0000 (UTC)
Received: by widdi4 with SMTP id di4so60851952wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CBAGSzIWEBkAsLI2+IRTmm6gKQo3DtBWL+LXR/NDPVA=;
	b=Ad9puVy9N+fqzZIyiooOeXqxPMfzjrynKkrLM+s6yBo+CiIwmTF5MM3DJ/U/jpv3Wr
	AqwBDvmjMfuYT6jHqI8ODKW1hEtOwjjMuqDraY72qSr06QJfO97dUmUxcvqOeP26/Zve
	ivu+kE7LFnVqK9NasEVp/BvUYgHJxYMAS14hvmYaOGqruckuRYrE3zcvwddDz1ceoZ+b
	zXVtI9h/CRQM4879tUxSrIy3Pkd1o8Y3EPqJqXml356RSyzuJTSqIkXcHlLnNiSTVmYF
	6NTa68GZn8CYvQeotTEuEIkitctZjfmP8hSMog8iwUiE2ZoiEUKhO9a6KXKjIqluB8a5
	JIXQ==
X-Received: by 10.180.20.144 with SMTP id n16mr18713795wie.44.1428910070484;
	Mon, 13 Apr 2015 00:27:50 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:49 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:33 +0200
Message-Id: <1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v2 3/7] icedtea7-native: Remove unused patch
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
X-List-Received-Date: Mon, 13 Apr 2015 07:27:50 -0000

This patch is not referenced anywhere in the recipes.

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
1.8.1.rc3


