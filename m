Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id AF3337C37F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f129so9317160wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BUSuoubSCuWgLcjxbg+BqNq/iZ3zPRsIqYvQodZ8FMc=;
	b=c47nwdgFUTwx0fhPiWY/Bajy7y8OL2M8gU6G3KxlE3ob282EmTerJIaOdJsyidIjkS
	kHOeDxhY6IyLr9eBMLYoEbVTRN6//8HhoERY6gwnoPpnmXUuoKpmW7eQ1sv28QRUMhKV
	NaYgdokCSxj+yynGCw/FsPYX540J3qfo6CGj0hwbWMe7Y6J5lUv3DRhct7wSOOIUDjuA
	87yK3CtuFzljZOihtc1GeqZs79WGEj5ucS4KCKX1kjY7T9T7qf1hCQnoZak0GpTQfkk+
	6PT2RTx00/6x/1GXvdHJ82X3Hs5qMTERABT+IQgc6tA30qivmgUPwRQve21khuhlvF1M
	wI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BUSuoubSCuWgLcjxbg+BqNq/iZ3zPRsIqYvQodZ8FMc=;
	b=bqHsJv8cyRJBtKJ5lvgSkkSF3fUjggFhuH/1zkWXM6pgYc076HqHOhhBrwzj//BSuv
	lGnqxtkrnGUZAsrq/UTmXqxjMs3lEJ1nch/ijOxGp/jXv5i8YikTLF5OsH1lEwgZUr1i
	dBJe4e+dMQOQlfGQvt0wfoaRyTApNUNfiI4/8of9ey8P31SDasHnc5IwLWo0qpE5Kz0a
	09QrQkfOQca0Mp4k2wDRikaa4ct/Gtbr7altkl19QE9SCMV2fyOUEBT0SRptsvfKJpE6
	rMKX2HZCuzTixvd/YcqOADntXcXXwjRrfpxFRWP0NtymDMlnkXjnL41VmgsQh0ewZL4M
	hpJg==
X-Gm-Message-State: APjAAAU4AkTNykL1oC2C7H/rOBvU7mERyq9cI1g2rL/fN0uhUiiPj7/v
	r7TW6zwTuJESjojIQX8v9qyEhIXg8+c=
X-Google-Smtp-Source: APXvYqwJKV/yx03sZOWHH/FjEO8j4FkQLNzK2vl3LMGikm8RJ7LqNmd0uFWuUSWSOhrdIkAOVtVjVw==
X-Received: by 2002:a7b:cfc2:: with SMTP id f2mr19361267wmm.44.1577482292105; 
	Fri, 27 Dec 2019 13:31:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:03 +0100
Message-Id: <20191227213120.3930-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/23] gnome-calculator: initial add 3.34.1
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-calculator_3.34.1.bb                | 33 +++++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb
new file mode 100644
index 000000000..b09e34d4c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "GNOME calculator"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SECTION = "x11/gnome"
+
+DEPENDS = " \
+    yelp-tools-native \
+    gtk+3 \
+    libsoup-2.4 \
+    libgee \
+    libmpc \
+    gtksourceview4 \
+"
+
+GIR_MESON_OPTION = 'disable-introspection'
+GIR_MESON_ENABLE_FLAG = 'false'
+GIR_MESON_DISABLE_FLAG = 'true'
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext features_check upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "9157b93a3f41fdad80df26c062b95c7b"
+SRC_URI[archive.sha256sum] = "4d5348c2fbf01d040a2cb5e84de812c503911e1ea498a83e7eefff52c4417051"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+    ${datadir}/gnome-shell \
+"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 642e02680..522e9e9a3 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -11,6 +11,7 @@ RDEPENDS_${PN} = " \
     evince \
     file-roller \
     gedit \
+    gnome-calculator \
     gnome-font-viewer \
     gnome-terminal \
     libwnck3 \
-- 
2.21.0


