Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6D17C85D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:37 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b18so41152420wrj.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CCpFLAoMlqOHkKdnpFUVwIHBZGeRGn02wDDWyP5irVA=;
	b=gfTxwZZx3UMoNX3C7yzBYp5j2p1+dPouZZL/X9sO+JoBoGv33vj/MJLTpIRYBKtfH8
	QY0lnCj/Y2hWdgJyk3uz1FrH0ShNJ5kWz4JcOzwqLv/KH2W98m/7abGjwIOEsix3jKKL
	VhgZMoB2yvPlV9XXh/3OF9BSR0ctJs8IPxA8YLSz0jVK9JYxF1PJAK62s2grArUv9aVt
	maqQtN2SfJQEWQpzAB6+gHmvMMtCUitSQC5Ip21YvxtIb0w0lVnrzcBAJ24rZklkS2fV
	qePJUmKJwrWvxu9RKUk/XlR2exVM2JFvXzli7kJzYRVgfZz1E7TdyOsx2vRoRmkKBlYf
	JYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CCpFLAoMlqOHkKdnpFUVwIHBZGeRGn02wDDWyP5irVA=;
	b=V+yvyAIlODDH05RnxLVaSMbSPho3BFKtBNQZSQNlc6YY1saaVEtqaaV4oa4xhC9Ae2
	gLJzmPm4Ccym4VXrPSu4HqNuHr5xl9YbgcFEGrqxFH3O2irHyvh0Md5cAiJIEpwDwEul
	ZvBS3CuiRRSMyqZamUXjg1y8T+NdWtqb819fBm10qIqEZ4ox9dHTMEBxcXzGmCjA0dXj
	Q4Ea1czQtRbXK+egHXoZ3PcaV6m8EXeLLeohjjO8hOR7s3HxJ3E2eJO6zIihmdlu1iRm
	EbyE5pvBZYZQA7IWPSjmxRgsoUWTA7iKXXIECvdxIWDMrFzWMAASSIUvn+eDIMvARUY0
	cQBg==
X-Gm-Message-State: APjAAAU2fFJej40f1CYrK20wgLOaIfaz0qc236o/UB5BX4dYAutJ5Q/U
	h6SYLGQfeA73vHuln6fODz9ByLbx
X-Google-Smtp-Source: APXvYqwDVyjFOQ1TmzPJaW/md7DgemdZ8Xo3T9E0mIr2gH6jTyW4mWRfTe8S9lSJMSZHraOvgpiHEw==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr7389102wrq.196.1575219097930; 
	Sun, 01 Dec 2019 08:51:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:22 +0100
Message-Id: <20191201165123.12699-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] mutter: initial add 3.34.1
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/mutter/mutter_3.34.1.bb     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb
new file mode 100644
index 000000000..a778dff9a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb
@@ -0,0 +1,95 @@
+SUMMARY = "Window and compositing manager based on Clutter"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = " \
+    xserver-xorg-cvt-native \
+    virtual/libx11 \
+    gtk+3 \
+    gdk-pixbuf \
+    cairo \
+    pango \
+    gsettings-desktop-schemas \
+    json-glib \
+    gnome-desktop3 \
+    gnome-settings-daemon \
+    libxtst \
+    libxkbfile \
+    xinerama \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
+
+SRC_URI[archive.md5sum] = "4d7b67471fa4177e5ff0357e1f1736fb"
+SRC_URI[archive.sha256sum] = "ba1826cf88bdb81e63943cac014a8e8bcf35ec178c53264401f9c72fdeab758e"
+
+# x11 is still manadatory - see meson.build
+REQUIRED_DISTRO_FEATURES = "x11"
+
+# systemd can be replaced by libelogind (not available atow - make systemd
+# mandatory distro feature)
+LOGIND ?= "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
+
+# profiler requires sysprof 3.34 which is not willing to build atow
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl native-backend', '', d)} \
+    remote-desktop \
+    sm \
+    startup-notification \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', '', d)} \
+"
+
+EXTRA_OEMESON += " \
+    -Dxwayland_path=${bindir}/Xwayland \
+"
+
+# combi-config - see meson_options.txt for more details
+PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput ${LOGIND} virtual/egl virtual/libgles2 udev"
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=true, virtual/libgl"
+PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false, glx"
+PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
+PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
+PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
+PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
+PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
+PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland wayland-native, xserver-xorg-xwayland"
+PACKAGECONFIG[wayland-eglstream] = "-Dwayland_eglstream=true,-Dwayland_eglstream=false"
+
+# yes they changed from mutter-4 -> mutter-5 recently so be perpared
+MUTTER_API_NAME = "mutter-5"
+
+do_install_append() {
+    # Add gir links in standard paths. That makes dependents life much easier
+    # to find them
+    install -d ${D}${datadir}/gir-1.0
+    for gir_full in `find ${D}${libdir}/${MUTTER_API_NAME} -name '*.gir'`; do
+        gir=`basename "$gir_full"`
+        ln -sr "${D}${libdir}/${MUTTER_API_NAME}/$gir" "${D}${datadir}/gir-1.0/$gir"
+    done
+}
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN} += " \
+    ${datadir}/gnome-control-center \
+    ${libdir}/${MUTTER_API_NAME}/lib*${SOLIBS} \
+    ${libdir}/${MUTTER_API_NAME}/*.typelib \
+    ${libdir}/${MUTTER_API_NAME}/plugins \
+"
+
+FILES_${PN}-tests += " \
+    ${datadir}/installed-tests \
+    ${datadir}/${MUTTER_API_NAME}/tests \
+    ${libexecdir}/installed-tests/${MUTTER_API_NAME} \
+"
+
+FILES_${PN}-dev += " \
+    ${libdir}/${MUTTER_API_NAME}/*.gir \
+    ${libdir}/${MUTTER_API_NAME}/lib*.so \
+"
+
+RDEPENDS_${PN} += "zenity"
+
-- 
2.21.0


