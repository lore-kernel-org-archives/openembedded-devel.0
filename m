Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BA224731D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:08:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c200so38506202wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=0JQh5DL7+BZOLnNabZDmLgh+RZ7MiIfCSEYuvEskt9A=;
	b=YYq9usrK6h+tfMKkW1JVQ04DfNlvTV7YxEEObWjgVIvuDV8auVQmnckm/T3wRa9gST
	yCACpFrqCMgM6twi0WoJDyn+LjDOlLxN11GN0WA7Xsg1OjFgwzG8F8F8JV8rmovFmHCj
	UPm41y5SpqCoUmgSxByeAr5EDU1Z2qwBexccXrgOX7BTeA1qkyiSpRdL2maIHl54YeAi
	mgGm9SNtsfa8Tpd4lj7X48q1fZMdYDPi+PGb4HfxXqMKvIlzKNRMA/ht4uzPG9lu7OAd
	iUkoDm6DvJUfr4B/3GcXpKMGxmgtmrl5VHT+2pWq2hKYaQudlo97Tre92qTjo6BGFvPp
	KcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=0JQh5DL7+BZOLnNabZDmLgh+RZ7MiIfCSEYuvEskt9A=;
	b=AEZ4SI63cv8aEuJEc9cpl5yo8r0qa3pvBkfvHCvV5zd7XMW1BkVgZarPWxhKhsXnxD
	N9+7AXsGoq3hGCndRHAlFkdRNqBTQURq41xU17r3C6PxWKq7WSKdVrRTGgr6/hh565IS
	C5e+JPLnrKiND+6LUt9IhF2+vauhl4SyfNwvx2p/5n6OUMJwAc+66FqsP0nU7haxM3tN
	JKDqEx3S7dkRUyaQGVvz+lIYAdckOelf3buE7PkOhzfC7vHck9DpCRez8FuhBMyqBNqf
	o+wDJx1z+VelVGotIH3PgY5nknjzgrocfdRKBQV1NPA35iiwelbIP+T8TwPp/7JM8yfr
	SJPA==
X-Gm-Message-State: AG10YOS1Yfckovwpo3hO8yOePv42XATleMN+bh5dOUrWd/wKlmjyb5yoil6k61CJMbBQbQ==
X-Received: by 10.194.82.163 with SMTP id j3mr44090079wjy.70.1455124137429;
	Wed, 10 Feb 2016 09:08:57 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	i10sm12130318wmf.14.2016.02.10.09.08.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 09:08:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2016 18:08:28 +0100
Message-Id: <1455124108-4180-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] xfce4-whiskermenu-plugin: update to 1.5.2
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
X-List-Received-Date: Wed, 10 Feb 2016 17:08:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sources moved to common xfce panel location

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...whiskermenu-plugin_1.5.1.bb => xfce4-whiskermenu-plugin_1.5.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.1.bb => xfce4-whiskermenu-plugin_1.5.2.bb} (54%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.2.bb
similarity index 54%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.2.bb
index 22b8762..2875f59 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.2.bb
@@ -5,6 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
-SRC_URI[md5sum] = "4886fca2b485dae0e6a64c78f9dca94e"
-SRC_URI[sha256sum] = "1c7650562322867513370ab575536b67aa3712329bb60a0c91a0a70e23a8945a"
+SRC_URI[md5sum] = "15187645e8be2c0d300714ce55c1a8d4"
+SRC_URI[sha256sum] = "307cbfa532a28c5c753409aba0330c2da010047b8fc2d669e06f12bf17712e38"
-- 
2.5.0


