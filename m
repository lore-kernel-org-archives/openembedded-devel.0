Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8772D61596
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:43 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id ep11so553428pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/THZ0Wy3BzTVuY+EBJQTKz5dI5bOvJOsSWOj8kixLF8=;
	b=gmn8dFyWJSfcyWMdjYJHLIrvfzKiMGn9cT/Sp6bAfyWoIHiLG7SPw19zy2Sr1xBSGL
	H/4IA98p4gbaL3oi62qQobNlZWvG7ECDiW2+Ibd1KW8Y/0sscZnhYVwEo68LIloxXmHO
	DXkRI9WmzAFfxuA1E+FvNJXRsmJ/1n6AcVKw14rOTRMuinBboyP188K5CI/zChOoT1JL
	0jbvPfGa6IZPXEenigp6Z1AMaxlkuvvyeE3bEG1rgpT9XhMhhVKnhn8xjPqcZOiOgV6+
	3/m+gBg//aSCUHd+5uiW7yqdOROsOB7RXVKKQxxdJ8PRUrDvMfD3+4dHbIk3nH3eiyr3
	fl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/THZ0Wy3BzTVuY+EBJQTKz5dI5bOvJOsSWOj8kixLF8=;
	b=snwXX4xWvIU1kflZ+aorLA8/PRZGaw4XbStPnUXK+Xx4oQSBezCpW7b5tGxnW5UhSf
	KMNIAjuIepXIZd30SBIMwvtnOajEgM/USYMgmnWO8S+3h9lxV1d4H3xhNABhle0XHi1s
	CJv6pXUuvlB3d2NIgZ41c6VnhlowBcXHyNhf+ElszBmnbQimhW72ufFPuJB8Wuoyr1x/
	3SwdeJLuv4TV5w/HPDevvZGejD9BXDW+blkePWYd7iRAVJpcq0KG2YpjKAZxh2Up3Nst
	m+qJTteryK4bcqzv1LyDXkuca5bFSFWLP+HvovvzBEr3JKGFYAaq/cxDy5PE7E6XA1+n
	LgIA==
X-Gm-Message-State: APjAAAXDDmJmSnIWi2vjUgH1F10a8CgzeNeb/Je7dz64IaHtXI/yjQvx
	YG24JTWekwc2drSjbocWkRz3e0SXj1Q=
X-Google-Smtp-Source: APXvYqyXgC75TUkZujRtEYwZusPKQolzOcep3ka2iACNaqSlus0I+u9gTjcRQoDT7DQx2r94g9F04Q==
X-Received: by 2002:a17:902:6809:: with SMTP id
	h9mr19283632plk.32.1582007024255; 
	Mon, 17 Feb 2020 22:23:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:42 -0800
Message-Id: <20200218062348.3742529-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/8] gssdp: Upgrade to 1.2.2
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to using meson
Use sniffer via packageconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-connectivity/gupnp/gssdp_1.0.2.bb | 24 -------------------
 .../recipes-connectivity/gupnp/gssdp_1.2.2.bb | 20 ++++++++++++++++
 2 files changed, 20 insertions(+), 24 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
deleted file mode 100644
index 6088ef1954..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Resource discovery and announcement over SSDP"
-DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.0/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "b30c9a406853c6a3a012d151d6e7ad2c"
-SRC_URI[sha256sum] = "a1e17c09c7e1a185b0bd84fd6ff3794045a3cd729b707c23e422ff66471535dc"
-
-inherit autotools pkgconfig gobject-introspection vala gtk-doc
-
-# Copy vapigen.m4 so that it doesn't get removed by vala class
-# (normally this would be the right thing to do, but in gssdp the vapigen.m4 has only a custom macro)
-do_configure_prepend() {
-        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
-}
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
-
-PACKAGES =+ "gssdp-tools"
-
-FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
new file mode 100644
index 0000000000..ddaddd2094
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Resource discovery and announcement over SSDP"
+DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+DEPENDS = "glib-2.0 libsoup-2.4"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "f00a470ebcba96f34def8f83ac5891ed"
+SRC_URI[sha256sum] = "cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+inherit meson pkgconfig gobject-introspection vala gtk-doc
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
+PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
+
+PACKAGES =+ "gssdp-tools"
+
+FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
-- 
2.25.1


