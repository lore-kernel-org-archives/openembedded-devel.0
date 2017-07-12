Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9167E77F6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 21:15:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e199so4590230pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vApo3cJHlI85/o6bVyFEDcAcb0SyPOtEktMUvvXAR58=;
	b=taV4CtQ0Bf1aF9h8iDVGVEIYYNgjLNJRaB49+7ZSbnQ4fMIxUzf0ExL8uj4jgL781R
	IsE8lDi9148Tj7kjcEYTkz+GupOK1+c5bcUmYB1XuDi/lelbHPp2JhmEfwxMXwJAqzyB
	VKGJxoWw7i1w/7TSmUmeAjXgimC033O2ajtk76UgCuApSsCiF0RrotYmzhl0eTjaDJAK
	0J3APiVcngiT7QFOXX+xbqGjgAitmUzkyn9xFAGXodsYTAEOLbhCvdY/wZNWjdpDoFO6
	D5lZoBc/3p4bi0sqaTcRDZeKw/15ZWv+DzdHs8QX1nWr/pn8S9o7VeoAZYhXfI6+w59Z
	9j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vApo3cJHlI85/o6bVyFEDcAcb0SyPOtEktMUvvXAR58=;
	b=k6EjAKCnP+71ZhYxQAxS0W2HNv4ryBicuE7lul2HFt+HlBoJ8vG+bAIrB/95fQjz7i
	lJWLNO4jMRYqKUw5yfYvp8/eMuVkzjWEMZOI4RwGz9e6p3ForVrgOXa69Wxmu6/5Kowa
	wNue8HMPhaGwaLjoGjTqAbyKo3tRG9krbxFgfbP1VkC/aDPJQqx9KmDQTstFAFITYFG7
	/ab91y4dMhAlnig3iSnS0/TBienyeZLBEw48Y7A9c2yQWkkDfw6dhc0lbLJ6Ho4C9Lh7
	mjVjtNUCseyH7gfrjlELedOsMMZCEdYy6CG5nzT80AHDxZoRX1tsuktGSwkJ9MqkPYYS
	1qgw==
X-Gm-Message-State: AIVw110xCUVEQ0tMm8CBIzBNLIPQQyP9J/apa5+19f7K3CUWUFhsYtS5
	Z9m/nSnTVpKlT0la
X-Received: by 10.98.83.130 with SMTP id h124mr32167712pfb.13.1499894112497;
	Wed, 12 Jul 2017 14:15:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id k18sm5923103pgf.5.2017.07.12.14.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 14:15:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:15:01 -0700
Message-Id: <20170712211501.45048-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170712211501.45048-1-raj.khem@gmail.com>
References: <20170712211501.45048-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qt5-creator: Fix build with NO_ACCESSIBILITY
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
X-List-Received-Date: Wed, 12 Jul 2017 21:15:11 -0000

Also add missing headers in sources

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch | 38 ++++++++++++++++++++
 .../0001-Qmlpuppet-add-missing-includes.patch      | 41 ++++++++++++++++++++++
 recipes-qt/qt5/qt5-creator_3.5.1.bb                |  2 ++
 3 files changed, 81 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch
 create mode 100644 recipes-qt/qt5/qt5-creator/0001-Qmlpuppet-add-missing-includes.patch

