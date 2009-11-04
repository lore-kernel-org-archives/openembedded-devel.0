Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1N5f3E-0008GU-5r
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 13:33:27 +0100
Received: by ey-out-1920.google.com with SMTP id 5so618158eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 04:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=jDAsarayzQguuAY9D6Dn/OPSCx+YJjc/rfo5tJp/YuQ=;
	b=SvODk/7b71fwAL4/C2yICP5/OfCWEkzPzM7Hepi/GTlIpac0pIbtmYjwZmF94EKyMe
	uM4IbJ/CJJIpMXdiL1G9dbdw1OjLNjiVDaen3Fg/5ef6RlG3V6HUcJ0yneogiS1AsoK6
	SZ43QvPw45Q3EiGiiUot+Oyps9P8p2WmwQPvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NCJ7Iwg2aWJqTFKTI2oLgqcHPTWaK39YNMrUDkB7tNSQKyMe7Z1XWee7dmsQRT3uOc
	Yj2aX46qktm/+VC5YxeWXL4rNO86K/6BeZwohXl9Mj3yXCgzNQuSJ5t+kmbiMkpQ0ngW
	V1WWUCtQPdiXVXTTaLp08iNVS6NIZ2dOSb/3Q=
Received: by 10.213.23.149 with SMTP id r21mr1607909ebb.19.1257337933236;
	Wed, 04 Nov 2009 04:32:13 -0800 (PST)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm3210175eyg.38.2009.11.04.04.32.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Nov 2009 04:32:12 -0800 (PST)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2009 13:32:03 +0100
Message-Id: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.1
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: [STABLE][PATCH 1/3] clutter.inc: rework armv7a machines a bit and add omap3517-evm to compatible machines
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
X-List-Received-Date: Wed, 04 Nov 2009 12:33:27 -0000

From: Koen Kooi <koen@openembedded.org>

Signed-off-by: Koen Kooi <k-kooi@ti.com>

---
 recipes/clutter/clutter.inc |   18 +++++-------------
 1 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index e900c43..7bce3e2 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Clutter graphics library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPL"
 
-COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|beagleboard|overo|omap3evm)"
+COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|omap3517-evm|beagleboard|overo|omap3evm)"
 
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
@@ -20,6 +20,10 @@ EXTRA_OECONF_mx31litekit = "${BASE_CONF} --with-flavour=eglnative"
 PACKAGE_ARCH_mx31litekit = "${MACHINE_ARCH}"
 LDFLAGS_append_mx31litekit = " -lpvrNULLWSEGL -lstdc++ "
 
+DEPENDS_armv7a = "${STDDEPENDS} libgles-omap3 tslib"
+EXTRA_OECONF_armv7a = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
+PACKAGE_ARCH_armv7a = "${MACHINE_ARCH}"
+
 DEPENDS_omap-3430ldp = "${STDDEPENDS} libgles-omap3 tslib"
 EXTRA_OECONF_omap-3430ldp = "${BASE_CONF} --with-flavour=eglx"
 PACKAGE_ARCH_omap-3430ldp = "${MACHINE_ARCH}"
@@ -28,18 +32,6 @@ DEPENDS_omap-3430sdp = "${STDDEPENDS} libgles-omap3 tslib"
 EXTRA_OECONF_omap-3430sdp = "${BASE_CONF} --with-flavour=eglx"
 PACKAGE_ARCH_omap-3430sdp = "${MACHINE_ARCH}"
 
-DEPENDS_beagleboard = "${STDDEPENDS} libgles-omap3 tslib"
-EXTRA_OECONF_beagleboard = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
-PACKAGE_ARCH_beagleboard = "${MACHINE_ARCH}"
-
-DEPENDS_omap3evm = "${STDDEPENDS} libgles-omap3 tslib"
-EXTRA_OECONF_omap3evm = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
-PACKAGE_ARCH_omap3evm = "${MACHINE_ARCH}"
-
-DEPENDS_overo = "${STDDEPENDS} libgles-omap3 tslib"
-EXTRA_OECONF_overo = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
-PACKAGE_ARCH_overo = "${MACHINE_ARCH}"
-
 DEPENDS_mx31ads = "${STDDEPENDS} libgles-mx31 tslib"
 EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
 PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
-- 
1.6.1



