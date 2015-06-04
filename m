Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A150A757C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:08:58 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so16194527wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pwI98b6k9L4qbW9Ngvb5VHQqq8VC6DPSznLgacovcKI=;
	b=UGjey8KKBFfmRiFVzxmmUEkShtaNWzv6qCsP1EYtP4FiJmwNaLzHIchtLPnpSpGudU
	iANZjWq4yKpTULXY19RdxtopD8TsqQjfNiqhTS4IoMYB0sOs+EzrO/nvLzMYKSA589Eh
	WBMMJA2YrRdJ3aqvveAT+QZYqvUuRp+Yqsq32/WmC9ATM5x7pL7NkCo/GqImEHPq8QOx
	iSISrWW3jluJCBdx+f+7cvlDaHwQxKtHj1d+6BndpBLo5hvQJ5pwTpD+G9TewrJtgGCZ
	qc/9qaIsu/YFEGclK310aT80Ilw0pwqnepCi/Nn5ohP5Jd2mVIDZ6wBLhBmiJhSdm9fl
	SW6A==
X-Received: by 10.180.99.69 with SMTP id eo5mr6054249wib.92.1433412539006;
	Thu, 04 Jun 2015 03:08:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id m10sm5610918wib.17.2015.06.04.03.08.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 03:08:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:09:09 +0200
Message-Id: <1433412551-20986-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
References: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][fido][PATCH 5/7] qt5-opengles2-test: Upgrade to latest tip
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
X-List-Received-Date: Thu, 04 Jun 2015 10:09:00 -0000

From: Khem Raj <raj.khem@gmail.com>

Fix dependencies on the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/examples/qt5-opengles2-test_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/examples/qt5-opengles2-test_git.bb b/recipes-qt/examples/qt5-opengles2-test_git.bb
index 0756e62..f763912 100644
--- a/recipes-qt/examples/qt5-opengles2-test_git.bb
+++ b/recipes-qt/examples/qt5-opengles2-test_git.bb
@@ -5,15 +5,15 @@ window focus handling and some other game-related features."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/main.cpp;beginline=1;endline=26;md5=93b83ece006c9e76b9fca80c3aecb169"
 
-PV = "1.0.2+gitr${SRCPV}"
+PV = "1.0.4+gitr${SRCPV}"
 
-DEPENDS = "qtbase"
+DEPENDS = "qtbase qtsensors"
 
 # Depends on gles2 enabled and that's not default configuration
 EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = "git://github.com/thp/qt5-opengles2-test.git"
-SRCREV = "9500c00a7094a881e53afd71146d76d40834df45"
+SRCREV = "3fa3789c28658b6f0bbddc3105f575f1074e87f2"
 S = "${WORKDIR}/git"
 
 inherit qmake5
-- 
2.4.2


