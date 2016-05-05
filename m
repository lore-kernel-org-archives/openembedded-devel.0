Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7D46FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 15:11:15 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a17so32987968wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=APHY/iEMZHDdd/vTpclgTz1bRfInwwBuYL7aScm9Q3E=;
	b=u/KAU428IIO5Iv/9GLbffl28cqwvrxJy7o+kya0wljTNDFC+G0b61OIph1LTp0j61s
	MfjhZuF7SqieyCOojGRMws2mUYG/AOoYQ4nyMl7MTNeHCMlYl2zpAGZKDV1Tih5j6NwT
	3kY53C9hM1eYksGw3VMw3eCeFozWaO9NqWmqKMLVSWvvb8Nes/MliwlrjxzcqGfkH/LD
	R8FqIAK+Mo8JnVzTnfsVpuks/uniylbR5xOzAZVi2gKKgRFz/CntaUPzY1fLNT5hMd8i
	5lesA7riezyNe5Scb1aIiwYp18j6C/3IziH+8oUra5g0UaJr3O3nCFGzzNQkrbM+ZZM0
	5vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=APHY/iEMZHDdd/vTpclgTz1bRfInwwBuYL7aScm9Q3E=;
	b=U8UUuwhedvNM5edvh2t3ZiknUqBia2o2IE5YVrFpGT54F1XnIKVNw92HbqT6LWhqhZ
	eTFb2Wb+jGnN+cckb9qmeyk9ySKl0YilqF1YRgEnX7xbrk7rOexCIwS/kNRqv7aN/qZK
	U69xqtEU7fiOAYuGsXB+uoODRawqFTIiZWvZsnVlisd5KXPpPXoPKHd1Iicy/PcjVlXK
	q8Mo+giTLprL6Q3niFLKKNg5jQ/HV19DrK1JH/jipWF0JpiQEaYVs3lLOWM5cjLlpLi8
	SAsXIw2gr9jyECNDRkfLMQnwxqMSdCfHLVFac9iUysXc340WhZsw8/t6vldcYTH4NYHS
	+fcQ==
X-Gm-Message-State: AOPr4FWgDvv3c/TWNdl8lkrZ/uhHW+9RIJRm3XEmQ/Tftrc2QUBlWyFqSFwWs8+ig7WgBw==
X-Received: by 10.28.214.137 with SMTP id n131mr3850212wmg.20.1462461076000;
	Thu, 05 May 2016 08:11:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kq9sm10141218wjc.26.2016.05.05.08.11.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 08:11:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 May 2016 17:12:36 +0200
Message-Id: <1462461156-14608-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH][meta-qt5] qtwebkit: replace base_contains by bb.utils.contains
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
X-List-Received-Date: Thu, 05 May 2016 15:11:17 -0000

* like in other recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index b84671b..58b86c8 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -25,7 +25,7 @@ SRC_URI += "\
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
-    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxcomposite libxrender', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcomposite libxrender', '', d)} \
     fontconfig \
 "
 PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.8.2


