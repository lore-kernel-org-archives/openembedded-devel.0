Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDF9C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 20:55:34 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web08.1163.1645044932675876199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 12:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=BQlnRiJw;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JzVbN5pl3z9sZF
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 21:55:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1645044928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D1o+JQGbW77eLBvUnGyZAxnTOrHEP9PKDXJHbaQ61w8=;
	b=BQlnRiJwKRpd1tDCsHwv9iFtvXTRG07KbVDuo7rO2SDVV4gSPq/hw5vJJN2U/TzNC+jMhD
	ZxTN86Qo8W5NoazY7HanquL0/KGnjO7PxzQgdG+1atOleY/0cfMztVqlaXizUdhCXLjyEu
	suU35hVxjOIK/HHO4xpLXNNAl/TY6DmzvY0wwtp8CV+PnwcM+3g4QX5H0ilLeDYzVpYAS+
	yh6baT5VOf3Z60+SehRhVyoUCCXWxxW+LWjaZkzAa/rXU6TtJE72ZKk+65H9n7bV/QJRC6
	lT4Sf9qd1VQdmoFfCL73+sqgR9cmBhknlsptg/GVn8l42DP3rT/xlvyRIEZAjg==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: Improve configuration
Date: Wed, 16 Feb 2022 21:55:02 +0100
Message-Id: <20220216205502.748440-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 20:55:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95348

By default, the WirePlumber lua scripts try to access a session DBus, whi=
ch
is not available if WirePlumber is run system wide. Add a small script
that turns off the bits that require session DBus. These involve reservin=
g
ALSA devices (only useful in multi-user desktop setups) and Flatpak.

Also, fix the configuration file paths (WirePlumber uses /usr/share inste=
ad
of /etc) and add the correct files to CONFFILES:${PN}.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...-disable-session-dbus-dependent-features.lua |  5 +++++
 .../wireplumber/wireplumber_0.4.8.bb            | 17 ++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/wireplumber/files/=
90-OE-disable-session-dbus-dependent-features.lua

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/files/90-OE-d=
isable-session-dbus-dependent-features.lua b/meta-multimedia/recipes-mult=
imedia/wireplumber/files/90-OE-disable-session-dbus-dependent-features.lu=
a
new file mode 100644
index 000000000..353a49c0b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/wireplumber/files/90-OE-disable-=
session-dbus-dependent-features.lua
@@ -0,0 +1,5 @@
+-- These features require a session DBus instance, which is not availabl=
e
+-- by default in OE generated images. The absence of such a DBus instanc=
e
+-- causes WirePlumber to fail to start. Turn these off to prevent that.
+alsa_monitor.properties["alsa.reserve"] =3D false
+default_access.properties["enable-flatpak-portal"] =3D false
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.8.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
8.bb
index 4d26e3360..2310c3a78 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
@@ -13,7 +13,8 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
=20
 SRCREV =3D "e14bb72dcc85e2130d0ea96768e5ae3b375a041e"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branc=
h=3Dmaster;protocol=3Dhttps \
-           "
+           file://90-OE-disable-session-dbus-dependent-features.lua \
+          "
=20
 S =3D "${WORKDIR}/git"
=20
@@ -50,6 +51,12 @@ PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rde=
pends "
=20
 WP_MODULE_SUBDIR =3D "wireplumber-0.4"
=20
+add_custom_lua_config_scripts() {
+    install -m 0644 ${WORKDIR}/90-OE-disable-session-dbus-dependent-feat=
ures.lua ${D}${datadir}/wireplumber/main.lua.d
+}
+
+do_install[postfuncs] +=3D "add_custom_lua_config_scripts"
+
 python split_dynamic_packages () {
     # Create packages for each WirePlumber module.
     wp_module_libdir =3D d.expand('${libdir}/${WP_MODULE_SUBDIR}')
@@ -117,12 +124,8 @@ PACKAGES_DYNAMIC =3D "^${PN}-modules.*"
=20
 SYSTEMD_SERVICE:${PN} =3D "wireplumber.service"
 CONFFILES:${PN} +=3D " \
-    ${sysconfdir}/wireplumber/config.lua \
-    ${sysconfdir}/wireplumber/config.lua.d/* \
-"
-FILES:${PN} +=3D " \
-    ${sysconfdir}/wireplumber/config.lua \
-    ${sysconfdir}/wireplumber/config.lua.d/* \
+    ${datadir}/wireplumber/wireplumber.conf \
+    ${datadir}/wireplumber/*.lua.d/* \
 "
 # Add pipewire to RRECOMMENDS, since WirePlumber expects a PipeWire daem=
on to
 # be present. While in theory any application that uses libpipewire can =
configure
--=20
2.32.0


