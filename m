Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4209172658
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:54 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so14724529pac.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Bo2MVV8C+i+QWBTfOtiK6kiR8gQOr29G6mHYxL7Itt0=;
	b=1CNeOwjb4AOaoWfaV13HHhi/dE7Upi7K/BKXnPuCfhkd+EJjO40+YiLu1KoORnh0x7
	wh3DlY0YCQ6skCZlIxBQNy2F+wI2HdCNEkyojtzDFiam8b75mg09L9anFoRlP8dYYI3r
	V0nrxZ+VsTMFHRKk80UgMh3Vnu3R3yHQY4xjNuU4c4IEa/DYWDaNZn+aiM0c4KGrwyXz
	GYvJQWKC5Tspm6zt5WujeiAtlDKJgHCWUvRyg59OWRooYxi5VxlLrEQ1lutb6GjNKXbT
	kK8SQEeyhr74yXdN1iFRwErw4hCRLNgF1pG6mmDFSTXFw3SIKdFJBAro5/e2Hmq3LzY0
	ry8Q==
X-Received: by 10.68.143.196 with SMTP id sg4mr57643722pbb.52.1419700975861;
	Sat, 27 Dec 2014 09:22:55 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:09 -0800
Message-Id: <ca118b8054149441e6c956891e59126f2da195e8.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 22/27] enca: fix broken automake
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:55 -0000

From: Awais Belal <awais.belal@gmail.com>

The added patch fixes the usage of AM_ICONV macro and
comes straight from the Buildroot source tree.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../enca/enca/libenca-003-iconv.patch              | 28 ++++++++++++++++++++++
 meta-oe/recipes-support/enca/enca_1.9.bb           |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch

diff --git a/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
new file mode 100644
index 0000000..dbf0fb8
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
@@ -0,0 +1,28 @@
+From 7e144495093187143a3d1589f74c2eac37e4d790 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Sun, 4 May 2014 15:49:28 +0200
+Subject: [PATCH] libiconv.m4: Fix AM_ICONV macro usage
+
+This patch come straight from the Buildroot source tree.
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ m4/libiconv.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/libiconv.m4 b/m4/libiconv.m4
+index fc8c6f8..3a59549 100644
+--- a/m4/libiconv.m4
++++ b/m4/libiconv.m4
+@@ -17,7 +17,7 @@ AC_REQUIRE([AC_C_CONST])dnl
+ dnl
+ 
+ dnl Use standard iconv test
+-AM_ICONV
++m4_pattern_allow([AM_ICONV])
+ CONVERTOR_LIBS="$CONVERTOR_LIBS $LIBICONV"
+ 
+ dnl Compile iconvcap.c and run it to determine what encodings iconv actually
+-- 
+1.9.3
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index efea5a3..184b27e 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -11,7 +11,8 @@ SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}
     file://configure-hack.patch \
     file://dont-run-tests.patch \
     file://configure-remove-dumbness.patch \
-    file://makefile-remove-tools.patch "
+    file://makefile-remove-tools.patch \
+    file://libenca-003-iconv.patch "
 
 SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
 SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
-- 
1.9.1


