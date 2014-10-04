Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id DDC0271400
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:07 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so389323wid.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CWnEIYZ6wpZ8V+cP2JdnQeTmDKtNOJFkmY7igqembWg=;
	b=ihGV9w9Tub6zikkx+w2FN+9ceViKSQWU7X4JRqQG6HbEiW34JZSyxxJ1tKIJ5N9PCh
	Xxxcmuu7DJfL7x+ALDpc4MoQVRp7IEplCiFB1gYlFlWcDXkLXkKYptkh0t1baDeqMuwO
	K/5HCKm/vK9IrVsO0JpI8cCM/Pd5ZY8KcDwT0JXlKwro5T1TeN73NFGX+ut9x+sB9l8o
	bMVaOBQuJpv99GFuzMBse1KCOfU7Q0lXbYFqAXW7olo4SRqyJ2+WYQB4Pwl0aQ9pT3RB
	jjTIhHZoFaNd8dB4vFY+CVGDfEyOwRvRupL8gGgeYmSwB8Kzf7efU0V88MblhwOHmptu
	IHgA==
X-Received: by 10.194.80.71 with SMTP id p7mr11722150wjx.35.1412389508242;
	Fri, 03 Oct 2014 19:25:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xm4sm3715507wib.9.2014.10.03.19.25.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:57 +0200
Message-Id: <1412389558-13237-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 6/7] qtwayland-native: remove qtwaylandscanner symlink
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
X-List-Received-Date: Sat, 04 Oct 2014 02:25:08 -0000

* it doesn't seem to be required anymore

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwayland-native_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 82750e7..761cfb6 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -6,8 +6,3 @@ require ${PN}.inc
 
 SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
 QT_MODULE_BRANCH = "5.4"
-
-# wayland-scanner and qtwaylandscanner must be in same path to work properly
-do_install_append() {
-    ln -sf ${D}${OE_QMAKE_PATH_QT_BINS}/qtwaylandscanner ${D}${bindir}/qtwaylandscanner
-}
-- 
2.1.1


