Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4930470675
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 09:49:58 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so5275594wgg.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vVBH5xGMvuJwzKqHrgLHQohk5uVV5gOobUOJvz3Y3rU=;
	b=W4lt8/puqbsGBp1k1qxSQ03p1Cs9ksuDUXaDpRIBkT4MNIkg2h8x4u7PbaVLOWo9oS
	A9PgqijRMu63hfniN/B+5AjmuQcm31GbGM+g1E3MaligYwwMQYBbEXYpHY7yvKooQuJ4
	msX7evHE0+O3m1t+GyCQWJqOQ+rhJlw9F7HKXjr61hkEjzMfzkJBw7eNdd95ztieFAqN
	9oxI4ssoDgP7knXEpjw3FzBdror43fMx9xKqEGkUONwtAQ6n84OPr+01IOVykb/7sTxY
	9jShY3L0TNv+lqpSnVeRkglYoluEDpsxlSQCNe4Fafk6TKv7mBeKwKnC5ctNX9nER2Cf
	rFWQ==
X-Received: by 10.194.59.49 with SMTP id w17mr2106677wjq.135.1405849799868;
	Sun, 20 Jul 2014 02:49:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wd7sm28465057wjc.36.2014.07.20.02.49.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 02:49:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 11:50:08 +0200
Message-Id: <1405849809-30338-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/4] xwd: add missing dependency on libxkbfile
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
X-List-Received-Date: Sun, 20 Jul 2014 09:49:59 -0000

* otherwise fails with:
  | configure: error: Package requirements (x11 xproto >= 7.0.17 xkbfile) were not met:
  |
  | No package 'xkbfile' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
index b73afe1..077df7a 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xwd/"
 SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
-DEPENDS = "libxmu"
+DEPENDS = "libxmu libxkbfile"
 
 SRC_URI[md5sum] = "6b5d48464c5f366e91efd08b62b12d94"
 SRC_URI[sha256sum] = "3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f4d57eef614227d79"
-- 
2.0.0


