Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C7F3376536
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 06:23:21 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so13029251wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=UuZ9oVcbK85Xfj0fyh24ViwBU3NWuvwOqflyKgiIeDQ=;
	b=SVldAPswJQteEdz2Vuh16dXhiLS+wWdE9vUV3Tm++vMWxXKU3Dqop10oRaX3pD4fVx
	Vkl/C/CUJv7Po21wjKv43pdFzNZVxv8rEnTeIY09wMEV0pQZdLJ5zxYzvHh/heBQ2r8l
	2CtOdRkBlfPVD+ximYIMGDDQu6idgY6ap1n6TnkZctp4rbaeI5wWoJI5chLkm5F618pK
	b4rIloEdke3jcsa+e8FWAiOPi5pQaoJFY0PctlFTca/+pUAXShIw9S1PoX8NpOxhPqeP
	toLWm10XhlF6nuK8VrauVxaYEhFJgjD2taOXcPllbI7kiJdZt3c2xXuGFoGB1xgSmYuw
	dLcg==
X-Received: by 10.181.27.138 with SMTP id jg10mr1940122wid.29.1444285401364;
	Wed, 07 Oct 2015 23:23:21 -0700 (PDT)
Received: from localhost.localdomain (p5B0A29DA.dip0.t-ipconnect.de.
	[91.10.41.218]) by smtp.googlemail.com with ESMTPSA id
	h7sm43893269wjz.7.2015.10.07.23.23.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Oct 2015 23:23:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Oct 2015 08:23:04 +0200
Message-Id: <1444285384-21338-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1444285384-21338-1-git-send-email-schnitzeltony@googlemail.com>
References: <1444285384-21338-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libgudev: skip recipe for distros not using systemd as init
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
X-List-Received-Date: Thu, 08 Oct 2015 06:23:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for those systems udev provides libgudev

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/libgudev/libgudev_230.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
index 5f847ad..3496948 100644
--- a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
+++ b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
@@ -8,4 +8,6 @@ DEPENDS = "glib-2.0 udev"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit gnomebase
+inherit gnomebase distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.1.0


