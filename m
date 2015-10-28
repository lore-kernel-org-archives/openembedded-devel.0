Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7E9755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:04:45 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so195613690wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FtzpK5ECvVXr1fguE9QyztfCMal+iYjcf2NFGoZT0Ls=;
	b=uEeSrhU8BFAC2m7LZfFNOZwE6faBHdQ5u1GxLdflO01u5tmZwD2fI2GfNwGTYQUVJo
	ZwMf7VfCCxtgbd4q88+FknfQzyRP2/UgcCKiNHdS2AF5LdwoSR/j322yBj8G8WuIdSnF
	CuybPyRa/r5TgFJavm3x+R86cJ/OhzNTcffXEnD4c8rrOeUYDQC9xy30UNNAwqaBasEj
	/J53SMgdBy9zNBYthn6clYdIJIUiK0SoMDBC4xc/2iy50eVjeoQgQiHvj5wd6PDTvQQ6
	d/lssM7fx7jwqsJKGIU6ynZGokhPEje0QQ/ZPCYzxKt39+m7D8QBOAf1IOhcDqSbZ43S
	8QwA==
X-Received: by 10.194.8.227 with SMTP id u3mr52612204wja.38.1446033885881;
	Wed, 28 Oct 2015 05:04:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y17sm21044653wib.15.2015.10.28.05.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 05:04:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2015 13:05:06 +0100
Message-Id: <1446033906-11619-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-oe] nodejs: use oe_runmake to respect PARALLEL_MAKE
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
X-List-Received-Date: Wed, 28 Oct 2015 12:04:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
index 2194510..41eb5ee 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
@@ -43,7 +43,7 @@ do_configure () {
 
 do_compile () {
     export LD="${CXX}"
-    make BUILDTYPE=Release
+    oe_runmake BUILDTYPE=Release
 }
 
 do_install () {
-- 
2.6.2


