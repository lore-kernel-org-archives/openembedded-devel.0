Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C97D3B7DD
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:13:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4335.1765185190512752268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E/czsOrr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765185191; x=1796721191;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lIcJhP2lMWqWa52IlNp4j9C5e621LxOTAeOSaWsiJ7w=;
  b=E/czsOrrCKnzeZEobHEdlMSU2+QZqfnnfXnLjTct26OJsCDM084s4lts
   L3hWGz+JjaM2iABgmANNTQI2TPhRrfNOnZVES7GVJNCpLvkenYnqgRCVY
   Td0Wm+1AZoANzCCMtYO5x6dtSz7ig8CNzQEXw109v8TKN17drbm/l1Xf/
   aX8Mn3M28mDtraG5q3nNoj0scOneyaw3cn1PDb/cDlZ5BFW7oBqM43+kF
   jPACSircaeXQYR3qGJuw91iB6oZWiOpdAv0ef+w1YIJL0+PL0W3aAIygH
   gxnIPVfI5N2osLJiYwnDUdFfRM/zXAAJyNbPV6wGEzQ1W90+feugDQOMO
   A==;
X-CSE-ConnectionGUID: zAK12GS5RJWHHFxFqyKQ7A==
X-CSE-MsgGUID: AbcJl8LLSi6G7cRWI+unUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="221825581"
X-IronPort-AV: E=Sophos;i="6.20,258,1758553200"; 
   d="scan'208";a="221825581"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 18:13:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9E77FC01B1C
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Dec 2025 09:13:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 572741400395
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Dec 2025 09:13:08 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0CDEC14000B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Dec 2025 09:13:05 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 2/2] gnome-control-center: upgrade  48.3 -> 49.2.2
Date: Mon,  8 Dec 2025 17:13:00 +0800
Message-ID: <20251208091300.21039-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 09:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122371

Changelog:
- Revert libgxdp updates

  The libgxdp updates depend on changes in gsettings-desktop-schemas
  that are part of the GNOME 50 cycle. Revert the pinned ref
  to the one we had before, until we branch libgxdp for GNOME 49.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...l-center_48.3.bb => gnome-control-center_49.2.2.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_48.3.bb => gnome-control-center_49.2.2.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
index d8d5849534..9bb0228d50 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
@@ -32,19 +32,22 @@ DEPENDS = " \
     udisks2 \
     upower \
     ${@' libxslt-native docbook-xsl-stylesheets-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''} \
+    blueprint-compiler-native \
 "
 
 inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen upstream-version-is-even bash-completion features_check
 
 REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
 
+SRC_URI = "https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
+SRC_URI[sha256sum] = "c23ae220d6c1237d285925de7801e0e36338b9cc1a8bb51c2e37e715e6b503ad"
+
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] = "c0698245a6420badd077c16ffb218860e457cd7300612718eabf9aba47222bae"
 
-PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
+PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[cups] = ",,cups,cups system-config-printer cups-pk-helper"
 PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
-PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
+PACKAGECONFIG[x11] = "-Dx11=true, -Dx11=false, virtual/libx11"
 PACKAGECONFIG[file-share] = ",,,gnome-user-share"
 PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
 PACKAGECONFIG[malcontent] = "-Dmalcontent=true,-Dmalcontent=false,malcontent,malcontent-ui"
@@ -54,6 +57,7 @@ EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
 GIDOCGEN_MESON_OPTION = 'documentation'
 
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+export GI_TYPELIB_PATH = "${RECIPE_SYSROOT}${libdir}/girepository-1.0"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.43.0


