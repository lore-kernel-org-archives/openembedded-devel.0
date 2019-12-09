Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id A43147FAAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j42so14060281wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=z/wXa70H8Ft3Om29k8uMlBRWGvXRBbjLSs4Hg+bm7qg=;
	b=Om5zzlEAvMqEdBb1Ngs+mkgRRxot0waQHVMN6kArmF6r/1ehBDI8KRrWFjx6qucbOQ
	bRVSAlXRcfqLgbvCEbY/1IOJiyEXZ69iczQ8Yr+0rUU0Ev3TzOSMU9DPPU708o24LEpi
	89/r6NTEPtdewmMSMBiDMAYDLJy/uswxqZ/5pwStNrYIpDTSdQYPfA08gB5KERYrQKjv
	3eH5YnKygnojZnMYwa6N4OD+5eLCICsVQM1pv+LzR/0i7D3z4G/UshRoRZChZpWkazuj
	BJszAvsJu8zOzmg8oPe2ia4+e0OPIyWZpcixqwyd2dMNPGLoY2IVQ+IzHOHvM/zoKEaB
	Lqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z/wXa70H8Ft3Om29k8uMlBRWGvXRBbjLSs4Hg+bm7qg=;
	b=nieOwQYAEDcEwgqw4O4nWLBhAl3a6nyDl4a5bxMd80U1I6VAIQcKNnmqULFJRqtk1R
	DzMXF8/ojACY0x4Wsg2T3qCFurSe218k6KjI/ByFnQBqB4EFZPeX3y16uyuJK8+VGCY1
	EQ+kWlgx3IAY5j9NSAc9PdOsszdrHWhhYK5AbTURrI/xAEbAI7nVgKaxfNHTp3Uh4T8u
	SobQSFBLBMiGrV/PIRrvcTE0Ww8Wf2StuLIHrupm0MchrN1RL0gn+jidClSDj9MMNiJ/
	d1ta7lRrVPWcV7IufgcjxixbanidrMYLSJzbc72t0G7TmTGUHC/tj6Dhe7lanPkBkRkT
	umJA==
X-Gm-Message-State: APjAAAVtL86bJC1m/iEGOy+RYS/oquzYcbZNr6xWR6Fmmql1FTHFfRyM
	fVlhEhVor4+U0a5bVyxCLH8LScdn
X-Google-Smtp-Source: APXvYqxreCespALQw180tdOBHePOsPKeaCyQoTfOQrAPTV8MErckzK8cNIEEGGviCGCqDTyu8yFLJA==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr28803457wrv.308.1575851938191;
	Sun, 08 Dec 2019 16:38:58 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:18 +0100
Message-Id: <20191209003840.3383-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/29] gnome-shell: initial add 3.34.1
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

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
new file mode 100644
index 000000000..d0b3af83d
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
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
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
+REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
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


