Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBCE71400
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:02 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so373634wid.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZTu0aRrdjOdyyQfG5Jh8zCxghbL17BGO3tSgKCP7f7w=;
	b=CmD0GI/tYAgSSrL0TVyISx7/T3fHyUSS31mZusV6NgvtWGneH5bnzAfoY1ieCTe30L
	pafZq1oNu/7VFwDfuUUZxPFebJ0M1m1Yg2pixj21KV5M3dsjaUxcThEr6Fpdu2C7J5kE
	nRDFMjg9uOTVnXIH6z3ftNjezcEgf5WEYXKUdlEJsCK8xUFbY8tA+Urq1aEaHYSYrSRd
	a98LmZzdAsU+eNn7KtMzXeTlQOpw7NMF7gwMNkjbijkvilhtIqWeVu9goqWJ08vVJfTu
	JpaieIwUEIA5RpzAwk0nbnVFk7rlTMgaFG2YUXZWL5Jx+UWyycyngLOV4pWO/DaTxnIB
	E+mg==
X-Received: by 10.194.249.164 with SMTP id yv4mr12413474wjc.34.1412389503256; 
	Fri, 03 Oct 2014 19:25:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id i5sm9639725wjz.0.2014.10.03.19.25.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:53 +0200
Message-Id: <1412389558-13237-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/7] qtwebengine: update repository location
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
X-List-Received-Date: Sat, 04 Oct 2014 02:25:07 -0000

* both were moved from qt-labs to qt and chromium repo was renamed to qtwebengine-chromium

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index d06c521..08486df 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -6,14 +6,15 @@ require ${PN}.inc
 # the master branch which will lead to 1.0 when Qt 5.4 is released here.
 PV = "0.9.99+git${SRCPV}"
 
-QT_MODULE_BRANCH = "master"
+QT_MODULE_BRANCH = "1.0"
+QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
 
 # For now we have to define SRC_URI here again as qt5-git.inc points to
 # qt.gitorious.org/qt/ but qtwebengine is still on qt.gitorious.org/qt-labs/ which will
 # switch soon.
 SRC_URI = " \
-    git://gitorious.org/qt-labs/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
-    git://gitorious.org/qt-labs/chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH};destsuffix=git/src/3rdparty \
+    git://gitorious.org/qt/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
+    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
     file://0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
-- 
2.1.1


