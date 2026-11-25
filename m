Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37927.1795594079935985918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wT3Xk8pi;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3863db981d4so7616151eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594079; x=1796198879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmwW99nFS8f7ah2f37miKa2k+ZkDXQj+1VufwbfMEkA=;
        b=wT3Xk8pi4kO6OC0rSm7nEQghGHyvDNjBS0OEiE5fR1s1h4hBTYTAP0z459DsgiYqOc
         NgULj4k4c7UnihRbwMUla8FzgriHvg0PATLfq0rEWhhL3cRuZl03jC9dyvmqjJAUuLX1
         yfg5KnDLMWubcacu1zWQATOeod0E3NsW4L1rcYyEUQaRg8G5BJBf/FIoeJS+Zt8gXNLu
         XK11Mffwg3WZhrbdaIQvpJ1Tn0awfhESKaoULuMjKSMzmUEFFPGG+bYKVJWAd0+UM3IV
         JTdfzEGXuaKSjUnTsKRW5NsB+dcLVnFxgSKB2sq0CXbaVV3CEiFT/1lWQoDbcgfMYF6J
         R/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594079; x=1796198879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmwW99nFS8f7ah2f37miKa2k+ZkDXQj+1VufwbfMEkA=;
        b=tdUpfdiQhivvMLOmruKbMXF+rzSkiWHsQBo03C7zWN5EJAR3+h0eHneU+3wDnpaw9M
         wMar/gRnlf8zWRo/RVWtmjShI4r+HmwtWLqxzuE1K9U4cyjV7m6vjFNyEArSij16dEvN
         cFh5uHnh4JaVxI3UFJc8XzSp7RGtuHmsL+U3CE+G3NsCRJpSOKUtWI/fFO/ZOfYkUNzA
         V+Daw8bpWdI3MPsPDQGcBjv4lSIF11ASXMlCmnOveXbCwHPhSeOmrYzLdJzir1OziITz
         pIVNDZMNR/wk4VRbp/xMxvU1jXUd07ZF6hn2TKnkQlTN6++F5aKxyuRVT4EIOD5s5oI+
         llxQ==
X-Gm-Message-State: APuU4Z8nNSJliGwjymI5AgKACVHWDG9xbaSFPzHudIrEwq8OGY7ecYMj
	0TQ0GQ+ga6PPwEQBakiEV5wz+FEfxVe450pW1S5Vr9mWlGtYNfYeHH/a/EahYFyz
X-Gm-Gg: AZFdTZc5oLd7CimFJtfe7IoOUapXZai7xYFHyL7wH8Nhz1pz+85w0YWIPcwmsdrlFl8
	Ha6qJjaCX7Eai14uqjMdnF7BozKfGV/nBfxWLO/O5AZz82E9vl4sRjaPCyfoD7E6ZraGhMxoCE9
	naWZZZngnmohUoIhIpiIJ2NCW9t7sNMvp6nXllnl5y/NtIFxMNRPcHWIV0wFD+kPP6F9HqwmcO/
	TMg67sk/VZnbTiPLdYVCa7xiihW6BbA12ihliHaG0Gn3/2dfM9DnlKyYxPOg28uHzKbU6ST+9kF
	tQHLoAVxrv5JMSzE6QwcZPsWx4B5diLhXudPB3DjHnUxPjaqUO8Fz6VKxf1DrmlYQu3YSJ/6AQ1
	gHVvTEfp+Z1bC/c82KjJCdbFDKx07h2WfZDgRruyZyJCSwXyl5u3pz8BGY7YTKXL+VQUMEjw6gV
	LLDZRcwsUMhwr+Y1fFmrXhPeWZfPCwmFrTmaO68v6m7wPh2ad8U0y6F0ALf4N2h3JEPrteLojAP
	IlQk/Tw4EZYGBihrboBHsZiDH4F2QhkQfVSD8pRM+SZblcIKz3sWUoVyZgTzjUKBkR35ZZZn251
	SzlLLMuK+2iF0ncRbz2SBDoieu/1gFo721iQdCmMXg+65mGE1FvN4RhIR4/6ppaQRG+bmaUwaQi
	Z3ylqLOcazVWFDa23+AgYK++dK6SEKtzfAuBcbCYRAR6pT5Z/xDEV8JTELIGajE9MHzWh9H+VVb
	odt4kIJexL8xNkAlEP+xaxqQQH5woSyJCvqYoDoY1L4y/l0kSOF1VINq2G+wvamhBnUxHtf8kaI
	LOi3gxS+bCcYsYA+Dkf20ce4u8fqj3BD4xl19MH/OMUtAwxMN7wAQKt6g6HtjkqPi7k2pvfhShc
	2xKn
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr10567399eec.11.1795594079227;
        Wed, 25 Nov 2026 00:07:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/55] adw-gtk3: upgrade 5.10 -> 6.5
Date: Wed, 25 Nov 2026 00:06:29 -0800
Message-ID: <20261125080732.2419614-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133016
Content-Type: text/plain; charset="utf-8"

- 6.0 brings message dialogs closer to libadwaita, makes libhandy
  viewswitcher buttons look like normal buttons and tweaks colors
- Later releases adopt libadwaita's classic notebook style, adjust
  titlebuttons and OSD/column header styling and add focus-ring
  transitions
- 6.4: the GTK4 theme requires GTK 4.20 or later, since it uses CSS
  @media queries for the dark variant
- 6.5 targets GNOME 50 and replaces deprecated sass usage

Since 6.0 the theme is built with Dart Sass, which OE does not provide,
and its SCSS no longer compiles with sassc. Install the CSS from the
upstream release tarball instead and add an upstream check for the
releases.

License-Update: the release tarball has no LICENSE file; use the common LGPL-2.1-only text
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gnome-themes/adw-gtk3_5.10.bb             | 15 ------------
 .../gnome-themes/adw-gtk3_6.5.bb              | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
 create mode 100644 meta-oe/recipes-gnome/gnome-themes/adw-gtk3_6.5.bb

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
deleted file mode 100644
index 70da55c137..0000000000
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "An unofficial GTK3 port of libadwaita."
-HOMEPAGE = "http://github.com/lassekongo83/adw-gtk3"
-SECTION = "graphics"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
-
-DEPENDS = "sassc-native"
-
-inherit meson
-
-SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main;tag=v${PV}"
-
-SRCREV = "c2e74c9d2a5c3895b8025ac1d4b9e4cced71fbe9"
-
-FILES:${PN} = "${datadir}/themes"
diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_6.5.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_6.5.bb
new file mode 100644
index 0000000000..1bbdd1abf9
--- /dev/null
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_6.5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "An unofficial GTK3 port of libadwaita."
+HOMEPAGE = "https://github.com/lassekongo83/adw-gtk3"
+SECTION = "graphics"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"
+
+# Building needs Dart Sass, which OE lacks, so install upstream's prebuilt CSS
+SRC_URI = "https://github.com/lassekongo83/adw-gtk3/releases/download/v${PV}/adw-gtk3v${PV}.tar.xz;subdir=${BP}"
+SRC_URI[sha256sum] = "a81780fadfc432be0fc3d89c4ebb41aa28e4f032d42c36f9789c57dd10cfa41c"
+
+UPSTREAM_CHECK_URI = "https://github.com/lassekongo83/adw-gtk3/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
+inherit allarch
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    install -d ${D}${datadir}/themes
+    cp -R --no-preserve=ownership ${S}/adw-gtk3 ${S}/adw-gtk3-dark ${D}${datadir}/themes/
+}
+
+FILES:${PN} = "${datadir}/themes"
