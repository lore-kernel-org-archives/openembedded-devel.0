Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 125AE6F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:40 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id b13so7835764wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OJf7TA2ETp36FNuRQjTgh4GVBF7HG1ZWsQ8XRD5yfjs=;
	b=SumvJg+06mDev7O05/rtOI6RA35OG69nKt7Uulmn/mRmODGzO8o7AqhrJIjWsYcuIA
	/1xBwB6jOHPUd7M11nsFx5ppLwidVvXJrXNdTH+dAKZ83YXIsYEUBST9OWnpBqoR4DL5
	nQbFHGe1Y4l+KzwMSH6O0BDHTcgohKjqvNwZv4Bmw/bFZYnpNOjgiWAZaYV1poo6c4gv
	uSBUDrNCIXUPtXsF2Q9BQc2aEs2pLBr7rTZ8VLpBujiCkI8JC1dTLu47HwJE/V6UcNTW
	aFbV2lhIrk6OORpFjUWzXkNhgQNJ4Iyw/FmdE67ppvZXvLTtrQEJ+iXGxYC6Hwuqksxv
	HMdQ==
X-Received: by 10.194.19.161 with SMTP id g1mr24071185wje.20.1396372481528;
	Tue, 01 Apr 2014 10:14:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm41849391eev.28.2014.04.01.10.14.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:29 +0200
Message-Id: <1396372434-10710-21-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 21/46] gnome-bluetooth: inherit only gnomebase, gtk-icon-cache
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 421de95..8de03a4 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -9,7 +9,7 @@ PR = "r1"
 SECTION = "x11/gnome"
 DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi"
 
-inherit gnome
+inherit gnomebase gtk-icon-cache
 
 SRC_URI += "file://0001-bluetooth-input-Fix-compile-errors.patch \
            "
-- 
1.9.1


