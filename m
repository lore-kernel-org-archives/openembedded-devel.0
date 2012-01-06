Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjF8H-00081v-Gr
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 20:07:17 +0100
Received: by yhoo47 with SMTP id o47so718327yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 10:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=OgWoXxuL2ZbiTmo8xzHj4kHSOHC6alSerRj4MwTlRaM=;
	b=OZYuTAPVNpmFS7zvTKUYmzDWoMTicIHTCues+h8MOJGuO9QACYiCtR2GPk9FETon9f
	aRE6fm0TQ3hQHOQCN7lvhOW7T+RF6c3eF2Ad1k9zN1oGE6s2j8OhLxSkQ8doXC6jCn8P
	VrGQZU6fqhB145xaovbUK2I9lIe2uUB+jCaXw=
Received: by 10.236.145.230 with SMTP id p66mr9066192yhj.27.1325876389145;
	Fri, 06 Jan 2012 10:59:49 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm17744177ann.21.2012.01.06.10.59.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 10:59:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2012 18:59:31 +0000
Message-Id: <177897c040bf0234aff680d79246595885e53643.1325876341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/5] xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 06 Jan 2012 19:07:17 -0000

Move systemd service to xserver-nodm-init-systemd to be consistent
with other packages.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   30 +++++++++----------
 1 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 496b342..2132eab 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
@@ -13,6 +13,15 @@ S = ${WORKDIR}
 
 inherit allarch
 
+inherit update-rc.d systemd
+
+INITSCRIPT_NAME = "xserver-nodm"
+INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
+INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
+
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
@@ -21,20 +30,9 @@ do_install() {
 	install -m 0644 xserver-nodm.service ${D}${base_libdir}/systemd/system/
 }
 
-RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-FILES_${PN} += "${base_libdir}/systemd/system/"
-
-inherit update-rc.d
+PACKAGES += "${PN}-systemd"
 
-INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
-INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
-
-pkg_postinst_${PN}_append () {
-    if [ -e ${base_bindir}/systemctl ] ; then
-        # can't do this offline
-        [ "x$D" != "x" ] && exit 1
+RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
 
-        systemctl enable xserver-nodm.service
-    fi
-}
+FILES_${PN}-systemd += "${base_libdir}/systemd/system/"
+RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
-- 
1.7.2.5



