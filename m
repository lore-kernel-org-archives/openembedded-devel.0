Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 93BF179BCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:59 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z20-v6so9975814qti.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wppfd2HjX1eLjFR8pvSa1epjzyDonU0Xic9Cj2HPXJ8=;
	b=RYsJ3eEYmyhqqlLshj3EPEy5WujB2s8/a8qLik6BUXyTVY1hwVAoOmLiXEbOMhxs3e
	tHC3XLXpE4cvbhJx7oa7NXhHTFsPJi3DEwGdLEiJxoA8ZbP1K3Rz0MpU6AixzAV9nh0J
	r7PSS4Seaq7eJZvyKdm4qAMrCbSSOorV4HfLbGx6CScQp68fzwZNDP3KV4q/UwfgvflF
	nY+A4Fm7shkXHMyRn3/kRYkQgMpLJ+aBPlwm6aVa96eUgtGIrT/AYKmYzBF7HFTomY3d
	f8EK/t+2FaCVozx4jbLwIOLTIOiZCv4YRVS/zGAV6iga7YBfZ7WgdpYbRw2jSNKUHILz
	p3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wppfd2HjX1eLjFR8pvSa1epjzyDonU0Xic9Cj2HPXJ8=;
	b=B9dMcV+IFu6tJiQFu3NVFDDjP0D4Jiq6vzL/CqYFdd52o9DcRaBXJfROTRufVtrZVj
	GMHr0LUMKMik/HdYphcwWaBYcWBb+kPwHH3B64HWj2MSQc2/v4OPXaMqWqnMLvYmLpUI
	t8d5oBS3FsAF+QVUfxxsHqy+Bp9JRcPICLjBHM8wZmYe31Fk2wM85SfHxtcnuZZBHwp/
	gWdSsdqxL+MrJb/28qCWDVGzYKpejK8OCo6xOq0d/ZF7/7Bd820zofC/hRCJL1xP9HAa
	6VhPrabF0aTqHjJHDIgmTo6w0yAYAqFrBv6RarRXJce5++yizXHndcjnV6RdTcU1Hbt0
	UzVQ==
X-Gm-Message-State: AGRZ1gKwcXV0wL0JhoZ5Pz4vJfXJmFb+mrcaP8xzT9Pf5GV/n2SNrvT2
	eiq/0c7VsIA7DCj5uAutACEk/eTN
X-Google-Smtp-Source: AJdET5fae1ZlOeiBV2a6Xj+JqAEvYkRhEFo2s39T8coDTKzH8ecKvRrSgNNxXZ3Xw6qnOz0jh5KgMg==
X-Received: by 2002:a0c:b211:: with SMTP id x17mr13404169qvd.153.1540831320313;
	Mon, 29 Oct 2018 09:42:00 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:59 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:12 -0400
Message-Id: <d84e5b262a493ae9fe761ee9e22fec8f6d2dc59c.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 15/16] gnome-shell-extensions: add recipe for gnome-shell-extensions
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
X-List-Received-Date: Mon, 29 Oct 2018 16:42:00 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../gnome3/gnome-shell-extensions_git.bb      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb b/meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb
new file mode 100644
index 000000000..8c02195d9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "GNOME Shell Extensions"
+LICENSE = "GPLv2"
+DEPENDS = " \
+            glib-2.0 \
+            gsettings-desktop-schemas \
+            gjs \
+            gnome-desktop3 \
+            gdm \
+            mutter \
+            wayland \
+            wayland-protocols \
+            evolution-data-server \
+            libcroco \
+            polkit \
+            gnome-bluetooth \
+            gstreamer \
+            keybinder \
+            gnome-settings-daemon \
+            ibus \
+            librsvg \
+            python3 \
+            sassc-native \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"
+
+SRC_URI = " \
+           git://gitlab.gnome.org/GNOME/gnome-shell-extensions.git;protocol=http;branch=master;tag=3.30.1 \
+          "
+
+RDEPENDS_gnome-shell = " \
+                         gnome-shell \
+                        "
+S = "${WORKDIR}/git"
+
+EXTRA_OEMESON += " -Dextension_set=all "
+
+FILES_${PN} += "${datadir}"
+
+inherit pkgconfig meson gobject-introspection gettext
-- 
2.17.1


