Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1E46F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:48:19 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id b10so4932953eae.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=L4o7JScduWUkjbQHJlN9A3qEpamT01d0CueyB22Mu6A=;
	b=BuaOoDrzuuvEU0Y0rRdkNUw2l/deVFSPVzjd8gBKvwmpcz+Vp6QOiRd00QnzGIRNsC
	L5PGw4csVhS2qbcU3ARvln1r2L3i0rS2IEx1w7pcdVXkkHdKQhIK1q8MiETXng4dDZA+
	prJ71WjTxkS95RSrpHZXAqBMTgE57el73aC7dZSfeArJd4kZycc8uE70aN6XrT8617ep
	bugXRMmCnKYs5rQrq4Oyrc/GfpUeXVfVyWTHh9joBfeUc3hUlUNET9HuDg89XNhqCzwX
	g+ErIwKXYdL1bV4Ro9sEQJ5dcMoLQ3Z1TSe+TFyy4k62iWlRF5rWGEebype9LE7etJ5h
	FmEw==
X-Received: by 10.14.211.66 with SMTP id v42mr46405625eeo.31.1394624899870;
	Wed, 12 Mar 2014 04:48:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cb5sm69048050eeb.18.2014.03.12.04.48.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 04:48:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2014 12:48:22 +0100
Message-Id: <818cc2d11b02ceb02ac27401fedcaf1e1db91d36.1394624790.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 4/4] qtbase: move 0015-Fix-linuxfb-argument-mmsize-parsing.patch to 5.2.1 recipe
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
X-List-Received-Date: Wed, 12 Mar 2014 11:48:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc      | 1 -
 recipes-qt/qt5/qtbase_5.2.1.bb | 2 ++
 recipes-qt/qt5/qtbase_git.bb   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index a6fb3b2..89736be 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -18,7 +18,6 @@ SRC_URI += "\
     file://0011-Allow-building-a-separate-qmake-for-the-target.patch \
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0015-Fix-linuxfb-argument-mmsize-parsing.patch \
     file://0016-eglfs-Fix-quad-coordinates.patch \
 "
 
diff --git a/recipes-qt/qt5/qtbase_5.2.1.bb b/recipes-qt/qt5/qtbase_5.2.1.bb
index c106d22..4257367 100644
--- a/recipes-qt/qt5/qtbase_5.2.1.bb
+++ b/recipes-qt/qt5/qtbase_5.2.1.bb
@@ -1,5 +1,7 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+SRC_URI += "file://0015-Fix-linuxfb-argument-mmsize-parsing.patch"
+
 SRC_URI[md5sum] = "fa005301a2000b92b61b63edc042567b"
 SRC_URI[sha256sum] = "acdfd1aa2548ebea1d922e8e24e5c59f5fc3b2beae7c8003ba47d773bfcc94c0"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 1083983..07dd936 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -2,5 +2,5 @@ require qt5-git.inc
 require ${PN}.inc
 
 QT_MODULE_BRANCH = "release"
-# v5.2.1 + 168 commits
-SRCREV = "08cbbde61778276ccdda73d89fd64d02c623779f"
+# v5.2.1 + 172 commits
+SRCREV = "bf0336a02502b3ed4d399c1cf5b4a56b1e858d42"
-- 
1.9.0


