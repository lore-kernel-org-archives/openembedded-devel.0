Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A759CE6B277
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:11:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96102.1766470256837462039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TmUwo6hF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470257; x=1798006257;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v0J7feQk428stf46enPA0oeSkFS3ysH6Zmc728FXtUI=;
  b=TmUwo6hFki84UYWixWjX2sDgV71s//rOHMlfnCvjtumz/nxnAUnU67g1
   IlAbXDQSxFhEgeYuOPliXECdCWSwGSCQ09WuS7Vu0KuIIUw0Dmxhf7xjA
   He10UAc3J9zCn9VGCxXIbrJlcok0fJHZbAf3Ci7YVT0vflvq7TsS+Zwy4
   qXmOA3aEkT0/+lUMJUJv2cnNJ1hYr4GLfrd4zj2ZLH8SoqQfVVScFeh25
   052JdQVtntI4VpZk5PwRqRuTCjzGsXuzCDgigrrhAEnPFUA2B8WiNv3Gn
   D0KYZkfGS3Y+gnmaX3w7gUeILvHKQtk2sCtt/IJE8zQN+MwwfyzEq3hIc
   g==;
X-CSE-ConnectionGUID: VKxr5SbMRfiQDI5VLFNchw==
X-CSE-MsgGUID: ox8VDDsJQ++revqvhyCrXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="227536474"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="227536474"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:10:55 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 231791002B97
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:10:55 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D0251C0245C
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:10:54 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B02F510005AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:10:52 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/7] flatpak: upgrade 1.17.0 -> 1.17.2
Date: Tue, 23 Dec 2025 14:10:36 +0800
Message-ID: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122817

1. Changelog:
    https://github.com/flatpak/flatpak/releases/tag/1.17.2

2. Update 0001-flatpak-pc-add-pc_sysrootdir.patch for 1.17.2

3. Remove http_backend related options as they were removed in 1.17.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch   | 11 +++++++----
 .../flatpak/{flatpak_1.17.0.bb => flatpak_1.17.2.bb}  |  7 ++-----
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.0.bb => flatpak_1.17.2.bb} (90%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
index 08d5625fa7..6207ae617b 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
+++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
@@ -7,22 +7,25 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
 Upstream-Status: Inappropriate [oe-specific]
 
+Update for 1.17.2.
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 4a0b865e..5f69b1d9 100644
+index e97b8cef..5c8de55f 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -509,7 +509,7 @@ pkgconfig_variables += 'exec_prefix=${prefix}'
+@@ -515,7 +515,7 @@ pkgconfig_variables += 'exec_prefix=${prefix}'
  pkgconfig_variables += 'datadir=' + ('${prefix}' / get_option('datadir'))
  
  pkgconfig_variables += 'datarootdir=' + ('${prefix}' / get_option('datadir'))
 -pkgconfig_variables += 'interfaces_dir=${datadir}/dbus-1/interfaces/'
 +pkgconfig_variables += 'interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces/'
- pkgconfig_variables += 'httpbackend=' + get_option('http_backend')
  
  pkgconfig.generate(
+   libflatpak,
 -- 
-2.34.1
+2.43.0
 
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
similarity index 90%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
index a51937ea72..b5803e00a4 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
@@ -4,11 +4,11 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
-    git://github.com/flatpak/flatpak;protocol=https;branch=main \
+    git://github.com/flatpak/flatpak;protocol=https;branch=main;tag=${PV} \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "0835c0272f3a0389f97b02cad4b208f80fec99ed"
+SRCREV = "20599618d623630f7aa38d61a2bb81d86fb25f09"
 
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
@@ -49,11 +49,9 @@ GTKDOC_MESON_OPTION = 'gtkdoc'
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
-PACKAGECONFIG[curl] = "-Dhttp_backend=curl,,curl"
 PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
 PACKAGECONFIG[docbook_docs] = "-Ddocbook_docs=enabled,-Ddocbook_docs=disabled,xmlto-native"
 PACKAGECONFIG[man] = "-Dman=enabled,-Dman=disabled,libxslt-native"
-PACKAGECONFIG[soup] = "-Dhttp_backend=soup,,libsoup-2.4"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,xauth socat-native"
 PACKAGECONFIG[xauth] = "-Dxauth=enabled,-Dxauth=disabled,xauth"
 PACKAGECONFIG[seccomp] = "-Dseccomp=enabled,-Dseccomp=disabled,libseccomp"
@@ -62,7 +60,6 @@ PACKAGECONFIG[selinux] = "-Dselinux_module=enabled,-Dselinux_module=disabled,lib
 PACKAGECONFIG[wayland-security-context] = "-Dwayland_security_context=enabled,-Dwayland_security_context=disabled,wayland wayland-native wayland-protocols"
 
 PACKAGECONFIG ?= " \
-    curl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-security-context', '', d)} \
-- 
2.43.0


