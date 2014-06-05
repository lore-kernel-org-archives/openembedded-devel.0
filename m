Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CD57860030
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:50 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id f8so11262271wiw.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tTKBapqtxtspRCw8sI6xSKRynxze7bZX3+jFTE+nQ/o=;
	b=e9wYprJbb8b29pBApHwQHodxeAtlZzcFOWVVSCjxeg/MvpJFJqYeKLfeo3WT/KfSmh
	QfPPEr8n6Nev8nR/+yAAPfO//H9QnfMsQxWVknS7fHDn1ceFPsUI+j5CIAwcil8LiFxL
	GS2TKkE4OsKq5HssFZ9Z73wHOSBRFwZm3hgVaCgMXaafSK+EGkgHTjGpzKwT8+mRy8yE
	qEXIvR8aArjIRLHGkWsDvcZW3j30CPE36UIRXpRYyO3r/9QqicKOhPpsOai34KfMflFR
	0uJx//227crjT5F0W/CvtdJzdoSS9f7PY4ffO4anlKwA6VUhMNGawMdr1mUyjomu5SG1
	/MPA==
X-Received: by 10.14.208.195 with SMTP id q43mr415449eeo.42.1402006131055;
	Thu, 05 Jun 2014 15:08:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y5sm17718991eee.1.2014.06.05.15.08.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:53 +0200
Message-Id: <1402006139-27614-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 04/10] qtenginio: Add new module
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:53 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtenginio.inc      | 8 ++++++++
 recipes-qt/qt5/qtenginio_1.0.4.bb | 7 +++++++
 recipes-qt/qt5/qtenginio_git.bb   | 6 ++++++
 3 files changed, 21 insertions(+)
 create mode 100644 recipes-qt/qt5/qtenginio.inc
 create mode 100644 recipes-qt/qt5/qtenginio_1.0.4.bb
 create mode 100644 recipes-qt/qt5/qtenginio_git.bb

diff --git a/recipes-qt/qt5/qtenginio.inc b/recipes-qt/qt5/qtenginio.inc
new file mode 100644
index 0000000..5b74a35
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio.inc
@@ -0,0 +1,8 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=66c98a57685a93d9adf4815b0d11827a \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
+LICENSE = "LGPL-2.1 | GPL-3.0"
diff --git a/recipes-qt/qt5/qtenginio_1.0.4.bb b/recipes-qt/qt5/qtenginio_1.0.4.bb
new file mode 100644
index 0000000..af059da
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_1.0.4.bb
@@ -0,0 +1,7 @@
+QT_VERSION = "5.3.0"
+
+require qt5-${QT_VERSION}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5870a3c01bbe175ed577f0c3f51f3f33"
+SRC_URI[sha256sum] = "090f6f7a22a197fd5cd9acdb3f79fa0361d1662abed1c450fc9db67c089745d4"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
new file mode 100644
index 0000000..3960bd2
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -0,0 +1,6 @@
+require qt5-git.inc
+require ${PN}.inc
+
+QT_MODULE_BRANCH = "release"
+# v1.0.4
+SRCREV = "bb55ab0eed452704e4ce52faf8e5337674c3b668"
-- 
2.0.0


