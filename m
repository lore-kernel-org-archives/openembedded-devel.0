Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B2DE065C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:17:06 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so199950594wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fb+XRQbVGyHpJBFvEFThOLUS0yfxjeEcHbUn1eRDdiA=;
	b=l262CigiLqdLK7YTZQGGEIrwV2wI7uvpcXOX777a+kNIjPnL8JCQ50TuPHpu1tLnyO
	jJqv87OmKwqzi/PMoxywHA12YXUnNyMMOYhy/+1whW+Z993up84TFmpnAA3ZqpP/X5AO
	eVXb9ZPLjzJsSfFAuOyR6gACWKB0XmVucLVHN6srHzUburo51OMiKXL0Ni3qHio+Vu8X
	fBSOADdevVUEM+k5qAeBqH2KX6x9VyURz58CFjvybbhHpQn45+QOJedp0G2NnVhzw7ZT
	8//TU3Uiw8o+oRrEJcY1yx30+dAb1GDU6XsqH+DnkX/dPkndSQPvo0RAfkd+pD76nZe5
	JYjQ==
X-Received: by 10.194.171.69 with SMTP id as5mr38275413wjc.137.1444753024656; 
	Tue, 13 Oct 2015 09:17:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o10sm3489467wia.4.2015.10.13.09.17.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 09:17:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Oct 2015 18:17:07 +0200
Message-Id: <1444753027-21606-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH][meta-gnome] network-manager-applet: drop dependency on blacklisted gnome-keyring
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
X-List-Received-Date: Tue, 13 Oct 2015 16:17:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.0.4.bb             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
index d5e106c..e83ebb8 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
+DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib gconf libgnome-keyring iso-codes"
 
 inherit gnomebase gsettings gtk-icon-cache
 
@@ -27,7 +27,6 @@ do_configure_append() {
 }
 
 RDEPENDS_${PN} =+ "networkmanager"
-RRECOMMENDS_${PN} =+ "gnome-keyring"
 
 FILES_${PN} += " \
     ${datadir}/nm-applet/ \
-- 
2.6.1


