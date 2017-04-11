Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 856DB77BD5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:04:37 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id h125so87456703lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oro/qwd1HbWcQ/EEhQDfvSwq4G1hHdgPJ04BVxDjc4s=;
	b=e46yDrFTiKjGI/2oBrZXuTzLxLFF4RNx/VoJvugdU5T/4Hgy5TRPCUDBKLErWdDEhp
	xKyh8cLY5gdMZ+OLdnYuj9ouxqiJm0431k425/mHeD2UG39NdRnVv/az0rYBqFB1hkvk
	LwwiPBTXqVjRAqWwzzXXW8bOQ9lJKcbEfFMgSWt3YdhhokbhsNKAUVerK62vxUcciYvm
	bLqg8OfKBvWqRgO6jLEZ0O/viD7F9rw9FIedPKXsCegE1+g0swM+Rfy2RY6iaB82uMo4
	G3u7bbS1Kd3N04jjWzsAJ6H9tmW1w2JAzAa6+RBMCNU1AvlDpBRz/qUktF5EK0hPdiFk
	Zxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oro/qwd1HbWcQ/EEhQDfvSwq4G1hHdgPJ04BVxDjc4s=;
	b=aov1jc+D6cx83llD80qzlwbn5M3Y+blYKebnHlbxZN+xVYuM5t+fVjdL4N3bMv6FwR
	Up/XzPLFqxX51MWOyndzxhFRIemotO07xilBJX8IrGKO1IL5oH6KS9tqadyq+HlRVG49
	txc/Ro2umBuhO+pzk2/nXpHNOoNTAq+98Lv+yS5yeXx7G6NRR7DIx29U5z9iUTuUUTRC
	ms23oAA5yMiI10d2xr9Pf0To8X9uh9CLnglbZ6Jn+IO7gEy/3ppM4/TQcswP/j7+eCH5
	xJDX43svsxKjTnOpqAeLE6k86RlaR4CH5yB42nH7+R8KRjAFiS1NrX01fH3lnME029J8
	5fRg==
X-Gm-Message-State: AN3rC/7hXMBA0TOhTkApJ7G1TPKVj8xe5Us0/l2J4mqP/EFFmq6eUVDP5vfEKSPhuax1r+sj
X-Received: by 10.25.213.12 with SMTP id m12mr4745154lfg.145.1491919478592;
	Tue, 11 Apr 2017 07:04:38 -0700 (PDT)
Received: from gordanmarkus-XPS13.luxoft.com
	(static-212-247-53-108.cust.tele2.se. [212.247.53.108])
	by smtp.gmail.com with ESMTPSA id c66sm3437412lfg.9.2017.04.11.07.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 07:04:37 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:04:33 +0200
Message-Id: <20170411140433.3792-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtwayland: fix initial window property values
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Apr 2017 14:04:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes a bug where there is nothing rendered on the
QtWayland surface due to missing window properties.

Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 ...l-window-property-values-being-propagated.patch | 35 ++++++++++++++++++++++
 recipes-qt/qt5/qtwayland_git.bb                    |  5 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch

diff --git a/recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch b/recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch
new file mode 100644
index 0000000..29c9180
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch
@@ -0,0 +1,35 @@
+From 3d30fd8df9b55449844207295ad3d51cc8bb44b1 Mon Sep 17 00:00:00 2001
+From: Robert Griebl <robert.griebl@pelagicore.com>
+Date: Thu, 15 Dec 2016 17:43:00 +0100
+Subject: [PATCH 2/2] Fix initial window property values being propagated
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This was broken since the the shell-surface refactoring.
+
+Change-Id: I130b7396e85c570a9d11d609af6b3016e3f706f0
+Reviewed-by: Dominik Holland <dominik.holland@pelagicore.com>
+Reviewed-by: Paul Olav Tvete <paul.tvete@qt.io>
+Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
+---
+ src/client/qwaylandwindow.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/client/qwaylandwindow.cpp b/src/client/qwaylandwindow.cpp
+index c8be9c1..b6f16f0 100644
+--- a/src/client/qwaylandwindow.cpp
++++ b/src/client/qwaylandwindow.cpp
+@@ -176,6 +176,9 @@ void QWaylandWindow::initWindow()
+                 mShellSurface->setAppId(appId);
+             }
+         }
++        // the user may have already set some window properties, so make sure to send them out
++        for (auto it = m_properties.cbegin(); it != m_properties.cend(); ++it)
++            mShellSurface->sendProperty(it.key(), it.value());
+     }
+ 
+     // Enable high-dpi rendering. Scale() returns the screen scale factor and will
+-- 
+2.9.3
+
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index d42d80a..bcddb32 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -44,6 +44,9 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
 
 # From https://bugreports.qt.io/browse/QTBUG-57767
-SRC_URI += "file://0001-fix-build-without-xkbcommon-evdev.patch"
+SRC_URI += " \
+    file://0001-fix-build-without-xkbcommon-evdev.patch \
+    file://0002-Fix-initial-window-property-values-being-propagated.patch \
+"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.9.3


