Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QjdvT-0003D0-Mk
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:03:27 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2387421fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y5ml9nF2GcdwpsDQlm32/TcUhhKq+jkkmgijYOvNxPg=;
	b=Bv5sUil10QxihEICDupdOtTWsWTH019ZCpkPslr2W8A8dgnvJIWMTtJ0LlAMKb9ZSE
	lKNWnta/mUjD7Y+CT9uEYsLwHR9xOmCK5jGKfdP0LicihNcRfmkXHSsRM06CgB9G14DN
	mhej8N6O+4AmITidhEV1MMBxLI8f8mQxWN1mI=
Received: by 10.223.24.17 with SMTP id t17mr194507fab.143.1311195563360;
	Wed, 20 Jul 2011 13:59:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s10sm927243fah.46.2011.07.20.13.59.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 13:59:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 22:58:49 +0200
Message-Id: <30479bfbd667bc29553eae73b1bab78f4cb248a4.1311195484.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
References: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195484.git.Martin.Jansa@gmail.com>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] bluez4: add missing dependency usbpath
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
X-List-Received-Date: Wed, 20 Jul 2011 21:03:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
index ab85776..7688986 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib libnl"
+DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib libnl usbpath"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ASNEEDED = ""
-- 
1.7.6



