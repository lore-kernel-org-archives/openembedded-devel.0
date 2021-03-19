Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web11.1889.1616181064047898803
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 12:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=tWcN1PGM;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4F2D5150sLzQjmj
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 20:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:message-id:date:date
	:subject:subject:from:from:received; s=mail20150812; t=
	1616181055; bh=xMWY3A/CCcpvYLF5pjfsBMvdF+DwKBO0JLe+kNpQ3rM=; b=t
	WcN1PGMo1FYVNf4Pq8/CG65NAqlxJ6Up6HwGfYn6EPwUUhdpNBw3GweZ8/0HKX8N
	7wRRFh1Gb3uXFOx13M7ekXnpkSzzRrkstQXE++pPFZN9Z6Omh8ouEw+LKLJ4mOWT
	RwJTG1k23a+SeGT0aTY+CiW2rF98+OAzxmq+O0Gw5mjd6nwyVkrQvdn8FyGv53qP
	z7pZ4/mr72SV/nMsJW2mD1BVk9L2GJ9a0k7qjpZS6+yCr5nVrcaWXeXDQbOESSs8
	dZY482G7Rr3q+cH4Ld3SZDhSF0C1dCkqPS6/dhyhmEj4ZvhmJftwvDPTGc5fQDng
	rv8pCTKbx4Lw6hBNFqLJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1616181059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dFeOzEfMcFb1KoO85Xo33jUdyeOYM2HBaib+WJfHbZM=;
	b=A1JMjH6S16QHZ4bRlQWEBZN7fxP8I1hI4UsAx5o2TtUjVQACnb9rgdX/E+9KJw7TzLLKtl
	1aAbdB9Od7v5JHyt/tnTvIv1pl1CL9cYuaFFMN8G7kxsuPwJjte0KsFqXMBM+8UainQewa
	cGAMUScKYcvBeGmhqI+17nikZidKz/Q4/9TLKnlwlerLWrrTokUiEnRLfaXtgLIBYU2Wdf
	tuhVAh91W2+2OOV//K7bE7rCJ//dmJSK/TWwhAd8sEkkh4S5HiThly4I7C0yzD8K3lWmwQ
	YytgV/UvfXbuMiq4aLzrNf34SmBxSjbOyVZLvmYmjcxOeN8/4ku8mwKtGjtccA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
	with ESMTP id 3nrjm3YoYFa5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2021 20:10:55 +0100 (CET)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Upgrade to 0.3.24
Date: Fri, 19 Mar 2021 20:10:44 +0100
Message-Id: <20210319191044.157938-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -1.20 / 15.00 / 15.00
X-Rspamd-Queue-Id: A1C8B16FF
X-Rspamd-UID: ce0a23
Content-Transfer-Encoding: quoted-printable

This is a bugfix upgrade with some necessary changes to the recipe itself=
.

Changelogs:

https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.23
https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.24

Fixes in the recipe itself:

- meson_options.txt now uses features for everything, so the
  "=3Dtrue" and "=3Dfalse" packageconfig args were replaced by
  "=3Denabled" and "=3Ddisabled", respectively
- "docs" packageconfig was incorrectly adding doxygen instead
  of doxygen-native to the DEPENDS variable
- "man" packageconfig removed, since manpage generation requires
  xmltoman, and that tool is not available

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...{pipewire_0.3.22.bb =3D> pipewire_0.3.24.bb} | 43 +++++++++++--------
 1 file changed, 24 insertions(+), 19 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.22.bb =3D=
> pipewire_0.3.24.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.24.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.24.bb
index b54be7f89..bc8c9c00d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.24.bb
@@ -11,7 +11,7 @@ SECTION =3D "multimedia"
=20
 DEPENDS =3D "dbus"
=20
-SRCREV =3D "22d563720a7f6ba7bdf59950f8c14488d80dfa95"
+SRCREV =3D "c81d44e8a9497899d01bcc3054b6aa845e7a066e"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -30,24 +30,30 @@ USERADD_PARAM_${PN} =3D "--system --home / --no-creat=
e-home \
 # For "EVL", look up https://evlproject.org/ . It involves
 # a specially prepared kernel, and is currently unavailable
 # in Yocto.
+#
 # FFmpeg and Vulkan aren't really supported - at the current
 # stage (version 0.3.22), these are just experiments, not
 # actual features.
+#
 # libcamera support currently does not build successfully.
+#
 # systemd user service files are disabled because per-user
 # PipeWire instances aren't really something that makes
 # much sense in an embedded environment. A system-wide
 # instance does.
+#
+# manpage generation requires xmltoman, which is not available.
 EXTRA_OEMESON +=3D " \
-    -Daudiotestsrc=3Dtrue \
-    -Devl=3Dfalse \
-    -Dsystemd-user-service=3Dfalse \
-    -Dtests=3Dfalse \
+    -Daudiotestsrc=3Denabled \
+    -Devl=3Ddisabled \
+    -Dsystemd-user-service=3Ddisabled \
+    -Dtests=3Ddisabled \
     -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \
-    -Dvideotestsrc=3Dtrue \
-    -Dffmpeg=3Dfalse \
-    -Dvulkan=3Dfalse \
-    -Dlibcamera=3Dfalse \
+    -Dvideotestsrc=3Denabled \
+    -Dffmpeg=3Ddisabled \
+    -Dvulkan=3Ddisabled \
+    -Dlibcamera=3Ddisabled \
+    -Dman=3Ddisabled \
 "
=20
 PACKAGECONFIG ??=3D "\
@@ -62,18 +68,17 @@ PACKAGECONFIG ??=3D "\
 # is why these two are marked in their respective packageconfigs
 # as being in conflict.
=20
-PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib udev"
-PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 sbc"
-PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,doxygen"
-PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gli=
b-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[jack] =3D "-Djack=3Dtrue,-Djack=3Dfalse,jack,,,pipewire-ja=
ck"
-PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-pe=
rl-native"
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib ude=
v"
+PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
+PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve"
+PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack,,,pipew=
ire-jack"
 PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
 PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd-system-service=3D=
true ,-Dsystemd=3Dfalse -Dsystemd-system-service=3Dfalse,systemd"
-PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Dtrue,-Dv4l2=3Dfalse,udev"
-PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Dtrue,-Dpipewire-alsa=
=3Dfalse,alsa-lib"
-PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Dtrue -Dlibjack-path=3D=
${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Dfalse,jack,,,jack"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled -Dsystemd-system-service=
=3Denabled ,-Dsystemd=3Ddisabled -Dsystemd-system-service=3Ddisabled,syst=
emd"
+PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
+PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
+PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
,jack"
=20
 PACKAGESPLITFUNCS_prepend =3D " split_dynamic_packages "
 PACKAGESPLITFUNCS_append =3D " set_dynamic_metapkg_rdepends "
--=20
2.25.1

