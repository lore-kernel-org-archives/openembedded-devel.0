Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0F79F609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:38:03 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so8281318wgh.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NTkMWxBiJ4t317L+7rclOElRzaLRqsuIUxbEZYBG9/U=;
	b=SbdWZ4ozFJeunLZ+IOJR5AeZBDXxbwZolRQv7Z1ZxEl0YOaKHDpxdMPLw3m2RU94Qm
	feLQMrpz+cCRZG3jHWdpfhUuf9VC+QJdWHS/QPSN1cMX5HZWwepCIH89qlpieYB8Xdev
	ZHtcTGseXDjywkpXN8wCDal+Rna0h0MuhChF3R500D+roUnF4mrDIAhVlOxyyj59Fl14
	MoXud2+vEcTE7/Z/ULe4BTugx+eDlI+I7Z/kRK+AsXJnC1b+stQC9oreVl8TjIJxADPq
	Iu04EB6T4JCLTrTTGgbrZHY5mFzz4sGVTF5fZSA7xP4mQbfG5L9Yu3wKvEHkm+Lql262
	BlCA==
X-Received: by 10.180.39.34 with SMTP id m2mr13913865wik.80.1406047084471;
	Tue, 22 Jul 2014 09:38:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm4383555wia.11.2014.07.22.09.38.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 09:38:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 18:38:17 +0200
Message-Id: <1406047097-20725-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] xwd: move require line first
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
X-List-Received-Date: Tue, 22 Jul 2014 16:38:04 -0000

* otherwise SUMMARY, HOMEPAGE, SECTION, LICENSE and DEPENDS are overwriten from
  .inc file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
index 077df7a..694bf57 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
@@ -1,3 +1,5 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
 SUMMARY = "xwd is a tool to capture an X window or screen to file"
 HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xwd/"
 SECTION = "x11/app"
@@ -7,5 +9,3 @@ DEPENDS = "libxmu libxkbfile"
 
 SRC_URI[md5sum] = "6b5d48464c5f366e91efd08b62b12d94"
 SRC_URI[sha256sum] = "3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f4d57eef614227d79"
-
-require recipes-graphics/xorg-app/xorg-app-common.inc
-- 
2.0.2


