Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id EC0717F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id t14so5624866wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AAQD+qcLjKcVjBLxZQP9efNbG8SDRgVu2Z/6VcTevF8=;
	b=C6vEFBneVkt6LvHvImevHN67uuqx/B9XOWpiLlv7/VhOLdI/zkwBI2DxCgAVEfBqA6
	o5h6lklIiPF1xaHbQLCEwfg//dELJonkJU1HaxyF5/HGjnVdb1UYzwvKHN+fPbqms8Mo
	p+7YTvlJ7M2SNkq/EY1GDKd2h3KT2+PKTPkN+sDFVOvUOewh2fWzzPU4kl/UZyqfIdA1
	KLxLpouX3p/gjvBtmMUAUqTAMwIoB3fFGsopDQbnG0NyM9DULiMNJSWPIV79ohYVYzHg
	N+HRrNd611ZMwqgVkvAK8U1YBVZ3uJvhBmpj38wkeFsmSD8KxRgl/yL7Eoi0YkVXuSW0
	WnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AAQD+qcLjKcVjBLxZQP9efNbG8SDRgVu2Z/6VcTevF8=;
	b=RO6T8GauRAEyHicOW7N7DHQqPvjCG/jR4tj/Ok4ExuvLnLnr//4d4GD9dtF1sAxCK/
	cuIeRZG+55vyeU3clI1EO8gIC+4V4vISJlpSVzdbvrhuA8djI85lmGUrkHIj/kmrT2rN
	zd1hxkLhRqGWpdD4sin/RBZzuEeeoTTnMwt+A6N6RuiEdP4l5i3cdJaDWo34hqr6DIWG
	kJGXlRGWMw7eAq6sCg2ZLA7mjp8TXiw8hVcrj/xLZ4vKVmPWfKezCPn7En8O8P+DiwK7
	O/8IO3YwEcnn96MRGnf3iLlA9ZpTiIK+Le1TnEXomX0+QpN6bdujDWC/wSo6es0h/vQ+
	DK4Q==
X-Gm-Message-State: APjAAAXTZZNViqHlJfcCzyeQuuP9B4PFn0Fgp3SehY4+iQc+iB0mPuLS
	+Z8ArOcfTpsyGFiO0gTfJaPO8ELK
X-Google-Smtp-Source: APXvYqwQcKfV02lQqbpP2oxFRJ7CMuIns5jmrDmOz0lJo7z7DUHpDvPsNSO9OUGWTTkPvcd8JnHI4Q==
X-Received: by 2002:a05:600c:204c:: with SMTP id
	p12mr7678774wmg.61.1575590980532; 
	Thu, 05 Dec 2019 16:09:40 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:07 +0100
Message-Id: <20191206000912.19841-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/21] gnome-session: inital add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
new file mode 100644
index 000000000..dba03b928
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "GNOME session"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = " \
+    glib-2.0-native \
+    libxslt-native \
+    xmlto-native \
+    xtrans \
+    libice \
+    libsm \
+    virtual/libx11 \
+    gtk+3 \
+    gnome-desktop3 \
+    gsettings-desktop-schemas \
+    json-glib \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext gsettings upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "1a9c10d5468b3ba8abee94653692fe0d"
+SRC_URI[archive.sha256sum] = "d7801fe2d5a751b19cb58081771316a76aabd5c550cd58d4e4c6a5a4ed356660"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit',d)}"
+
+PACKAGECONFIG[consolekit] = "-Dconsolekit=true, -Dconsolekit=false, consolekit"
+PACKAGECONFIG[systemd] = "-Dsystemd=true -Dsystemd_journal=true, -Dsystemd=false -Dsystemd_journal=false, systemd"
+
+FILES_${PN} += " \
+    ${datadir}/xsessions \
+    ${datadir}/wayland-sessions \
+    ${systemd_user_unitdir} \
+"
+
+RDEPENDS_${PN} += "gnome-shell gnome-settings-daemon gsettings-desktop-schemas"
-- 
2.21.0


