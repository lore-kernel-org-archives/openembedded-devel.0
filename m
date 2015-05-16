Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3510D7416A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2015 10:14:57 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so55529865wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2015 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RgeswPVfRfGBBrw4TeO3R221l+u6W7u1jwwbyL4F9cs=;
	b=gbMV7Wftc4s+RLdixvpnBey/dPcdzX8fTjzn8hkZpHZ36TGbaw+jU61QqOqJPHtAhj
	jXXvAkPrlu0C5U2ZL76GY5IH2thrDyxrUa/MnigOEUx4SghucuyllJiipf7F98oUVFgk
	9kOK7Ola1TjenTzoaxoOo930ZeLZtSQ5dWpIWAOK0NeCNV4Xque7Pja/WsOE9mGBuLpa
	lfG80hPbDZfj3L4JUdemvJJP5n1LGTOSOu+YNiiU+9IVo4qtUvxvWzYXRqozDqXJWcoh
	67XnQyS1cgboAD1ik5ibirj5t9LH3LaantMaOgySxcqpt6E7BNSg3j4lykVQuILbY9xK
	tshw==
X-Received: by 10.194.77.44 with SMTP id p12mr26674369wjw.1.1431771298324;
	Sat, 16 May 2015 03:14:58 -0700 (PDT)
Received: from Saturn.local.all (212-41-104-161.adsl.solnet.ch.
	[212.41.104.161])
	by mx.google.com with ESMTPSA id dg8sm6658014wjc.9.2015.05.16.03.14.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 May 2015 03:14:57 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2015 12:14:15 +0200
Message-Id: <1431771255-20841-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-gnome][PATCH] florence: use ${SOURCEFORGE_MIRROR} in SRC_URI
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
X-List-Received-Date: Sat, 16 May 2015 10:14:58 -0000

http://switch.dl.sourceforge.net has been down for some time.
Use the OE provided mirror variable instead.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 meta-gnome/recipes-support/florence/florence_0.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
index 9eab385..71014f0 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify"
 
-SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/florence-0.5.1.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${PV}.tar.bz2 \
            file://0001-Fix-glib-includes.patch"
 SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
 SRC_URI[sha256sum] = "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"
-- 
1.8.4.5


