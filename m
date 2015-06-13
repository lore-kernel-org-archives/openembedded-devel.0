Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2406D7598B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2015 07:03:08 +0000 (UTC)
Received: by wgez8 with SMTP id z8so36166973wge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2015 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=54gfAOCqjFAZtxpinA3yCx3RDEANpONFGnmKDNG5DLA=;
	b=zfOP5aEDFiWimgLvSwVPQ0zDUe/dcE3j+/tg/fEjwHK1rQIOt5/ggAAyxoS+Eb3YQk
	cXxNkyZ0STdEfB5c6wFR9Rl3gttEeiqXBePuyz+URkUl/2dfUYUpBppfptIz74pDzues
	UTUPXWnfiLFYbcI6tz7xGXYVF5Kksd+uus8+c0TXwR8zvDZSrP4QvEkeusZjq5NzyMnD
	V2DcPQkH0Fx00+o+qn8KQOmz46sUTUvgdw1UIo/n5CPpBh0AzV1Yfl+RwGhFQcDSQ0sR
	8FSPKOv3kQKYhjZk8D2IfRSAOZBLhU3dpzCefOHZNduoYJ3xGSQZS2UKUGh7bkaJnj7i
	yDOQ==
X-Received: by 10.181.13.172 with SMTP id ez12mr13170635wid.91.1434178989344; 
	Sat, 13 Jun 2015 00:03:09 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1D76.dip0.t-ipconnect.de.
	[79.223.29.118])
	by mx.google.com with ESMTPSA id n6sm5950669wic.16.2015.06.13.00.03.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Jun 2015 00:03:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jun 2015 09:02:55 +0200
Message-Id: <1434178975-21236-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5-opengles2-test: update to last commit
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
X-List-Received-Date: Sat, 13 Jun 2015 07:03:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* don't segfault in case qtsensors does not find accelerometer values

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/examples/qt5-opengles2-test_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/examples/qt5-opengles2-test_git.bb b/recipes-qt/examples/qt5-opengles2-test_git.bb
index f763912..10c0aed 100644
--- a/recipes-qt/examples/qt5-opengles2-test_git.bb
+++ b/recipes-qt/examples/qt5-opengles2-test_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "qtbase qtsensors"
 EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = "git://github.com/thp/qt5-opengles2-test.git"
-SRCREV = "3fa3789c28658b6f0bbddc3105f575f1074e87f2"
+SRCREV = "938390507054ed1258345f70ed55770d2fe56176"
 S = "${WORKDIR}/git"
 
 inherit qmake5
-- 
1.9.3


