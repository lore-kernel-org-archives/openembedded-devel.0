Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6A36FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:17:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q189so6704272wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nwxkbIPHDlUPPqXlw3HDDUYZ/ejQY3tKIdOYYQZbZdc=;
	b=nM/s0WIi8wWDTQ9nR3qFFxJFaFuHjOk7ApY+FjFnljfjKsPyJWtxnYGB7os/+rkaTA
	7PuMlBtwxj+PW43rYd7SYcXWPjQw39JBaf9EV9YxvvKDOapeaSjQ8iCyzEwxzBUN9vyj
	6z22r79n2cOdByyHAajM8LXmYid6i3hLcBVcy4xiXsTnKsFj0sT/r+6Kbrmq8yykgQFM
	sS/CbY1bfvv8MOG5s8hgRob1xHsp8LVYn2gJWVshag0BnvXonTiQzgPcBJkNz+urddT1
	N1FXOM/2YCSb5Ic/1ZCn+0aoWCHEDcUM43ojqc26rmoVU/Y/szes4Nyst303A/h0Defb
	e3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nwxkbIPHDlUPPqXlw3HDDUYZ/ejQY3tKIdOYYQZbZdc=;
	b=O0j5YqPjUIYifcG05RLrlN/M56xil3OPtoBt9hRK8sB5jMiK6zEMJvPbvwlbwEFPHz
	00UOsIrPX87IlIRteZuQ8ro9GdqSFcJt8ljsRaDbd+ncVlVAyQD1QbTxSwaGFD43Z7Ax
	2v3inRNC3RxgUHBlRIJXt5Gb/fP3jMRi+Oqws0QWXEYJ1VKEs/nM8SuNosYLvLaaG4JI
	PMSh9cSc9XofK501bW2cA8cPawzIqkc4KA1MIVWaQCsaqd1HieCoPUBhLXLvgXYkSpuS
	wPpFUM101u+hG2WUIagKD0QrlkiIBiFDgz74llOVm9oN9Ud+dcojjcT9MQnHlJYfJGKx
	sm6A==
X-Gm-Message-State: AHYfb5hw7/w0N17cDGi0PxyxjJvJDZmV/eH+fMjbQeQwueC6SdrjcY9k
	gop+T4bYuLAAitm5
X-Received: by 10.28.61.4 with SMTP id k4mr2780287wma.148.1503137845384;
	Sat, 19 Aug 2017 03:17:25 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f4sm2554641wmh.28.2017.08.19.03.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 03:17:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 12:19:01 +0200
Message-Id: <20170819101901.22156-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170819101901.22156-1-Martin.Jansa@gmail.com>
References: <20170819101901.22156-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtwebengine: add a fix for building demobrowser without printing support
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
X-List-Received-Date: Sat, 19 Aug 2017 10:17:25 -0000

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
index 659cbcf..45b885c 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -121,12 +121,18 @@ RDEPENDS_${PN}-examples += " \
 
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
2.14.0


