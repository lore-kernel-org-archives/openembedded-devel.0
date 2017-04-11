Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id AB2DF77BD9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 13:04:11 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id s141so50984714lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sM+mFiWnUBvm222mIye6rwJe0g5obHFaTn7C+VoRi3Y=;
	b=eYLmFbBSRqWGTqgRC82Hc1FYXcFwjCcCBynZ5XKRkuPeH3Xd+CVQk6RsURbFzP0Nqg
	Is3fvfLAS7XfM1jFOJGDykCzABK7E1qJoYI6oMRqp1/vaLymzGg2H83BAu7YMdqhuYMK
	AWJNqVjAL1QOQ7ZF/u3GV6nobJ2TkRbFHRgsOIJfUtajvODYi3Hz/ED9zER0eXK0oVMa
	wWm6wV6cBvxzYwwBen15Y1scDyYpWH849sIaU66h5V3dAt/HMrAUm0B+9OfmBS4+/D2i
	zbGPeNMGohMVsGHoQJZL0JAzaFF7BIU87Oyj+blsYpEGvKW1AEWleyVrZyFaGDDm43Vp
	DQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sM+mFiWnUBvm222mIye6rwJe0g5obHFaTn7C+VoRi3Y=;
	b=NI4kd7fYkpq6yVNlhp0Kg54QaFVyR1WKRdC68LKKdY3uZ7DFRf/U0BLcJMobuKY/qz
	wRuIfb6OL7Yl8fCH3obyqax9D9PIPRgTqtWjgyKuV8ZdOwCKz4z7z6fREgDjtTDTiNRu
	vks0JJM28S2Fx70CYf63Jc37Xay7WFaPdw6uItPZrH9WsT1Tpp/RR+zzxiYwTvq8Nvqn
	0XYN6VT2izJ0dPeRg3mp+DTNf71AVlyPn1IGg1ct0fOZUDSiFjRQ8BXVfqIOoaY94CgO
	2JWpTgDE5YA5b3mpL18pMsdGfnjBZOLyJ/Xg6SjADYHfMllZlAFrDgNnvRglxsTzjjNO
	GRig==
X-Gm-Message-State: AN3rC/69vZYSZhZGBINhx8nbYpBrJoBvqqRe1VNgZN+4M/mBB/xUUOpuG522KWfaKQwg0iUT
X-Received: by 10.25.193.205 with SMTP id r196mr2326336lff.127.1491915851736; 
	Tue, 11 Apr 2017 06:04:11 -0700 (PDT)
Received: from gordanmarkus-XPS13.luxoft.com
	(static-212-247-53-108.cust.tele2.se. [212.247.53.108])
	by smtp.gmail.com with ESMTPSA id
	f21sm3437416lfa.27.2017.04.11.06.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 06:04:10 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Apr 2017 15:04:05 +0200
Message-Id: <20170411130405.21564-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtdeclarative: fix memory leaks
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
X-List-Received-Date: Tue, 11 Apr 2017 13:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Fix QQmlExpression leaking QQmlError objects
* Fix V4 Javascript Engine creating duplicate entries
* Fix memory leak in QQuickWindowPrivate::deliverTouchAsMouse

Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 ...-QQmlExpression-leaking-QQmlError-objects.patch | 35 +++++++++
 .../qtdeclarative/0002-Fix-memory-leak-in-V4.patch | 44 ++++++++++++
 ...leak-in-QQuickWindowPrivate-deliverTouchA.patch | 84 ++++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_git.bb                |  6 ++
 4 files changed, 169 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
 create mode 100644 recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
 create mode 100644 recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch

