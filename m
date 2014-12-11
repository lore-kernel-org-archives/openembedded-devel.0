Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EDD4860673
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 14:39:51 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so6597448wgg.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 06:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iJql8ZUY8vDsc3Gq6hStHZ5ZueoORfEYHvJXxZHJrNA=;
	b=Jfv6uik1oZuycs4oN6GrWi0xhUsbDWpPUH2Fy9jHUhtcpaW5SHbYG1hqTtQz3ITZCz
	wt57EIIKMzZq/vmoH7+Po02iKQFdYVrsyDb40KMG00d9Ok7gn/cXBGsOUBKDRSCHr3pS
	BYG/PVGIvMjCfqQrY0w36NndBjZpKh2lWOCoQIkJWiCgZ01vRi98HkBFikyOIp1sh06g
	jasIcyCrao8CiO5bsJpoAIaLgpm/4fpbmyRAdB7TNPjxZLj3L9axWJVGwmNjtSp1VLAP
	qdxelEXQ9ifOfQE6xS2lh/4VWhDAOWF2FISsu1DFDEl55Lx73gECSZ4cI44ikdySz7Ng
	K85w==
X-Received: by 10.180.93.167 with SMTP id cv7mr24046989wib.12.1418308791674;
	Thu, 11 Dec 2014 06:39:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm2564385wic.16.2014.12.11.06.39.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 06:39:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 15:39:53 +0100
Message-Id: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for cups
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
X-List-Received-Date: Thu, 11 Dec 2014 14:39:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 4c7e86c..d6053be 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -80,6 +80,7 @@ PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
+PACKAGECONFIG[dbus] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-- 
2.1.3


