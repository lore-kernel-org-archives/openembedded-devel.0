Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94B9EDF04E
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 07:07:32 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40669.1770880051022164843
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 23:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bw2GHLBN;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7964f1405a0so44886467b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 23:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770880050; x=1771484850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHfUbgr9OcsVNmtflDpDEiNSabPHr38Trd15XzEIFlc=;
        b=Bw2GHLBNSQd1m2RkG8RdtAOO43eYkuDHD7gg4qTuhL3EHoHFKosoChjP9MISK9/6GE
         2dAcm7QzLLH/caEo86Pfo67+swZmvpipdW1u+M7iSmDNvxCOL7g4wTuX48xL5cwlIt1v
         +ohnOn9xpZKn7+Aq1Icc35tArqNSWCXttKCWNiGpOYdkwDJXT5CMDbGFGNKz3fU4mnCt
         oyE7J0OLVnTFH4m+JWt57RhFEnxZkL0GfQNJBw5Qw165fjcwvDd+P6NKfoO+eZa4WURE
         4xbrNuHhdICROU9e3jpJCi3CsZyIOU6D1sONzUxIxu7CghO3LFjlw/1dL+vPaLrCbSJS
         qppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880050; x=1771484850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHfUbgr9OcsVNmtflDpDEiNSabPHr38Trd15XzEIFlc=;
        b=BHysp2fwYBjgHUq3h91vXx98AbxUoZW6rdwxADveCUl3HM5jTTCQVmhJYVOIi9zRIJ
         poAT/HczaCfDbHDHOWYsv1rsem8V1Q+VWbnuEAsltSV1JSIYphUxMvFj8M3S8R2w/zbs
         EMmKzhm6ReFh7jKuBU73JHjCd2/v/u0uKSsyfwfU+ogbFIF1vjg3SF4uXKGa1xQ/gqWq
         JrW30DxR4nlY25eCrftIeXC1DcIgUd+khK6UEXdkunlbvrriPJHWhJdSP9wak/ARgJiN
         cGXBpd82CQ2GiYCgtORM7df1uiAnI6nEFKUZVCJqQZSHxt3bxyKkA3tLhc2NXg2FLYzW
         CMRA==
X-Gm-Message-State: AOJu0Yyx39d0PQ5lqYiRpEQowJ/zuFsRHwaBLvz2Aacj8aWvmc6Hngvm
	fN1j364OxwVnB/Ff6c5qe1IVf6jAtvoqBfdz9DAXVcBrxZjeGW8B/sY6wSZs3CQK
X-Gm-Gg: AZuq6aJ9tLlgJGrFSmKosGOBPoUGPzyGkG2gEucPUZEDAsNkeY8xAqygexX8eUOSCzQ
	mb2uXHnYHDHOybL67WJSEAM/xwvNoY53mstXPVc/PK1fm7EbxzcDAFduHFZOfayYlBs/hSQCCpW
	cP+TyoYeuJkqy80va/DsdjvJ6fktEGJL6drNWGo0ONt+jjj1PsnYaV4FAtMoyaUWYZs4jzBE9KU
	1UYMLrodhUde6Dyhk0D9EdJJpM7Ibujuuraf1WVoH1N8VpLgUqtr8YsJNtpcyGRIveFoevymXkL
	o1XIfJzLvWvYfBjTnVdX3cp+Qvb3EtJ17oesbsC+joJSN+5yIfmT7pI7hxUwqH9scYAJeInmzac
	K5A59lQDrMrYwzjFAnYiPP0ljx/fcOaPHYgDDMpSeHGUbsdwWCihP7p/VhyIivZYhC+R28/bYr3
	q5F1EC1C33grgoVN0i+cElmlR2buY5MghImSNDaMD4o5Eoetp8UNQrt3bF6AmKK9L/eAyoLml3t
	qUS9v1LEnvpCeEeeWM3EhufsOfL0Vb7dp+STvpHC9kL24ufKm1NJasxWznRzQ==
X-Received: by 2002:a05:690c:c50d:b0:795:3e1:ddac with SMTP id 00721157ae682-797376de053mr21113017b3.21.1770880044871;
        Wed, 11 Feb 2026 23:07:24 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16e5desm37695817b3.11.2026.02.11.23.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 23:07:24 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][kirkstone][PATCH] Use https when accessing archive.xfce.org
Date: Thu, 12 Feb 2026 02:06:49 -0500
Message-ID: <20260212070649.8819-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124344

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
 .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb         | 2 +-
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb       | 2 +-
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb            | 2 +-
 .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
 .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb | 2 +-
 .../recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb      | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 423f337bef..969360a0d2 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -4,7 +4,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
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
 
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
index f4681f4602..fa13f32be8 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "intltool-native"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
+SRC_URI = "https://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
            file://0001-Makefile.in.in-Pass-arguments-to-tar.patch \
            "
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
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
index 267d11b44b..242813130d 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 SRC_URI[sha256sum] = "6c76260e101790754dd93255ec979accd97d21a21da85d8edcd6c7b01ddcd70c"
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
index 5c41a76ed6..1536d5fb7f 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
 SRC_URI[sha256sum] = "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e15ce05545e8eb4f04"
 
-- 
2.43.0


