Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC25C677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:17:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.165011.1673871470238356634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 04:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4D5EAD7;
	Mon, 16 Jan 2023 04:18:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59C513F445;
	Mon, 16 Jan 2023 04:17:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] fwupd: Upgrade to 1.8.9
Date: Mon, 16 Jan 2023 12:17:44 +0000
Message-Id: <20230116121744.3153994-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 12:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100581

From: Richard Hughes <richard@hughsie.com>

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 ...e9c524998e449b822feb465a0c90317cd735.patch | 26 -------------------
 .../fwupd/{fwupd_1.8.4.bb =3D> fwupd_1.8.9.bb}  | 20 ++++++++------
 2 files changed, 12 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822=
feb465a0c90317cd735.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.8.4.bb =3D> fwupd_1.8.9.bb} (8=
9%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822feb465a=
0c90317cd735.patch b/meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b82=
2feb465a0c90317cd735.patch
deleted file mode 100644
index 947c76403..000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822feb465a0c90317=
cd735.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c54ae9c524998e449b822feb465a0c90317cd735 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Sep 2022 15:10:26 +0100
-Subject: [PATCH] trivial: Fix compile when using python 3.7 or older
-
-Upstream-Status: Backport [https://github.com/fwupd/fwupd/pull/5051]
-Signed-off-by: Richard Hughes <richard@hughsie.com>
----
- contrib/generate-gresource-xml.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/contrib/generate-gresource-xml.py b/contrib/generate-gresou=
rce-xml.py
-index 235a770020..569c804937 100755
---- a/contrib/generate-gresource-xml.py
-+++ b/contrib/generate-gresource-xml.py
-@@ -23,6 +23,9 @@
-         n_file.set("preprocess", "xml-stripblanks")
-     n_file.set("alias", os.path.basename(fn))
- with open(sys.argv[1], "wb") as f:
--    f.write(ET.tostring(root, "utf-8", xml_declaration=3DTrue))
-+    try:
-+        f.write(ET.tostring(root, "utf-8", xml_declaration=3DTrue))
-+    except TypeError:
-+        f.write(ET.tostring(root, "utf-8"))
-=20
- sys.exit(0)
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-b=
sp/fwupd/fwupd_1.8.9.bb
similarity index 89%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
index 99077923d..0f889ca8f 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 DEPENDS =3D "glib-2.0 libxmlb json-glib libjcat gcab vala-native"
=20
 SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${=
BP}.tar.xz \
-           file://c54ae9c524998e449b822feb465a0c90317cd735.patch \
            file://run-ptest"
-SRC_URI[sha256sum] =3D "adfa07434cdc29ec41c40fef460e8d970963fe0c7e849dec=
7f3932adb161f886"
+SRC_URI[sha256sum] =3D "719a791ac4ba5988aeb93ec42778bd65d33cb075d0c093b5=
c04e5e1682be528a"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
=20
@@ -18,7 +17,7 @@ inherit meson vala gobject-introspection systemd bash-c=
ompletion pkgconfig gi-do
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'docgen'
-GIDOCGEN_MESON_DISABLE_FLAG =3D 'none'
+GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG ??=3D "curl gnutls gudev gusb \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'bluetooth polk=
it', d)} \
@@ -26,23 +25,25 @@ PACKAGECONFIG ??=3D "curl gnutls gudev gusb \
                    ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'plug=
in_uefi_capsule plugin_uefi_pk', '', d)} \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests plu=
gin_dummy', '', d)} \
                    hsi \
+                   plugin_android_boot \
                    plugin_acpi_phat \
-                   plugin_amt \
                    plugin_bcm57xx \
                    plugin_emmc \
                    plugin_ep963x \
                    plugin_fastboot \
                    plugin_flashrom \
                    plugin_gpio \
+                   plugin_igsc \
+                   plugin_intel_me \
                    plugin_intel_spi \
                    plugin_logitech_bulkcontroller \
+                   plugin_logitech_scribe \
                    plugin_modem_manager \
                    plugin_msr \
                    plugin_nitrokey \
                    plugin_nvme \
                    plugin_parade_lspcon \
                    plugin_pixart_rf \
-                   plugin_platform_integrity \
                    plugin_realtek_mst \
                    plugin_redfish \
                    plugin_synaptics_mst \
@@ -74,7 +75,7 @@ PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfals=
e,gcab-native"
=20
 # TODO plugins-all meta-option that expands to all plugin_*?
 PACKAGECONFIG[plugin_acpi_phat] =3D "-Dplugin_acpi_phat=3Dtrue,-Dplugin_=
acpi_phat=3Dfalse"
-PACKAGECONFIG[plugin_amt] =3D "-Dplugin_amt=3Dtrue,-Dplugin_amt=3Dfalse"
+PACKAGECONFIG[plugin_android_boot] =3D "-Dplugin_android_boot=3Denabled,=
-Dplugin_android_boot=3Ddisabled"
 PACKAGECONFIG[plugin_bcm57xx] =3D "-Dplugin_bcm57xx=3Dtrue,-Dplugin_bcm5=
7xx=3Dfalse"
 PACKAGECONFIG[plugin_cfu] =3D "-Dplugin_cfu=3Dtrue,-Dplugin_cfu=3Dfalse"
 PACKAGECONFIG[plugin_dell] =3D "-Dplugin_dell=3Dtrue,-Dplugin_dell=3Dfal=
se,libsmbios"
@@ -84,15 +85,17 @@ PACKAGECONFIG[plugin_ep963x] =3D "-Dplugin_ep963x=3Dt=
rue,-Dplugin_ep963x=3Dfalse"
 PACKAGECONFIG[plugin_fastboot] =3D "-Dplugin_fastboot=3Dtrue,-Dplugin_fa=
stboot=3Dfalse"
 PACKAGECONFIG[plugin_flashrom] =3D "-Dplugin_flashrom=3Dtrue,-Dplugin_fl=
ashrom=3Dfalse,flashrom"
 PACKAGECONFIG[plugin_gpio] =3D "-Dplugin_gpio=3Dtrue,-Dplugin_gpio=3Dfal=
se"
+PACKAGECONFIG[plugin_igsc] =3D "-Dplugin_igsc=3Denabled,-Dplugin_igsc=3D=
disabled"
+PACKAGECONFIG[plugin_intel_me] =3D "-Dplugin_intel_me=3Denabled,-Dplugin=
_intel_me=3Ddisabled"
 PACKAGECONFIG[plugin_intel_spi] =3D "-Dplugin_intel_spi=3Dtrue -Dlzma=3D=
true,-Dplugin_intel_spi=3Dfalse -Dlzma=3Dfalse,xz"
 PACKAGECONFIG[plugin_logitech_bulkcontroller] =3D "-Dplugin_logitech_bul=
kcontroller=3Dtrue,-Dplugin_logitech_bulkcontroller=3Dfalse,protobuf-c-na=
tive protobuf-c"
+PACKAGECONFIG[plugin_logitech_scribe] =3D "-Dplugin_logitech_scribe=3Den=
abled,-Dplugin_logitech_scribe=3Ddisabled"
 PACKAGECONFIG[plugin_modem_manager] =3D "-Dplugin_modem_manager=3Dtrue,-=
Dplugin_modem_manager=3Dfalse,libqmi modemmanager"
 PACKAGECONFIG[plugin_msr] =3D "-Dplugin_msr=3Dtrue,-Dplugin_msr=3Dfalse,=
cpuid"
 PACKAGECONFIG[plugin_nitrokey] =3D "-Dplugin_nitrokey=3Dtrue,-Dplugin_ni=
trokey=3Dfalse"
 PACKAGECONFIG[plugin_nvme] =3D "-Dplugin_nvme=3Dtrue,-Dplugin_nvme=3Dfal=
se"
 PACKAGECONFIG[plugin_parade_lspcon] =3D "-Dplugin_parade_lspcon=3Dtrue,-=
Dplugin_parade_lspcon=3Dfalse"
 PACKAGECONFIG[plugin_pixart_rf] =3D "-Dplugin_pixart_rf=3Dtrue,-Dplugin_=
pixart_rf=3Dfalse"
-PACKAGECONFIG[plugin_platform_integrity] =3D "-Dplugin_platform_integrit=
y=3Dtrue,-Dplugin_platform_integrity=3Dfalse"
 PACKAGECONFIG[plugin_powerd] =3D "-Dplugin_powerd=3Dtrue,-Dplugin_powerd=
=3Dfalse"
 PACKAGECONFIG[plugin_realtek_mst] =3D "-Dplugin_realtek_mst=3Dtrue,-Dplu=
gin_realtek_mst=3Dfalse"
 PACKAGECONFIG[plugin_redfish] =3D "-Dplugin_redfish=3Dtrue,-Dplugin_redf=
ish=3Dfalse"
@@ -107,12 +110,13 @@ PACKAGECONFIG[plugin_uf2] =3D "-Dplugin_uf2=3Dtrue,=
-Dplugin_uf2=3Dfalse"
 PACKAGECONFIG[plugin_upower] =3D "-Dplugin_upower=3Dtrue,-Dplugin_upower=
=3Dfalse"
=20
 # Always disable these plugins on non-x86 platforms as they don't compil=
e or are useless
-DISABLE_NON_X86 =3D "plugin_amt plugin_intel_spi plugin_msr"
+DISABLE_NON_X86 =3D "plugin_intel_me plugin_intel_spi plugin_msr"
 DISABLE_NON_X86:x86 =3D ""
 DISABLE_NON_X86:x86-64 =3D ""
 PACKAGECONFIG:remove =3D "${DISABLE_NON_X86}"
=20
 FILES:${PN} +=3D "${libdir}/fwupd-plugins-* \
+                ${libdir}/fwupd-${PV} \
                 ${systemd_unitdir} \
                 ${datadir}/fish \
                 ${datadir}/metainfo \
--=20
2.39.0


