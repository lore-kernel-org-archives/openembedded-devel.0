Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeVCf-0003AW-Ex
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:20:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so447188eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=GuBGj0KcgMN8XTAFk8MwvhXe5SD8+LmbC6BaTYzTZro=;
	b=JuQI8cI1yOV9ePs/ots2DUDkLXicYyBsQ7GwJpsyW4/TEDeIrmHrvntBsUaQKVqPlJ
	XXhzrFBlggaDmImspVfuCMB36Jp/aph7TIICwzEj/WJNa0f2qcy5IOI8t5jGsJt0pLoO
	YW0BMhqSk8sv3kDGPnKObEHARMyfOjL8QEFLBWo53AEZmk3oKfwqz2A9HRitV5DjDUhb
	Y64yodHDTyUh+WRbYl8MCOiDSs0N0BHTD7qD8wCKYUsJwwVk0sFbQuGetnF7mf+fxDOi
	ZsUQLJfcYpMFOP8mL3DhchyLS71yOiQRt3aX546va5eQAoSpkFgYFIMXjXjxLmo0dr5M
	KgfA==
Received: by 10.14.193.136 with SMTP id k8mr6982625een.30.1354298788131;
	Fri, 30 Nov 2012 10:06:28 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id k2sm11872698eep.15.2012.11.30.10.06.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 10:06:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Nov 2012 19:04:12 +0100
Message-Id: <1354298653-494-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe, danny] gphoto2: fix gettext build error
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
X-List-Received-Date: Fri, 30 Nov 2012 18:20:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index d7f6ac0..27f660b 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
@@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
 do_configure_append() {
-	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
 	cd ${S}/libgphoto2_port/
 	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 	cd ${S}
-- 
1.7.6.5



