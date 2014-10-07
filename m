Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A812271808
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 01:11:22 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so8122150wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 18:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vpzh2h+OwSOH4CM6/Z3unxYmryPYu/hQfXaszeY6alk=;
	b=Vy0E73+Ur8qPP+PWmm+vdLjNm3SuXexIaI31ifTMuoFlrW/TvoBwy1cZDHGW1lxAzK
	oCT1I3WkFuLICJk2v7H4ozy0G06dR40XStQRC4Z2rhImVOyEueel5ZAqA+eK9OiC5omx
	Oy861iEgksjqTw1JJ5uAzOXOmXVQ/JuQQbmHEZMwYZ+AGUT0STfDjINvRvGBMesRO9B8
	zzBtZPLvfMSOc6mRaRGxR4eov+fGjDofFrv5qsjFVO9s0f+H528aE795CfavVZIA5brU
	HkE/0Alok3pUlTxQMj1Tg+Nm4sxiaGRyomTc3SmMwT97cdf5J9rE57UjLxhZT14jwjV/
	obQg==
X-Received: by 10.180.95.163 with SMTP id dl3mr470680wib.79.1412644283185;
	Mon, 06 Oct 2014 18:11:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k2sm6287795wiz.18.2014.10.06.18.11.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 18:11:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 03:12:20 +0200
Message-Id: <1412644341-15169-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412644341-15169-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412644341-15169-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [oe-core][RFC][PATCH 2/3] gnome-panel3, gnome-menus3, libgweather3: blacklist because of sysroot conflicts with 2* versions
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
X-List-Received-Date: Tue, 07 Oct 2014 01:11:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb | 3 +++
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb  | 2 ++
 meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb     | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
index 87060f3..38ea5e5 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -4,6 +4,9 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
+PNBLACKLIST[gnome-menus3] = "CONFLICT: 24 files are conflicting with gnome-menus"
+# e.g. sysroots/qemux86-64/usr/share/desktop-directories/X-GNOME-Other.directory
+
 DEPENDS = "python libxml2 gconf popt gtk+3"
 
 inherit gnomebase pkgconfig python-dir pythonnative
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index 8802dba..f89f3da 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 BPN = "gnome-panel"
 PR = "r1"
 
+PNBLACKLIST[gnome-panel3] = "CONFLICT: depends on libgweather3 which conflicts with libgweather"
+
 # conflicts with gnome-panel, because they provide the same package
 # http://patches.openembedded.org/patch/43105/
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
index 5d6467f..69cdd8f 100644
--- a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "x11/gnome/libs"
 DEPENDS = "libxml2 gconf libsoup-2.4 gtk+3"
 
+PNBLACKLIST[libgweather3] = "CONFLICT: 876 files are conflicting with libgweather"
+# e.g. sysroots/qemux86-64/usr/share/libgweather/locations.dtd
+#      sysroots/qemux86-64/usr/share/libgweather/Locations.zh_TW.xml
+
 BPN = "libgweather"
 
 inherit gnome
-- 
2.1.1


