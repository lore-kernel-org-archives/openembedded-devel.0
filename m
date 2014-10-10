Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A42FA6AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:38:51 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so1602977wid.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GzRfBVJaRCFrNDeuduAJkZPSp7UFD0KdDrEKTs1ZOm8=;
	b=LES4IqjGAxqF3tIoz6+14YZfgUTyE+2p9zrTW35YPTP6LLSdHxSjXr1D6iqsS77lx7
	NfvVqIlQ//ubsDT/+R2gWKAUFwX1PpWysPMhJlx+/nUJjfWYwWI86tMsWMrMSQj4+sxr
	W96iFOzc3KZg/ytRSAts13ohamqAgc1qkn3u+XbsJGjcudlsLuWedV6YmDsjY5RsN2cB
	96nVrOtPsUDAI1UZzSN9GRrJjj4ZMQRXVDCfS9g/k22I2ATYiq2sjsR9iJulNJ9e8dBK
	bZOagm0hZHturgX+NAWrOn9K7lgYq5BLza5oCv+GsmY3Do41/vq1dZ3rnzut5pxh2KBW
	6HQA==
X-Received: by 10.180.20.175 with SMTP id o15mr3745492wie.51.1412937532723;
	Fri, 10 Oct 2014 03:38:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b6sm2158669wiy.22.2014.10.10.03.38.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 03:38:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Oct 2014 12:39:57 +0200
Message-Id: <1412937597-7505-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-gnome][PATCH] tracker: add dependency on networkmanager
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
X-List-Received-Date: Fri, 10 Oct 2014 10:38:53 -0000

* fixes following QA warnings:
  tracker-0.14.2: tracker rdepends on libnmglib, but it isn't a build dependency? [build-deps]
  tracker-0.14.2: tracker rdepends on libnmutil, but it isn't a build dependency? [build-deps]
  tracker-0.14.2: tracker rdepends on nss, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index d412183..104e490 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
-DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee"
+DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager"
 
 RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
 HOMEPAGE = "http://projects.gnome.org/tracker/"
-- 
2.1.1


