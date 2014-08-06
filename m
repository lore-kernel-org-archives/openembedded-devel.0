Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9A81E65E2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 22:54:11 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so3322677wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WZpK/RQV7Ad7zJBXmX5xPj0zHTIgUBqrFPbe/ivDU+o=;
	b=w++idLK//3KW7l35WrdzE3KxV8DIm/TNzfHSnLfU/CtEOL2RnZzP1E9qNcCWMWrvTc
	5YD+ZEX+vnyjAVVFHd3seA+Cisv1kmYq05NOqZ0I/uzdYSZX/OdnO9x+u6PX5Kt8zYRu
	moROVolrkftiMHZMXxJw5NtXhAz8bTBTRvqZhoHX23cypyIqxzsfCW1dwtBI7uc7ax/H
	MQcJ0O9N1326qaowhqwle9WXmWbObnWQ0lg1QhdTt8xLGTftW5lBX5AVfJVAz98B9EIq
	fmujq+BzjEzZEkRK2AQtoCl6vWy6hLJx2QcPpJjQkrAM8PBSViYvbN46e5xuUrRO0Ff2
	/lxQ==
X-Received: by 10.194.89.200 with SMTP id bq8mr9643218wjb.52.1407365652737;
	Wed, 06 Aug 2014 15:54:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm10430952wic.17.2014.08.06.15.54.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 15:54:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Aug 2014 00:54:39 +0200
Message-Id: <1407365679-24247-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-qt5][PATCH] qtwebkit.inc: add PACKAGECONFIG for libwebp
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
X-List-Received-Date: Wed, 06 Aug 2014 22:54:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index 8054e93..cb652aa 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -13,6 +13,7 @@ PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-ba
 PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
 PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
 PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
+PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
 
 do_configure_prepend() {
     export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
@@ -26,6 +27,8 @@ do_configure_prepend() {
     sed -e 's/(video):\(qtHaveModule(multimediawidgets)\)/(video):OE_QTMULTIMEDIA_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable qtsensors test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable libwebp test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(config_libwebp: \)/ OE_LIBWEBP_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
 }
 
 # qtwebkit gets terribly big when linking with all debug info, disable by default
-- 
2.0.4


