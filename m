Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6CC782C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:01:19 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z91so19767813wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lqbaYs/po2/dblF+ntAAQCZdp39hvq4ROFkzwPGOa1Y=;
	b=F5eBB7EBq3Nxd6FNd7QbVtRWIBarIdQ9aN/0B9YsX1mzniZax/x9n5W6NA7ntQ5y9E
	Dna03KqgnDB5/ZsZz1jDNSqzy9G0jxdvbzg92FCWvqFQaH7wgBNvwfXVXlMaXIU1QzLB
	Cdm95WEd2z0hxqe0Fy14+59tpJIJ1MSDBXijFheH7viS2xiihismMotAJwkIthUJaYWa
	Rfrhfg41HH6+KaBTIchbbLChbHmt/ZpfbCEN5mygYUYNKEl+QkoT+E+x0+zPD8ud69js
	SBYGPWl9L6O4bGyPuU6RLW09wb6Rh9bhJXdhzKP0U4zM3A/HmfEvbjHjswcSc0oq0YlS
	W7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lqbaYs/po2/dblF+ntAAQCZdp39hvq4ROFkzwPGOa1Y=;
	b=bNRdhx8qutI1fsvsghsjus6iq88oh5vfevO2wYuwwj6CwlCuY8kCqDVT0NkGjSU/15
	HVpH18yct4QuhbUwGCLh9jVMtoOfswvZM5Ul9eE1JugElgyXsrP0FbAT8Q4sCT8zlkHK
	obx9el5pq1axcFm2RhOvVLlRrKyQ4/ihQz2iNz5a5cfDhQm4uErQ3c8BstavBxswjcR9
	mq1nwC/oGYaC/YH01wvSTkvKwZoIUZ1rTsbOhNGbUhCfixp3keKqoRS7coTS8ZoIJ31n
	lNv+WJoOHcn2e4wMmCjsANJYuxmyxuMXMH9ZUN0riDrrQpfeKw2uoy2MfM2uW/4XWZdP
	1JsQ==
X-Gm-Message-State: AHYfb5js2mwmoxZWRnIYOBnpbM1rl9bmD29oScPF2XZ8a4FUiPhh3yXB
	fiCnvqlYMwKWQBx0
X-Received: by 10.223.144.37 with SMTP id h34mr12853216wrh.93.1503349280730;
	Mon, 21 Aug 2017 14:01:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m48sm7330086wrm.79.2017.08.21.14.01.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 14:01:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 23:02:55 +0200
Message-Id: <20170821210259.20276-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170821210259.20276-1-Martin.Jansa@gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 3/7] qtwebengine: add a fix for building demobrowser without printing support
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
X-List-Received-Date: Mon, 21 Aug 2017 21:01:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0005-Always-compile-QWebEnginePage-print.patch | 241 +++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |   6 +
 2 files changed, 247 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-Always-compile-QWebEnginePage-print.patch

