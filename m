Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2226360030
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:49 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id bs8so4336352wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4O8PTPyg6bea/qgz0BQOb31W8cEGdO+q7yKi9Wru0Xk=;
	b=l9lYvSIeNrvAafChB1ASF3zVpzvdPiNhvUpy5Y22yr5lr/mtahw522NOCoX7OwipuC
	S/3T44/o1K7J3/yu5IH4k1RH0W6OU9JL0AtOAuvXX0Oxz9m9vLoBtCMwAeip1138jD/5
	0LCREzkLfIHDFzIgUzMdR0e153Fl4/eq21wDVa6lZzf8ibRwSXdTLcDQIcv9mvn+ZZuY
	xu3HgrSHjaT2NNtLlfC7P/d9klMvWRmTqGLcCJ/k9+IO1jOHirHha/xZKkSjmXykezvE
	LdqwKSzaku7u1yToUsePxlGXGsjSJmiLdQuf52zPZsGKyVnvtE4NhaxDiBRFPt+g8nSx
	QgwA==
X-Received: by 10.14.218.201 with SMTP id k49mr467910eep.16.1402006129794;
	Thu, 05 Jun 2014 15:08:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e6sm14778835eem.44.2014.06.05.15.08.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:52 +0200
Message-Id: <1402006139-27614-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 03/10] qtwebsockets: Add new module
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:52 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebsockets.inc      | 6 ++++++
 recipes-qt/qt5/qtwebsockets_5.3.0.bb | 5 +++++
 recipes-qt/qt5/qtwebsockets_git.bb   | 6 ++++++
 3 files changed, 17 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebsockets.inc
 create mode 100644 recipes-qt/qt5/qtwebsockets_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets_git.bb

diff --git a/recipes-qt/qt5/qtwebsockets.inc b/recipes-qt/qt5/qtwebsockets.inc
new file mode 100644
index 0000000..eb442a6
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets.inc
@@ -0,0 +1,6 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+LICENSE = "LGPL-2.1"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.0.bb b/recipes-qt/qt5/qtwebsockets_5.3.0.bb
new file mode 100644
index 0000000..2437060
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0ced83d5555e969f05e1ea89607ad584"
+SRC_URI[sha256sum] = "715f2e5196a29176bdb9980bf99334e5c8aefe5f4aac961d7de3c53b0a432ce6"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
new file mode 100644
index 0000000..3528ae7
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -0,0 +1,6 @@
+require qt5-git.inc
+require ${PN}.inc
+
+QT_MODULE_BRANCH = "release"
+# v5.3.0
+SRCREV = "c6dfdcdacfdd8c8190301b930caf67ad50ac09bb"
-- 
2.0.0


