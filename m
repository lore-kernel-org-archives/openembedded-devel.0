Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cky-0007eY-K8
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:04:00 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XHY7r3B1XHkwtECs9GUiMyY94J6/f7TOIbhZbrQr8Qo=;
	b=etDrNx6X4FSsS1/swwYVBArAUJ5j9bkev2aRTeR/fDRD0HKyBgKkmBxmyjlW3XufJf
	huP9QbNh/EcRYDDo7pWUXMX0QU/VC+oB7KejbYc9huP7dNJt82/yb51EO3bH229QyeOd
	ha+zsvOp4iaWmyhU4hiWz0lhyvrdb7XOdWxz8=
Received: by 10.204.3.214 with SMTP id 22mr7534263bko.148.1317387514067;
	Fri, 30 Sep 2011 05:58:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm4904178bka.0.2011.09.30.05.58.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:58:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:48 +0200
Message-Id: <a7340a253dadaa64bcd3e2c283e4bc822d089c0d.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 12/15] xf86-video-glamo: change RDEPENDS for xserver-xf86-dri-lite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 13:06:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-video-glamo_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 51397da..9517553 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -4,7 +4,7 @@ DEPENDS += "libdrm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
-RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
+RDEPENDS_${PN} = "xserver-xf86-dri-lite-extension-dri xserver-xf86-dri-lite-extension-dri2 xserver-xf86-dri-lite-extension-glx"
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
 PR = "r16"
-- 
1.7.6.1



