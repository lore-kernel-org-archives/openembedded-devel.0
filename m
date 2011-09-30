Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cjc-0007eY-3j
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:02:36 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WDqkS/AQ5aiTqwKcXpRKB4OFkhhDRVZAA5E4VRth8ig=;
	b=aSkEtWiw9Va1frmSjfnBJRCI0fL2wjf7Xvcny+9VQD5r9uk4ajNziT8Xl6I9YQn8lm
	/02urw3O/MwBTzCkTnC2klLfiXCxBmpa9AmUy+/kJDrWQ474C+X9I9fT/UIiMxXOACq4
	T3K30xEzPieQFi6MsfX88EQ8xaa9r3HO02fQo=
Received: by 10.204.9.205 with SMTP id m13mr8562893bkm.212.1317387427148;
	Fri, 30 Sep 2011 05:57:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm4883681bkn.7.2011.09.30.05.57.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:57:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:38 +0200
Message-Id: <5098c35b8a1acb6e44bf344485e69aab96a659ff.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 02/15] xorg-driver: use renamed .inc from oe-core
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
X-List-Received-Date: Fri, 30 Sep 2011 13:02:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    2 +-
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    2 +-
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    2 +-
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    2 +-
 .../xorg-driver/xf86-video-glamo_git.bb            |    2 +-
 .../xorg-driver/xf86-video-omapfb_git.bb           |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index fa59036..ea12955 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-input-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- tslib input driver"
 DEPENDS += "tslib"
 RRECOMMENDS_${PN} += "tslib-calibrate"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
index 71b7cbc..fa15645 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-input-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- void input driver"
 PR = "r16"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
index 4c85704..eec92a1 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-video-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 DESCRIPTION = "X.Org X server -- fbdev display driver"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
index e44cf49..0041c53 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-video-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
 
 DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 3608fb2..51397da 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-video-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
 DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
 DEPENDS += "libdrm"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index e30972c..a73b5e6 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-driver-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-common.inc
 
 DESCRIPTION = "X.Org X server -- OMAP display driver"
 PV = "0.1.1+${PR}+gitr${SRCREV}"
-- 
1.7.6.1



