Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 846136F7C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:48:12 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e51so4226533eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=WtGGcFP9+cWpmrQJsuZx9+kx1lnKQEG+7wMi0QXISG0=;
	b=E97P3WdyTl35NV3ORY6MRlt89rjFNKjA5qMoLYbntCsYWeZAC+46kb+oC5VIRQjLQe
	Z5gujqXD3jARh34UciJy6ArODOGYPipkdd6yjf45qq2wZpM5xYvnMdjWXd0xJUL3lEp9
	Q4SMEnz2vwl6FNI6VQlJbJ5rTbtY2ZcWP8MrHIFpdbGL2HVu6iaRPDIYPl/cadlCF5F7
	M3lvPSQKjnKjb4KcyqvIX+e6AUWx0WKxShP9NgQnjMk+oOXXYjCNQbpWDbXz/Wva5zlp
	+gaejuoWoK7/V0bcq9WZaB9CqgEXWiOSSU5jW9CYwbjQju6C7BoNUDR/F2FmkWwzjwjN
	bPZw==
X-Received: by 10.15.54.5 with SMTP id s5mr15569887eew.36.1394624893363;
	Wed, 12 Mar 2014 04:48:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	46sm69061380ees.4.2014.03.12.04.48.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 04:48:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2014 12:48:19 +0100
Message-Id: <a036792a6270f18c971baeb72f92abbb91c4d73e.1394624790.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/4] qtbase: Replace 0012-qtbase-allow-build-of-examples.patch with -compile-examples option
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
X-List-Received-Date: Wed, 12 Mar 2014 11:48:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* -compile-examples option was added in upstream commit:
  commit 8ea19caacf281240411541b5af37c2f9a103a7d1
  Author: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
  Date:   Tue May 7 17:10:22 2013 +0200
  Subject: add -compile-examples configure option

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc                          |  3 +-
 .../0012-qtbase-allow-build-of-examples.patch      | 48 ----------------------
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 2430035..a6fb3b2 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -16,7 +16,6 @@ SRC_URI += "\
 SRC_URI += "\
     file://0010-qmake-is-already-built-in-qtbase-native.patch \
     file://0011-Allow-building-a-separate-qmake-for-the-target.patch \
-    file://0012-qtbase-allow-build-of-examples.patch \
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
     file://0015-Fix-linuxfb-argument-mmsize-parsing.patch \
@@ -65,7 +64,7 @@ PACKAGECONFIG[release] = "-release,-debug"
 PACKAGECONFIG[developer] = "-developer-build"
 PACKAGECONFIG[sm] = "-sm,-no-sm"
 PACKAGECONFIG[tests] = "-make tests,-nomake tests"
-PACKAGECONFIG[examples] = "-make examples,-nomake examples"
+PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
 PACKAGECONFIG[tools] = "-make tools,-nomake tools"
 # only for completeness, configure will add libs even if you try to explicitly remove it
 PACKAGECONFIG[libs] = "-make libs,-nomake libs"
diff --git a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
deleted file mode 100644
index 9d46d2f..0000000
--- a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6e5e22110b4731b4324d309bc579393f422ba99d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Sat, 25 May 2013 17:34:32 +0200
-Subject: [PATCH 12/14] qtbase: allow build of examples
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this revert the following commit :
-
-commit 2b397f985e4ef6ae5c0571a928bb1320fb048c61
-Author: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
-Date:   Fri Dec 21 19:36:12 2012 +0100
-
-    do not actually build examples in production builds
-
-    -developer-build enables an actual build of examples, based on the
-    assumption that developers want to test it (it can be still disabled
-    with -nomake examples). regular users otoh want only the examples
-    sources installed.
-
-    Change-Id: Ifc6a108099929175a3960480802b271a758fdd38
-    Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
-
-Signed-off-by: Eric Bénard <eric@eukrea.com>
----
- mkspecs/features/qt_example_installs.prf | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/mkspecs/features/qt_example_installs.prf b/mkspecs/features/qt_example_installs.prf
-index 2db752c..ca1b0c7 100644
---- a/mkspecs/features/qt_example_installs.prf
-+++ b/mkspecs/features/qt_example_installs.prf
-@@ -92,11 +92,4 @@ probase = $$relative_path($$_PRO_FILE_PWD_, $$dirname(_QMAKE_CONF_)/examples)
-         allfiles -= doc
-         !isEmpty(allfiles): warning("remaining files in $$_PRO_FILE_PWD_: $$allfiles")
-     }
--
--    !equals(TEMPLATE, subdirs):!compile_examples {
--        TEMPLATE = aux
--        CONFIG -= have_target qt staticlib dll
--        SOURCES =
--        INSTALLS -= target
--    }
- }
--- 
-1.8.5.3
-
-- 
1.9.0