diff --git a/recipes-qt/qt5/qt5-creator/0001-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch b/recipes-qt/qt5/qt5-creator/0001-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch
new file mode 100644
index 0000000..9e90bab
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator/0001-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch
@@ -0,0 +1,38 @@
+From 429347dda56a4d45dc03fee2362eb02294161bfd Mon Sep 17 00:00:00 2001
+From: Eike Ziller <eike.ziller@qt.io>
+Date: Fri, 24 Jun 2016 10:23:24 +0200
+Subject: [PATCH] Fix compilation with QT_NO_ACCESSIBILITY
+
+Task-number: QTCREATORBUG-16446
+Change-Id: If75122c23a697f26ccf56391fe2e8d316aad6367
+Reviewed-by: hjk <hjk@theqtcompany.com>
+---
+ src/libs/utils/fancymainwindow.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/libs/utils/fancymainwindow.cpp b/src/libs/utils/fancymainwindow.cpp
+index 9477f17..1ee425f 100644
+--- a/src/libs/utils/fancymainwindow.cpp
++++ b/src/libs/utils/fancymainwindow.cpp
+@@ -159,13 +159,16 @@ public:
+ 
+         m_floatButton = new DockWidgetTitleButton(this);
+         m_floatButton->setIcon(q->style()->standardIcon(QStyle::SP_TitleBarNormalButton, &opt, q));
+-        m_floatButton->setAccessibleName(QDockWidget::tr("Float"));
+-        m_floatButton->setAccessibleDescription(QDockWidget::tr("Undocks and re-attaches the dock widget"));
+ 
+         m_closeButton = new DockWidgetTitleButton(this);
+         m_closeButton->setIcon(q->style()->standardIcon(QStyle::SP_TitleBarCloseButton, &opt, q));
++
++#ifndef QT_NO_ACCESSIBILITY
++        m_floatButton->setAccessibleName(QDockWidget::tr("Float"));
++        m_floatButton->setAccessibleDescription(QDockWidget::tr("Undocks and re-attaches the dock widget"));
+         m_closeButton->setAccessibleName(QDockWidget::tr("Close"));
+         m_closeButton->setAccessibleDescription(QDockWidget::tr("Closes the dock widget"));
++#endif
+ 
+         setActive(false);
+ 
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qt5-creator/0001-Qmlpuppet-add-missing-includes.patch b/recipes-qt/qt5/qt5-creator/0001-Qmlpuppet-add-missing-includes.patch
new file mode 100644
index 0000000..8c1311e
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator/0001-Qmlpuppet-add-missing-includes.patch
@@ -0,0 +1,41 @@
+From 51088a424416a8ca5cdf5161b792ac5e8a01f749 Mon Sep 17 00:00:00 2001
+From: Marco Benelli <marco.benelli@qt.io>
+Date: Thu, 6 Jul 2017 09:31:41 +0200
+Subject: [PATCH] Qmlpuppet: add missing includes
+
+Task-number:  QTCREATORBUG-18498
+Change-Id: Ie40a066508bb52f53b8ad528f9d4cf6969fc0632
+Reviewed-by: Thomas Hartmann <thomas.hartmann@qt.io>
+---
+ .../qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp | 2 ++
+ .../qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
+index 3f9f148..160e5c4 100644
+--- a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
++++ b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
+@@ -29,6 +29,8 @@
+ ****************************************************************************/
+ #include "layoutnodeinstance.h"
+ 
++#include <QCoreApplication>
++
+ namespace QmlDesigner {
+ namespace Internal {
+ 
+diff --git a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
+index 5a9342f..bacbc12 100644
+--- a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
++++ b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
+@@ -33,6 +33,7 @@
+ #include <enumeration.h>
+ #include <qmlprivategate.h>
+ 
++#include <QDebug>
+ #include <QEvent>
+ #include <QQmlContext>
+ #include <QQmlError>
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bb b/recipes-qt/qt5/qt5-creator_3.5.1.bb
index f4ba858..c85f38c 100644
--- a/recipes-qt/qt5/qt5-creator_3.5.1.bb
+++ b/recipes-qt/qt5/qt5-creator_3.5.1.bb
@@ -21,6 +21,8 @@ DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qtto
 SRC_URI = " \
     http://download.qt.io/official_releases/qtcreator/3.5/${PV}/qt-creator-opensource-src-${PV}.tar.gz \
     file://0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch \
+    file://0001-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch \
+    file://0001-Qmlpuppet-add-missing-includes.patch \
     file://qtcreator.desktop.in \
 "
 SRC_URI[md5sum] = "77aef7df837eba07c7ce6037ee504c05"
-- 
2.13.2


