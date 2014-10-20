Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4145D60600
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:33:58 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so6006620wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8vi4jLxZ7EE+Nu1OdxaERROarmFW0G9TYZuBqC1lOgk=;
	b=EwbSDyzPHC3fTMi7jW9VNHnl26IiWO0BVRcdAKZuXpdyz+i5/fa7ReESET0SfF3/vT
	79a98cjIw2C6QNTk0lWh33z5B/Qqm7NFfcpPE5889/o69ohTaY05UZR8awrhh60G/vRj
	rDd3xp6F2GZIie6WeHTmX0A9d9dds4OF4BgQfUWb5ohlcTeK3gMphphdHoM83D+fhoOT
	dpc4KRAINlvP1XhXOuUIcdwzfJ8yvyDb1QqYCrkz9xFGDMf1y9Cc2FKC28pEp83u/JpV
	XSTI573PyhZSHfj16NjSd53jsZosn4+C4p7W4+SHUjiCCPKbW3yaLPeYQE0JoYfzRdOB
	TgIA==
X-Received: by 10.180.219.106 with SMTP id pn10mr22632876wic.63.1413826438548; 
	Mon, 20 Oct 2014 10:33:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gw6sm10340238wib.8.2014.10.20.10.33.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 10:33:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 19:33:50 +0200
Message-Id: <1413826432-483-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
References: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 3/5] qtbase: delete mkspecs/macx-ios-clang to hide QA issue
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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 389d356..b7a0e73 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -221,6 +221,10 @@ do_install_append() {
 
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
+
+    # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
+    # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
+    rm -rf ${D}/${OE_QMAKE_PATH_LIBS}/mkspecs/macx-ios-clang
 }
 
 PACKAGES =. " \
-- 
2.1.1


