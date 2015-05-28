Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 57E527571E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:22:43 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so146431798wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e1DCCJjnwfI7xMQrvlrxjFuYhlqJWNhul8XRw4EXa24=;
	b=AZjHnNmQQmdkSxWvVU7+Xrn81S6HIOFA/TgBbIS1azbjpsYkCEjGfRk7x34KNiJJuW
	Ya5n1d5/k7Xf1FI54oJnpDhfebWGZasDVSxqYiv+/QJ5JVhXlzRmuqAkXcT5ItTXefyE
	sM7qHWEoz/VOgIot8UYqZnPZSBiWAw9/5xp2lMoH672yO8tp26rJFPUofBRWsfJXhJqW
	OR6ebMPp/cO9zc9EH7xjgt7Vs1hyKCF75033JzJbiQZlxKEMl23+E/JMQG7p5ZmCW64a
	H/4O2Yi7q8EJ/J8ypxwsjK3dVgpQ1WN3E0m8szR+AsWH8IVJT6+hSqJRrVjT68aq0D0J
	vYsw==
X-Received: by 10.180.86.168 with SMTP id q8mr59448421wiz.80.1432819364142;
	Thu, 28 May 2015 06:22:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ck16sm3336809wjb.37.2015.05.28.06.22.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 06:22:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 15:22:56 +0200
Message-Id: <1432819376-24340-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
In-Reply-To: <1432819376-24340-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150528132002.GG2383@jama>
	<1432819376-24340-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [WIP][meta-qt5][PATCH 5/5] qmake5_base.bbclass: fix typo
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
X-List-Received-Date: Thu, 28 May 2015 13:22:43 -0000

From: Alexis Cellier <alexis.cellier@openwide.fr>

In the qt.conf file created, fix typo on "TargetSpec" (was "TartgetSpec").

Signed-off-by: Alexis Cellier <alexis.cellier@openwide.fr>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass            | 2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 recipes-qt/qt5/qtbase_git.bb           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 44575c4..dbdaf78 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -79,7 +79,7 @@ HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
 HostData = ${OE_QMAKE_PATH_HOST_DATA}
 HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
 HostSpec = ${OE_QMAKESPEC}
-TartgetSpec = ${OE_XQMAKESPEC} 
+TargetSpec = ${OE_XQMAKESPEC}
 ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
 Sysroot = ${STAGING_DIR_TARGET}
 EOF
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 2d9d280..3369940 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -122,7 +122,7 @@ EOF
 }
 
 # qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
+QMAKE_MKSPEC_PATH = "${S}"
 
 # qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
 export OE_QMAKE_COMPILER
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 0b07c60..2644e30 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -142,7 +142,7 @@ EOF
 }
 
 # qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
+QMAKE_MKSPEC_PATH = "${S}"
 
 # another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
 OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
-- 
2.4.1


