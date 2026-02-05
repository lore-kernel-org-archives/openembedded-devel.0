Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DF2EC1E9D
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 11:14:10 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18287.1770290048158170947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 03:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 5 Feb 2026 20:14:05 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 5 Feb 2026 20:14:05 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] pipewire: fix runtime dependency when multilib is enabled
Date: Thu,  5 Feb 2026 20:13:38 +0900
Message-ID: <20260205111338.796357-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 11:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124209

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Without ${MLPREFIX} in the PACKAGECONFIG runtime field, building the
multilib variant forms a dependency to the non-multilib variant of
certain packages.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 .../recipes-multimedia/pipewire/pipewire_1.4.10.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
index a0b3848dd0..b7b87bef79 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
@@ -97,7 +97,7 @@ PACKAGECONFIG:class-target ??= " \
 # libjack.so* files, thus colliding with the libpack package. This
 # is why these two are marked in their respective packageconfigs
 # as being in conflict.
-PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev,,pipewire-alsa pipewire-alsa-card-profile"
+PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev,,${MLPREFIX}pipewire-alsa ${MLPREFIX}pipewire-alsa-card-profile"
 PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
 PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc glib-2.0-native"
 PACKAGECONFIG[bluez-aac] = "-Dbluez5-codec-aac=enabled,-Dbluez5-codec-aac=disabled,fdk-aac"
@@ -111,15 +111,15 @@ PACKAGECONFIG[docs] = "-Ddocs=enabled,-Ddocs=disabled,doxygen-native graphviz-na
 PACKAGECONFIG[ffmpeg] = "-Dffmpeg=enabled,-Dffmpeg=disabled,ffmpeg"
 PACKAGECONFIG[flatpak] = "-Dflatpak=enabled,-Dflatpak=disabled,glib-2.0"
 PACKAGECONFIG[gsettings] = "-Dgsettings=enabled,-Dgsettings=disabled,glib-2.0"
-PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,gstreamer1.0-pipewire"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,${MLPREFIX}gstreamer1.0-pipewire"
 PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
 PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera libdrm"
 PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
 PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
 PACKAGECONFIG[media-session] = ",,,pipewire-media-session,,wireplumber"
-PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio,,pipewire-pulse"
+PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio,,${MLPREFIX}pipewire-pulse"
 PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
-PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,pipewire-jack,jack"
+PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,${MLPREFIX}pipewire-jack,jack"
 PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
 PACKAGECONFIG[raop] = "-Draop=enabled,-Draop=disabled,openssl"
 # Starting with version 0.3.60, readline usage can be turned off in pw-cli.

