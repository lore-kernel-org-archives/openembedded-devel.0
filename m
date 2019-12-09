Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id D307F7F79D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p17so13901303wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TqpPl2n2CkdbYUp4LR/EsrYfAHVLVf9ObYG5dZdBqIc=;
	b=qEzVJo0me8uYuJF8EdcF5yVcEqrMGkeZEumBEzDmwKqr9ao3Uoc70cIFdjEKMBRtkh
	ClgHHGRS5A/MkeXMsz5zJaTmNpnzAHu45uQR/yzm/KsfnWKommhhkwZ3H5mjCCYnEc2e
	DdEvxgVDIo14FlDZCHD/pBIG5M0nr0711pUFVipRpvzKg7YiiU2+Un6mjIXqPu3yzWHk
	GOE4Bnqwup+y0F3a4g9mvI8BcGW29vP35is2yGRbW12o/1usg6geUejCPi7oZrIFKh9Q
	HxQuP0uKn8UmraQDub+QR3+czmSujGbvKWkpm6eueTNK41OhXFKI2C5NEZnmDkomkpxk
	1U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TqpPl2n2CkdbYUp4LR/EsrYfAHVLVf9ObYG5dZdBqIc=;
	b=Vyynux6KyNorqAyDnsX9Ze3rpkBvTdGJ7pErLaYCyOHRhJWJSszO9zIPClxQwT4Bqt
	+ZcCd2EB6IWrCAu1MvZh+sDq7Bp6MiqHHr5n0aQ9bM9wBhRehbjqRsPZcBO6fBb9uGqr
	10z8WurKpmUqaecsWGeFNV933Ub/ca2GUEESd1DQPuKPD5CiPc94vZ8M8dMKY1EPkUau
	juyV3UbxPgNxCAvro5BDmOgPadwrBcn7+PzSrmul1SieEUuGUD+k7h/ObGZptO3EI1IZ
	exlzZkTdw58rf9OCcFkjqrw4OWskcKGs9s8x7uur8hIVIISkHzh59ze+W7ugMeMdCxge
	sXlQ==
X-Gm-Message-State: APjAAAX+8IsfjEY1xok0USJryix69V24jbZZMZsgct4RWDUu6HZ2HtmH
	KWMnX9+C7LlmlNq216V65TRVZ7l3
X-Google-Smtp-Source: APXvYqzqdlG3tkyHlsN4ST8cvJfH2p8WbTtV4YXr1XhsyHpvE4OKcdC8o2xgMYGj5GEsR4lBoQ14rw==
X-Received: by 2002:a05:600c:a:: with SMTP id
	g10mr22887776wmc.69.1575880584146; 
	Mon, 09 Dec 2019 00:36:24 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:54 +0100
Message-Id: <20191209083612.23922-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 02/20] gdm: re-add 3.34.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2019 08:36:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GDM is a mandatory component for all types of gnome sessions. To give users the
choice to build images with gnome-session using different display-manager
without changing systemd service configuration,, mandatory parts were split
into gdm-base package.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 +++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch b/meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
new file mode 100644
index 000000000..6362d5ee6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
@@ -0,0 +1,48 @@
+From f7bba53adf8a26f900442a05bb98326747c392b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 3 Dec 2019 00:24:27 +0100
+Subject: [PATCH] Ensure pam-file installation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+All the detection magic does not work for us
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ data/Makefile.am | 12 +-----------
+ 1 file changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index bda9160..dbc3ea3 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -296,22 +296,12 @@ endif
+ 		chown root:root $(DESTDIR)$(logdir) || : ; \
+ 	fi
+ 
+-	system=`uname`; \
+-	if test -f /usr/include/security/pam_appl.h; then \
+-	  if test '!' -d $(DESTDIR)$(PAM_PREFIX)/pam.d; then \
+ 		$(mkinstalldirs) $(DESTDIR)$(PAM_PREFIX)/pam.d; \
+ 		chmod 755 $(DESTDIR)$(PAM_PREFIX)/pam.d; \
+-	   fi; \
+-	   if test $$system = Linux; then \
+ 	     for pamfile in $(pam_files); do \
+ 	       bn=$$(basename $$pamfile .pam); \
+ 	       $(INSTALL_DATA) $(srcdir)/$$pamfile $(DESTDIR)$(PAM_PREFIX)/pam.d/$$bn; \
+-	     done; \
+-	   fi; \
+-	   if test $$system = SunOS; then \
+-		echo "Please add PAM authentication for gdm, gdm-autologin and gdm-welcome in $(PAM_PREFIX)/pam.conf!"; \
+-	   fi; \
+-	fi
++	     done;
+ 
+ 	if test '!' -d $(DESTDIR)$(xauthdir); then \
+ 		$(mkinstalldirs) $(DESTDIR)$(xauthdir); \
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
new file mode 100644
index 000000000..a47bf6fcf
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
@@ -0,0 +1,56 @@
+SUMMARY = "GNOME Display Manager"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = " \
+    dconf-native \
+    gtk+3 \
+    accountsservice \
+    libcanberra \
+    libpam \
+"
+
+REQUIRED_DISTRO_FEATURES = "x11 systemd pam"
+
+inherit gnomebase gsettings gobject-introspection gettext systemd useradd upstream-version-is-even features_check
+
+SRC_URI[archive.md5sum] = "65d1fd4bb85e8b133d1cbffb80ecf62e"
+SRC_URI[archive.sha256sum] = "e85df657aa8d9361af4fb122014d8f123a93bfe45a7662fba2b373d839dbd8d3"
+SRC_URI += "file://0001-Ensure-pam-file-installation.patch"
+
+EXTRA_OECONF = " \
+    --without-plymouth \
+    --with-default-pam-config=openembedded \
+    --with-pam-mod-dir=${base_libdir}/security \
+"
+
+do_install_append() {
+    rm -rf ${D}/run ${D}${localstatedir}/run
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
+# Some gnome components - as gnome-panel and gnome-shell (!!) - require gdm
+# components. To allow gnome-images using different display-manager, split them
+# out into a seperate package.
+PACKAGE_BEFORE_PN = "${PN}-base"
+FILES_${PN}-base = " \
+    ${datadir}/glib-2.0 \
+    ${datadir}/gnome-session \
+    ${libdir}/lib*${SOLIBS} \
+    ${libdir}/girepository-1.0 \
+"
+
+CONFFILES_${PN} += "${sysconfdir}/gdm/custom.conf"
+FILES_${PN} += " \
+    ${datadir}/dconf \
+    ${base_libdir}/security/pam_gdm.so \
+    ${localstatedir} \
+    ${systemd_unitdir} \
+"
+
+RDEPENDS_${PN} += "${PN}-base"
+
-- 
2.21.0


