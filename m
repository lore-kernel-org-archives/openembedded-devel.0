Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88368C5B559
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 09:04:28 +0000 (UTC)
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
 by mx.groups.io with SMTP id smtpd.web10.2893.1749114265047252009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 02:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=jvNnX+se;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.163, mailfrom: andrej.v@skyrain.eu)
Received: from lt-aval.kyiv.ciklum.net ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id N6VsuYeSJwQNXN6WMuuaNb; Thu, 05 Jun 2025 11:04:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1749114263; bh=s84F2tlI5uajW2wMcMHz9TplLIIVtmAdMNfe1R65PUg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=jvNnX+seDBWWYizgPPULDj8FNy6gkRiQwpift+QyDnlZhSsayzz2uTTzK+Toso3GZ
	 fEMqoK/mM3nylD5rp+jjyMynchMRxopueyCATvl2oNQsvCkAsBtUUhlQqiHr/QAZyG
	 xEtQlfxqiXBJFexieiAQK4FCwr6TwGRTbgBTRIz737HCv/VOCYV2KmVPnxAQGxZGw7
	 j2wWW71IdyUXukDBt+lAs4Q6LtpxWeY3t2BaUeLmLMaH+wb14vjzO01wKEoNbC7yhe
	 zQWhNt0S2w5Gqn/W8rZVHBKorinK8CneZ5FZ07CRhQMxdUT5kC5w6T9NUBRg7W2vQW
	 95Kw1NIPE5wZQ==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe][meta-oe][PATCH] freerdp: move alsa to packageconfig
Date: Thu,  5 Jun 2025 11:03:35 +0200
Message-Id: <20250605090335.47577-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIzWaz3CvfiIcYa9eFERconNIyGuW3w6/zgxt+bl6uFmzUSNBqyV/FnMlmGJDhb6LsSJHv7fD031rF6Xjc3h4GN/UdYTXDyq4nHplV4O7pTgSBchJDTT
 pnuC0GjjI5nmKYO2IYengTTHPGY1bNBHVFzqUyqNJXMrcRhu1KCrYScwOBbCLdccrzR3AznpgrTNJYHpmQSJ6sc2vmMmMg/t5gs8ExOO3hGkIBOcWjt5XW0U
 mHNli0pk/xJfNxWUs2xGEitUfflxtAw9Db3xYIIbEjM=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 09:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117747

This will allow to disable alsa which pulls the audio stuff even if
it could be disabled.

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 846ebbf28f..e200f59b05 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION = "FreeRDP RDP client & server library"
 HOMEPAGE = "http://www.freerdp.com"
-DEPENDS = "openssl alsa-lib libusb1"
+DEPENDS = "openssl libusb1"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
@@ -26,7 +26,6 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE += " \
-    -DWITH_ALSA=ON \
     -DWITH_FFMPEG=OFF \
     -DWITH_CUNIT=OFF \
     -DWITH_NEON=OFF \
@@ -38,7 +37,7 @@ EXTRA_OECMAKE += " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayland x11', d)}\
-    gstreamer cups pcsc server \
+    alsa gstreamer cups pcsc server \
 "
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
@@ -51,6 +50,7 @@ PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaud
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
 PACKAGECONFIG[server] = "-DWITH_SERVER=ON,-DWITH_SERVER=OFF"
+PACKAGECONFIG[alsa] = "-DWITH_ALSA=ON,-DWITH_ALSA=OFF,alsa-lib"
 
 PACKAGES =+ "libfreerdp"
 
-- 
2.34.1


