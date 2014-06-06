Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 419796FC70
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 15:11:26 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id lf12so3170780vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=LB4q+o+V8+r3DMsv2R3iqLC9/if79+h23Gz/sMCkH70=;
	b=O+Ra8eEFvRFzVkbE1D6XQYLq0IaFFGgAZVNXe7chDy0jMI6KwFdRKyqlaLlcc0OeUW
	h1DqKPvaSo2INMnaOYE4z5b/H2aNyJxQXOE8YJecuHm5jpI9273Yp1WocBqWQu4SxLuZ
	xEWKGrkKxPgwCnFsebjbO5tpCwxdmZ/w4w72cL8dATG/4fR1TdqH8OZIotMOLl3ouugY
	2YqvPJgjBgkLlY6a4QiG9I4nY1T5bBCkTrD5Rx7E0DA6y0QiHghz/04AhHk/OK8XePLt
	R4CQOYQw20oR2AXm2xmFpa+HyJ/FQwEjMlHRZUY9QRC7zGeMFmkaRqLytL49NJwaOu92
	N75g==
X-Received: by 10.58.74.164 with SMTP id u4mr3106148vev.81.1402067486968;
	Fri, 06 Jun 2014 08:11:26 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	z12sm16950812vdg.22.2014.06.06.08.11.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 08:11:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id B65741B76A13A; Fri,  6 Jun 2014 12:11:22 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 Jun 2014 12:11:10 -0300
Message-Id: <1402067470-15080-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] qt5.inc: Fix packaging of plugins
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
X-List-Received-Date: Fri, 06 Jun 2014 15:11:33 -0000

The qtmultimedia module install the plugins in a sub-directory however
those were not being packaged. This patch fixes following QA error:

ERROR: QA Issue: qtmultimedia: Files/directories were installed but not shipped
  /usr/lib/qt5/plugins/video
  /usr/lib/qt5/plugins/video/videonode
  /usr/lib/qt5/plugins/video/videonode/libimx6vivantevideonode.so
  /usr/lib/qt5/plugins/video/videonode/.debug
  /usr/lib/qt5/plugins/video/videonode/.debug/libimx6vivantevideonode.so

Reported-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qt5.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index dfc1c76..bb0bcdc 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -1,4 +1,4 @@
-# Copyright (C) 2012 O.S. Systems Software LTDA.
+# Copyright (C) 2012, 2014 O.S. Systems Software LTDA.
 # Copyright (C) 2013 Martin Jansa <martin.jansa@gmail.com>
 
 inherit qmake5
@@ -54,6 +54,8 @@ FILES_${PN}-tools-dbg = " \
 "
 FILES_${PN}-plugins-dbg = " \
     ${OE_QMAKE_PATH_PLUGINS}/*/.debug/* \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/*/.debug/* \
 "
 
 # extra packages
@@ -98,6 +100,8 @@ FILES_${PN}-tools = " \
 "
 FILES_${PN}-plugins = " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/*/*${SOLIBSDEV} \
 "
 FILES_${PN}-mkspecs = "\
     ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
-- 
2.0.0.rc4


