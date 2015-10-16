Return-Path: <folkus@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5EDFC770F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:23:22 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so96778172lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 03:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wz0eqPe+mO4warv7RNDeyXkcN6qR6Q5I06ZjlABdrBs=;
	b=R8QZ/y/KNGGkofCpGlXwnVubNosHUmbOw9gGHDzuHzmrE1rlyr/Xt7Ya4cxWf7Fi81
	H4MpLuOJb8cq4sP4xhQ4FFRUjfXF3Y5sdO0njp2fjmyKROrNJnFnN3UgrfSHGeZaF4rZ
	w660ZWYVhD3IYu63I71TSNcnmFaeAdBhWVwlJyEJbih5rGbNkPgsMkqWMjaTB8SVtS/P
	X3gKGZnlUq/mJKN4lL7geit3sbZoTvzVueKcogdZ+w/IxrPz0m0eZPMRdBITSvC8Qsh9
	iOuVKbjggleX/maj3KNpUlpDNN6itfBj3gZDbfu6ZddyJchz3vMqMtiEI/9P/JGh9U3M
	go0A==
X-Received: by 10.112.36.229 with SMTP id t5mr7808225lbj.61.1444991001415;
	Fri, 16 Oct 2015 03:23:21 -0700 (PDT)
Received: from localhost.localdomain ([188.121.6.226])
	by smtp.gmail.com with ESMTPSA id
	e138sm2772003lfg.36.2015.10.16.03.23.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 03:23:19 -0700 (PDT)
From: =?UTF-8?q?S=C5=82awomir=20Paszko?= <folkus@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 12:22:33 +0200
Message-Id: <1444990953-4567-1-git-send-email-folkus@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-qt5][PATCH] There is missing line, which is setting the OE_BLUEZ_ENABLED. It was broken when merging .inc with _git.bb files. Without this missing line libQt5Bluetooth isn't working with bluez!
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
X-List-Received-Date: Fri, 16 Oct 2015 10:23:22 -0000

From: folkien <folkus@gmail.com>

---
 recipes-qt/qt5/qtconnectivity_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index c758d04..2915327 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -22,3 +22,4 @@ do_configure_prepend() {
 }
 
 SRCREV = "aa00047183008edd739df472cf0490e9fffbe655"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
-- 
2.6.1


