Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 984D57FC0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id g206so14463453wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=z/wXa70H8Ft3Om29k8uMlBRWGvXRBbjLSs4Hg+bm7qg=;
	b=UOEwCxACKIS5TW9M0lwIg0x8Ppib2m3blRqRgV9CkWEDeDleeaZ/n/i7jaHjWa0pcQ
	INVXfyHQPEbygcAEO6o/We/aTMYvgXgNlpvHR8cqIUt3769HubwJ8eJGBBEn3fOalnbw
	YA9XxSMgu18mmeYi+a3gcB9rzo80MwJq9vZz7Pk3LxqcMZQAVzCmhpfHO5Xx7rK8vEmI
	3WMckxwFfvps+mEFdpZZvkIMoNmGsmGiqX/LsQgzTvUjY6S9UHN2T3vswD51qSbSs+kj
	Rhr5BT1Si5fgRoo1uT49fh0NxF/M7vkOSK/TuMEud7LrtCtSaCoSfrJWsbkwUhek5sHz
	2UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z/wXa70H8Ft3Om29k8uMlBRWGvXRBbjLSs4Hg+bm7qg=;
	b=lNUEF/LOCkOIvg/uc1lMUbI3USAvczKVbcKa7TTZZF2buPQqq2vC/smRbxSS9iRJSA
	hgG0JJ1nhx7bWDFyk3R0hMH4yxPUFxLO8I7a133lQbolx3Xch16PoQOLFsu2dbeT668C
	s97WRKjc7Ldi0lyz7dlYxuOVfURw65xUKSA3/gUf3i5XF7wZbsWzXr3/+vB3QFAT4mld
	W3BqMGKG3xNrOEtgVK6DGFqhEhdchSquEnNXWOvoDa2HV/qcZsKvRLNo4NxNcNChBkR8
	X52feBB7qqRnj4WCAL7IKjZmNukPNMa2bI0gs/WtoqCXFCOOA4yJ9Un0zx9QFw+sfncL
	j4fA==
X-Gm-Message-State: APjAAAXzBXlxLwDZ41MC/JrWq5/OlvV4LnkE4IkYJWxlFj9CT8gTn7Ek
	vQNVcVWfjz8C+3IlfjLgJ24gFQDG
X-Google-Smtp-Source: APXvYqx8kqZWivSvj0uSfPVJq9yp8Oqzc5LY+8JuBG/lf996z6tYptOD55msa3UdgzG/31TasgilMg==
X-Received: by 2002:a1c:9e0d:: with SMTP id h13mr23579693wme.110.1575880585129;
	Mon, 09 Dec 2019 00:36:25 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:55 +0100
Message-Id: <20191209083612.23922-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 03/20] gnome-shell: initial add 3.34.1
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


