Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id BEB7B6F61F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:47:27 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id rd3so1971228pab.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cfjrP4kch2/YJhoA+jDvxuKamoQeSKKE59v3Ca9BILo=;
	b=aWqjMUw/A+qvhVgcZL7RjxFTEXlVo4F6f6hFzs6lhk9S6Ajfvape0zLdb3OR7l9Qjh
	iTzc728Gf7vAxKZ0Kk+oxFS+PXVTB8+vPEM1bvKeN6ljwoJMQcpaZpMeB4ReBwdaMcx8
	Y+qJFZSd0kj1HkkzkTgp6zVa3owrgESeBgqJK5W57qz/CFvt57FacZO0EC0moNPL4UHv
	s93IrJKwD/CjlmYIkFmY87rI1cxiiMlGy8NY+hcC2IiDRLkDYS2Kzu3Xwl/w+kuxDH26
	v2vPov6gLGHPnlkiguwVRgUUsmHZ70Rw3Nor3fjbsC3dRQsLdslxODHLMoyCzpUg9Ady
	RLqw==
X-Received: by 10.66.139.70 with SMTP id qw6mr4797165pab.111.1395841648113;
	Wed, 26 Mar 2014 06:47:28 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	oa3sm58535918pbb.15.2014.03.26.06.47.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 06:47:27 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 00:53:15 +1100
Message-Id: <1395841995-26907-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] qtwebkit: add missing qtmultimedia DEPENDS
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
X-List-Received-Date: Wed, 26 Mar 2014 13:47:29 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index 90bd981..536fade 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
 
-DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
+DEPENDS += "qtbase qtdeclarative qtmultimedia icu ruby-native sqlite3 glib-2.0 libxslt"
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtsensors"
 PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
1.9.0


