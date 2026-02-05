Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4C8EA794F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 00:41:46 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10444.1770252101885023347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 16:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fwkw+8on;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7946a1f2430so3950627b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770252101; x=1770856901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBA4ZscBDaLYSq248pPG3eBj1U/TugAdNDTTekg+fS0=;
        b=Fwkw+8onEkaE6lIBRjA616688C6sfiXj7g6PV0e/pDpFLdZHITiqKoEAct6ag/xrOT
         vfYTfRmr3fqK8lMLs+xgOMOVFoIu79NB2i13uHaJHV9IZlfxYARImPdGWC+yDlRFn9Ln
         Mr1LpSOmgnNpxICqTYOiZ02rGN8yGxheRBAxJS5HajZXECSVTEtFkIuWQsuOUJMNLEEC
         1VmYKrd2bo+dUD27WIwx+wHJdpamPzCP+qYIOkC5etey1TijAgwkhhtOoI07s2p2IHmf
         l7PEpaK1EpGA7Ox4jDYXBS7dJYEvO550XLkikHhITDCNWRE2f0Lm2SwaNn3XGqXsm8Y0
         E67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770252101; x=1770856901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBA4ZscBDaLYSq248pPG3eBj1U/TugAdNDTTekg+fS0=;
        b=i1lJRjbTWddjI13eMqpjs4GobvmatcAtFOxl5omQQfLRuPBkbUGBXA+rGNtYX4lcpS
         72oG50iPVtoqJn8O7quFnt4kBr1VA1FcWBIIHt2UkchuD2IX87pZjDWHQKJLQdPxY2qv
         r3tTdvYf54b3qhUdB1K3aMqqafnKBrSC38WzUfykFs79Qnw7I77BZ3OcFiRtDofROCtC
         JKZJGgdgtPu204FtSHbp7EN3INrJ+sQzYBN9yoaiGbYKaO3bmoO2a3ipAA1/0goSL1GY
         AzErlFj7IngpzHm4eBeVX6/rdL+EHkkfXWnPreCMxoo3oljxVani5gQ68BFZKw9TwdQW
         KK7Q==
X-Gm-Message-State: AOJu0YwNjwgGqeTZBaFOZoUnCzBrX6+iVsQJJiZU/lED5YJCIRp6ZhGY
	NTFFTKbdwImjrTvg8osW7g3MZgv2+UraDXpvJElkTAl5plfTgoQ9XWmetL48CT0+
X-Gm-Gg: AZuq6aKDtv1u8Y0oKdmI1Qe8lZ4qRZn3UNVFB5dder40TUnwMd8jCSzv+u7mw54fkuz
	469mLJYZ4Slq07uv0HVSggKBZnLchsgF+qPi/KfOqFEC3JgpxMJopCAeurUvkM6XUH0b2Rd4I03
	nHmP4Fey6txUwb5ywSO7nnMfkyG9v0v4n0hr7z73sCLcydMilB5QMEg+6gmjA/3dqE8J/Bc9hzR
	LLZzIcTK2nN/axHREeu3hoqp4u8OeJtLaDvUED4vdwv9P0xU88Tmdy9MPYgbgabaUPQXL3nLMtj
	/jS6qGxV3AqrwPaBX3rM51kHcm2z3M9weBOq5EmN1em01IoLcvRfoOwWV2hxvaemIgYek5ol80A
	Kjw6CYVpBbH101fXAiqEnobFADIt51mj7NUMuDUvG3mIiDaBuGsXJJgmQFqiGd3cbRpvsJ9ZKIn
	gZKvi1MmOrNmdUdCd8B0JxHBOY7oLN3Oug5+QnZnxjTs3Qd5ZZada9PVwTdHxjbkHRJHbV7wyaR
	Oo4MVTyNUxPdl9QPabHu6OH2iJ/VYFqUvfyYcs=
X-Received: by 2002:a05:690c:dc6:b0:794:c468:655c with SMTP id 00721157ae682-794fe809718mr45484537b3.65.1770252100438;
        Wed, 04 Feb 2026 16:41:40 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794fee82395sm34919957b3.3.2026.02.04.16.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 16:41:40 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][whinlatter][PATCH] Use https when accessing archive.xfce.org
Date: Wed,  4 Feb 2026 19:41:21 -0500
Message-ID: <20260205004121.6497-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 00:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124147

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 808916819692d4ee2a592ef25af55081d80a8021)
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


