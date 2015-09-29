Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACC977002
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 19:09:56 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so165053427wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cUsoANSFV0rj3eM6oMTeaXCbq0mZLpDJZXCxrPCUZEA=;
	b=q6HP3dUxFFeGY/lmCSwGsQyo3Yty0MQ5e5Sjcm7kdNrQ1xprFlBDAZRg7vSi71IpcX
	dA+aaz6/9eY/F6PCmm0J3c6zDh/NiUb0GP4N3C0oqDpHwdLjMbX+En1fWRTzxdsz7NoT
	mNbUOmjG+8oFf18rUsX7GI7ge1x9LkrlkR4ABpba18IXQAOpxPSGHIu/50s7dDZUJ2Xz
	4krc3km/I3q6T1P3nIujQDCbhLlIMsluyVuPnpZun7f+5bUq7h6uk4tBKIU7H/433cWN
	z6IEsSBgdJDApbCHGPU0HCesx5Z9ei2JMyK147UCU6DzjEj04VOZPcq47fDjurs+mZjS
	x7qA==
X-Received: by 10.180.90.107 with SMTP id bv11mr28764736wib.69.1443553796912; 
	Tue, 29 Sep 2015 12:09:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x7sm25377237wia.5.2015.09.29.12.09.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 12:09:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2015 21:10:33 +0200
Message-Id: <1443553833-30600-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [PATCH][meta-qt5] qtwebengine: enable cmake
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
X-List-Received-Date: Tue, 29 Sep 2015 19:09:59 -0000

* it works fine in 5.5 version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 40dca0c..7127c8f 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -35,9 +35,6 @@ require qt5-git.inc
 SEPB = "${S}"
 B = "${SEPB}"
 
-# Project ERROR: Missing CMake tests. Either create tests in tests/auto/cmake, or disable cmake config file creation with CONFIG-=create_cmake.
-EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
-
 export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
 
 do_configure() {
-- 
2.6.0


