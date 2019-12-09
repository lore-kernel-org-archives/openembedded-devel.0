Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0773B79C92
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:31 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p17so13901715wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ylCbqqV41RXb/WNjRmumFAlymU2zBU/WfsuZA4Eq+UI=;
	b=aR2V9cbj9mvsj5Egwu8qdFYjmNKzliRR1SPV9c8osEKVXA+qTsNQSEYZ+4U7c9dKBi
	Y3wkdjvlAgyFoBvgwXUPYXpg0RcRi9rlIFnsbSOyvrRvxKtNp/oIMtuIAkRaMeVB92Hw
	enm9B6dCFUfawlLpzs+2i75bkK7fqw745mzUplQpxsl39HBNF37UjJbQu6e9UQFIpxWS
	QLIRPdzEuzTshXmAs/XJlBR11qvVBgRYv+iOuMUF8gwN2AfX1H5HagmvJqPArvxQmXQO
	zcUkqz9rm8n1m2/5lDRoyk7/G6kTNWP9w4NPtJLyeajXl4VO1vrFSwQCw+zKtc24XwKV
	oP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ylCbqqV41RXb/WNjRmumFAlymU2zBU/WfsuZA4Eq+UI=;
	b=dEjlrOJzJlIfzfIDo14mc4voxhwl8gKpm0KWcv2+zyQY5ImI2TbEPyd/Hi38J2q/8L
	CwTvNJAWZFrCVyZ0WBOVtYs6GXc63yXH67UipdUmYyNGiDk+OoXtHIsjm4AOZkB4IIQs
	BnOPUaojyGYIdedlJyEc5kgFXZwCWDhtZVgGJJuU4TTfWyluVUFWTZbhBNzPq8+EOiGA
	fTo5IYMvbYAa1W5n4HM+CxZccZQh6lSsmhvZL/Q5YivH+FwEw0LNWoQ5VzNZM9CpV1rP
	q/z+g7eqwnmWKMdQXHbQuTOwxq/nJGfETIc92r6YjqKVoOuqbsmg7MpKl+GFVN9qf/YY
	9t1A==
X-Gm-Message-State: APjAAAWLoFGIEUBQQsT4TXaejKC9zB/R3BmwCTm3At0AstErbjbaoWqg
	qxQghDWDUuH7L5FJQKVPVElFwsu9
X-Google-Smtp-Source: APXvYqx8HfU12rh2wA3sMZOEUNIpCsf6huIDgE9oKX9w8z3Oy7dluJkCkzVhmGw2AqR19cikkVadDg==
X-Received: by 2002:a1c:6485:: with SMTP id y127mr24599482wmb.19.1575880591763;
	Mon, 09 Dec 2019 00:36:31 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:01 +0100
Message-Id: <20191209083612.23922-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 09/20] gnome-session: inital add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
new file mode 100644
index 000000000..e1bf16b5c
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
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
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


