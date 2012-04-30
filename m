Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkId-0003pZ-28
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:41:31 +0200
Received: by wibhj13 with SMTP id hj13so2041429wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cGVDTGvQOanRBsS+G2N9CqP/UPH1D4Sckk3/qL4WKRY=;
	b=HcHgiR3LjQ5jCybQyUlPRoAAls3v6L7m6mYflTpCXBDtDYRzSlUexEAjMdKF+ihwTt
	J5hZ8X/hgZfBWbw7qyK+hT2/lCrdhlCUyCmskkIRhcHHirBN64hZZi0tU91mQzoT0kfy
	YJQIBxTCLihRTtYYNdRTNMARJymeiT4cOVgxTj2l60JUmJOzCQWlVjY2AH5pO9T61BNF
	GfIXVefEpWDSYV+ora8H8xGrBG46noaI5j7BUiaEPqk2OilELbHmrit0Fvk5SS4tOv1/
	tt51CyxMsKbk9zqQ0jJdicuqMSGYg8CQYxpWmRUissJB0jj63onG9e+QAxaouIyUeI0j
	MZCA==
Received: by 10.180.84.4 with SMTP id u4mr15184919wiy.2.1335767509736;
	Sun, 29 Apr 2012 23:31:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm26408331wia.11.2012.04.29.23.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:31:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:31:11 +0200
Message-Id: <34f0d3bce05751b1328ab39ff45a9f16381cd3cf.1335766581.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/6] epdfview: fix build with glib-2.32
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
X-List-Received-Date: Mon, 30 Apr 2012 06:41:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch |   12 ++++++++++++
 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb        |    6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch

diff --git a/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch b/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
new file mode 100644
index 0000000..e08584c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
@@ -0,0 +1,12 @@
+diff -uNr epdfview-0.1.8.orig/src/gtk/StockIcons.h epdfview-0.1.8/src/gtk/StockIcons.h
+--- epdfview-0.1.8.orig/src/gtk/StockIcons.h	2011-05-28 12:24:57.000000000 +0200
++++ epdfview-0.1.8/src/gtk/StockIcons.h	2012-04-30 07:48:08.528285594 +0200
+@@ -18,8 +18,6 @@
+ #if !defined (__STOCK_ICONS_H__)
+ #define __STOCK_ICONS_H__
+ 
+-#include <glib/gmacros.h>
+-
+ G_BEGIN_DECLS
+ 
+ // ePDFView stock icons.
diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
index 5f6bbf4..c16137e 100644
--- a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
+++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
@@ -5,12 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "x11/applications"
 DEPENDS = "gtk+ poppler"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "--without-cups"
 
 inherit autotools gettext
 
-SRC_URI = "http://www.emma-soft.com/projects/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2"
+SRC_URI = "http://www.emma-soft.com/projects/${BPN}/chrome/site/releases/${BP}.tar.bz2 \
+  file://glib-2.32.patch \
+"
 SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
 SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
-- 
1.7.8.6



