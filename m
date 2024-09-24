Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E879CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 03:32:50 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.5710.1727148765773529984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 20:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpXbEQKQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-206f9b872b2so40723345ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727148765; x=1727753565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0npDqlEJr4FxkWSQZnDgkSzVFM5bwz7asn8O0d6KlzI=;
        b=VpXbEQKQ0xwETP0ZDJJixWtMEujKLyPikmC4D19gaKUiGQXToDjTo9/7YRLOpq8V4m
         6XcPiJnwZnrp30qyAqc/JyYH8LAoNxuotOh4Hzgjy27s79lNC0B8hWSv4ftLPbllNW08
         9pwr2Tbk8Kle8KbqFosoImL5ho2/DoC5XRRpLIz2tS5/ezu51c1RIENZY3mqG2nVRldV
         hSxU/KWmBo/o3UV2YCltS2qkvxbpqNVblI4Q+InLhBOtWFxvT9KaTN1GpcSlriEXL40E
         1gmMJmmg323m3JxxqCifB9hLzTGwSJpvxLKWAci5iz3IaWXigAd3wSp+Y9rS4t4WYj1e
         U2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727148765; x=1727753565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0npDqlEJr4FxkWSQZnDgkSzVFM5bwz7asn8O0d6KlzI=;
        b=N6IklGosNNjl1LUvtVGMpiWnQGEaSWaUU/sucYdppkh0ZL98gOmZTY3VctKzPrA8SL
         ejHmIJdqhkiGnR9Kq9qFe2OaP3Zo34y1/QcIEL2g/Q4M7R+XT3Idhjabt5WTQoJzPIOF
         UGFFgQakA3FxmIcc2yH/pFWtWo0Jt77WVuDDgdw/SNgBPLcnsV2aFxoRmo8/eiqDLKY/
         ywtz0pBrFj1XEuXQ+CDFql9A+CKkHxIK3TpsdhpZaSs9oVQ1+Fkxaj5L6Rvrj36tF5iC
         8anuMqMvoaoDOSgeDo1NFNEfevnFK8xLuyklVkqtVJKQf5x7J7HVtWdrsaAvnI9ubpPm
         7ssQ==
X-Gm-Message-State: AOJu0YwLa/QXjG5d/PNWLCIWGKNv872nhEMZRL7HeD5fI4RwpHb9jdY/
	1YcDWNF5GlOJF+sfZy1xmXnUgohtljALGmwGBev+z30fDwbsGKsXHrt1i4UR
X-Google-Smtp-Source: AGHT+IG3ExdyBg9cAP8CW5Ngn8th2UmFNHtek/94NgcBByb46bYCdjXkhNlpMgwYY2ZfSPUjIzK3fQ==
X-Received: by 2002:a17:903:2346:b0:205:753e:b496 with SMTP id d9443c01a7336-208d97f0550mr156132785ad.3.1727148764891;
        Mon, 23 Sep 2024 20:32:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e660])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af182fa6dsm2359175ad.233.2024.09.23.20.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 20:32:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-user-share: Fix build issue found with musl systems
Date: Mon, 23 Sep 2024 20:32:39 -0700
Message-ID: <20240924033241.2527463-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 03:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112465

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 ...ine-list-of-libc-feature-test-macros.patch | 41 +++++++++++++++++++
 .../gnome-user-share/gnome-user-share_47.0.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share/0001-build-Define-list-of-libc-feature-test-macros.patch

diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share/0001-build-Define-list-of-libc-feature-test-macros.patch b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share/0001-build-Define-list-of-libc-feature-test-macros.patch
new file mode 100644
index 0000000000..fbbda824e3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share/0001-build-Define-list-of-libc-feature-test-macros.patch
@@ -0,0 +1,41 @@
+From 5f2e3fb82055ee1346eaa20fcca640fc802ae1c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Sep 2024 03:19:24 +0000
+Subject: [PATCH] build: Define list of libc feature test macros
+
+_POSIX_C_SOURCE is needed since it uses kill() API
+and as per [1] it need it, without this the build fails
+particularly on musl systems with clang compiler
+
+./git/src/http.c:394:3: error: call to undeclared function 'kill'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+[1] https://man7.org/linux/man-pages/man2/kill.2.html
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-user-share/-/merge_requests/27]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index ea2892e..72f3851 100644
+--- a/meson.build
++++ b/meson.build
+@@ -39,6 +39,17 @@ config_h.set_quoted('GNOMELOCALEDIR', user_share_prefix / user_share_localedir)
+ 
+ config_h.set_quoted('HTTPD_CONFIG_TEMPLATE', user_share_prefix / user_share_pkgdatadir / 'dav_user_%s.conf')
+ 
++#
++# OS/Compiler feature detection
++#
++feature_defines = [
++  ['_XOPEN_SOURCE', '700'], # POSIX.1–2001 (IEEE Std 1003.1-2001)
++]
++
++foreach f: feature_defines
++  config_h.set(f[0], f[1])
++endforeach
++
+ # compiler flags
+ common_flags = []
+ if get_option('buildtype').contains('debug')
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
index 4c8ad3a2af..8e4b238b85 100644
--- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
@@ -14,6 +14,7 @@ inherit gnomebase gsettings features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=https;branch=master"
+SRC_URI += "file://0001-build-Define-list-of-libc-feature-test-macros.patch"
 SRCREV = "77ecbaddab0ed2121859926acbfccc9cecdee0db"
 S = "${WORKDIR}/git"
 

