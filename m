Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 28454731C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:04:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x83so44119489wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eLn3tJc6WER6T3pfXsUum93AdCT9jgLEidLk7KPggYo=;
	b=hCyR/1AgCUB4NT3SkKCF4NOOwM6gtRRI+/LbeT6Ioi9jeyyY9Ne11W6ZXcUO0mRDIY
	b+zYvHpMG6ViWMW6sUxRcXe8MioJsCypGvhJ2xZIbYbJl3G40Yv4SSpqHfsqpph/sjJ0
	51/x40+Tgxg/7+Vyn74r0mQRTYBQeHQUS+Cccy5p48B9lA1LDtAxtS7xzj9OEv5yeMA7
	0AXMk++3atzmfbEeu/c9QYz8GnDQkh0Tv2li8I69husJIfGX9d7gOcPcY1Nt4LEled0Z
	nyKveVOpze6PD7rlY4Z7hHdsUMjN1GKehrwuT/5Wfi4Ap7z7K26tN56nywEwBbMfkU/Z
	1Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eLn3tJc6WER6T3pfXsUum93AdCT9jgLEidLk7KPggYo=;
	b=LJWHe0ATF6xthziJL6E0A4Z4X4W0TLlTCuTZOZFkQfj2bJ7oec5xl/jkGClkf8nSAw
	K5ruTBm9vY8y73DJY0ahLTI3O05IG6gbKX2Oi1hxduL+3qciG5TLDJ0f1I10QYOVX+Cu
	/0BJXUdi7HhC4uL3LOo5sqxxtXsDQhaDLwpWO8TPptJWH4sTOgcjLs6shmLfFC7agqKi
	uRPS8ZloZwnomZ49ghhcUK67QJhCopK/tovGgIQWbqKYh791wcEQrzMD12NFpXPT7Yxs
	apb7C46krVD/ICCgaoqsdJoOLf23Qn/3fH5rkzdX54D8Gc9I96xxbjsWfLxoU8vAm3vb
	YYAw==
X-Gm-Message-State: AEkoouszfST9bQwKjCKEjwPOOgALtr/ZbRPiUx0edtDDR883gkjKN3It1qvBzQxM1PDY9g==
X-Received: by 10.28.127.209 with SMTP id a200mr69099297wmd.99.1470315846037; 
	Thu, 04 Aug 2016 06:04:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	za2sm12778475wjb.34.2016.08.04.06.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Aug 2016 06:04:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Aug 2016 15:04:10 +0200
Message-Id: <20160804130410.12942-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160727154953.13918-1-Martin.Jansa@gmail.com>
References: <20160727154953.13918-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH] qt5-opengles2-test: remove
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
X-List-Received-Date: Thu, 04 Aug 2016 13:04:08 -0000

* https://github.com/thp/qt5-opengles2-test no longer exists
  there is some clone of it in:
  https://github.com/mer-qa/qt5-opengles2-test but that doesn't have
  the SRCREV we were using and last commit is from 2014 version 1.0.2
  while we had 1.0.4

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/examples/qt5-opengles2-test_git.bb | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 recipes-qt/examples/qt5-opengles2-test_git.bb

diff --git a/recipes-qt/examples/qt5-opengles2-test_git.bb b/recipes-qt/examples/qt5-opengles2-test_git.bb
deleted file mode 100644
index 10c0aed..0000000
--- a/recipes-qt/examples/qt5-opengles2-test_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Qt5 OpenGL ES 2.0 Test Application"
-DESCRIPTION = "This application is used to test OpenGL ES 2.0 rendering in \ \
-a simple QWindow, plus multi-touch input, window orientation, \
-window focus handling and some other game-related features."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/main.cpp;beginline=1;endline=26;md5=93b83ece006c9e76b9fca80c3aecb169"
-
-PV = "1.0.4+gitr${SRCPV}"
-
-DEPENDS = "qtbase qtsensors"
-
-# Depends on gles2 enabled and that's not default configuration
-EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI = "git://github.com/thp/qt5-opengles2-test.git"
-SRCREV = "938390507054ed1258345f70ed55770d2fe56176"
-S = "${WORKDIR}/git"
-
-inherit qmake5
-- 
2.9.2


