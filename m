Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFF7CEBF97
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:24:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2476.1763432644046978610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EXdoN30L;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7ba49f92362so3774557b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763432643; x=1764037443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/9hIDkhESH+Cw8hm043T0kBa68AdDQLvT5TplC8s+8=;
        b=EXdoN30Ldvlv3Ed6bNIhT66BEPZ4NlGURaD+DLSMIsI8TvfXkOW6UTVABWwWtFBtlt
         4QgCDFyJrZ3FlL1yfUDTsrgyzC9ZXscJVsxK7jm3vSJCj8g2Xc454IUGAFj0ivbevPtu
         GwCZ94xbA5/nMr4Q8GQl7NaufVuvEAXZoKBjN/B9+fMr10UKU/rtgIvkf4Q+goNCHqHH
         bpGpkznsx0rmW3c2mE9MlE6zUP899++uBU2+XFx7kLSZJUVWDwc7uVM9Jp82K78+cIjd
         kyrQYbR3iey0rKUAfT4yOaLDVhMIEJGP6PsZHiH5UJjpMp7XKivkvpMohlKrnLai+Bnx
         QzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763432643; x=1764037443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/9hIDkhESH+Cw8hm043T0kBa68AdDQLvT5TplC8s+8=;
        b=NJSqqZ3YhHBTA5n6kl4LAkh9Yhwthxn1AqnwweDQZ0dfwxZ3HbMDFy7pTxjsj6JZMp
         BrIbNo8/l9LT3VmCulC/EbHhJlwOZonaKrhe4GhSrqy48Xa4JKuJVv+GLGty4z82+Ysy
         cXc7Xx+GYv4a2yf1u4OyUcmMxPDaFFXR4tdu/HphiuPbIO8if73qEldxuieYv7xwBlRG
         FDqwxZFImmhFLl7Xqkpdc+FegtLyq9FR+6uVUQLziTveUHB9xoZYVCKoZ0vzfFc6M/Tc
         c+Gtatl7hB7yU1H9AoatR/dO2Ry7jUH4C05bJ9EnUSHjtLqOXRpnIIW8UWP9DpzqA+O2
         K2LQ==
X-Gm-Message-State: AOJu0YyUJef1etHY/gtFhVRl0wqkTQFcJX7eITwY9wIZBZTKt6xouUjs
	R30SPIgshnI/QZmp5SqUxzsfASRVjGcQa1/haUXXJ5mw+vvljsDN5DuVgdPHcx5W
X-Gm-Gg: ASbGncs7rC2T2/WtP1ltWLFZPYHyUbBnuGo1vDb4J9EUOfP+vuwnZKLCCJTca0YNS0Z
	zkGxCgVnej3yZrkhwkL86mhIdV4YSNDU+4/wYx/ZAKU0aR52Qp5KKXXgtUWC0sMSN+dttU7Gf4H
	Rh2IYL/X7T5o0AKBUVndHD8xhLss9IkJdbf1F8mLnyhZE6YytNGieSslblRQGU3A/CRkhye1AzZ
	5/vL8Da2SiJgaMN6hgUi0tgw89uVHAvvxq19jFmnLL8If2q/opWq0oINhDeNz2g0eUi0cfUHykT
	/Luzit/KJBi37KdcEFUIMxpFjDU2VCuB+QZ9buir8oq+vj5YtoZ/lwwYOETIxWwJKH4dmG4yBdL
	KNOucxVUl2nN9O35gnalWrunE/9Y88rKBIFlUdRGd0G92m1zbXfFtgAlPmxun9y80G0gGHLyaR8
	LhsSl1aGJ7ssn18m6NOLKrasqOulATA6ClalUSB58a/4b98dRF5il/h4CBl0vhzV5FJW9qoUVDS
	Popd1XYesQvPTyYYvrWWwFvnkAp9XICvqzfzI+5G8k=
X-Google-Smtp-Source: AGHT+IEBFJMqkPf+Oa2q14ClJjIPMPyBdtPr0/BDhoEGFS4ZxGznVqTWrfmAzdxRr0kjzgmu2FF2XQ==
X-Received: by 2002:a05:7022:4083:b0:11b:9386:a38f with SMTP id a92af1059eb24-11c74fb20f9mr617838c88.22.1763432642507;
        Mon, 17 Nov 2025 18:24:02 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608861asm36829873c88.9.2025.11.17.18.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:24:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] gtk-layer-shell: Add recipe for GTK3 version
Date: Mon, 17 Nov 2025 18:23:59 -0800
Message-ID: <20251118022400.3733149-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121798

This is needed by xfce4-screenshooter

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gtk-layer-shell/gtk-layer-shell_0.10.0.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb

diff --git a/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb b/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb
new file mode 100644
index 0000000000..2bfe9b0e77
--- /dev/null
+++ b/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "A library to write GTK applications that use Layer Shell"
+HOMEPAGE = "https://github.com/wmww/gtk-layer-shell"
+BUGTRACKER = "https://github.com/www/gtk-layer-shell/issues"
+SECTION = "graphics"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE_MIT.txt;md5=ffeb3391e5dace600b84c757688b9f1b"
+
+REQUIRED_DISTRO_FEATURES = "wayland gobject-introspection-data"
+
+DEPENDS += " \
+	gtk+3 \
+	wayland \
+	wayland-native \
+	wayland-protocols \
+"
+
+SRC_URI = " \
+	git://github.com/wmww/gtk-layer-shell.git;protocol=https;branch=master;tag=v${PV} \
+"
+SRCREV = "3964966d72ea3359f4ff748081493e979c080b7e"
+
+inherit meson pkgconfig features_check gobject-introspection vala
+
+EXTRA_OEMESON += "--buildtype release"

