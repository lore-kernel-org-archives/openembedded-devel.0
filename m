Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B05607F977
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id s14so5638001wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=j7XJD558dTg0A3eJHyDSN0req0ISqfvx5J54/hHRLJw=;
	b=Dv6YF32pq5b5x+fdnb/z6xyZdWCmZkcFNehp7pMURiJaoNC94Wsx3k8wcCH3ZnkNEh
	vIpdCFEegtGtYzMuRoNARVrTMszJX8Y/wmio4kcO7ZJkd+NnQj683MZFJJ6JzMeOdn1b
	CTHaet738jAN2TbJYo2IOdhUyRUz+RQ+siswphqI3Z4gxS1YrjExFXpyKO3wqsqAIkWO
	pksVZd9JfDr/HKr78MphAJbrrJMTyDd3qeVDQLc1jBP0CHV/CnJl0LvIQ226KjfMEFEo
	5jLGXzdinhflV4Jqu94q2+ePfP/0SqFxLQh/XD88XtL+qkoh35cfCwfrT6BwPZxzUg0n
	XTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j7XJD558dTg0A3eJHyDSN0req0ISqfvx5J54/hHRLJw=;
	b=G0QJYYy0mo7eW6MXg+1QULiWYC/+9ailnGAweDj8brtIWbm5wQ3BMeqEj1QMW6gjeO
	At0C7v3IO9BFM0ioMJ9wE73RZqzxVPiybzUPyEZSfviV++EPtaALgHHoa4FxyOPzvWRC
	z6lZgSdPcYq5o/jpScGgHC/1iPpMFuJj8+1RhV4HDWtrMU26VBvXTARf4/LioZtXSuQv
	zHIN8OL/+SGNCjSSP43GLw8JaOkfVztjIFnST3t0vRskWoJnDlx5wjIeqHyxncX+Vrq3
	iN7CRpy5nLuYg1cym/BzQI1yZw35+MO+0U1gclp2JUQRsNnnHdJead1ub/b7lYLNBJZN
	eddw==
X-Gm-Message-State: APjAAAUv5MRNof6nGOQYTwRQkVM99yp3JXwmPKHX/o/O8IWrCnJCa6X0
	SqOX8N2RxU6/apS/wtIW41G6u9lc
X-Google-Smtp-Source: APXvYqxr55YJrn9lwZ2neiVtPLmZATo37+DDfiiDvXWuXNZwQqGLQpRl8QhEEuYtgPcQY84cAz3msQ==
X-Received: by 2002:a05:600c:1051:: with SMTP id
	17mr7456162wmx.49.1575590971134; 
	Thu, 05 Dec 2019 16:09:31 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:58 +0100
Message-Id: <20191206000912.19841-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/21] gnome-shell: initial add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
new file mode 100644
index 000000000..c61625070
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
@@ -0,0 +1,64 @@
+SUMMARY = "GNOME Shell is the graphical shell of the GNOME desktop environment"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gettext gobject-introspection features_check upstream-version-is-even bash-completion
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
+
+DEPENDS = " \
+    libxml2-native \
+    sassc-native \
+    gtk+3 \
+    mutter \
+    evolution-data-server \
+    gcr \
+    gjs \
+    gnome-autoar \
+    polkit \
+    libcroco \
+    startup-notification \
+    ibus \
+    gsettings-desktop-schemas \
+"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+SRC_URI[archive.md5sum] = "2e00c22673d069d6b919b2ca1b225d89"
+SRC_URI[archive.sha256sum] = "ccd86559b9c897c219d2d2ebfdb8413efa4c1bee846427c750cb8a301b3f6d1e"
+
+PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
+PACKAGECONFIG[nm] = "-Dnetworkmanager=true, -Dnetworkmanager=false, networkmanager"
+PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
+
+EXTRA_OEMESON = " \
+    -Dman=false \
+"
+
+do_install_append() {
+    # fix shebangs
+    for tool in `find ${D}${bindir} -name '*-tool'`; do
+        sed -i 's:#!${PYTHON}:#!${bindir}/${PYTHON_PN}:' $tool
+    done
+}
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gnome-control-center \
+    ${datadir}/xdg-desktop-portal \
+    ${systemd_user_unitdir} \
+"
+
+RDEPENDS_${PN} += "gsettings-desktop-schemas gdm-base librsvg-gtk"
+
+PACKAGES =+ "${PN}-tools"
+FILES_${PN}-tools = "${bindir}/*-tool"
+RDEPENDS_${PN}-tools = "python3-core"
+
-- 
2.21.0


