Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D081AE8B386
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 00:20:02 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8307.1770164396629351401
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 16:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tn7qicIq;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649b31e9010so272077d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 16:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770164395; x=1770769195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fuHdF4EiPh2HOnen5nnPdHUYacYsSXDCeQxHcVXrKo=;
        b=Tn7qicIq5Sv7qq3nQHxl/Azbzrpk/XirroiKuLifcZpmALIF6tPzkKONQ5NJG4+1/q
         FdfgIzB380HBjPrNK1620Ob6Rdvv0jb2fUpLg9aN6cEPKED3NvAroMtiJM1+yqPTU1lK
         XEuVts4n/v56PU5QbCzhtjN3bj5sNxEwApARmA45s3Ix7G1MZlT/opaFkIYqwDw2oJJj
         nV8+63sEyo5H2toUZ2M53ekxK9NRAY9y4bSrzrkJgD7JZ7aAkBxlLgyy6B9vhT+BV7gk
         uEgCuVAJs8y3UK5DNSvs1vEVXcZxFB41+aibSmq1CAfrcPMadxdHEvXc0dGXr136pXwL
         V6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770164395; x=1770769195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fuHdF4EiPh2HOnen5nnPdHUYacYsSXDCeQxHcVXrKo=;
        b=eOY3Z10zaljQU7la1zbHR4etjxSZqhRH1FxePkng35Y5CV9TSkv1KXWghKSfo4U46j
         CrcqAaB/6pY3LabQXrkNJGCaNy2hGYblz3/PBdED/W/rgY2OP5yWsllXQNi2HkErJyZD
         EdzLVqJmWl8T82YDxasbsXvPLxc1wQ7uly3T7ibcBvlPmn43LxSbptYh44I7+YiebSUO
         HREdW5HwpL9JkAnDGmS1EjTiiMmjUBAEeQVbr43zHpukDbnSvMtDJ/G0D219WbHxoT5L
         Mf82px76gz3TvsDT2tx2lFEZ8nJkg7rNb5lbd5V+pYojaq6H0T/8ieyJJKnAThVtzYxC
         z6Sw==
X-Gm-Message-State: AOJu0YysRSpBSeF6A9nbSe/ylFjrHn6SWClN+k3DeIcfpE14u9/p38aE
	k8PGfsFi6XT4BQxJDQ1ekn4BmtYis74tJ766zM/0p2NSYOLaXKEFCst+YT3TSCl5
X-Gm-Gg: AZuq6aLRtOERlcW/0WBvbXdAd4I91RPOLyLjE8Yh4nSplIJCPKalEaNTcK1xThjJzcI
	+VpnsQhqXkBWk7Oc1qBoUbVrMntOfgRgelRiiY26ZFJinUCiWCEkBjyJSfBFE9HeIGsY49xxuLl
	skh2fcg+Am6a6qaVZBuHZah6H8rXKYkTTSXM1NINczvIQKm6zH3OmEPz78AWunM36r3okeYvd4v
	4h2kF0SwEuhTuHkvXvTcwqskCR6zt3dI8h4C0lzxLgHEK27mzK9W5rKvrjbEWQHlYkTUvtR5hTg
	1BDOAWQ7FQlIOwWnVbC3rXX0Uzi9Tj3RGm0aBVqXiEV5chv6ve010RdYSXrr88JT2ox/RxbAQYG
	KxTQBPt3kIClVZnUNDCbZnhyVst2BYLGO/VVidB0bWIB4RkqUVv6DkDzNVSem/NL5CPZaEk/6EG
	C5TghT0q47p3G+OaQ8BhMMxpEQI5NDAKr15a6OPV6wAUd14XLRB7ifDMLRIfDR6Wt6HiLIr1v8c
	7ixcxn68mPQxjOX3mLOHVCm6c4GKk9Mw8npOg==
X-Received: by 2002:a05:690e:bc7:b0:649:db62:aeb3 with SMTP id 956f58d0204a3-649db62af42mr1128056d50.4.1770164395134;
        Tue, 03 Feb 2026 16:19:55 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5c9ebbsm895015d50.17.2026.02.03.16.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:19:54 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][scarthgap][PATCH] Use https when accessing archive.xfce.org
Date: Tue,  3 Feb 2026 19:19:44 -0500
Message-ID: <20260204001944.4156-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 00:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124114

While using devtool to check available versions, I noticed a 301 http error.

Specifically :

$ devtool latest-version libxfce4ui

Resolving archive.xfce.org (archive.xfce.org)... 217.70.191.87
Connecting to archive.xfce.org (archive.xfce.org)|217.70.191.87|:80... connected
.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://archive.xfce.org/src/xfce/libxfce4ui/4.20/ [following]

With this patch, we change to make the SRC_URI an https request.

A similar patch is already in master - commit 808916819692d4ee2a592ef25af55081d80a8021

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/classes/thunar-plugin.bbclass                         | 2 +-
 meta-xfce/classes/xfce-app.bbclass                              | 2 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass                     | 2 +-
 meta-xfce/classes/xfce.bbclass                                  | 2 +-
 .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb         | 2 +-
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb       | 2 +-
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb            | 2 +-
 .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
 .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb | 2 +-
 .../recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb      | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 3719cba219..2c80de9726 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -6,7 +6,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS += "thunar"
 
-SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
 FILES:${PN} += "${libdir}/thunarx-3/*.so"
 
diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
index d1b07d7457..d539b720a6 100644
--- a/meta-xfce/classes/xfce-app.bbclass
+++ b/meta-xfce/classes/xfce-app.bbclass
@@ -2,5 +2,5 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index b43f9e3125..9ba117a484 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -4,7 +4,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
 FILES:${PN} += "${datadir}/xfce4/panel-plugins/"
 FILES:${PN} += "${datadir}/xfce4/panel/plugins/"
diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 913202be59..79a249f92c 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -4,7 +4,7 @@ def xfce_verdir(v):
     return "%s.%s" % (m.group(1), m.group(2))
 
 HOMEPAGE = "http://www.xfce.org"
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
 inherit autotools gettext gtk-icon-cache pkgconfig
 
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
index 38f6eb6ebc..4c68f00f2b 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 
 DEPENDS += "intltool-native"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "6d08354e8c44d4b0370150809c1ed601d09c8b488b68986477260609a78be3f9"
 
 do_configure() {
diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index 272f83c01b..9472c6e2cf 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce
 
-SRC_URI = "http://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "eaa58362053a3549c8be0b32efd3c54f"
 SRC_URI[sha256sum] = "3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada66fd575"
 
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 0a65bd94a2..b910acf64d 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -8,7 +8,7 @@ inherit xfce pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
-    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
+    https://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
     file://0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch \
 "
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
index 583aa9a006..5acc3b2508 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 SRC_URI[sha256sum] = "5909a65341a6af4d7ff3c7bb87aeac91c763f69b43ae9dc4a10668ac226fecc9"
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
index 6ed4747565..e39574f11a 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b6065ae7d3696cdad6869dd8627a9fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 SRC_URI[sha256sum] = "9fac3a3ad52e18584bfb127cd1721d56de1004b9fdd140915fded89704ccb44e"
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
index 6ca18b8b33..ef2107ce14 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0"
 DEPENDS:append:class-target = " ${BPN}-native"
 
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-- 
2.43.0


