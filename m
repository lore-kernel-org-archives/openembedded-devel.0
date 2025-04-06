Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD115C3600C
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 07:23:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.20649.1743924193953046061
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 00:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbimFNlU;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so418846a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743924193; x=1744528993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQApev84XuLG/Kv07OPf4EQ+blogIV/em72siv3S+jE=;
        b=GbimFNlUCIhkWZCYYNLhwdDx2pUHiS0Od6smmqqJF5ok7p2Fw2r6QMd8NQw6aKiuAg
         AQT/w+K2FqvuKnGZK2K1bf6GY7OQBoyXSTnZft0L/87HPrAASZ3er8CfsgwsAk1eD58T
         kj5TRsF0u6F2BTmQKleZEFWQJ/K3lscz5PSe+ww6biJlTlI3stvG6WVzAds2lpwxrMst
         +/65Uo3UhqyjjbNikju4+HPDba1F1vFQBZwI7PvjWtTRLxeXdT0NkzNrMr3GDz9S4r8V
         d9Pq25EZ+f48HC8w/jYhpqnU/488WvjDg/R+8xAg0PZG9+cWjDFjwaadJ/AZyKquHRZL
         Aopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743924193; x=1744528993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQApev84XuLG/Kv07OPf4EQ+blogIV/em72siv3S+jE=;
        b=V64gdP91VAp8kKbFKdZmQrJ0aq7N2sduPyDwJXDt/IxmyoN/2Ilc8DY4hV9gs+fVmo
         mEX4eiBWxKSj+qnsBQY/GT6A3pJ8NqD5II8y6ow8tcBZ3KCaITVKjcayHsCUAOJLyFVC
         rYQNiBQoipa8RNjOrT7HdBkNincjsz5CduDD0FE7l0QQlZgw2hEWL4LL+tpM5LUVoNq7
         urKLlLQWN7EqTdm+cXbtr1qyamEcDm8HXm4u2W6qQhjuo+UDv1PN5KYkycXeSDiyaIy+
         YYgh9nuH35+VYy+uBk/yOZuCxm9z6ikwStF3oBWxjisLYfspgMOtd4hpwu6ToOJDTZFa
         Ztvw==
X-Gm-Message-State: AOJu0YzxrrVqWTFhVkBirhHems3Yj4LufOrssDcfUN+LkbshjUM8piYk
	9rGrSwTLjncGNKcdktOiD1jj+9u+aNAjwvhAOqXfAFJxrBH7dGIlO/0df1xK
X-Gm-Gg: ASbGncuuvZNNNjCw8iiJIQV9ZG58nqz7IlTPKkThxbO2CEi3oZkUQZbhmcuQPM5qnqn
	r/1eFhGQ6ZkCbRaMpzymZjKTljejzLF2Ndkv3DyF5BYQ/SgciFxD7hJBBE1Kebvo9vVgDccRNxj
	Nwob3BFgCazquGWIbwwMJ+VTu9bOeiMByfwyh66i2p3/jSU3rN8aUXpbceHD1a9bacsDWfd8ZY9
	I5ZsjCt0cUCJxwC16FprlHF6yrwHVVTv4CC8/q1PGEqQsfUJbbPUuRxfuSDdSaJfEQZfERDH2B3
	Muc6NQ0NAMH3ljaydbjbmkqct390elLdphi4
X-Google-Smtp-Source: AGHT+IFiuyg5emd5ianVZRksTBfSpWbURq5sq075x1ZfTtPsdYzGmxSpcyLmYD41W0h0mrtPI8SLQQ==
X-Received: by 2002:a17:90b:2710:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-306a615018dmr11584724a91.11.1743924192905;
        Sun, 06 Apr 2025 00:23:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561c98496sm11373673a91.0.2025.04.06.00.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 00:23:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/5] openzone: Upgrade to 1.2.4
Date: Sun,  6 Apr 2025 00:23:06 -0700
Message-ID: <20250406072310.862374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 07:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116605

1.2.3 tarballs are not available anywhere

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cursor-themes/openzone_1.2.3.bb           | 32 ----------------
 .../cursor-themes/openzone_1.2.4.bb           | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 32 deletions(-)
 delete mode 100644 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
 create mode 100644 meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb

diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
deleted file mode 100644
index e47f8c5367..0000000000
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "X11 Mouse Theme"
-HOMEPAGE = "http://xfce-look.org/content/show.php/OpenZone?content=111343"
-SECTION = "x11/wm"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a2f562fb8fb1e138b810d69521c4bcd7"
-
-inherit allarch gtk-icon-cache
-
-SRC_URI = "http://xfce-look.org/CONTENT/content-files/111343-OpenZone-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dc20f97a49e1ff1becf7853ef5f137ed30a4c27490540e755021d78d339efd92"
-
-S = "${WORKDIR}/OpenZone"
-
-do_compile() {
-}
-
-do_install() {
-    install -d ${D}${datadir}/icons
-    for theme in `find -name '*.tar.xz'`; do
-        tar -Jxf ${theme} -C ${D}${datadir}/icons
-    done
-}
-
-python populate_packages:prepend () {
-    icondir = bb.data.expand('${datadir}/icons', d)
-    do_split_packages(d, icondir, '^(.*)', '%s', 'Open Zone cursors %s', allow_dirs=True)
-}
-
-FILES:${PN} += "${datadir}/icons"
-
-PACKAGES_DYNAMIC += "^openzone-.*"
-ALLOW_EMPTY:${PN} = "1"
diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
new file mode 100644
index 0000000000..4b2071eb3f
--- /dev/null
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
@@ -0,0 +1,38 @@
+SUMMARY = "X11 Mouse Theme"
+HOMEPAGE = "http://xfce-look.org/content/show.php/OpenZone?content=111343"
+SECTION = "x11/wm"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a4dd0d1066e1f1224b3bc4bbb206b754"
+
+inherit allarch gtk-icon-cache
+
+SRC_URI = "https://mirrors.dotsrc.org/mirrors/exherbo/111343-OpenZone-${PV}.tar.xz"
+SRC_URI[sha256sum] = "db6fa6d0798aceb56998ce81382fa2246c77911d56b3b06e6aadee4cf5b4816e"
+
+S = "${WORKDIR}/OpenZone"
+
+do_compile() {
+}
+
+do_install() {
+    install -d ${D}${datadir}/icons
+    for theme in `find -name '*.tar.xz'`; do
+        tar -Jxf ${theme} -C ${D}${datadir}/icons
+    done
+}
+
+python populate_packages:prepend () {
+    icondir = d.expand('${datadir}/icons/')
+    iconname = d.expand('${PN}-%s')
+    do_split_packages(d, icondir, '^(.*)',
+                      iconname,
+                      'Open Zone cursors %s',
+                      extra_depends='',
+                      prepend=True,
+                      aux_files_pattern=['${datadir}/icons/%s/*'])
+}
+
+FILES:${PN} += "${datadir}/icons"
+
+PACKAGES_DYNAMIC += "^${PN}-.*"
+ALLOW_EMPTY:${PN} = "1"

