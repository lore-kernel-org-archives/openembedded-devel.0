Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA62678682
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 17:38:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m207so4650004wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y3aRKALyxSsc/i79vdqlOuSCiO3DGWEvSuWYGkfnF8A=;
	b=AvrIt95EjWUmlDKsfj8CfVDeCCJRLgag9Z+cPZjLJ/xhmaMdwIxWjzoZ6yVH9NMQsF
	VfSavdZeeOx2gih26YtKJ0FBTPEcMJ7TnYcLX2QVaXzike+LZiWopfw17oeS/juDy4Qg
	xE1ml0SjG4K0kYO0uTgg+jUMbX/Ibl2/EyAiHi97Sz2RIATfLA22PGBmrBII1sLefRT/
	KnCyiY47Gyj4JjrD4c5nK6BKmpjxYxyq7oxMFh/yWHKKj31VUEsfIQCIwVghlLb6vOaE
	ty7yd5LoasLPVn6l8alZ4rixjR8xNuaxTyq1vVd2Ov3Z/wTw7ldJjDuIuzQCZppqxzvd
	41ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y3aRKALyxSsc/i79vdqlOuSCiO3DGWEvSuWYGkfnF8A=;
	b=oC9qlRjOiC/jth42dZTHSToZ96Uatn5+B38/DzM88UlueaYOMlQ2OM/0yeydZcGtZo
	19YYeMslGEhoG0yNFJUUD3XN8I3werbLSswSUr9sofqGjGPzYuKmI7B6kJ57C5kzXMMN
	HUqIryzkst5T+OWqzB9cTglaq5vdRYG0ap6eFs5ycQrVcEgHJakhCd2SqTvjhcIjhE3q
	82ZI7sM6bFr2W8tmU8Sewt2sGRYfF6rzLQ9hTlCHMMzysR7di2xx2/xC9nMq5eNIlfts
	BrbqfxBPKLCVW3QCrL5E1sV3XcbZRHzLLL8l88zDcNEsNk0FlW/H18tbbPP4OiATTS/9
	gbDw==
X-Gm-Message-State: APf1xPBo7SL4L5SKcW7yqIKbqv6swhiH4rFvgY2LztMV3hf77AffOmBA
	JC3rqCvjgnnNyzw7ptVCR/gM1A==
X-Google-Smtp-Source: AH8x227X+Xd5O8yf4K9RiH8t5JUlHCAGrCjS8z9lVycURZJeLcWO6Z7zASB+eQeY8BI+TK1MZyWGrA==
X-Received: by 10.28.55.129 with SMTP id e123mr5740177wma.156.1519321133376;
	Thu, 22 Feb 2018 09:38:53 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r136sm1076381wmf.18.2018.02.22.09.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 09:38:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 17:38:51 +0000
Message-Id: <20180222173851.29001-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][rocko][PATCH] qt5-git.inc: drop nobranch=1
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
X-List-Received-Date: Thu, 22 Feb 2018 17:38:52 -0000

* sneaked in with:
  commit 333949a8239dfa7788b35f1059614733e11a6a25
  Author: Samuli Piippo <samuli.piippo@qt.io>
  Date:   Thu Jan 26 16:54:50 2017 +0200

    Upgrade to Qt 5.8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 44f8d71..796f105 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -3,7 +3,7 @@
 
 QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.9"
-QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
+QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-- 
2.15.1


