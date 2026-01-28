Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A9FD35664
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 01:01:58 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2962.1769562108969253078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 17:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V24/s5TN;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78fdb90b670so57716657b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 17:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769562108; x=1770166908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpBjjvmjt4wDiy0zv6J0FUZ29aVlTEnWOkuIMEeurkA=;
        b=V24/s5TNI0f9l4y8INk9Wo/nqyOmIAFWlE9aaioO3UftWIcz9JeSFqzHMo4XbDTleG
         bEWa7zYU58/4nXNsdd0TeqwRYGmZSsxqLaKAoTfjT+RyUX07ZsxtldwTbW8CymE6UfT4
         fmv4TmQun7aS8Q7m5cqzCGK++AuamRbSppAGa/0PulC1e7wffvH2rjf9TzQ+ByLSJrrc
         pYvOb7BmP01F0gJaMFpuO21Jc3TOzwDWMS9P3c9ltj87CEUUbo7WT9da+D/y50izIsH5
         zQX9tthPPziyCRGSwBBsTg8OeKgtyLhhrm/203xjHdkwywheWw62cAa8gRI3Hu5Mkjek
         +bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769562108; x=1770166908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpBjjvmjt4wDiy0zv6J0FUZ29aVlTEnWOkuIMEeurkA=;
        b=mDVMjvxDgPyYOSrjFKZ4OpJVt2U1OE91i5WulUwEgPlGyHepaliu1pligEQJ3XM6QN
         ExsnbLPKzjQhHMhOt6gGWs6JGf5nTzX2lvcbKXrJ034a42uOTIR21CBnzSJqC4Ks3Bv5
         KvBeSog/YORSz3osoK9SmquxADrxKo0+vtRLHinwv1ibNg5lgNsQH57mLBqLvozXlQGu
         C6idvpmUuIt7xh5ERPGIUxFoOM9IeOahAqfmIvYVc5UkQYtythpcxrEkZpw91La4DsEo
         QMwxSdDRVLIOTl6GGaNMc7x4k6XNl5T3LMKrAaBFmIehL+bJK5IZoWP+GMCAf3zeG/y+
         XESA==
X-Gm-Message-State: AOJu0Yw+8Kjam9B8O4zzlfLgMTCqT9GBHsv8ksLo/WLEcfYqCNg9/0ad
	fxz0XOl7d2c3zNjRcTr7s0A1uv+Ze9KQzFQB+Nq1Uk8/sLN1LtUqA/pDuNUyII78
X-Gm-Gg: AZuq6aLcj/X+fi9Mmfa/02WcvJdA1xruLMy327FTXPFj+74WmqNvc/aNgd3vYeei/Ea
	55+OdWfr1Tx3Qy+VPVWy4lij05HUS+ezh9hwQWyXWnNCdqbuxo0FcDzp29qpCGcFRqxMjRmyArP
	phcbUoiZgFlgTCgyL6Thedx/bVcE1cP0kCVqr9RKHkrJj+DLUMTyHCtmMvt3th0L6/oQK9Qb9zR
	+BS+shPJkzf/Ued+XxsigGB9Re4z3RqSGHEs8YiWDbfan0DUOoeTtnpAry+R8WzO2EicFO3UYaB
	vp/8rZ41chIwhGXiGJ2MtPaYZAkPYUva0P3glQkhkwhZNDQ2Zut0/ZicrC/a4tE2tUf5CDRFZNu
	V/qjTQ4ERlII8GisqVI2UUAjmQ0y9JVkvI0yZFaYZKP+5HExVUYawz3n1BIXGU9hugy2PiC22yg
	FqOH3vGhngpgLMsxdRxYdOOFQv6HvM+ndg5ZVApQ09jh+hU9NCsj1aqWr7L82Wz2Zi4+tzhvn8K
	t8KGk2pRMrLU3EfJkRfSafELGMeMn3ytzlLKg==
X-Received: by 2002:a05:690e:1510:b0:63f:a6c4:fed6 with SMTP id 956f58d0204a3-6498fc14056mr2541232d50.4.1769562107321;
        Tue, 27 Jan 2026 17:01:47 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64996063fd5sm201805d50.4.2026.01.27.17.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 17:01:46 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] Use https when accessing archive.xfce.org
Date: Tue, 27 Jan 2026 20:01:08 -0500
Message-ID: <20260128010108.3564465-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 01:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123962

While using devtool to check available versions, I noticed a 301 http error.

Specifically :

$ devtool latest-version libxfce4ui

Resolving archive.xfce.org (archive.xfce.org)... 217.70.191.87
Connecting to archive.xfce.org (archive.xfce.org)|217.70.191.87|:80... connected
.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://archive.xfce.org/src/xfce/libxfce4ui/4.20/ [following]

With this patch, we change to make the SRC_URI an https request.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/classes/thunar-plugin.bbclass                       | 2 +-
 meta-xfce/classes/xfce-app.bbclass                            | 2 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass                   | 2 +-
 meta-xfce/classes/xfce.bbclass                                | 4 ++--
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb     | 2 +-
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb          | 2 +-
 .../diskperf/xfce4-diskperf-plugin_2.8.0.bb                   | 2 +-
 .../netload/xfce4-netload-plugin_1.5.0.bb                     | 2 +-
 .../recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb    | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index ad9e15296e..39b0304327 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -6,7 +6,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS += "thunar"
 
-SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.xz"
 
 FILES:${PN} += "${libdir}/thunarx-3/*.so"
 
diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
index 957cfb3362..9469c66d24 100644
--- a/meta-xfce/classes/xfce-app.bbclass
+++ b/meta-xfce/classes/xfce-app.bbclass
@@ -2,5 +2,5 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI = "https://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index b2d71a4141..1dc54f8d41 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -4,7 +4,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
 FILES:${PN} += "${datadir}/xfce4/panel-plugins/"
 FILES:${PN} += "${datadir}/xfce4/panel/plugins/"
diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 21136742c5..bc4b3561cf 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -3,9 +3,9 @@ def xfce_verdir(v):
     m = re.match(r"^([0-9]+)\.([0-9]+)", v)
     return "%s.%s" % (m.group(1), m.group(2))
 
-HOMEPAGE = "http://www.xfce.org"
+HOMEPAGE = "https://www.xfce.org"
 XFCE_COMPRESS_TYPE ?= "bz2"
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
 inherit gettext gtk-icon-cache pkgconfig
 
diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index d69abfedf2..cdec5f7792 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce
 
-SRC_URI = "http://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada66fd575"
 
 # using xfwm4-theme as in xfwm4 might cause warnings of packages supplied by
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 6ee5391d2c..b9ccb6183e 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -8,7 +8,7 @@ inherit xfce pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
-    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
+    https://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
     file://0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch \
 "
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
index a6972727f2..a71eb0abde 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
@@ -7,5 +7,5 @@ XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 SRC_URI[sha256sum] = "3833920a3a4a81b3c676c4fab6dd178f4a222d66f316a0783a9149a0153b7fb6"
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb
index d54e3b1bd1..7b04a23ada 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb
@@ -7,5 +7,5 @@ XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 SRC_URI[sha256sum] = "a868be8f73e8396c2d61903d46646993c5130d16ded71ddb5da9088abf7cb7ba"
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
index 3338126557..121140e2f6 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 libxslt-native meson-native"
 DEPENDS:append:class-target = " ${BPN}-native"
 
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2 \
+SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2 \
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-- 
2.43.0


