Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id EEDCE6EC80
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 16:05:50 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so2991052eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=kWiKCSkZKZUHluHsA4VeXhswJU8nslg2Vh0ogNnUKAQ=;
	b=OupqERIWaNkdHkBxFnBQHdoHqEsIFVhRba7L8DpUouujFArqz5ynWNb5bXzhYEF5TA
	GKSHDdSrO3YL8WzpvJcaiCalRnnGosPZKaAbUFaBmVGFl1/Ca7xAlYbAflrLrlk9/V/C
	Rz9tO73c+x7Mg3yOjyxkfB3o46LJMvJuosegCjJQAgqcEwBoZIbFYkhZJ/rWYTXLubrV
	pnNBG4wLXLsFA3AToqgZqqJQo0zrcGM42IN9caR0UkkrNY0sMoLtKx70WUy1R9dmscv1
	rmnpnxWcyi+/AFuUdIA7bKghYX5sfopFq2/v3+8Rv6X71O6IJuO5EDt6rNsztW+yNuEg
	l/9A==
X-Received: by 10.14.219.73 with SMTP id l49mr1145323eep.112.1392048351505;
	Mon, 10 Feb 2014 08:05:51 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-124.unitymediagroup.de.
	[109.91.251.124]) by mx.google.com with ESMTPSA id
	o43sm56086885eef.12.2014.02.10.08.05.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 08:05:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2014 17:05:41 +0100
Message-Id: <1392048341-24963-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1392048341-24963-1-git-send-email-schnitzeltony@googlemail.com>
References: <1392048341-24963-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.1] 2/2] qtwayland.inc: fix QA warnings
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
X-List-Received-Date: Mon, 10 Feb 2014 16:05:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: QA Issue: qtwayland: Files/directories were installed but not shipped
  /usr/lib/qt5/plugins/wayland-graphics-integration
  /usr/lib/qt5/plugins/wayland-graphics-integration/client
  /usr/lib/qt5/plugins/wayland-graphics-integration/server
  /usr/lib/qt5/plugins/wayland-graphics-integration/client/libwayland-egl.so
  /usr/lib/qt5/plugins/wayland-graphics-integration/client/.debug
  /usr/lib/qt5/plugins/wayland-graphics-integration/client/.debug/libwayland-egl.so
  /usr/lib/qt5/plugins/wayland-graphics-integration/server/libwayland-egl.so
  /usr/lib/qt5/plugins/wayland-graphics-integration/server/.debug
  /usr/lib/qt5/plugins/wayland-graphics-integration/server/.debug/libwayland-egl.so

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index 29c6b27..abeb15f 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -14,3 +14,11 @@ QT_WAYLAND_BUILD_PARTS ?= "examples"
 EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
 EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
 EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=${QT_WAYLAND_BUILD_PARTS}"
+
+FILES_${PN}-plugins += " \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
+"
+
+FILES_${PN}-plugins-dbg += " \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
+"
-- 
1.8.3.1


