Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTPt-0001v9-W4
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:16:18 +0200
Received: by wgbds1 with SMTP id ds1so3199635wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tzlYazwyUEs0u2V9Ft67/zva0tIbQy1GOD6/cXwMHEY=;
	b=04Dkl2nG0S96/xmOW0/91Mx8QJBfk+FRFafVDz3kwYD+xXRgqXkBCTf6QxUsksReC1
	YtLjnJImxPLEDSVQ1L6mm6SfhYeRj84SK4B/MdOhwevTHXfrJmF2RD2xh0YhqjGL6dpV
	JAiuPVI9fMVcj7qNY8DMby5WkGUCeDxF/EDIeMs3MUf3arYD85vk6SqnSuqDpuYNoGPH
	4QMoADlfMjq3uiH4moHVk6YyZXXtUA9pGzGz84bm1A6y3l5mdT9VtSBc88ct8VHEVGaP
	XrfDFpVGV5SoW33BruXdayhbStp6SBlaqnoo0bNnfYzLnOwW0N9FlP2Gk/zSPB8OgNyZ
	uRbA==
Received: by 10.180.101.136 with SMTP id fg8mr37919773wib.4.1336417586884;
	Mon, 07 May 2012 12:06:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm22224432wib.9.2012.05.07.12.06.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:06:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:05:46 +0200
Message-Id: <fd0343f3b67ae3c4917b18a394bc4361a5599735.1336417488.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 4/5] loudmouth: fix build with glib-2.32
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
X-List-Received-Date: Mon, 07 May 2012 19:16:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../loudmouth/loudmouth-1.4.3/glib-2.32.patch      |   10 ++++++++++
 .../loudmouth/loudmouth_1.4.3.bb                   |    5 ++++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
new file mode 100644
index 0000000..b6c9422
--- /dev/null
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
@@ -0,0 +1,10 @@
+--- loudmouth-1.4.3.orig/loudmouth/lm-error.c	2008-10-29 21:48:15.000000000 +0100
++++ loudmouth-1.4.3/loudmouth/lm-error.c	2012-05-06 08:27:07.455739440 +0200
+@@ -19,7 +19,6 @@
+  */
+ 
+ #include <config.h>
+-#include <glib/gerror.h>
+ #include "lm-error.h"
+ 
+ /**
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index f91fdff..87852ee 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -8,7 +8,10 @@ DEPENDS = "glib-2.0 check openssl"
 
 inherit gnomebase
 
-SRC_URI += "file://04-use-pkg-config-for-gnutls.patch"
+PR = "r1"
+
+SRC_URI += "file://04-use-pkg-config-for-gnutls.patch \
+            file://glib-2.32.patch"
 
 SRC_URI[archive.md5sum] = "55339ca42494690c3942ee1465a96937"
 SRC_URI[archive.sha256sum] = "95a93f5d009b71ea8193d994aa11f311bc330a3efe1b7cd74dc48f11c7f929e3"
-- 
1.7.8.6



