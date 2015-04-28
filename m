Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 14F2772491
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:03:31 +0000 (UTC)
Received: by wgin8 with SMTP id n8so9243387wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Uy/8VeRD5Is/8ApGqNks9rHe0E87uxQhYXIZTxDLXyI=;
	b=WlmVCH/FklpNVeEe7qP7EDqkfGoFhQp5iUM0cZCUUqOv9SGiLRGyDLHhkshPIX12h3
	4P9AE/pT6xbZk8ZUGBTmdlwyzGChIdXh5IQaDYqW3jxqLLBrweOy3Hs0NI4SCr5P6Y4n
	hpVALItHrDmkxWIBTeP4TuDAq44+hA33Al5wCXBhJX8M3z6oyQO65kkItXKTATzNc12P
	tZoItZWFgpD0yUDOatmrGRKfDkq01JqrZ5OxPP/edkQmOa+yUa4sDMCsMTvFUxFwbRVt
	f9IN66an5fWS54whj2cIKOktcqy8DPzDr1Al7Vn1XpOCa5nWn3frbNWkpQtmuSrPjmzu
	gtzg==
X-Received: by 10.194.157.40 with SMTP id wj8mr33478272wjb.25.1430258612427;
	Tue, 28 Apr 2015 15:03:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	fa8sm18322376wib.14.2015.04.28.15.03.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 15:03:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Apr 2015 00:03:24 +0200
Message-Id: <1430258606-26895-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-qt5][PATCH 1/3] qtconnectivity: improve PACKAGECONFIG handling
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
X-List-Received-Date: Tue, 28 Apr 2015 22:03:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtconnectivity.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
index 10dcc22..ab8d31e 100644
--- a/recipes-qt/qt5/qtconnectivity.inc
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -3,14 +3,13 @@ require qt5.inc
 DEPENDS += "qtbase qtdeclarative"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[bluez4] = ",,bluez4"
+PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
 
 do_configure_prepend() {
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
     # disable bluez test if it isn't enabled by PACKAGECONFIG
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
-
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
-- 
2.3.5


