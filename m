Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A8DDA721E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:54:06 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x12so12770851wgg.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=LwdMO9w+zwEDdjt9QpS2N+tgPJwlzop1H2ZCrcjY1Mk=;
	b=npMoGSTBB+46uZP2nrbuoTjv4dLBTrZhszihtOutqyvKrzDv/X0s6rV4u5rHxX2Mkg
	23jd2A+Kz6pA0cgPOdj4FtaratmIgD2QSM2xW0uGhYrLRnpGGMb3dRCHanzi/xvCaI5d
	y22eZzJYRcllG37RXkf0Y+MrXyExZDsaTmDsF9pIrPH+4kgVOXf9QqQ0jhB1idJv+qY8
	E2uKlPDUa3Po669Z/kYaPynalct26/Fn5CZJnhk0QAWWyExlhaYKxQU7x/YIP9iuCG7U
	iWW5TL6y/5j5WL+iT8hbU+U6MpAJUyLnf4+5is0T6U0ekGNjWN7/F6MWJLgTLBbv9GBX
	9p4w==
X-Received: by 10.194.61.145 with SMTP id p17mr49227292wjr.35.1422338047417;
	Mon, 26 Jan 2015 21:54:07 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id
	gm10sm16610857wib.19.2015.01.26.21.54.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 21:54:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 06:53:49 +0100
Message-Id: <1422338033-18521-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/5] qtbase: remove patches required for native(-sdk) only
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
X-List-Received-Date: Tue, 27 Jan 2015 05:54:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase.inc    | 2 --
 recipes-qt/qt5/qtbase_git.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 5b2c08c..a8748ef 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -5,8 +5,6 @@ SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
-    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f67ea16..611e19a 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -10,8 +10,6 @@ SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
-    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-- 
1.8.3.1


