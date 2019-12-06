Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id E12BA7F977
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w15so5854298wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0zAqtRfSW+wV+d97qB/8IDqYBLTsbh7YBIAO6gTL6pw=;
	b=Ujv9/LaZc3bLlNkRIoAjxSyoKkqXv8RLFwBcvtmXRzx/6u9SJniX0T9ehZTxXL+JPd
	bR07Izf0m4MGWdL1c+O+HSDP8Kcwr1hrQnWjfL/4Q/YPEy1xb6IxtgOdv/fYHxLVUalb
	zuEs/vo/Aw0f3AshOFY3/MSiQ3G0IeIwRs+p42m/XBtszMPI3BfBTx90WMRiz+8rUqHI
	r/GAq2k65jP0nzbSeS8A6ZcINri5ZDmdir+7l7u6TPEWKwrdPGMNkHOfk4RDxQvIsqQF
	3YRNS+QlGiNaS70VwwMo1cKJaZilJ9pLCzQRmxil9L4hfn6/z8H+zqxLt4kOABCTFOkX
	JC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0zAqtRfSW+wV+d97qB/8IDqYBLTsbh7YBIAO6gTL6pw=;
	b=aLIPdY+w9Fzfz9ctmOKYVDCTwKxIHL+g5/GEcotLCOVZp7/jIfuFt6PkEN2GTxYuP9
	rXe2jqznsnIH11IdGF35bm8nBbbeFQX50mMxxIeQ5fBwkqb8bi802JWer732v0lKW7ZE
	uw4LeI6v/bKmhssvGZrPJ3KXYJeVpaeR7uRulLnS+umgnm9yZR23+E0E2cqef48WL3v9
	DmFH07/iScrTXOCEd5PWKUSy+ybgmznFaM5Ib2Qphxa7F3jNLsTpaF0ZEzxco+AWdF9H
	BargaENozLnG6OYE+ysln7SGxEGpZsC5DazpLCOhbq/H2Y1XeX35HFvLr1LHDb4Muslt
	1jAg==
X-Gm-Message-State: APjAAAXLUlt2UxTVDY/RPZZ07NeQC54w5umAGUBe8/GI3ZB7eiPA+3Nu
	3ZUTTeob5MNeCrT5t5hSYQtgb8uK
X-Google-Smtp-Source: APXvYqwm0Kye+cm9xYrd8C9Toakiyf3hU+GGsK/VSAk1tbQqic0CU5W5cM4H7yTaZu8A5qkBsMGrXA==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr3710528wrv.146.1575590970105; 
	Thu, 05 Dec 2019 16:09:30 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:57 +0100
Message-Id: <20191206000912.19841-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/21] gdm: re-add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GDM is a mandatory component for all types of gnome sessions. To give users the
choice to build images with gnome-session using different display-manager
without changing systemd service configuration, mandatory parts were split
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


