Return-Path: <net147@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED69F6FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 00:58:09 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yl2so13073272pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 17:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KFBBK0c9J0r82jWSWs5M65jx6kzdRpZpxM8W83INN3U=;
	b=osXMAgEmi+MoMiCTiPAgqQ1UVEw0mQQB3yO4iNe+xrB2ZOl140QmG9flafAXoQdzDc
	jEHpPEFvgUlmfB5bhvL+HMh9yJrJyjVRztQcYFzFCyDoKQflTB5/MEruw4ENKga+pzqs
	b3CVZCIYLerWocfeaSnnYuB8iS7LS88tdw/jqttljKYe44S/BEXNtiUk5xRsuWFLnKda
	mzt2SiZQFaGoA2ohLUYqINLe0PozU8/cWoqCgvUVxQtrgToeLN/xhgkzS25QzOWqqIOB
	ZM6qXQ7rTYfxJ5FxRsR60J9MFS2BS9DsKgSoecUcXsjy7NOrHaZUpFIfmmQZz4dD5Sql
	ih4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KFBBK0c9J0r82jWSWs5M65jx6kzdRpZpxM8W83INN3U=;
	b=YLkvgzGzwqlYmGiwTJmo+6z22MfihXWi8QnXb/HfkpR3AnrYid/SmoMOOVi3JaMe6u
	40rEg+W1N68//cAQgy4EqojdSy21npaFJahwbBbE7dA/+7cVuK/ZGkP5B8omQiKxNgzK
	qYo1XrDmjGLWw9vy0Axr97O0UvcasZ2wd6mmNFXfDN5Ki4EQLevisXCvTKa0DQI8s/R2
	l1RsvDSbGMCaTROyXrZlHPEJVaX6bgQllVRWqeaGq8bT3/vixpLBmVPkXbtHW8aznDNa
	4M9+3wWiO2gU0yZedCIXVeoJZYHqyLu70Q77JXSHS+7t4OBS+P/exF6BAS2mbUvecQd+
	PMIw==
X-Gm-Message-State: AOPr4FUuRBy8Vb29nrbW887BGC5ETDCHGAhZhR8knOYeMvNtAfslaack0GbF4wbl8rV5OQ==
X-Received: by 10.66.246.165 with SMTP id xx5mr41079057pac.87.1463360290617;
	Sun, 15 May 2016 17:58:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	g70sm42884166pfb.7.2016.05.15.17.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 May 2016 17:58:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2016 10:58:23 +1000
Message-Id: <1463360303-31424-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-qt5][PATCH] qtvirtualkeyboard: add recipe
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
X-List-Received-Date: Mon, 16 May 2016 00:58:10 -0000

Qt Virtual Keyboard module was added in Qt 5.7.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtvirtualkeyboard_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-qt/qt5/qtvirtualkeyboard_git.bb

diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
new file mode 100644
index 0000000..a8fcb9c
--- /dev/null
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -0,0 +1,11 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
+
+SRCREV = "42344a4b21b95bce913d60267d554ac17e120af1"
-- 
2.8.0


