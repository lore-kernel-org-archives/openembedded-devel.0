Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6A53B60557
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:34:02 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so6016163wgg.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=94Hbo6rOYdg71q/K8BykVz9dNOs0JZvLaeuGqg8bDOo=;
	b=ScxcwYy+CSxjvEAJSBVma0zWaHMsHhcvN55TBNztd35UmBcu4p7pw5k1j6jq5NTR70
	dD9IIPI3aU53KAOCGH50+/M4xN12zFNdkPN2xlkibida3LHMwtnNpy5ZM/4IeUP6RYJN
	EcQ6xTowbA+mggR+8X2vuIMDqdhBl9z13T36UYNGJbWpfaGLDTsDixG141pXQ+Gc8B85
	OsYlkC4FPBrCw986BC5viUzgHYuO796Lee4PYPYOcqRuSMPv+GKBfvPu6bFtkZWOudKx
	3PG21uWOftRcsD6dmdDx6N9AZt5oiHVesYGqxjZpAguP/chbCpYCp4RYG6lnSNzqj1mh
	cFyg==
X-Received: by 10.194.103.74 with SMTP id fu10mr36583606wjb.0.1413826439705;
	Mon, 20 Oct 2014 10:33:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q10sm12581122wjq.35.2014.10.20.10.33.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 10:33:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 19:33:51 +0200
Message-Id: <1413826432-483-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
References: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 4/5] qtwebengine: simplify SRC_URI
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
X-List-Received-Date: Mon, 20 Oct 2014 17:34:02 -0000

* now when it was moved from qt-labs to qt prefix we can reuse the
  SRC_URI from qt5-git.bb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_5.3.2+git.bb | 9 +++------
 recipes-qt/qt5/qtwebengine_git.bb       | 9 +++------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
index c9a6ea4..9c65d7a 100644
--- a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
+++ b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
@@ -9,12 +9,8 @@ DEFAULT_PREFERENCE = "1"
 QT_MODULE_BRANCH = "1.0"
 QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
 
-# For now we have to define SRC_URI here again as qt5-git.inc points to
-# qt.gitorious.org/qt/ but qtwebengine is still on qt.gitorious.org/qt-labs/ which will
-# switch soon.
-SRC_URI = " \
-    git://gitorious.org/qt/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
-    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
+SRC_URI += " \
+    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
     file://0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
@@ -24,5 +20,6 @@ SRC_URI = " \
 "
 SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
+SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 7fe2190..a2f685a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -4,12 +4,8 @@ require ${PN}.inc
 QT_MODULE_BRANCH = "1.0"
 QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
 
-# For now we have to define SRC_URI here again as qt5-git.inc points to
-# qt.gitorious.org/qt/ but qtwebengine is still on qt.gitorious.org/qt-labs/ which will
-# switch soon.
-SRC_URI = " \
-    git://gitorious.org/qt/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
-    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
+SRC_URI += " \
+    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Try-to-add-_moc-suffix.patch \
     file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
@@ -18,5 +14,6 @@ SRC_URI = " \
 "
 SRCREV_qtwebengine = "14fcf0d3193e2ee2bf904a305c9f34ff8d0e5ce7"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
+SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
-- 
2.1.1


