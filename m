Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T710Z-0005AF-On
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 11:25:51 +0200
Received: by wgbdr1 with SMTP id dr1so1048756wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=I4kLOAFKSQx35gbvhUShhOyW6oDIA1M1f0uxgEQ/Zzs=;
	b=TosXCvov5SEfhtuVCH52TSRbEr6gGWlEoOn2c3ObkMAbIV2FZPy5LOZnpJWerJvIr2
	5ZcGbO0YtBB0usTXEHgGMb/7Rl9eScbKVRY9um1zaQNUdthVqZN5VBRvpB6yTOWKg4uT
	3jvAj5XmJ8qcxXjA8EI5WWvl55MepQaWoC67L/YLX1trt5acXTWL4KR1t7IDgqOk2yQW
	yOc+CxYlHg6rjDVMRQw6nAk/AXuc2XVCVNysU79Szy9jfXtxsu4fV2Me7tGw/GRvbVCW
	iU9fMeysdw+NBXvPW9KWxGqb8x+pWcPQ/y0788QxCAUODZHmQp/RGph+nOkq35hPXGl1
	3aTQ==
Received: by 10.180.76.36 with SMTP id h4mr46538216wiw.13.1346318016782;
	Thu, 30 Aug 2012 02:13:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm3357038wib.10.2012.08.30.02.13.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:13:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 11:13:31 +0200
Message-Id: <541bb1970acee1ab8726f2a64d8cabeb96eed49f.1346317656.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <]>
 <cover.1346317656.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <cover.1346317656.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] gpsd: add gpsd-machine-conf to RRECOMMENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 09:25:51 -0000

* it could be something machine specific (config + hoooks) and we don't want gpsd sstate checksum depending on MACHINE var
* gpsd-machine-conf itself is using u-a to select right config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf                     | 1 +
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 550f8cf..dcacb32 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -28,4 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   mplayer-common \
   task-x11-server \
   fbset-modes \
+  gpsd-machine-conf \
 "
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index e8f4cad..eff0dcb 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
@@ -94,7 +94,7 @@ FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.p
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
 RDEPENDS_${PN} = "gpsd-gpsctl"
-RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
+RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev gpsd-machine-conf"
 
 DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
 FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
-- 
1.7.12



