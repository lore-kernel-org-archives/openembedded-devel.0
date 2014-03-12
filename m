Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 56F5E6F7C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:48:16 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so4256916eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=YTTstEqjuGrN/eyI9L8Cg74W9im5FP1VM6/tiZAJlPY=;
	b=vXIr7ya+bFZLpPgBKPwYeouFv3O6KmI473Q3zOINSXos+Nqv8MADDT/10shc21ShUT
	OCUbAbk+oowwx6mSCiF5fw/LFERJoGLYbU4CLBDXfUD2oMIR1AJZHSnmvPSvUP99EvL8
	7T2+aa5+6xsEfh5I6bKtl+5wMV+5sbWUrTfBqN7qB/Q5mbJwQUjOhOSbrwkdrMe1MQLY
	tozMRbpkOOtnsPIc5PFw1GPXPUweAZgRn8TRLZoIGw9vj6rPHyiuXlYcv11m5B+DjdaA
	LD1rQ4wIKlhSI70Ck9AZjTVYB8vzonFvbW+qXvO4uY5nmsHbkcsVLEfIYrbqXWPsLrC5
	OESQ==
X-Received: by 10.14.115.1 with SMTP id d1mr34583837eeh.30.1394624897541;
	Wed, 12 Mar 2014 04:48:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	46sm69057940ees.4.2014.03.12.04.48.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 04:48:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2014 12:48:21 +0100
Message-Id: <a93ebb736bb02c1c74bb8a4bd14476c725905ea3.1394624790.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 3/4] qtdeclarative_git: drop 0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
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
X-List-Received-Date: Wed, 12 Mar 2014 11:48:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* drop 0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
  because it's already applied in upstream commit:
  commit d765ad8e3dabe44f276db9084b1d16164c4535e7
  Author: Florian Hänel <florian.haenel@basyskom.com>
  Date:   Wed Jun 5 19:23:32 2013 +0200
  Subject: Fix wrong calculation of viewPort for transitions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtdeclarative.inc      | 1 -
 recipes-qt/qt5/qtdeclarative_5.2.1.bb | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index bd68955..4a186fd 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -2,7 +2,6 @@ require qt5.inc
 
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
-    file://0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch \
 "
 
 DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtdeclarative_5.2.1.bb b/recipes-qt/qt5/qtdeclarative_5.2.1.bb
index 8e435cf..eaa90ba 100644
--- a/recipes-qt/qt5/qtdeclarative_5.2.1.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.2.1.bb
@@ -1,5 +1,9 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+SRC_URI += " \
+    file://0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch \
+"
+
 SRC_URI[md5sum] = "a23fba03a4b48f36fe8b51d326d08acc"
 SRC_URI[sha256sum] = "7e32b8d6e1d64ca4bdfa92d15f9b4217a1b24239ef40e8826eeccbe918866690"
-- 
1.9.0


