Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1E61260DD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 11:37:53 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so4751637eaj.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 03:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=olxKoF2+jR505wk46H0h1r76ADOWOW0C9q1xiqAAfJI=;
	b=0m5ZAvryjonM2l7JPVqVZRLyesSjDTxJwwoLQCHN8vQEWKk9xRTbFqRn8SgY08KLR/
	8FjYrADuoUQIpZWbswHleBtH5RSeTDA76+kKVBDQNzzkFV1WgKNyCAOlbaX7r/PgT+Dy
	oa49igK2zrwqTxueobZCWeNJ6YjrIwz5o5+isJs4PvWOBuusNDxTkS2IuSWtyy3ihmbG
	O6uzKwoY1gQKztB6CKIp0Rhcu5WXgnGxrUgf6N563Kip2vbvN2tuEpLmsia3pgFzewBW
	UBjLOEsEvwcsI0rv+pL2mdcThewRwK6rvwOSabVD3kQTuTOQ1iWXweI5IYasH/b1EgCE
	BFYw==
X-Received: by 10.15.31.196 with SMTP id y44mr6229732eeu.96.1388489874859;
	Tue, 31 Dec 2013 03:37:54 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	l4sm117415793een.13.2013.12.31.03.37.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 03:37:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 12:37:51 +0100
Message-Id: <1388489871-14502-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-qt5][PATCH] qtwebkit: Depend on gstreamer-1.0 instead of 0.10
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
X-List-Received-Date: Tue, 31 Dec 2013 11:37:55 -0000

* since this commit:
  commit e0debe138cb59c140ebbc69755d36028d2b89459
  Author: Allan Sandfeld Jensen <allan.jensen@digia.com>
  Date:   Thu Feb 28 13:42:27 2013 +0100
  Subject: Switch QtWebKit to GStreamer 1.0.

  qtwebkit supports 1.0 and will use that by default when found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index c0e0648..9b334ae 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
-DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer gst-plugins-base libxslt"
+DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer-1.0 gst-plugins-base-1.0 libxslt"
 
 # qtwebkit gets terribly big when linking with all debug info, disable by default
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
-- 
1.8.4.3


