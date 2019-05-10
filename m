Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C49917E07A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYd1ZTDzFr
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489317;
	bh=NAyyiWMVz6CO6ocWm8px3XG73bxQyRg4fczWPwqsME8=;
	h=From:To:Subject:Date:From;
	b=i0UYR16Z77MdeJ8x1ISu2u/rRgKRif77Zd9Q0vJNruT3nck093LzBkLrvdIkxyc3t
	QAWI6r1wscVCQvoOU8YimZiFV3oaby15N2tMAIYimLrE9PvFxKTYLxMtm/2/I5Jw6l
	NV6EBq3jqqpGcOJND5GZ/EdXEXvKsyVlGc/Hk5RD/nmyEhEvYZNhuuSaU2oFatTn0o
	giD56y4RVNPGZZsaN1GdWsqqfA2nDCNtcBV+JaM5WocQ4E5yyifsbofxD/rzXLyATi
	DQarJX9Yp02aoPhuo8F5LohMcWAMcnf/zRhrnszu9XTvMYjhm/5zdtQcmX9T5fx2ye
	SO8uzjuc4EwHaoHHs1NgOYQf/ZMI9NQ6b2xFR/MBSv9EEOxIUW/41qMyNVaDObDbhs
	8c5V9aWoiHuXzKamAypli8qRvF5RBYoZu3RefkdQAUPWFzFQkZtBSMrlDR4MXF/TCW
	ZL2d8TyVEZdqlwru/FNki8absQw6NSorUgnzU0hbGeDeYMIfCrDKut0lzHlqP37/xk
	YWJBXmDUYF65/c2rxS2Ymwh1Hpw1SsNhGzHVKT+wC+FiIJ3l9Jp8tJ9uuqdRzCBfHw
	GnNgMoruw5sGCzSxPw04+SFHLpLQBJ2pghDRO3aeeDAth6lHnNIWzMaBzBrXoQf8Rs
	VjmHDObFjJY7r24gn8uLqhAE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:54:59 +0300
Message-Id: <20190510115515.19491-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cloud9: Remove stale files of recipe removed 2 years ago
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
X-List-Received-Date: Fri, 10 May 2019 11:55:17 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../cloud9/cloud9/cloud9-avahi.service                | 10 ----------
 meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service | 11 -----------
 meta-oe/recipes-devtools/cloud9/cloud9/index.js       |  2 --
 3 files changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cloud9/cloud9/cloud9-avahi.service
 delete mode 100644 meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
 delete mode 100644 meta-oe/recipes-devtools/cloud9/cloud9/index.js

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9-avahi.service b/meta-oe/recipes-devtools/cloud9/cloud9/cloud9-avahi.service
deleted file mode 100644
index cb9b6e2db..000000000
--- a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9-avahi.service
+++ /dev/null
@@ -1,10 +0,0 @@
-<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
-<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
-
-<service-group>
-  <name replace-wildcards="yes">Cloud9 IDE on %h</name>
-  <service>
-    <type>_http._tcp</type>
-    <port>3000</port>
-  </service>
-</service-group>
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
deleted file mode 100644
index 495b131ff..000000000
--- a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Cloud9 IDE
-ConditionPathExists=|/var/lib/cloud9
-
-[Service]
-Restart=always
-EnvironmentFile=-/etc/default/node
-ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/index.js b/meta-oe/recipes-devtools/cloud9/cloud9/index.js
deleted file mode 100644
index 88c9a19f0..000000000
--- a/meta-oe/recipes-devtools/cloud9/cloud9/index.js
+++ /dev/null
@@ -1,2 +0,0 @@
-var o3 = require('./o3.js')
-module.exports = o3.xml;
-- 
2.17.1


