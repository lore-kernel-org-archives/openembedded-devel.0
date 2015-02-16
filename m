Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1589E7355F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 18:01:27 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w62so30625517wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iHqX7bYqoXyzuXsi/qdUA4JMgMkXzUJr9R06sTukYfI=;
	b=eOxA2jQPo1j+NAJeK6eoHiWwrhh550JfulqhygX6Sdgw2dEGLc7b+aapu1Q8O9zhNh
	5t8wizhdRajVwU8VFmnO/QzVY3d4SAzy44w56gYTolU8nKzWU1rRB4djSDo02fOshXKS
	NWcFKsl2MoMdeKYhPYX+ZguyIrTKsCdPrO6VeTY1dkyfT/KQHlOFaeM6gd33cBvvvST/
	bRNG6KPqFXtbAFRtWafMAhYFbjOIQD4BurkI3Y2Qr1ijzr0KgJ9XmuROabEVX93YnxgZ
	BTzVpXcYbE9zf3LvIytFrzbilsPXTyrR41j18tSnXifoq/cedQharP603FgLqQk/qmSf
	QPag==
X-Received: by 10.180.92.226 with SMTP id cp2mr49831630wib.67.1424109688316;
	Mon, 16 Feb 2015 10:01:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l6sm23853499wjx.33.2015.02.16.10.01.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 10:01:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 19:01:30 +0100
Message-Id: <1424109690-28034-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [meta-qt5][PATCH] qt5-plugin-generic-vboxtouch: fix unpackaged cmake file
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
X-List-Received-Date: Mon, 16 Feb 2015 18:01:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
index 7308064..5352d15 100644
--- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
+++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
@@ -19,5 +19,6 @@ S = "${WORKDIR}/git/vboxtouch"
 
 inherit qmake5
 
-FILES_${PN} += "${libdir}/qt5/plugins/generic/libvboxtouchplugin.so"
-FILES_${PN}-dbg += "${libdir}/qt5/plugins/generic/.debug/"
+FILES_${PN} += "${OE_QMAKE_PATH_PLUGINS}/generic/libvboxtouchplugin.so"
+FILES_${PN}-dbg += "${OE_QMAKE_PATH_PLUGINS}/generic/.debug/"
+FILES_${PN}-dev += "${OE_QMAKE_PATH_LIBS}/cmake/*"
-- 
2.3.0