diff --git a/recipes-qt/qt5/qtwebengine/0005-Always-compile-QWebEnginePage-print.patch b/recipes-qt/qt5/qtwebengine/0005-Always-compile-QWebEnginePage-print.patch
new file mode 100644
index 0000000..c63086d
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-Always-compile-QWebEnginePage-print.patch
@@ -0,0 +1,241 @@
+From a8c0deca850ca519b3f146c71492a8f42a33dd84 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=BCri=20Valdmann?= <juri.valdmann@qt.io>
+Date: Tue, 20 Jun 2017 15:36:43 +0200
+Subject: [PATCH] Always compile QWebEnginePage::print
+
+- Remove two out of five layers of ifdefs around and inside this method.
+- Now always compiled but will yield an error if printing is disabled.
+- Remove printing-related ifdefs from demobrowser.
+
+Task-number: QTBUG-61510
+Change-Id: I79781189d3d3fb62db0a2216b2b989e3fa1d1f86
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Reviewed-by: Rolf Eike Beer <eb@emlix.com>
+---
+ examples/webenginewidgets/demobrowser/browsermainwindow.cpp | 12 ------------
+ examples/webenginewidgets/demobrowser/browsermainwindow.h   |  6 ------
+ examples/webenginewidgets/demobrowser/printtopdfdialog.cpp  |  7 -------
+ src/webenginewidgets/api/qwebenginepage.cpp                 | 10 ++--------
+ src/webenginewidgets/api/qwebenginepage.h                   |  8 --------
+ 5 files changed, 2 insertions(+), 41 deletions(-)
+
+diff --git a/examples/webenginewidgets/demobrowser/browsermainwindow.cpp b/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
+index 327d7a9d..14d49f7f 100644
+--- a/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
++++ b/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
+@@ -109,9 +109,7 @@ BrowserMainWindow::BrowserMainWindow(QWidget *parent, Qt::WindowFlags flags)
+     , m_historyForward(0)
+     , m_stop(0)
+     , m_reload(0)
+-#ifndef QT_NO_PRINTER
+     , m_currentPrinter(nullptr)
+-#endif
+ {
+     setToolButtonStyle(Qt::ToolButtonFollowStyle);
+     setAttribute(Qt::WA_DeleteOnClose, true);
+@@ -312,9 +310,7 @@ void BrowserMainWindow::setupMenu()
+ #if defined(QWEBENGINEPAGE_PRINT)
+     fileMenu->addAction(tr("P&rint Preview..."), this, SLOT(slotFilePrintPreview()));
+ #endif
+-#ifndef QT_NO_PRINTER
+     fileMenu->addAction(tr("&Print..."), this, SLOT(slotFilePrint()), QKeySequence::Print);
+-#endif
+     fileMenu->addAction(tr("&Print to PDF..."), this, SLOT(slotFilePrintToPDF()));
+     fileMenu->addSeparator();
+ 
+@@ -702,23 +698,19 @@ void BrowserMainWindow::slotFileOpen()
+ 
+ void BrowserMainWindow::slotFilePrintPreview()
+ {
+-#ifndef QT_NO_PRINTPREVIEWDIALOG
+     if (!currentTab())
+         return;
+     QPrintPreviewDialog *dialog = new QPrintPreviewDialog(this);
+     connect(dialog, SIGNAL(paintRequested(QPrinter*)),
+             currentTab(), SLOT(print(QPrinter*)));
+     dialog->exec();
+-#endif
+ }
+ 
+ void BrowserMainWindow::slotFilePrint()
+ {
+-#ifndef QT_NO_PRINTER
+     if (!currentTab())
+         return;
+     printRequested(currentTab()->page());
+-#endif
+ }
+ 
+ void BrowserMainWindow::slotHandlePdfPrinted(const QByteArray& result)
+@@ -751,7 +743,6 @@ void BrowserMainWindow::slotFilePrintToPDF()
+     currentTab()->page()->printToPdf(invoke(this, &BrowserMainWindow::slotHandlePdfPrinted), dialog->pageLayout());
+ }
+ 
+-#ifndef QT_NO_PRINTER
+ void BrowserMainWindow::slotHandlePagePrinted(bool result)
+ {
+     Q_UNUSED(result);
+@@ -763,7 +754,6 @@ void BrowserMainWindow::slotHandlePagePrinted(bool result)
+ 
+ void BrowserMainWindow::printRequested(QWebEnginePage *page)
+ {
+-#ifndef QT_NO_PRINTDIALOG
+     if (m_currentPrinter)
+         return;
+     m_currentPrinter = new QPrinter();
+@@ -774,9 +764,7 @@ void BrowserMainWindow::printRequested(QWebEnginePage *page)
+         return;
+     }
+     page->print(m_currentPrinter, invoke(this, &BrowserMainWindow::slotHandlePagePrinted));
+-#endif
+ }
+-#endif
+ 
+ void BrowserMainWindow::slotPrivateBrowsing()
+ {
+diff --git a/examples/webenginewidgets/demobrowser/browsermainwindow.h b/examples/webenginewidgets/demobrowser/browsermainwindow.h
+index 91e1c1d2..5bbbb292 100644
+--- a/examples/webenginewidgets/demobrowser/browsermainwindow.h
++++ b/examples/webenginewidgets/demobrowser/browsermainwindow.h
+@@ -56,9 +56,7 @@
+ #include <QtCore/QUrl>
+ 
+ QT_BEGIN_NAMESPACE
+-#ifndef QT_NO_PRINTER
+ class QPrinter;
+-#endif
+ class QWebEnginePage;
+ QT_END_NAMESPACE
+ 
+@@ -142,10 +140,8 @@ private slots:
+     void slotSwapFocus();
+     void slotHandlePdfPrinted(const QByteArray&);
+ 
+-#ifndef QT_NO_PRINTER
+     void slotHandlePagePrinted(bool result);
+     void printRequested(QWebEnginePage *page);
+-#endif
+     void geometryChangeRequested(const QRect &geometry);
+     void updateToolbarActionText(bool visible);
+     void updateBookmarksToolbarActionText(bool visible);
+@@ -180,9 +176,7 @@ private:
+     QAction *m_restoreLastSession;
+     QAction *m_addBookmark;
+ 
+-#ifndef QT_NO_PRINTER
+     QPrinter *m_currentPrinter;
+-#endif
+ 
+     QIcon m_reloadIcon;
+     QIcon m_stopIcon;
+diff --git a/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp b/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
+index 0f3b1765..50a8bb91 100644
+--- a/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
++++ b/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
+@@ -52,10 +52,8 @@
+ #include "ui_printtopdfdialog.h"
+ 
+ #include <QtCore/QDir>
+-#ifndef QT_NO_PRINTER
+ #include <QtPrintSupport/QPageSetupDialog>
+ #include <QtPrintSupport/QPrinter>
+-#endif // QT_NO_PRINTER
+ #include <QtWidgets/QFileDialog>
+ 
+ PrintToPdfDialog::PrintToPdfDialog(const QString &filePath, QWidget *parent) :
+@@ -66,11 +64,8 @@ PrintToPdfDialog::PrintToPdfDialog(const QString &filePath, QWidget *parent) :
+     ui->setupUi(this);
+     setWindowFlags(windowFlags() & ~Qt::WindowContextHelpButtonHint);
+     connect(ui->chooseFilePathButton, &QToolButton::clicked, this, &PrintToPdfDialog::onChooseFilePathButtonClicked);
+-#ifndef QT_NO_PRINTER
+     connect(ui->choosePageLayoutButton, &QToolButton::clicked, this, &PrintToPdfDialog::onChoosePageLayoutButtonClicked);
+-#else
+     ui->choosePageLayoutButton->hide();
+-#endif // QT_NO_PRINTER
+     updatePageLayoutLabel();
+     setFilePath(filePath);
+ }
+@@ -82,7 +77,6 @@ PrintToPdfDialog::~PrintToPdfDialog()
+ 
+ void PrintToPdfDialog::onChoosePageLayoutButtonClicked()
+ {
+-#ifndef QT_NO_PRINTER
+     QPrinter printer;
+     printer.setPageLayout(currentPageLayout);
+ 
+@@ -92,7 +86,6 @@ void PrintToPdfDialog::onChoosePageLayoutButtonClicked()
+     currentPageLayout.setPageSize(printer.pageLayout().pageSize());
+     currentPageLayout.setOrientation(printer.pageLayout().orientation());
+     updatePageLayoutLabel();
+-#endif // QT_NO_PRINTER
+ }
+ 
+ void PrintToPdfDialog::onChooseFilePathButtonClicked()
+diff --git a/src/webenginewidgets/api/qwebenginepage.cpp b/src/webenginewidgets/api/qwebenginepage.cpp
+index 82720ae3..20d3268c 100644
+--- a/src/webenginewidgets/api/qwebenginepage.cpp
++++ b/src/webenginewidgets/api/qwebenginepage.cpp
+@@ -80,11 +80,9 @@
+ #include <QMenu>
+ #include <QMessageBox>
+ #include <QMimeData>
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
++#ifdef ENABLE_PRINTING
+ #include <QPrinter>
+-#endif //QT_NO_PRINTER
+-#endif //QT_PRINTSUPPORT_LIB
++#endif
+ #include <QStandardPaths>
+ #include <QStyle>
+ #include <QTimer>
+@@ -2052,8 +2050,6 @@ void QWebEnginePage::printToPdf(const QWebEngineCallback<const QByteArray&> &res
+ #endif // if defined(ENABLE_PDF)
+ }
+ 
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
+ /*!
+     \fn void QWebEnginePage::print(QPrinter *printer, FunctorOrLambda resultCallback)
+     Renders the current content of the page into a temporary PDF document, then prints it using \a printer.
+@@ -2090,8 +2086,6 @@ void QWebEnginePage::print(QPrinter *printer, const QWebEngineCallback<bool> &re
+     d->m_callbacks.invokeDirectly(resultCallback, false);
+ #endif // if defined(ENABLE_PDF)
+ }
+-#endif // if defined(QT_NO_PRINTER)
+-#endif // if defined(QT_PRINTSUPPORT_LIB)
+ 
+ /*!
+     \since 5.7
+diff --git a/src/webenginewidgets/api/qwebenginepage.h b/src/webenginewidgets/api/qwebenginepage.h
+index c7d5a19e..5619639c 100644
+--- a/src/webenginewidgets/api/qwebenginepage.h
++++ b/src/webenginewidgets/api/qwebenginepage.h
+@@ -55,11 +55,7 @@
+ 
+ QT_BEGIN_NAMESPACE
+ class QMenu;
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
+ class QPrinter;
+-#endif // QT_NO_PRINTER
+-#endif // QT_PRINTSUPPORT_LIB
+ 
+ class QWebChannel;
+ class QWebEngineContextMenuData;
+@@ -294,15 +290,11 @@ public:
+     void printToPdf(const QWebEngineCallback<const QByteArray&> &resultCallback, const QPageLayout &layout = QPageLayout(QPageSize(QPageSize::A4), QPageLayout::Portrait, QMarginsF()));
+ #endif
+ 
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
+ #ifdef Q_QDOC
+     void print(QPrinter *printer, FunctorOrLambda resultCallback);
+ #else
+     void print(QPrinter *printer, const QWebEngineCallback<bool> &resultCallback);
+ #endif // QDOC
+-#endif // QT_NO_PRINTER
+-#endif // QT_PRINTSUPPORT_LIB
+ 
+     const QWebEngineContextMenuData &contextMenuData() const;
+ 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 19583f9..830e640 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -129,12 +129,18 @@ RDEPENDS_${PN}-examples += " \
 
 QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
+# Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0003-Include-dependency-to-QCoreApplication-translate.patch \
     file://0004-Force-host-toolchain-configuration.patch \
+    file://0005-Always-compile-QWebEnginePage-print.patch \
+"
+
+# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
+SRC_URI += " \
     file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
     file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
 "
-- 
2.14.1


