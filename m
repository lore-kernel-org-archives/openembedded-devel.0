Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 515357382F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:03:34 +0000 (UTC)
Received: by wgin8 with SMTP id n8so9244543wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c0XPTrS2V9D1oj36rYqsFvyGnNLdvdhmOWJio3S37cI=;
	b=rCQLu4zKtUEEfHOBcHuU/V68QhsVhz01ZnmLcaCEXJQuFOe1SXoqTOTUC9J8/5Bgmi
	KL8RPeNatqrKSj5WS80b1yKysm+AlNIv7i2c3C0Rn+GlIpaX9JveJXd+u7jgngF4jLDQ
	rG5py06Wvgj3cTi7HRZlOlqtD2W7V506JbKH8uPx3fwcO4JIBJBtckYGT5ZKba+6ydXy
	WY3N06vctd6siiFT36mYgMpOdCNNBf1qusMhZfQ9ypee3REyu0Uj4b8fGixC3to6dDdM
	TKzCqonwFPX9V98Y0iMc8gplPfypAWVLZYA8tDdh+uvWlryvykzTppoIDia2HfF+wphr
	48rA==
X-Received: by 10.194.60.43 with SMTP id e11mr37360308wjr.36.1430258615688;
	Tue, 28 Apr 2015 15:03:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	mc20sm18317740wic.15.2015.04.28.15.03.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 15:03:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Apr 2015 00:03:26 +0200
Message-Id: <1430258606-26895-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430258606-26895-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430258606-26895-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 3/3] qtbase: remove 2nd BSD from LICENSE
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
X-List-Received-Date: Tue, 28 Apr 2015 22:03:36 -0000

* BSD is now in default LICENSE variable:
  recipes-qt/qt5/qt5-5.4.1.inc:LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
  recipes-qt/qt5/qt5-git.inc:LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index a5687ea..50cb505 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -22,9 +22,7 @@ SRC_URI += "\
 
 DEPENDS += "qtbase-native"
 
-# Used for examples and tests
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
-LICENSE += "& BSD"
 
 # for syncqt
 RDEPENDS_${PN}-tools += "perl"
-- 
2.3.5


