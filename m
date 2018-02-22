Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0AA7878C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 14:51:29 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p104so10822772wrc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NIEp5FurFrKGbz7b33+QfDZqP+jY0dO8q4jU0g/L2tU=;
	b=Gm6WiWTRH/rL3gbwQ9NyjC3VPy4d4yHdtE5Qqz8Z6vzB39SDpWcLpasONh0xr57Yun
	6aDBoVoQH4uioCoxWUui4aC4xGBkArrthFnsRlMydftAUjFagYr/jGc/eMgxI/gx7bhi
	7A50TbOvWn6Wq/bQMHca4j7hsXdvyH93jUlHI5TszewDBhSTx6yHmEyeUNCbBeaFL0kB
	Bq96qTOKCKcWHGYQkpSWsE/xXV/rRUw8xqR6uEuAn5XRFCFrlw2xUk2iW7HJ8oPk//tY
	zQOERWxtvfU3RYRbnp0H9RJS8oh4+gZ8J573FprOOCH0r/zHWlZ/6Os3w7/ffoUR8FSN
	rbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NIEp5FurFrKGbz7b33+QfDZqP+jY0dO8q4jU0g/L2tU=;
	b=QtRrb3ra3Fl5RRnFepcJ6cm24FLjtJhEZjwL69hmyStJhv8Lg0OO8gz/bNj38l0oju
	PRL5wHK4Prji6GWS/bNWK/y+8h1gi1sKRjiSp4IG4R8CF2WrW4ib3UAIN28a32iN7w3T
	jJyQK0nkBLnlPDWG+zkA0dPei6Zev3Izvx8BZbCTp9IQ3Mym0trHLH1qx8AQnf+BLxWv
	gP3FrsGtVp/5l3Fer6+J5ImF+oAdCKqJC1ixEiZJrg8aHdrpOJ0ocSnfQoqIpDwTetUd
	INgy8RP2W4DM0rzCP8YvlwWz1xPrf5uGnMMXWP2Rn1BKoHMJ8w0sYAiOQ70Jsm9DIi0S
	iisw==
X-Gm-Message-State: APf1xPDhitsuLgbOSOjwwznyxj6Tkmw3FQjFlEg5tLlPzMs8Vb9I1aL4
	YgIrtMxHkECMze7xRUxrE4V7pA==
X-Google-Smtp-Source: AH8x2246T0w2PoFq9nAfYhnRH8ImxO+ykmSl9cKAL70ZRIzUQWq9dBW4G18N9V3ucpPWNfU25qB7Ig==
X-Received: by 10.223.184.88 with SMTP id u24mr6254580wrf.3.1519311090466;
	Thu, 22 Feb 2018 06:51:30 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d27sm306779wrd.60.2018.02.22.06.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 06:51:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 14:51:28 +0000
Message-Id: <20180222145128.17472-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][PATCH] qt5-git.inc: drop nobranch=1
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
X-List-Received-Date: Thu, 22 Feb 2018 14:51:30 -0000

* sneaked in with:
  commit 333949a8239dfa7788b35f1059614733e11a6a25
  Author: Samuli Piippo <samuli.piippo@qt.io>
  Date:   Thu Jan 26 16:54:50 2017 +0200

    Upgrade to Qt 5.8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 7ee0643..37c742f 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,9 +1,9 @@
 # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
-# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
+# Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.10"
-QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
+QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-- 
2.15.1


