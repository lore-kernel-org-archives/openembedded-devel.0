Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B45E17702E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 00:26:58 +0000 (UTC)
Received: by qkcj187 with SMTP id j187so15016488qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 17:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=F7fDmLtF7vXWkFJiedyB1mTJKnFJipyWrntv258K39A=;
	b=ylWznD4FrI3s41l6xn8TwZdHpZXviUQQOGl6BLRtSam49wJH3sn99jrpC/JVzQo5fi
	MzyG7yZM6BrmSRBjtmsn7rMk3KeJCZCF9XiXWvyRM0YmcaGIY0WkXMR13CPOIgtfN+Vl
	msp8xC+2UqRBXp+iInc3LnKydZ5BislVIBHC4E1XaJYvNS5+/p8Gmgtixiz4wgSoA+QA
	Eu9j3CR5kBoxrhOPpTfzME8jehmWBPdose0KuRdwKZENfbAU7ZdsnLfD8GoiomdomvuQ
	FMuTB/ZkvJ54/Pi/UC9BAII+x4nqQZL2bZx4PQ5qQCxvQFa3TtUDbLysS4B/u0StLdB5
	65kg==
X-Received: by 10.55.18.214 with SMTP id 83mr34604111qks.7.1441240018416;
	Wed, 02 Sep 2015 17:26:58 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	m82sm13767054qhb.19.2015.09.02.17.26.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 17:26:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Sep 2015 00:26:51 +0000
Message-Id: <1441240011-49718-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [meta-oe][PATCH] plymouth: Add recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 00:26:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
new file mode 100644
index 0000000..f7f1af2
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Plymouth is a project from Fedora providing a flicker-free graphical boot process."
+
+DESCRIPTION = "Plymouth is an application that runs very early in the boot process \
+               (even before the root filesystem is mounted!) that provides a \
+	       graphical boot animation while the boot process happens in the background."
+
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/Plymouth"
+SECTION = "base"
+
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libcap libpng cairo dbus udev"
+PROVIDES = "virtual/psplash"
+RPROVIDES_${PN} = "virtual/psplash virtual/psplash-support"
+
+SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
+SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
+
+EXTRA_OECONF += " --enable-shared --disable-static \
+                  --disable-gtk --disable-pango \
+		  --with-logo=${LOGO} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
+                "
+
+PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
+PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
+
+PACKAGECONFIG ??= "pango"
+
+LOGO ??= "${datadir}/plymouth/bizcom.png"
+
+PACKAGECONFIG_append_x86 = " drm"
+PACKAGECONFIG_append_x86-64 = " drm"
+
+inherit autotools pkgconfig systemd
+
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
+	install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
+	# Remove /var/run from package as plymouth will populate it on startup
+	rm -fr "${D}${localstatedir}/run"
+}
+
+PACKAGES =+ "${PN}-initrd ${PN}-set-default-theme"
+
+FILES_${PN}-initrd = "${libdir}/plymouth/plymouth/*"
+FILES_${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
+
+FILES_${PN} += "${systemd_unitdir}/system/*"
+FILES_${PN}-dbg += "${libdir}/plymouth/renderers/.debug"
+
+
+RDEPENDS_${PN}-initrd = "bash dracut"
+RDEPENDS_${PN}-set-default-theme = "bash"
+
+SYSTEMD_SERVICE_${PN} = "plymouth-start.service"
-- 
2.5.1


