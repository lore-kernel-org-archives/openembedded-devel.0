Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 938AC71A86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:24:36 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so1283375wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mKoebK9f+B3D81Khm0FvURw6gsDMFQGsuXBsSWol8DI=;
	b=zoeZv0l3tJRcQ9ewRRZZ8l5Fx00P+zYM+x8wlqvsqZvPil3q7AqP6CDqcv7YfC8TAT
	RwZTU/tO6A6n0Z0D6plBX9h0GBXkusk36x1FYefhrrD2q/96dcsL/F9yuYXkzvqY/Mh4
	2tREI3oMg2B6UHeXJMQeGz2ok0CQJItEuZOIsWiT+h4L0L/J1Z1FBf3w+GLbBnvmbrTW
	lkAFrdpqajCyKdzeO9FXwKb/3tuV2+o3xbtGxJqm2jQDSbnQTzwLOknMiNbQW/Es1To9
	pruqZZw/UUSIxn8AWHbjrIKOHIEy+D24uBR9hjz6kxpsM1yXkbYuyNvSFjdKBfGAiC48
	KeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mKoebK9f+B3D81Khm0FvURw6gsDMFQGsuXBsSWol8DI=;
	b=SUu7uL98Z24AiKPG3gaQ7L3z5rbuE1cY20mhADfbv6oCgWGieNPvjWAmKmXhmChKUf
	gm2PdvnaDfqwhJirI70YHWveWrWCGvRRp04bjxfzy5GRj8tKVb9JxJRqvWsWjMH1O0S1
	aw++SKBlnlBTnNt5f53rAhmVPifJsFBAI7XOREVJVVP5Guzh3MNcVSq6EP2A+xS/UKsL
	ID60K2SLIDL9qCgeBBxfVpnoc7CXfeaUO0Y4AdwTybuz3KHDk2xqITKT8CbHVYdpx5oq
	vguqxJuDgK9+c+gYN4XuN/GLFtMhcTkL5x81Adp+8cq8p06pk7swq83P5fi3pa1/VlB/
	mNIw==
X-Gm-Message-State: AKaTC03u10CvC+GziaxmKQDMKoF/EpdIGuZ/qdqf79KvIHyyEwl2TGtWv9EEZvpD4akZBw==
X-Received: by 10.194.198.196 with SMTP id je4mr3589025wjc.25.1479914677558;
	Wed, 23 Nov 2016 07:24:37 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g184sm3285285wme.23.2016.11.23.07.24.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 07:24:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 16:24:36 +0100
Message-Id: <20161123152436.9232-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Cc: Daniel Ottiger <daniel.ottiger@ch.schindler.com>,
	Janek Filus <janek.filus@bytesatwork.ch>
Subject: [meta-qt5][PATCH] qtwebengine: use QT_GIT_PROTOCOL variable
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
X-List-Received-Date: Wed, 23 Nov 2016 15:24:38 -0000

From: Janek Filus <janek.filus@bytesatwork.ch>

Signed-off-by: Daniel Ottiger <daniel.ottiger@ch.schindler.com>
Signed-off-by: Janek Filus <janek.filus@bytesatwork.ch>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 4152ef0..056f9be 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -113,7 +113,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "53-based"
 
 SRC_URI += " \
-    ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
+    ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-- 
2.10.2


