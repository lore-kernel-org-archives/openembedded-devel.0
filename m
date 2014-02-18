Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2937A6E8A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 15:36:39 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z10so4553733ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cyOISUWnaQR2njTT5M3okvObOoBky0KY4SJvOgIH2lI=;
	b=YWTNAHQGiqKIa+GWnTROmeLrPeQaW8PngOSXnZSdJwHSx52j48ADKHE0z8Du3EjXnO
	QZy/njqAZzrXnMB8Oj5POYdumaWpLjvEIzehHPWN0q5feZup4+J+J1mryruX8/hVqCiU
	CX1lEv5p3qv4McgTDjYXNBNDAFvlbi+8pUVnJJcle9wDah79DnkDX3uApAg50MtC8oe3
	Bcrd2WoyTEWxo3DJBQFreaxttGpz4CzD+NvTxpp7W2LZg31R3ak6HwdGr16GwoGZh+m3
	NkelxISjaCp0oq+ld714WUpkYq0fqN0ezu5n8PBGTbbXbm7pHZPVKsbb9ptSvU+PGVZm
	glYw==
X-Received: by 10.15.44.202 with SMTP id z50mr4760419eev.81.1392737799659;
	Tue, 18 Feb 2014 07:36:39 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y47sm71534938eel.14.2014.02.18.07.36.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 07:36:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2014 16:37:05 +0100
Message-Id: <1392737825-11241-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-qt5][PATCH] qtbase-native: explicitly disable icu
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
X-List-Received-Date: Tue, 18 Feb 2014 15:36:39 -0000

* Jonathan Liu reported that qtbase-native was failing to build for him
  and it looks like qtbase-native was trying to link against icu from his
  host (instead of icu-native because it isn't in DEPENDS)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index b9193e4..860bc29 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -51,6 +51,7 @@ EXTRA_OECONF = " \
     -no-opengl \
     -no-openssl \
     -no-xcb \
+    -no-icu \
     -verbose \
     -release \
     -prefix ${OE_QMAKE_PATH_PREFIX} \
-- 
1.8.5.3


