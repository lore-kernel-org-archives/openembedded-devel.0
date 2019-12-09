Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id D43D17FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:56 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c9so14116069wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0zAqtRfSW+wV+d97qB/8IDqYBLTsbh7YBIAO6gTL6pw=;
	b=FdZNrQPyl8Xloy+HFjaBZMbIf4iJSnjUtR0pZdNBmY//2U7aOkoSwk+jBTcsuVVlot
	RAQ7cH3W+XadLDce9WJrRR8EUMu0V1OtQnlbMaHJOqS7NOx49cNI99lCw7MVwLSWJh8J
	YC2fREtleDWMTWIRBIZO5qDtPoyV/3CzxLwa2ClcP3+6N/C+I/DrzUj+sIA8Me3avpzt
	wkte5g89GLpfo0d6RFLPvBVru8lSA5OCqr8XbwaQYQBqrjXGyL1dd7zP1Y6LqUpSCGZv
	zTA+UEALVRr6L0k+mLOEOtS3QnahMLIHW64m3I4GhiFRwnmstNU4VgooV9R4v6vmODqQ
	lG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0zAqtRfSW+wV+d97qB/8IDqYBLTsbh7YBIAO6gTL6pw=;
	b=GUhEkPWlmyUqQcK4RCZmjcunCwbOZAGmzoBX9ep/WMVwL1EvabTQA38VA2YjmAlCFc
	JnxeTyK/wCXzzU0gBgwy9vn/uY27P0RDsh/XOZDfJxy3A7Yy6oScXHojAKhSnC1ZQV2T
	yOeo8+aqETcSWdZT92Fm7n8sicbrXbHr5qh9PPm/iTPRL9XuIruhwtnINziOhK0ioBJZ
	HfVfk88jP/LfclT2XAerYQtjA3IyS9r5MAvkEBubEZIqLbfMdY6zXAqvbEU7RlOjI1Wu
	54w7HRUxsHyeAdkMyL5JgjlFFiLoZ3UmWK6fs4ma24Zn/ongKbgcGkPF/UFS8InesrNm
	VdBw==
X-Gm-Message-State: APjAAAX5xnIDB8QQ4dHbr8eeP1Xh1aTxypoSHVl9/xmQlGrWdejrl5Q3
	ykSYwY9BO+nRiBR/y39KHz7R4VFy
X-Google-Smtp-Source: APXvYqxhd203ASo4cFNeM1WVKScptST+d3eNqOPR5ZJyd4DcsAlFnqtP0wEW8uAY7FVUPHnT0/bC7A==
X-Received: by 2002:adf:b648:: with SMTP id i8mr16250876wre.91.1575851937228; 
	Sun, 08 Dec 2019 16:38:57 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:17 +0100
Message-Id: <20191209003840.3383-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/29] gdm: re-add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:57 -0000
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


