Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C204C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 16:51:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8261.1636131076890430225
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 997432F
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  5 Nov 2021 09:51:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28EED3F7F5
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  5 Nov 2021 09:51:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fwupd: add new recipe
Date: Fri,  5 Nov 2021 16:51:06 +0000
Message-Id: <20211105165106.3763152-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 16:51:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93846

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch | 141 ++++++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd/run-ptest     |   6 +
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb      | 101 +++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
 create mode 100755 meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch b/meta-oe/reci=
pes-bsp/fwupd/fwupd/no-bash.patch
new file mode 100644
index 0000000000..e0f83c4b6c
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
@@ -0,0 +1,141 @@
+Upstream-Status: Backport [a346c582cc0f34ac6c7c11251919c84553424efb]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/data/installed-tests/fwupd.sh b/data/installed-tests/fwupd.=
sh
+index 5b1f5d22..eaa5ec7f 100755
+--- a/data/installed-tests/fwupd.sh
++++ b/data/installed-tests/fwupd.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+=20
+ exec 2>&1
+ dirname=3D`dirname $0`
+@@ -7,7 +7,7 @@ run_test()
+ {
+         if [ -f $dirname/$1 ]; then
+                 $dirname/$1
+-                rc=3D$?; if [[ $rc !=3D 0 ]]; then exit $rc; fi
++                rc=3D$?; if [ $rc !=3D 0 ]; then exit $rc; fi
+         fi
+ }
+=20
+diff --git a/data/installed-tests/fwupdmgr.sh b/data/installed-tests/fwu=
pdmgr.sh
+index e3f7ee31..3d65395e 100755
+--- a/data/installed-tests/fwupdmgr.sh
++++ b/data/installed-tests/fwupdmgr.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+=20
+ exec 2>&1
+ device=3D08d460be0f1f9f128413f816022a6439e0078018
+@@ -13,47 +13,47 @@ error()
+ # ---
+ echo "Getting the list of remotes..."
+ fwupdmgr get-remotes
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Enabling fwupd-tests remote..."
+ fwupdmgr enable-remote fwupd-tests
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Update the device hash database..."
+ fwupdmgr verify-update $device
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Getting devices (should be one)..."
+ fwupdmgr get-devices --no-unreported-check
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Testing the verification of firmware..."
+ fwupdmgr verify $device
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Getting updates (should be one)..."
+ fwupdmgr --no-unreported-check --no-metadata-check get-updates
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Installing test firmware..."
+ fwupdmgr update $device -y
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Getting updates (should be none)..."
+ fwupdmgr --no-unreported-check --no-metadata-check get-updates
+-rc=3D$?; if [[ $rc !=3D 2 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 2 ]; then error $rc; fi
+=20
+ # ---
+ echo "Testing the verification of firmware (again)..."
+ fwupdmgr verify $device
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ if [ -z "$CI_NETWORK" ]; then
+         echo "Skipping remaining tests due to CI_NETWORK not being set"
+@@ -63,27 +63,27 @@ fi
+ # ---
+ echo "Downgrading to older release (requires network access)"
+ fwupdmgr downgrade $device -y
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Downgrading to older release (should be none)"
+ fwupdmgr downgrade $device
+-rc=3D$?; if [[ $rc !=3D 2 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 2 ]; then error $rc; fi
+=20
+ # ---
+ echo "Updating all devices to latest release (requires network access)"
+ fwupdmgr --no-unreported-check --no-metadata-check --no-reboot-check up=
date -y
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # ---
+ echo "Getting updates (should be none)..."
+ fwupdmgr --no-unreported-check --no-metadata-check get-updates
+-rc=3D$?; if [[ $rc !=3D 2 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 2 ]; then error $rc; fi
+=20
+ # ---
+ echo "Refreshing from the LVFS (requires network access)..."
+ fwupdmgr refresh
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi
+=20
+ # success!
+ exit 0
+diff --git a/plugins/uefi-capsule/fwupd.grub.conf.in b/plugins/uefi-caps=
ule/fwupd.grub.conf.in
+index 92bd49a1..9c3a22f2 100755
+--- a/plugins/uefi-capsule/fwupd.grub.conf.in
++++ b/plugins/uefi-capsule/fwupd.grub.conf.in
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ # SPDX-License-Identifier: LGPL-2.1+
+ set -e
+=20
+@@ -8,7 +8,7 @@ set -e
+=20
+ if [ -f @localstatedir@/lib/fwupd/uefi_capsule.conf ] &&
+    ls /sys/firmware/efi/efivars/fwupd-*-0abba7dc-e516-4167-bbf5-4d9d1c7=
39416 1>/dev/null 2>&1; then
+-      source @localstatedir@/lib/fwupd/uefi_capsule.conf
++      . @localstatedir@/lib/fwupd/uefi_capsule.conf
+       if [ "${EFI_PATH}" !=3D "" ] && [ "${ESP}" !=3D "" ]; then
+       echo "Adding Linux Firmware Updater entry" >&2
+ cat << EOF
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest b/meta-oe/recipes-=
bsp/fwupd/fwupd/run-ptest
new file mode 100755
index 0000000000..dbc0fc32a2
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
@@ -0,0 +1,6 @@
+#! /bin/sh
+
+# Don't run all of the fwupd tests, as fwupd/fwupdmgr.test needs a custo=
m
+# /etc/fwupd/daemon.conf with DisabledPlugins unset.
+
+gnome-desktop-testing-runner fwupd/fwupd.test
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb b/meta-oe/recipes-b=
sp/fwupd/fwupd_1.7.1.bb
new file mode 100644
index 0000000000..f034b847a3
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
@@ -0,0 +1,101 @@
+SUMMARY =3D "A simple daemon to allow session software to update firmwar=
e"
+LICENSE =3D "LGPL-2.1+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native=
"
+
+SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/1.7.1/${=
BP}.tar.xz \
+           file://run-ptest \
+           file://no-bash.patch"
+SRC_URI[sha256sum] =3D "ae56ceb44b786f21f54d133ac70bc5d9cb8cd4bda0167339=
c669a228da67fa3c"
+
+UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
+
+# Machine-specific as we examine MACHINE_FEATURES to decide whether to b=
uild the UEFI plugins
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+inherit meson vala gobject-introspection systemd bash-completion pkgconf=
ig gi-docgen ptest manpages
+
+GIDOCGEN_MESON_OPTION =3D 'docs'
+GIDOCGEN_MESON_ENABLE_FLAG =3D 'docgen'
+GIDOCGEN_MESON_DISABLE_FLAG =3D 'none'
+
+PACKAGECONFIG ??=3D "gnutls gudev gusb curl \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'polkit systemd=
', d)} \
+                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'plug=
in_uefi_capsule plugin_uefi_pk', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests plu=
gin_dummy', '', d)} \
+                   plugin_altos \
+                   plugin_amt \
+                   plugin_emmc \
+                   plugin_fastboot \
+                   plugin_flashrom \
+                   plugin_intel_spi \
+                   plugin_logitech_bulkcontroller \
+                   plugin_modem_manager \
+                   plugin_msr \
+                   plugin_nvme \
+                   plugin_parade_lspcon \
+                   plugin_platform_integrity \
+                   plugin_realtek_mst \
+                   plugin_redfish \
+                   plugin_synaptics_mst \
+                   plugin_synaptics_rmi \
+                   plugin_thunderbolt"
+
+PACKAGECONFIG[bluez] =3D "-Dbluez=3Dtrue,-Dbluez=3Dfalse"
+PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue,-Dconsolekit=3Dfalse,=
consolekit"
+PACKAGECONFIG[curl] =3D "-Dcurl=3Dtrue,-Dcurl=3Dfalse,curl"
+PACKAGECONFIG[firmware-packager] =3D "-Dfirmware-packager=3Dtrue,-Dfirmw=
are-packager=3Dfalse"
+PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
+PACKAGECONFIG[gudev] =3D "-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgudev"
+PACKAGECONFIG[gusb] =3D "-Dgusb=3Dtrue,-Dgusb=3Dfalse,libgusb"
+PACKAGECONFIG[libarchive] =3D "-Dlibarchive=3Dtrue,-Dlibarchive=3Dfalse,=
libarchive"
+PACKAGECONFIG[lzma] =3D "-Dlzma=3Dtrue,-Dlzma=3Dfalse,xz"
+PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse"
+PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse,polkit"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,gcab-native"
+
+# TODO plugins-all meta-option that expands to all plugin_*?
+PACKAGECONFIG[plugin_altos] =3D "-Dplugin_altos=3Dtrue,-Dplugin_altos=3D=
false,elfutils"
+PACKAGECONFIG[plugin_amt] =3D "-Dplugin_amt=3Dtrue,-Dplugin_amt=3Dfalse"
+PACKAGECONFIG[plugin_dell] =3D "-Dplugin_dell=3Dtrue,-Dplugin_dell=3Dfal=
se,libsmbios"
+PACKAGECONFIG[plugin_dummy] =3D "-Dplugin_dummy=3Dtrue,-Dplugin_dummy=3D=
false"
+PACKAGECONFIG[plugin_emmc] =3D "-Dplugin_emmc=3Dtrue,-Dplugin_emmc=3Dfal=
se"
+PACKAGECONFIG[plugin_fastboot] =3D "-Dplugin_fastboot=3Dtrue,-Dplugin_fa=
stboot=3Dfalse"
+PACKAGECONFIG[plugin_flashrom] =3D "-Dplugin_flashrom=3Dtrue,-Dplugin_fl=
ashrom=3Dfalse,flashrom"
+PACKAGECONFIG[plugin_intel_spi] =3D "-Dplugin_intel_spi=3Dtrue,-Dplugin_=
intel_spi=3Dfalse"
+PACKAGECONFIG[plugin_logitech_bulkcontroller] =3D "-Dplugin_logitech_bul=
kcontroller=3Dtrue,-Dplugin_logitech_bulkcontroller=3Dfalse,protobuf-c-na=
tive protobuf-c"
+PACKAGECONFIG[plugin_modem_manager] =3D "-Dplugin_modem_manager=3Dtrue,-=
Dplugin_modem_manager=3Dfalse,libqmi modemmanager"
+PACKAGECONFIG[plugin_msr] =3D "-Dplugin_msr=3Dtrue,-Dplugin_msr=3Dfalse,=
cpuid"
+PACKAGECONFIG[plugin_nvme] =3D "-Dplugin_nvme=3Dtrue,-Dplugin_nvme=3Dfal=
se"
+PACKAGECONFIG[plugin_parade_lspcon] =3D "-Dplugin_parade_lspcon=3Dtrue,-=
Dplugin_parade_lspcon=3Dfalse"
+PACKAGECONFIG[plugin_platform_integrity] =3D "-Dplugin_platform_integrit=
y=3Dtrue,-Dplugin_platform_integrity=3Dfalse"
+PACKAGECONFIG[plugin_realtek_mst] =3D "-Dplugin_realtek_mst=3Dtrue,-Dplu=
gin_realtek_mst=3Dfalse"
+PACKAGECONFIG[plugin_redfish] =3D "-Dplugin_redfish=3Dtrue,-Dplugin_redf=
ish=3Dfalse"
+PACKAGECONFIG[plugin_synaptics_mst] =3D "-Dplugin_synaptics_mst=3Dtrue,-=
Dplugin_synaptics_mst=3Dfalse"
+PACKAGECONFIG[plugin_synaptics_rmi] =3D "-Dplugin_synaptics_rmi=3Dtrue,-=
Dplugin_synaptics_rmi=3Dfalse"
+PACKAGECONFIG[plugin_thunderbolt] =3D "-Dplugin_thunderbolt=3Dtrue,-Dplu=
gin_thunderbolt=3Dfalse"
+PACKAGECONFIG[plugin_tpm] =3D "-Dplugin_tpm=3Dtrue,-Dplugin_tpm=3Dfalse,=
tpm2-tss"
+# Turn off the capsule splash as it needs G-I at buildtime, which isn't =
currently supported
+PACKAGECONFIG[plugin_uefi_capsule] =3D "-Dplugin_uefi_capsule=3Dtrue -Dp=
lugin_uefi_capsule_splash=3Dfalse,-Dplugin_uefi_capsule=3Dfalse,efivar fw=
upd-efi"
+PACKAGECONFIG[plugin_uefi_pk] =3D "-Dplugin_uefi_pk=3Dtrue,-Dplugin_uefi=
_pk=3Dfalse"
+
+# Always disable these plugins on non-x86 platforms as they don't compil=
e
+DISABLE_NON_X86 =3D "plugin_msr plugin_intel_spi"
+DISABLE_NON_X86:x86 =3D ""
+DISABLE_NON_X86:x86-64 =3D ""
+PACKAGECONFIG:remove:aarch64 =3D "${DISABLE_NON_X86}"
+
+FILES:${PN} +=3D "${libdir}/fwupd-plugins-* \
+                ${systemd_unitdir} \
+                ${datadir}/fish \
+                ${datadir}/metainfo \
+                ${datadir}/icons \
+                ${datadir}/dbus-1 \
+                ${datadir}/polkit-1 \
+                ${nonarch_libdir}/modules-load.d"
+
+FILES:${PN}-ptest +=3D "${libexecdir}/installed-tests/ \
+                      ${datadir}/installed-tests/"
+RDEPENDS:${PN}-ptest +=3D "gnome-desktop-testing"
--=20
2.25.1


