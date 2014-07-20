Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 79DD77037F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 09:49:56 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so6346516wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yr37hKUcv1oDRMMSImOi2K72ZPbGkczuzVoUTopmBhI=;
	b=DqFEDzQfs3uwFS8zGdBK/HjJ7pmhla3jcP7a6R1y4G0jpFFm9P35+bhJEfiyEmOuK6
	j6B3gjXqT9t/Ik8AHzu6G07nZt6zbe2yfEinYZ9LT9PzaCZtyDAI31hib/JKps3+2pcn
	NQkr57/GmrU8EWVSG6DT2pwgUvK/g1JPoZ9g0BdA1tkHxMbYe0vmLE/5ctd6cPwW4K/5
	B+InVLzd18E8Et+EyZl6sJycUV/KwVmPmRdKWC+mm+mjvkpdX6fpOT/RZAqk4/MfP57t
	fNQWInL0suRkXkZsTAYgDMECmg0LaCONxB/LwIa0Z/PnKHFffFC4B54GkWk1Dh6n2TpW
	CHLA==
X-Received: by 10.180.84.7 with SMTP id u7mr9672303wiy.1.1405849797143;
	Sun, 20 Jul 2014 02:49:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	da9sm28290488wib.5.2014.07.20.02.49.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 02:49:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 11:50:06 +0200
Message-Id: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH 1/4] gmtk: add missing dependency on intltool-native
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
X-List-Received-Date: Sun, 20 Jul 2014 09:49:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index 7283409..4b4721b 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11"
+DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11 intltool-native"
 
 SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
 SRC_URI[md5sum] = "e06e9ca8d61d74910343bb3ef4348f7f"
-- 
2.0.0


