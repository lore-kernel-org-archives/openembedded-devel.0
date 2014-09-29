Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC856FD16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 21:57:05 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id k14so3866610wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZTu0aRrdjOdyyQfG5Jh8zCxghbL17BGO3tSgKCP7f7w=;
	b=dDy4wsTdW2HMGVtTsHyzyqijlbOTAGMw7M48zkGfIYy0pKCSrH41c3UVLCt3QOTlTy
	aMaznKrS7auXo30+6e0LG3vm2yYsu/kF3ltF9IPnD4xCOCEiTdajSSAF+luCTZ8rPDbS
	kVKnqTTuoLzbXaBYFuok8Sr7Ej+L8CjRGU084se1Y5XdSbrn7MflGerV0gpkBluzSAbs
	160+jo4VdX8v74TZ/6C23Kv5W9GpGeMM4oYkkV6pnL1TMwtTZJTj8TQb3RGYXjsqYqf9
	hvWdxQ1+mM/3BB6q+idutbHeScY+8hpEEKtJid/vYPRKeDpZSkjdH/okO4g2j/MTTbla
	QNtw==
X-Received: by 10.195.13.14 with SMTP id eu14mr18566621wjd.22.1412027826493;
	Mon, 29 Sep 2014 14:57:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k10sm17062661wjb.28.2014.09.29.14.57.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 14:57:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Sep 2014 23:57:53 +0200
Message-Id: <1412027875-24924-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412027875-24924-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412027875-24924-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 2/4] qtwebengine: update repository location
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
X-List-Received-Date: Mon, 29 Sep 2014 21:57:07 -0000

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


