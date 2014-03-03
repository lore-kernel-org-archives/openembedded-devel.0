Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 259876B8D1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 06:55:19 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id w10so3349405pde.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Mar 2014 22:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZKAbCCMgR8hGnQlr8AV0kPylhBWedIAEgJn13UB6eac=;
	b=F39+wos9Wtv7YsZ5DGEjszZLH/iSCqYAoCV0mUaWYGHq4KBdxBWFO28OovkjKTucSP
	VDASxZghympHAyOMvr3FiUT7rNL1hYHIHhwt8g/JWYTBoG/oArGhvA+upypdBM7OsmPI
	3TrkliVxN2xRYoDIi1PfR/+rtIjnO/Dfe+/eopy4XoUuTVKeqfq5lrb/VJSkRxwGj9ln
	ToPS05NFaZxSS8a8+VAULovFwZefdDQezWroDANTYSxpyS0AwqLVuXBn5hG6lTwOGO/+
	74XvYvjIu5z2hSM2VVV68gBRqANWZTL9Swy5pzufws/0NsDEa/5BsaF0lFpT5hvKRwAS
	fFiQ==
X-Received: by 10.66.65.204 with SMTP id z12mr17818230pas.60.1393829719094;
	Sun, 02 Mar 2014 22:55:19 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id f5sm78205767pat.11.2014.03.02.22.55.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Mar 2014 22:55:18 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Mar 2014 18:00:03 +1100
Message-Id: <1393830003-16768-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] qttools: add missing DEPENDS
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
X-List-Received-Date: Mon, 03 Mar 2014 06:55:20 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qttools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
index 8412db4..0192f22 100644
--- a/recipes-qt/qt5/qttools.inc
+++ b/recipes-qt/qt5/qttools.inc
@@ -1,6 +1,6 @@
 require qt5.inc
 
-DEPENDS += "qtbase"
+DEPENDS += "qtbase qtdeclarative qtwebkit qtxmlpatterns"
 
 SRC_URI += " \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
-- 
1.9.0


