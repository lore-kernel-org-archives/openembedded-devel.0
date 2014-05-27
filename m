Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f45.google.com (unknown [209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CF3106FAF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 16:56:56 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so9449262pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MlOb5bnbgczfrSPK0hWAnWl6EtGIOMRkTaesrE/VrJc=;
	b=08viKv8+SyanDqWM1bWuDodKx0sY8gRSRcx82URnz/nRqDMieQoxgUWiks5zQzfvU8
	ZTUshHRdWuxDymO1yw2Gzy2+3Ov/4uWN66cwlNO3gYLQS9gzv44OD3f3i4EIY/3bABIW
	WgZ9GelIdRz8tjDLaNAVrZsP3FgMApiuWpMqQXV/JnHvKeqZjyqwsvR0JxUj1bjw4wni
	ylTH1dRbY6KioO93I1IYytx1wQXfIi9JJgUZXsBnoQ9qOLDbJuRg7mBaPS6EK/b23h2s
	cgK8T2fYNouCR9wNWvbv3PzPbHIb8bkyHiSX85W/QvQirf1kzUeypqWEX6B0LIwnnXEP
	rZ9g==
X-Received: by 10.68.113.68 with SMTP id iw4mr37357175pbb.119.1401209817265;
	Tue, 27 May 2014 09:56:57 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	nw13sm75775203pab.37.2014.05.27.09.56.56 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 May 2014 09:56:56 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 09:56:48 -0700
Message-Id: <1401209808-10467-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-gnome][PATCH] network-manager-applet: fix S!=B error
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
X-List-Received-Date: Tue, 27 May 2014 16:56:57 -0000

The Makefile fixup in do_configure_append is in the build directory,
not the source directory.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.0.bb           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
index 6c00283..8dbb3dc 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF += " \
 do_configure_append() {
     rm config.log
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-    for i in $(find ${S} -name "Makefile") ; do
+    for i in $(find ${B} -name "Makefile") ; do
         sed -i -e s:-Werror::g $i
     done
 }
@@ -45,4 +45,3 @@ FILES_${PN} += "${libdir}/gnome-bluetooth/plugins/*.so"
 FILES_${PN}-dev += "${libdir}/gnome-bluetooth/plugins/libnma.la"
 FILES_${PN}-staticdev += "${libdir}/gnome-bluetooth/plugins/libnma.a"
 FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
-
-- 
1.8.3.2


