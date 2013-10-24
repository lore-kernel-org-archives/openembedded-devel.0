Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id D68236D364
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 10:58:03 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id w10so443977pde.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O0SijFlWsYgF6mFst8RTTTBdbuzWXIi4ug4nlkiZFHQ=;
	b=lvs/7jx4dGK/4YRySF4SgNUCxgHIMVJxXECSkdaqKZQJtdj12Pu16MilPGAQRKh8zj
	O0US26yvGC5t542mi2mdjibnHCYKb7k7iBst6q/5bXOpv2x/x9D1D9+dsbEMk8eacku2
	+KTUssFoEQquOMDpHamEwHqoAqvj52D8AThmR36yaG/aYEWka2EpS0ak6S+YwXBadsxn
	hj2Ev1oF8/L8dkyj762hpryBUog4ubR04z8DlSyATtkYP3g8wiBV/MyXME68Z7buUDsX
	45ArOp3K4R0GsSCedodfsYxGzH15uGKFXLydKSSsA221JFV4QdlkqG/3ML1/3OaJD+IF
	k5Kg==
X-Received: by 10.68.189.229 with SMTP id gl5mr823544pbc.195.1382612285743;
	Thu, 24 Oct 2013 03:58:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id sd3sm1758034pbb.42.2013.10.24.03.58.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Oct 2013 03:58:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2013 21:56:37 +1100
Message-Id: <1382612197-6440-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-qt5][PATCH] qtbase: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch
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
X-List-Received-Date: Thu, 24 Oct 2013 10:58:03 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...ned-selection-region-with-text-when-cente.patch | 74 ++++++++++++++++++++++
 ...ned-selection-region-with-text-when-cente.patch | 74 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase.inc                          |  1 +
 3 files changed, 149 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selection-region-with-text-when-cente.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selection-region-with-text-when-cente.patch

diff --git a/recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selection-region-with-text-when-cente.patch b/recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selection-region-with-text-when-cente.patch
new file mode 100644
index 0000000..d5e082e
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selection-region-with-text-when-cente.patch
@@ -0,0 +1,74 @@
+From 5d8a882c11201a29475c5ea71cfb76c9de6573f5 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 23 Oct 2013 00:28:17 +1100
+Subject: [PATCH] Fix misaligned selection region with text when centered
+
+If the text is centered, the x/y position in the selection QRectF may
+be a multiple of 0.5 which is rounded up. This rounding causes
+misalignment of the selection region with the text.
+
+The alignment is fixed by using qFloor on the x and y components.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,68842]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-34218
+Task-number: QTBUG-34234
+Change-Id: I4f2fadeb38602f62a93773c6e5faecf03b28069f
+Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
+---
+ src/gui/text/qtextlayout.cpp | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index 54d337e..66341e1 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -44,6 +44,7 @@
+ 
+ #include <qthread.h>
+ #include <qfont.h>
++#include <qmath.h>
+ #include <qpainter.h>
+ #include <qvarlengtharray.h>
+ #include <qtextformat.h>
+@@ -946,15 +947,23 @@ static void addSelectedRegionsToPath(QTextEngine *eng, int lineNumber, const QPo
+                 continue;
+             }
+ 
+-            if (lastSelectionWidth > 0)
+-                region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
++            if (lastSelectionWidth > 0) {
++                QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
++                rect.moveLeft(qFloor(rect.left()));
++                rect.moveTop(qFloor(rect.top()));
++                region->addRect(rect);
++            }
+ 
+             lastSelectionX = selectionX;
+             lastSelectionWidth = selectionWidth;
+         }
+     }
+-    if (lastSelectionWidth > 0)
+-        region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
++    if (lastSelectionWidth > 0) {
++        QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
++        rect.moveLeft(qFloor(rect.left()));
++        rect.moveTop(qFloor(rect.top()));
++        region->addRect(rect);
++    }
+ }
+ 
+ static inline QRectF clipIfValid(const QRectF &rect, const QRectF &clip)
+@@ -2077,7 +2086,7 @@ static void setPenAndDrawBackground(QPainter *p, const QPen &defaultPen, const Q
+ 
+     QBrush bg = chf.background();
+     if (bg.style() != Qt::NoBrush && !chf.property(SuppressBackground).toBool())
+-        p->fillRect(r, bg);
++        p->fillRect(QRectF(qFloor(r.x()), qFloor(r.y()), r.width(), r.height()), bg);
+     if (c.style() != Qt::NoBrush) {
+         p->setPen(QPen(c, 0));
+     }
+-- 
+1.8.4
+
diff --git a/recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selection-region-with-text-when-cente.patch b/recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selection-region-with-text-when-cente.patch
new file mode 100644
index 0000000..d5e082e
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selection-region-with-text-when-cente.patch
@@ -0,0 +1,74 @@
+From 5d8a882c11201a29475c5ea71cfb76c9de6573f5 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 23 Oct 2013 00:28:17 +1100
+Subject: [PATCH] Fix misaligned selection region with text when centered
+
+If the text is centered, the x/y position in the selection QRectF may
+be a multiple of 0.5 which is rounded up. This rounding causes
+misalignment of the selection region with the text.
+
+The alignment is fixed by using qFloor on the x and y components.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,68842]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-34218
+Task-number: QTBUG-34234
+Change-Id: I4f2fadeb38602f62a93773c6e5faecf03b28069f
+Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
+---
+ src/gui/text/qtextlayout.cpp | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index 54d337e..66341e1 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -44,6 +44,7 @@
+ 
+ #include <qthread.h>
+ #include <qfont.h>
++#include <qmath.h>
+ #include <qpainter.h>
+ #include <qvarlengtharray.h>
+ #include <qtextformat.h>
+@@ -946,15 +947,23 @@ static void addSelectedRegionsToPath(QTextEngine *eng, int lineNumber, const QPo
+                 continue;
+             }
+ 
+-            if (lastSelectionWidth > 0)
+-                region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
++            if (lastSelectionWidth > 0) {
++                QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
++                rect.moveLeft(qFloor(rect.left()));
++                rect.moveTop(qFloor(rect.top()));
++                region->addRect(rect);
++            }
+ 
+             lastSelectionX = selectionX;
+             lastSelectionWidth = selectionWidth;
+         }
+     }
+-    if (lastSelectionWidth > 0)
+-        region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
++    if (lastSelectionWidth > 0) {
++        QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
++        rect.moveLeft(qFloor(rect.left()));
++        rect.moveTop(qFloor(rect.top()));
++        region->addRect(rect);
++    }
+ }
+ 
+ static inline QRectF clipIfValid(const QRectF &rect, const QRectF &clip)
+@@ -2077,7 +2086,7 @@ static void setPenAndDrawBackground(QPainter *p, const QPen &defaultPen, const Q
+ 
+     QBrush bg = chf.background();
+     if (bg.style() != Qt::NoBrush && !chf.property(SuppressBackground).toBool())
+-        p->fillRect(r, bg);
++        p->fillRect(QRectF(qFloor(r.x()), qFloor(r.y()), r.width(), r.height()), bg);
+     if (c.style() != Qt::NoBrush) {
+         p->setPen(QPen(c, 0));
+     }
+-- 
+1.8.4
+
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 889ab99..575621f 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -23,6 +23,7 @@ SRC_URI += " \
     file://0023-configure-make-freetype-a-configurable-option.patch \
     file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
     file://0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
+    file://0027-Fix-misaligned-selection-region-with-text-when-cente.patch
 "
 
 DEPENDS += "qtbase-native"
-- 
1.8.4


