Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeVCg-0003AY-Lw
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:20:46 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so447211eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=iso5+6r4dRr/m8XZwxmycjWeuqGTS3a7xM/8o7o8pzI=;
	b=THuO5KxGUr7ZJGgtU5LCGJaZz9PV6vG564P4kCFdnnApfTgfrNx2SYwcHlf+ESIL6n
	Gwv7cJyL3Xde+t/ezMukpUh2BvXEBPr9cU+GLtaXMQrY2T+SvH3WQ9a0ICm1qrt/+Ggf
	QOg4yjHYbdl9k0oGHCcfWSsbHZeLsxQJLbX5v+IeqStj6L7zSHjIp0HzLbNfKHS64n13
	7AxWN8EBr/R53NAfUrivQiy7oBGKKGnjbO/jfHVom2Q1vISUH44HN7knd0Sh+RAVArdY
	eGuvdGwk+OBxMzDr5UOh5Fxzc1W0khwKWA/h9RxD5LmRUzPG+BAgbP01pUQI5dMPvsZo
	HpGw==
Received: by 10.14.194.71 with SMTP id l47mr7109945een.6.1354298789567;
	Fri, 30 Nov 2012 10:06:29 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id k2sm11872698eep.15.2012.11.30.10.06.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 10:06:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Nov 2012 19:04:13 +0100
Message-Id: <1354298653-494-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1354298653-494-1-git-send-email-schnitzeltony@googlemail.com>
References: <1354298653-494-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, master] libgphoto2: refix build
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
X-List-Received-Date: Fri, 30 Nov 2012 18:20:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this manually reverts

commit 92e3f684d14fd287194e78bc5e65f80504758b7d
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Nov 21 14:42:02 2012 +0000

    gphoto2: fix gettext build error

which should go into danny only [1].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/042668.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index 27f660b..60271cc 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
@@ -26,6 +26,7 @@ inherit autotools pkgconfig gettext lib_package
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
 do_configure_append() {
+	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
 	cd ${S}/libgphoto2_port/
 	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 	cd ${S}
-- 
1.7.6.5



