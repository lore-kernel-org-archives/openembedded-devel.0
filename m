Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610BDC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:35:02 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web12.13581.1644338101584534060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=vJiuVGlm;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JtTBV2n3nz9sGf;
	Tue,  8 Feb 2022 17:34:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1644338098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVqI9kFoTZfcLrVK0DSG+w6U9tnZuYIhqGboLzIaJok=;
	b=vJiuVGlmVN6LbizspkF9UHd50KIXmLVGgHGQE9Ul8nJoDQg3aPiMKns/yK5z6pDLwY30fX
	r3h3hXaBC7hdeYZ85R9UoGzYbwh8T4MT6B89HuEAbCJ/Bilhvaj1fdytHRrNz9ryVgflaH
	0LznBOGpXyuRMye/3hG5yTyat5KuqEZSITUjHJPzyEKIe8lYoxEHJHdfrbyEIVBucHVRDc
	BAiMXwY/1fXbGCaJw88VckhqJPTd8iMirgveR4ZeizZvcWwYfrkjJ58zNq+FRMPHdy+k9X
	sESF24gf1FgTnNy+uOvkgglRo/C7YaOfhSBc7EQ7LZhXcNNViwLkSzMM3mEbyQ==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: =george.kiagiadakis@collabora.com
Subject: [meta-multimedia][RFC PATCH 2/2] wireplumber: Add recipe
Date: Tue,  8 Feb 2022 17:34:40 +0100
Message-Id: <20220208163440.428471-3-crg7475@mailbox.org>
In-Reply-To: <20220208163440.428471-1-crg7475@mailbox.org>
References: <20220208163440.428471-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 16:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95270

WirePlumber is a session / policy manager for PipeWire with support
for Lua scripting and adding functionality by installing extra modules.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../wireplumber/wireplumber_0.4.8.bb          | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/wireplumber/wirepl=
umber_0.4.8.bb

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.8.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
8.bb
new file mode 100644
index 000000000..4d26e3360
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
@@ -0,0 +1,140 @@
+SUMMARY    =3D "Session / policy manager implementation for PipeWire"
+HOMEPAGE   =3D "https://gitlab.freedesktop.org/pipewire/wireplumber"
+BUGTRACKER =3D "https://gitlab.freedesktop.org/pipewire/wireplumber/issu=
es"
+AUTHOR     =3D "George Kiagiadakis <george.kiagiadakis@collabora.com>"
+SECTION    =3D "multimedia"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D17d1fe479cdec331eecbc65d26bc7=
e77"
+
+DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
+"
+
+SRCREV =3D "e14bb72dcc85e2130d0ea96768e5ae3b375a041e"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branc=
h=3Dmaster;protocol=3Dhttps \
+           "
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig gobject-introspection systemd
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
+# Enable system-lua to let wireplumber use OE's lua.
+# Documentation needs python-sphinx, which is not in oe-core or meta-pyt=
hon2 for now.
+# elogind is not (yet) available in OE, so disable support.
+EXTRA_OEMESON +=3D " \
+    -Ddoc=3Ddisabled \
+    -Dsystem-lua=3Dtrue \
+    -Delogind=3Ddisabled \
+    -Dsystemd-system-unit-dir=3D${systemd_system_unitdir} \
+    -Dsystemd-user-unit-dir=3D${systemd_user_unitdir} \
+    -Dtests=3Dfalse \
+"
+
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service', '', d)} \
+"
+
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
+PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-system-service=3Dtr=
ue,-Dsystemd-system-service=3Dfalse,systemd"
+# "systemd-user-service" packageconfig will only install service
+# files to rootfs but not enable them as systemd.bbclass
+# currently lacks the feature of enabling user services.
+PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Dtrue,-=
Dsystemd-user-service=3Dfalse,systemd"
+
+PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
+PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
+
+WP_MODULE_SUBDIR =3D "wireplumber-0.4"
+
+python split_dynamic_packages () {
+    # Create packages for each WirePlumber module.
+    wp_module_libdir =3D d.expand('${libdir}/${WP_MODULE_SUBDIR}')
+    do_split_packages(d, wp_module_libdir, r'^libwireplumber-module-(.*)=
\.so$', d.expand('${PN}-modules-%s'), 'WirePlumber %s module', extra_depe=
nds=3D'', recursive=3DFalse)
+}
+
+python set_dynamic_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    # Go through all generated WirePlumber module packages
+    # (excluding the main package and the -meta package itself)
+    # and add them to the -meta package as RDEPENDS.
+
+    base_pn =3D d.getVar('PN')
+
+    wp_module_pn =3D base_pn + '-modules'
+    wp_module_metapkg =3D  wp_module_pn + '-meta'
+
+    d.setVar('ALLOW_EMPTY:' + wp_module_metapkg, "1")
+    d.setVar('FILES:' + wp_module_metapkg, "")
+
+    blacklist =3D [ wp_module_pn, wp_module_metapkg ]
+    wp_module_metapkg_rdepends =3D []
+    pkgdest =3D d.getVar('PKGDEST')
+
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in blacklist:
+            continue
+
+        is_wp_module_pkg =3D pkg.startswith(wp_module_pn)
+        if not is_wp_module_pkg:
+            continue
+
+        if pkg in wp_module_metapkg_rdepends:
+            continue
+
+        # See if the package is empty by looking at the contents of its
+        # PKGDEST subdirectory. If this subdirectory is empty, then then
+        # package is empty as well. Empty packages do not get added to
+        # the meta package's RDEPENDS.
+        pkgdir =3D os.path.join(pkgdest, pkg)
+        if os.path.exists(pkgdir):
+            dir_contents =3D os.listdir(pkgdir) or []
+        else:
+            dir_contents =3D []
+        is_empty =3D len(dir_contents) =3D=3D 0
+        if not is_empty:
+            if is_wp_module_pkg:
+                wp_module_metapkg_rdepends.append(pkg)
+
+    d.setVar('RDEPENDS:' + wp_module_metapkg, ' '.join(wp_module_metapkg=
_rdepends))
+    d.setVar('DESCRIPTION:' + wp_module_metapkg, wp_module_pn + ' meta p=
ackage')
+}
+
+PACKAGES =3D+ "\
+    libwireplumber \
+    ${PN}-default-config \
+    ${PN}-scripts \
+    ${PN}-modules \
+    ${PN}-modules-meta \
+"
+
+PACKAGES_DYNAMIC =3D "^${PN}-modules.*"
+
+SYSTEMD_SERVICE:${PN} =3D "wireplumber.service"
+CONFFILES:${PN} +=3D " \
+    ${sysconfdir}/wireplumber/config.lua \
+    ${sysconfdir}/wireplumber/config.lua.d/* \
+"
+FILES:${PN} +=3D " \
+    ${sysconfdir}/wireplumber/config.lua \
+    ${sysconfdir}/wireplumber/config.lua.d/* \
+"
+# Add pipewire to RRECOMMENDS, since WirePlumber expects a PipeWire daem=
on to
+# be present. While in theory any application that uses libpipewire can =
configure
+# itself to become a daemon, in practice, the PipeWire daemon is used.
+RRECOMMENDS:${PN} +=3D "${PN}-scripts pipewire"
+
+FILES:libwireplumber =3D " \
+    ${libdir}/libwireplumber-*.so.* \
+"
+
+FILES:${PN}-scripts +=3D "${datadir}/wireplumber/scripts/*"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES:${PN}-modules =3D ""
+RRECOMMENDS:${PN}-modules +=3D "${PN}-modules-meta"
--=20
2.32.0


