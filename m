Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE166EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 13:27:29 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web10.16264.1687613244938166254
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jun 2023 06:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=lGum8ew/;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QpFJp4bc7z9sW3
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 15:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1687613242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FewPTQ4l4WEqcK6MhoyAa/nLkAmuaII/je9brhZZ9uw=;
	b=lGum8ew/nIaUOhPRlLuJ9UVztuN9Fzqb67/5iJn7ff4jCVP94ebnkSTYy8Xvm/rYHA4W8B
	kPhzjcbCnjVhAnNyCWV+nKfZ5SHEPxsZR9I/GblbdpTX1udz+daPLQ/HidPyQfd31Eqh4m
	ow8tHzj4KNIG5DgGMSEoTTP8hPgqfxuHbXGNIQsI3oyEC4ANMjVTq/GlriQIgflAk+HIY7
	55CC258mAeOhwPqHqb1Cd/IhIZ1po8n6vAXpLABBd87e96sHYhyJPweQLrjgPPjuPF82DX
	8bDcbbFbkopsRSOGwnpbe+mpEkiYeHFryNqofakeLPIg5Xo3eQj4sUkg33tWDg==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/3] pipewire: Improve packageconfigs
Date: Sat, 24 Jun 2023 15:27:14 +0200
Message-Id: <20230624132715.1664863-2-crg7475@mailbox.org>
In-Reply-To: <20230624132715.1664863-1-crg7475@mailbox.org>
References: <20230624132715.1664863-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 3tsscod6e1bw8jxqpeghb4zbekifoers
X-MBO-RS-ID: f781af5970960179c3d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103555

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../recipes-multimedia/pipewire/pipewire_0.3.71.bb       | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
index 051776cceb..414ae3ea8d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
@@ -88,7 +88,7 @@ PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera \
+    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readl=
ine \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -101,6 +101,10 @@ PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3D=
disabled,avahi"
 PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
 PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Denabled,-Dbluez5-code=
c-aac=3Ddisabled,fdk-aac"
 PACKAGECONFIG[bluez-opus] =3D "-Dbluez5-codec-opus=3Denabled,-Dbluez5-co=
dec-opus=3Ddisabled,libopus"
+# From the pipewire git log:
+# "Some Linux phones doesn't use oFono but ModemManager to control the m=
odem."
+# This packageconfig enables modemmanager specific code in the BlueZ bac=
kend.
+PACKAGECONFIG[bluez-backend-native-mm] =3D "-Dbluez5-backend-native-mm=3D=
enabled,-Dbluez5-backend-native-mm=3Ddisabled,modemmanager"
 PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve graphviz-native"
 PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Denabled,-Dflatpak=3Ddisabled,gli=
b-2.0"
@@ -116,6 +120,9 @@ PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3De=
nabled,-Dpipewire-alsa=3Ddisabled
 PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
pipewire-jack,jack"
 PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
 PACKAGECONFIG[raop] =3D "-Draop=3Denabled,-Draop=3Ddisabled,openssl"
+# Starting with version 0.3.60, readline usage can be turned off in pw-c=
li.
+# If it is disabled, getline() is used as a fallback.
+PACKAGECONFIG[readline] =3D "-Dreadline=3Denabled,-Dreadline=3Ddisabled,=
readline"
 PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,libsdl2"
 PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
--=20
2.34.1


