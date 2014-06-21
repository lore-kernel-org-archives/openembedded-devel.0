Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 446026FD72
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 10:17:48 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so4649140wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9KXKg8kQPSdvt7mCjXS+Dij3YgTW6ASM6TMSOYN0Wrc=;
	b=gt4IHA0sKWhU+eYdFo6ynjhkefuWRp/0HCVlHokv8tm2r/tONFzNuch38PnedmC6+p
	QHy/BMP0ipA+67vy5onpIvLPinQ61jhwHKZvgZDgOWr2P7jlYYyc7uB2aV6viRUlu7+/
	vTg7oagf5I2C5Hm8k9y45S99blY1H7Im3OtOc8WctU1Wb/txd9IwUQQE6bSHQ6O1todA
	gmtMd52d9nkeUT9fkChcs0GkdX/bOFmUJZ76KCmBUu1FzDj8fFAvqnTZmVeEh3LVx8/E
	caBi9hEjXMNvof8WmAYd/bXhXg2axZIzNs7BI2/2pvInuNd80LftMInKVsS7y/0j4AYC
	PH/g==
X-Received: by 10.194.243.70 with SMTP id ww6mr10888386wjc.76.1403345869132;
	Sat, 21 Jun 2014 03:17:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm21460929wja.25.2014.06.21.03.17.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 03:17:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 12:17:49 +0200
Message-Id: <1403345869-1557-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH] libgnomekbd: delete older 2.26.0 version
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
X-List-Received-Date: Sat, 21 Jun 2014 10:17:53 -0000

* there is 2.32.0 version in libgnome and this one was broken for long time
  it depends on gconf-dbus which was removed 2,5 years ago, now when
  newer recipe was blacklisted this started to be pulled into the build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
deleted file mode 100644
index 5f72399..0000000
--- a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "GNOME keyboard library"
-LICENSE = "LGPL"
-
-DEPENDS = "gconf-dbus dbus libxklavier gtk+"
-
-inherit gnome
-
-do_configure_append() {
-    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
-}
-
-
-
-- 
2.0.0


