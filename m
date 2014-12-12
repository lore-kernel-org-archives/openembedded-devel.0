Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 203A072407
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 17:07:28 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so9643326wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gt2/Yz2b5biQsPVvylWdHoOiJRfcrYsiium3Q55Bq/o=;
	b=SMa3CZ2CmusO4NgNm34XdbTXBKwA/CYw1AftXKgsz2+/+j5QatgRcxoTS6CQ0oeLEF
	5SARGtgB5YC+ewUDknZysPY8rbBPLhM05sAPVYfisD2PmcT0rkVSt39rlAvs1geS1Ljc
	wO+xLhJLe5e3nWtV6EDgrxIMpzo0J3cXnQgllF2b4LM5eneNYbS5DGY426UFDCPx17Q/
	BUhjM7pEJKLSIWng2MXcAGMiGBlRWD4JwEWWSC8lQ4szq0AHJEFk93a0bJsZYEWFD5HI
	8+EsL7eqaMMWhYB0WjOsQNHUWV2mypXzitqOtSsZos8NLv4kxDLh/31CmlIfpdrWrr/h
	1yyA==
X-Received: by 10.180.198.211 with SMTP id je19mr9235905wic.27.1418404048823; 
	Fri, 12 Dec 2014 09:07:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gf6sm2540612wjc.11.2014.12.12.09.07.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 09:07:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Dec 2014 18:07:30 +0100
Message-Id: <1418404050-2772-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418404050-2772-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418404050-2772-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qt5-opengles2-test: import from meta-webos-ports
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
X-List-Received-Date: Fri, 12 Dec 2014 17:07:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/examples/qt5-opengles2-test_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-qt/examples/qt5-opengles2-test_git.bb

diff --git a/recipes-qt/examples/qt5-opengles2-test_git.bb b/recipes-qt/examples/qt5-opengles2-test_git.bb
new file mode 100644
index 0000000..0b201d2
--- /dev/null
+++ b/recipes-qt/examples/qt5-opengles2-test_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Qt5 OpenGL ES 2.0 Test Application"
+DESCRIPTION = "This application is used to test OpenGL ES 2.0 rendering in \ \
+a simple QWindow, plus multi-touch input, window orientation, \
+window focus handling and some other game-related features."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/main.cpp;beginline=1;endline=26;md5=93b83ece006c9e76b9fca80c3aecb169"
+
+PV = "1.0.2+gitr${SRCPV}"
+
+DEPENDS = "qtbase"
+
+SRC_URI = "git://github.com/thp/qt5-opengles2-test.git"
+SRCREV = "9500c00a7094a881e53afd71146d76d40834df45"
+S = "${WORKDIR}/git"
+
+inherit qmake5
-- 
2.1.3


