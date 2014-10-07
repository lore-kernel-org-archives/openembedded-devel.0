Return-Path: <nizovn@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 58BE065E0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 18:44:29 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id z12so6748577lbi.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2014 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wUBVknlDLYRhxwT7K8pvWaCniTa6NT8NcYHJArlFJmo=;
	b=DYDPz25E1moaNR7wht/8zdJX4+NPtl5DbImttbUQK0oyZsTYhtlq0HhWIslZyW/7hX
	OF0bb5mfE/XIudrNdAHhFma5lmuxJ+R6FppwjYgntpZv9NT8ptbLX6xRltXVb+wPqM39
	599BGIJguqohELjkzoD113W53WLzy851NsfQZ+4f3XqH61+xj4WfnTqUPHiBiVbj3Uvg
	B2d2pVp0P+kXD2pZiQZ8dkuFQLjHgR4eYFazfuq9IJ06Cj9IP7BbCNBQRLVn4DZi/MdE
	lLzrHpdZC+G+XwBF9DQjlopBtRduBF1FYdoFS6fnCH85vTaMhEYZ/+zfkO5HrvQl6lIp
	GYcA==
X-Received: by 10.152.6.202 with SMTP id d10mr6228848laa.69.1412707470711;
	Tue, 07 Oct 2014 11:44:30 -0700 (PDT)
Received: from localhost.localdomain ([93.183.76.214])
	by mx.google.com with ESMTPSA id mn4sm6966691lbb.4.2014.10.07.11.44.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 11:44:29 -0700 (PDT)
From: Nikolay Nizov <nizovn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 22:44:21 +0400
Message-Id: <1412707461-6484-1-git-send-email-nizovn@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-qt5][PATCH] maliit-framework-qt5: Update SRCREV
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
X-List-Received-Date: Tue, 07 Oct 2014 18:44:39 -0000

This update is needed to include fix for segfaults when change keyboard
focus while having selection.
See http://issues.webos-ports.org/issues/673 for example.
This will update SRCREV for one(also the latest) commit from master branch.

Signed-off-by: Nikolay Nizov <nizovn@gmail.com>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 633bf6e..82573c4 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://maliit-server.desktop \
 "
 
-SRCREV = "dbc0403f329d7f6ce2f5a09e6ff5adbd2548a8c9"
+SRCREV = "17fdf8699c53ddfb2c15df8e11d46804e782fec5"
 PV = "0.99.0+git${SRCPV}"
 
 
-- 
2.0.4