diff --git a/recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch b/recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
new file mode 100644
index 0000000..050a914
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
@@ -0,0 +1,35 @@
+From f9dcbf008b430aadd464985b7a618eca8173d264 Mon Sep 17 00:00:00 2001
+From: Robert Griebl <robert.griebl@pelagicore.com>
+Date: Thu, 23 Feb 2017 15:11:13 +0100
+Subject: [PATCH 1/3] Fix QQmlExpression leaking QQmlError objects
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the user doesn't clear any potential errors manually via clearError(),
+then do it automatically in the destructor. Found with valgrind.
+
+[ChangeLog][QtQml][QQmlExpression] Fixed memory leak
+
+Change-Id: If5b1181850c7463c939a7ba536d74e7054c53d60
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
+---
+ src/qml/qml/qqmlexpression.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/qml/qml/qqmlexpression.cpp b/src/qml/qml/qqmlexpression.cpp
+index 6afbd05..5cb3d4d 100644
+--- a/src/qml/qml/qqmlexpression.cpp
++++ b/src/qml/qml/qqmlexpression.cpp
+@@ -200,6 +200,7 @@ QQmlExpression::QQmlExpression(QQmlContextData *ctxt, QObject *scope,
+ */
+ QQmlExpression::~QQmlExpression()
+ {
++    clearError();
+ }
+ 
+ /*!
+-- 
+2.9.3
+
diff --git a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch b/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
new file mode 100644
index 0000000..423681e
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
@@ -0,0 +1,44 @@
+From 80e63c5a2981473dd7ee3a4f382e54948bb99f75 Mon Sep 17 00:00:00 2001
+From: Gunnar Sletta <gunnar@crimson.no>
+Date: Thu, 19 Jan 2017 09:05:46 +0100
+Subject: [PATCH 2/3] Fix memory leak in V4
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Transitions contain both an id and a set of flags, but the sorting
+failed to take the flags into account in the operator<. As a result
+we would some times end up with duplicate entries if the same id
+was added multiple times with different flags.
+
+If the same id was added again and again with varying flags, this
+could lead to an ever expanding list filled with duplicate entries.
+
+Fix this by also taking flags into account in operator< so that
+operator< and operator== are symetric and the list gets correctly
+sorted.
+
+Change-Id: I762ec3f0c5b4ed9a1aecb9a883187a0445491591
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+Reviewed-by: Robin Burchell <robin.burchell@crimson.no>
+Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
+---
+ src/qml/jsruntime/qv4internalclass_p.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qml/jsruntime/qv4internalclass_p.h b/src/qml/jsruntime/qv4internalclass_p.h
+index dcda949..1d8ef4b 100644
+--- a/src/qml/jsruntime/qv4internalclass_p.h
++++ b/src/qml/jsruntime/qv4internalclass_p.h
+@@ -234,7 +234,7 @@ struct InternalClassTransition
+     { return id == other.id && flags == other.flags; }
+ 
+     bool operator<(const InternalClassTransition &other) const
+-    { return id < other.id; }
++    { return id < other.id || (id == other.id && flags < other.flags); }
+ };
+ 
+ struct InternalClass : public QQmlJS::Managed {
+-- 
+2.9.3
+
diff --git a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch b/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
new file mode 100644
index 0000000..79a48f5
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
@@ -0,0 +1,84 @@
+From 6aa9001064c19e75e58c830eedc583e2342a7f20 Mon Sep 17 00:00:00 2001
+From: Shawn Rutledge <shawn.rutledge@qt.io>
+Date: Wed, 1 Feb 2017 12:06:26 +0100
+Subject: [PATCH 3/3] fix memory leak in
+ QQuickWindowPrivate::deliverTouchAsMouse
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A QTouchEvent is allocated with a reduced subset of TouchPoints for
+each Item to which we attempt to deliver it, and thrown away afterwards.
+(Ιt's not efficient to heap-allocate it, but we can't avoid doing it
+at all without changing behavior.)  So now it's stored in a QScopedPointer.
+
+Change-Id: I48badb493610d0a715e582a2eedae95e2006eb2b
+Reviewed-by: Jan Arve Sæther <jan-arve.saether@qt.io>
+Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
+---
+ src/quick/items/qquickwindow.cpp | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/quick/items/qquickwindow.cpp b/src/quick/items/qquickwindow.cpp
+index 1297dde..c130aec 100644
+--- a/src/quick/items/qquickwindow.cpp
++++ b/src/quick/items/qquickwindow.cpp
+@@ -629,8 +629,8 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
+ 
+     // FIXME: make this work for mouse events too and get rid of the asTouchEvent in here.
+     Q_ASSERT(pointerEvent->asPointerTouchEvent());
+-    QTouchEvent *event = pointerEvent->asPointerTouchEvent()->touchEventForItem(item);
+-    if (!event)
++    QScopedPointer<QTouchEvent> event(pointerEvent->asPointerTouchEvent()->touchEventForItem(item));
++    if (event.isNull())
+         return false;
+ 
+     // For each point, check if it is accepted, if not, try the next point.
+@@ -647,7 +647,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
+                 break;
+ 
+             qCDebug(DBG_TOUCH_TARGET) << "TP (mouse)" << p.id() << "->" << item;
+-            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QEvent::MouseButtonPress, p, event, item, false));
++            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QEvent::MouseButtonPress, p, event.data(), item, false));
+ 
+             // Send a single press and see if that's accepted
+             QCoreApplication::sendEvent(item, mousePress.data());
+@@ -661,7 +661,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
+                 pointerEventPoint->setGrabber(item);
+ 
+                 if (checkIfDoubleClicked(event->timestamp())) {
+-                    QScopedPointer<QMouseEvent> mouseDoubleClick(touchToMouseEvent(QEvent::MouseButtonDblClick, p, event, item, false));
++                    QScopedPointer<QMouseEvent> mouseDoubleClick(touchToMouseEvent(QEvent::MouseButtonDblClick, p, event.data(), item, false));
+                     QCoreApplication::sendEvent(item, mouseDoubleClick.data());
+                     event->setAccepted(mouseDoubleClick->isAccepted());
+                     if (!mouseDoubleClick->isAccepted()) {
+@@ -678,7 +678,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
+         } else if (touchMouseDevice == device && p.id() == touchMouseId) {
+             if (p.state() & Qt::TouchPointMoved) {
+                 if (QQuickItem *mouseGrabberItem = q->mouseGrabberItem()) {
+-                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event, mouseGrabberItem, false));
++                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), mouseGrabberItem, false));
+                     QCoreApplication::sendEvent(item, me.data());
+                     event->setAccepted(me->isAccepted());
+                     if (me->isAccepted()) {
+@@ -689,7 +689,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
+                     // no grabber, check if we care about mouse hover
+                     // FIXME: this should only happen once, not recursively... I'll ignore it just ignore hover now.
+                     // hover for touch???
+-                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event, item, false));
++                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), item, false));
+                     if (lastMousePosition.isNull())
+                         lastMousePosition = me->windowPos();
+                     QPointF last = lastMousePosition;
+@@ -707,7 +707,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
+             } else if (p.state() & Qt::TouchPointReleased) {
+                 // currently handled point was released
+                 if (QQuickItem *mouseGrabberItem = q->mouseGrabberItem()) {
+-                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event, mouseGrabberItem, false));
++                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event.data(), mouseGrabberItem, false));
+                     QCoreApplication::sendEvent(item, me.data());
+ 
+                     if (item->acceptHoverEvents() && p.screenPos() != QGuiApplicationPrivate::lastCursorPosition) {
+-- 
+2.9.3
+
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index a620a00..c19bbd5 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -14,6 +14,12 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+SRC_URI += " \
+    file://0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch \
+    file://0002-Fix-memory-leak-in-V4.patch \
+    file://0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch \
+"
+
 DEPENDS += "qtbase"
 
 PACKAGECONFIG ??= "qtxmlpatterns"
-- 
2.9.3


