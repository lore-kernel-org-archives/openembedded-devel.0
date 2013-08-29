Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A77906BDB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:18 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so343182eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Ifx9bzd2H6kybrdgmF2Rm+AI1qGtM1HLOXuu5sCGpmI=;
	b=fN1zA7cUym6am0bHltjk4yQVJ/wHifIlVvGqvbuTivSQXlABL27sne/8mGWgkxpo5W
	TR+bYSwiXRRkIOeC2CPWfKjEA1E1LQVJuE4+xZIuOk4exk1mwjMuVEAmwdihB7G0hRZv
	/s9Cb6gOk1NV4QQSyWYcNYYlGNHilWiv/5sfwMtsELSs7IbR/cTQhURzDCBJlGRufzb2
	UFSn1VmWsGDlj8nsVW3XhNaLljwyDilUIidUlwF0daE+exUpXNKCVN5yHu3tsg087YyL
	gLdpZNxuMxHj6I5M5In662r+VMRTaJJv84OdxszjW9xeDalnpRAdCqKJkwR+5mn2L/yv
	WsTQ==
X-Received: by 10.14.182.9 with SMTP id n9mr4592300eem.66.1377791479121;
	Thu, 29 Aug 2013 08:51:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47160846eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:15 +0200
Message-Id: <5eac51fc4e86c7c92194c88d71d7ded0f87e1ae9.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 22/66] tracker: Add PACKAGECONFIG for undeterministic dependencies
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tracker/tracker_0.14.2.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
index 5838c2d..910833a 100644
--- a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
@@ -13,7 +13,7 @@ VER_DIR = "${@gnome_verdir("${PV}")}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
            file://0005-Fix-missing-gobject-introspection-checks.patch \
            file://enable-sqlite-crosscompile.patch \
-	   file://fix-removable-media-detection.patch \
+           file://fix-removable-media-detection.patch \
            file://90tracker \
            file://tracker-store.service \
            file://tracker-miner-fs.service \
@@ -23,6 +23,16 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${P
 SYSTEMD_SERVICE_${PN} = " tracker-store.service tracker-miner-fs.service tracker-dbus.service "
 SYSTEMD_AUTO_ENABLE = "disable"
 
+PACKAGECONFIG ??= "gstreamer"
+PACKAGECONFIG[enca] = "--enable-enca,--disable-enca,enca"
+PACKAGECONFIG[libgif] = "--enable-libgif,--disable-libgif,giflib"
+PACKAGECONFIG[gstreamer] = "--enable-generic-media-extractor=gstreamer,--enable-generic-media-extractor=external,gstreamer gst-plugins-good"
+PACKAGECONFIG[libgsf] = "--enable-libgsf,--disable-libgsf,libgsf"
+PACKAGECONFIG[poppler] = "--enable-poppler,--disable-poppler,poppler"
+PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
+PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
+
+
 EXTRA_OECONF += " tracker_cv_have_ioprio=yes --disable-introspection"
 
 # Disable the desktop-centric miners
-- 
1.8.3.2


