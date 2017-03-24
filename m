Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCF877BAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:29:36 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id j90so3402025lfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bsjHnVD4UZFVh8ki9/svJ7+x76+uDkFrq0D6gxAyKJ8=;
	b=gGEm6Kukj0J945IUr3w3zyqE3cenZxy6PNEOxhGyL+W9VjeAYHKLyKyer3HLn6h7a0
	Mu95jhMyGiNrf3e7It7mE13azAMrZ1/0AQm//7cpevZHULH0WMxnQ2yuZzByKRJ4rO/q
	Y/0pu5EsVhL6h6Le/Lh7O5Y8eU1DnClN70OnGJ9+Tpae8szAO/y82nJXdY7vlcEchBnQ
	qgPzQxK8Ue9uOyckUCVOyV+wPHmvzghQhAK4t82v33BuwPdmE2j1wlzIJJAzF7JrxIsF
	mQE5oIKa3Ya25mW0MlQQhlT/op6bNfiXhwG7atGOsNr0SNPShJXspEoG8IWSuq9BNJ+5
	tAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bsjHnVD4UZFVh8ki9/svJ7+x76+uDkFrq0D6gxAyKJ8=;
	b=FBKYqpwUrpVd7IRD319+W6/CBY898vF7nnV7esCi7lHsHk2TyMntutKoOLrjaoECVL
	Ovrsr+2vaLxTeLCX39MBMnY4vtYCyyCDD+NQ6v5/E5dIxCIkezE2+v6sBAxP9PCZdyNR
	UHWKFcD10ahFuBEKMyEV79dcKyTMF84YrP/cFh+iV6IwCoCLcBBPffoKFSKItKIrKGte
	7gyTFO1kZp4Jj94IJZg/7gGa/jLkBv3y6umTERjdW8mfgYSpuzQecUjGMU5eulHG0pPU
	ce0cYxGy7LOfI9U1/mk6QLja78M09C9GPcQz0GUkAnURt3Z1GJzKWNEtbi/RnopKJzVV
	cvIQ==
X-Gm-Message-State: AFeK/H35hGpWt8v/QjPqacOgBAosUFXJ9abZ3pnaj3fVjURTgKDTwPA9GNB5OpPY5droDFcM
X-Received: by 10.25.152.9 with SMTP id a9mr3410460lfe.155.1490347777622;
	Fri, 24 Mar 2017 02:29:37 -0700 (PDT)
Received: from localhost.localdomain (c-5eeaaadf-74736162.cust.telenor.se.
	[94.234.170.223])
	by smtp.gmail.com with ESMTPSA id t30sm254941ljd.39.2017.03.24.02.29.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Mar 2017 02:29:36 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Mar 2017 10:29:27 +0100
Message-Id: <20170324092927.1539-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtwayland: update build without xkbcommon-evdev
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
X-List-Received-Date: Fri, 24 Mar 2017 09:29:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update patch that enables building qtwayland without xkbcommon-evdev.
Building qtwayland without xkbcommon-eved with the previous patch
resulted in the following error:

error: undefined reference to 'xkb_state_mod_name_is_active'
Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 .../0001-fix-build-without-xkbcommon-evdev.patch   | 39 ++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index e1e978e..555bb28 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,13 +1,40 @@
-From c93dbe53e8a1b2203c750a66c7efe6fc9a326903 Mon Sep 17 00:00:00 2001
-From: Raphael Freudiger <raphael.freudiger@siemens.com>
-Date: Thu, 22 Dec 2016 13:54:31 +0100
+From 2b72ad7955fe19abb4a0b4ebb6bc7aa498e454bc Mon Sep 17 00:00:00 2001
+From: Raphael Freudiger <laser_b@gmx.ch>
+Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
+Change-Id: I4f52c4ad741fdd7063a18b67f5777b52f03726fe
+Signed-off-by: Raphael Freudiger <laser_b@gmx.ch>
+Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
 ---
+ src/client/client.pro                              |  2 ++
+ src/compositor/compositor.pro                      |  2 ++
  src/compositor/compositor_api/qwaylandkeyboard.cpp | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
+ 3 files changed, 11 insertions(+), 6 deletions(-)
 
+diff --git a/src/client/client.pro b/src/client/client.pro
+index 7482cfd..cb3578c 100644
+--- a/src/client/client.pro
++++ b/src/client/client.pro
+@@ -120,3 +120,5 @@ MODULE_PLUGIN_TYPES = \
+             wayland-decoration-client \
+             wayland-shell-integration
+ load(qt_module)
++
++LIBS += -lxkbcommon
+diff --git a/src/compositor/compositor.pro b/src/compositor/compositor.pro
+index dc9000d..4eebfd6 100644
+--- a/src/compositor/compositor.pro
++++ b/src/compositor/compositor.pro
+@@ -32,3 +32,5 @@ include ($$PWD/extensions/extensions.pri)
+ MODULE_PLUGIN_TYPES = \
+     wayland-graphics-integration-server
+ load(qt_module)
++
++LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
 index 55381b4..5c054c6 100644
 --- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
@@ -40,5 +67,5 @@ index 55381b4..5c054c6 100644
  {
      Q_FOREACH (Resource *resource, resourceMap()) {
 -- 
-2.1.4
+2.9.3
 
-- 
2.9.3


