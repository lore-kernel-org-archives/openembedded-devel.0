Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web09.5463.1614771708023161621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 03:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=yObwDKVB;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4DrBt20L5DzQlX5;
	Wed,  3 Mar 2021 12:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1614771701; bh=+yORyqIb4rPOF98crfdROmmx/RtO17eSs
	bq2Ypvh1DE=; b=yObwDKVBhM+U2NOc1xIlUZlyljUOKj7DlbgKbN89dQMNk5phv
	F9c/LJxXcppP1yzVnVCmRNgzhaw5bUhjzzOa3LoCWk7i359r0wkpoPpaPZKRsn+7
	RoZGaD5HbYAT7IHN4mJG5iLtJAjFrmbPzb1j8nRXAsxHAn+ybBZA7qPe9x63nV4k
	QvhlAT0jCvAk6KC7MrHE2kySX5cVNussu0wrxy3s5LCHKKRcSfwc6BfCOdU0RQyI
	Ad9Ky4gh6YmBXFqKuiR0kMnxXuAx2qrGQFGZKVnkNzd78OHcfgJ7jHlbKHrbE+82
	eghcsqm77oMqqCVByK2jiiddMVieff8Yrdgaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1614771704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpnsInOOm+XzkPTLq4vPCjFctcMTn/R29xfIK7N6XEk=;
	b=QII61puL9z/8cZasOxmFVrwYnSzm0MDmG6Qoq2sS9Jd14funKTZvxEMMSIAQtvazR9c+9p
	ZIkUDV9MyL0P+dgoP6DO2jzUfqYZBOVmqzJQPPeR9sCjwFvcehPGZkJ+zjfIw5oQ1oAt7u
	kuoH6foJlmk2g3WFuWkiGn1hJvBb8sUMbxbKkGIJD6hMnLr/xUB+8wBRvLNrHXCBUDI+Eq
	RbI1Nt/Bd7Ti0eKvvvu3+U7W8vmCkDU+xTzZZPEIiO3HtOgnvjyWDCvNNyOUzDzebT2TVK
	nPvdpun936UzZuYBrDP0VDabgadR9R8I7SVZCzhgXoH0IEorXidzMt9RgFfwyw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
	with ESMTP id Lyx21kDlaCNS; Wed,  3 Mar 2021 12:41:41 +0100 (CET)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: quentin.schulz@streamunlimited.com,
	george.kiagiadakis@collabora.com
Subject: [meta-multimedia][PATCH 2/2] pipewire: Rework 0.3 recipe and upgrade to 0.3.22
Date: Wed,  3 Mar 2021 12:41:30 +0100
Message-Id: <20210303114130.2317817-2-crg7475@mailbox.org>
In-Reply-To: <20210303114130.2317817-1-crg7475@mailbox.org>
References: <20210303114130.2317817-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.82 / 15.00 / 15.00
X-Rspamd-Queue-Id: DCFC98C9
X-Rspamd-UID: 383c6e
Content-Transfer-Encoding: quoted-printable

* Use a versioned recipe instead of _git
* Add more packageconfigs: alsa, docs, sdl2, sndfile, v4l2,
  pipewire-alsa, pipewire-jack
* Split SPA and module packages dynamically to generate one package for
  each SPA plugin and for each module
* Split pipewire library, shim PulseAudio daemon, main tools & SPA tools,
  pipewire-alsa, pipewire-jack, ALSA card profiles, GStreamer plugin,
  and example session manager into separate packages
* Set up a "pipewire" user and group to run the PipeWire daemon with that
  user instead of root

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../pipewire/pipewire_0.3.22.bb               | 273 ++++++++++++++++++
 .../pipewire/pipewire_git.bb                  |  77 -----
 2 files changed, 273 insertions(+), 77 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_=
0.3.22.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_=
git.bb

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
new file mode 100644
index 000000000..b54be7f89
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
@@ -0,0 +1,273 @@
+SUMMARY =3D "Multimedia processing server for Linux"
+DESCRIPTION =3D "Linux server for handling and routing audio and video s=
treams between applications and multimedia I/O devices"
+HOMEPAGE =3D "https://pipewire.org/"
+BUGTRACKER  =3D "https://gitlab.freedesktop.org/pipewire/pipewire/issues=
"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69 \
+    file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
+"
+SECTION =3D "multimedia"
+
+DEPENDS =3D "dbus"
+
+SRCREV =3D "22d563720a7f6ba7bdf59950f8c14488d80dfa95"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd manpages gettext useradd
+
+USERADD_PACKAGES =3D "${PN}"
+
+GROUPADD_PARAM_${PN} =3D "--system pipewire"
+
+USERADD_PARAM_${PN} =3D "--system --home / --no-create-home \
+                       --comment 'PipeWire multimedia daemon' \
+                       --gid pipewire --groups audio,video \
+                       pipewire"
+
+# For "EVL", look up https://evlproject.org/ . It involves
+# a specially prepared kernel, and is currently unavailable
+# in Yocto.
+# FFmpeg and Vulkan aren't really supported - at the current
+# stage (version 0.3.22), these are just experiments, not
+# actual features.
+# libcamera support currently does not build successfully.
+# systemd user service files are disabled because per-user
+# PipeWire instances aren't really something that makes
+# much sense in an embedded environment. A system-wide
+# instance does.
+EXTRA_OEMESON +=3D " \
+    -Daudiotestsrc=3Dtrue \
+    -Devl=3Dfalse \
+    -Dsystemd-user-service=3Dfalse \
+    -Dtests=3Dfalse \
+    -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \
+    -Dvideotestsrc=3Dtrue \
+    -Dffmpeg=3Dfalse \
+    -Dvulkan=3Dfalse \
+    -Dlibcamera=3Dfalse \
+"
+
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
+    gstreamer jack v4l2 \
+"
+
+# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
+# since "jack" imports libjack, and "pipewire-jack" generates
+# libjack.so* files, thus colliding with the libpack package. This
+# is why these two are marked in their respective packageconfigs
+# as being in conflict.
+
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib udev"
+PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 sbc"
+PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,doxygen"
+PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gli=
b-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jack] =3D "-Djack=3Dtrue,-Djack=3Dfalse,jack,,,pipewire-ja=
ck"
+PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-pe=
rl-native"
+PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
+PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd-system-service=3D=
true ,-Dsystemd=3Dfalse -Dsystemd-system-service=3Dfalse,systemd"
+PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Dtrue,-Dv4l2=3Dfalse,udev"
+PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Dtrue,-Dpipewire-alsa=
=3Dfalse,alsa-lib"
+PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Dtrue -Dlibjack-path=3D=
${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Dfalse,jack,,,jack"
+
+PACKAGESPLITFUNCS_prepend =3D " split_dynamic_packages "
+PACKAGESPLITFUNCS_append =3D " set_dynamic_metapkg_rdepends "
+
+SPA_SUBDIR =3D "spa-0.2"
+PW_MODULE_SUBDIR =3D "pipewire-0.3"
+
+remove_unused_installed_files() {
+    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
+    # Remove it if pipewire-jack is not built to avoid creating the
+    # pipewire-jack package.
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', '=
true', d)}; then
+        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
+    fi
+}
+
+do_install[postfuncs] +=3D "remove_unused_installed_files"
+
+python split_dynamic_packages () {
+    # Create packages for each SPA plugin. These plugins are located
+    # in individual subdirectories, so a recursive search is needed.
+    spa_libdir =3D d.expand('${libdir}/${SPA_SUBDIR}')
+    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$', d.expand('${P=
N}-spa-plugins-%s'), 'PipeWire SPA plugin for %s', extra_depends=3D'', re=
cursive=3DTrue)
+
+    # Create packages for each PipeWire module.
+    pw_module_libdir =3D d.expand('${libdir}/${PW_MODULE_SUBDIR}')
+    do_split_packages(d, pw_module_libdir, r'^libpipewire-module-(.*)\.s=
o$', d.expand('${PN}-modules-%s'), 'PipeWire %s module', extra_depends=3D=
'', recursive=3DFalse)
+}
+
+python set_dynamic_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    # Go through all generated SPA plugin and PipeWire module packages
+    # (excluding the main package and the -meta package itself) and
+    # add them to the -meta package as RDEPENDS.
+
+    base_pn =3D d.getVar('PN')
+
+    spa_pn =3D base_pn + '-spa-plugins'
+    spa_metapkg =3D  spa_pn + '-meta'
+
+    pw_module_pn =3D base_pn + '-modules'
+    pw_module_metapkg =3D  pw_module_pn + '-meta'
+
+    d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
+    d.setVar('FILES_' + spa_metapkg, "")
+
+    d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
+    d.setVar('FILES_' + pw_module_metapkg, "")
+
+    blacklist =3D [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg=
 ]
+    spa_metapkg_rdepends =3D []
+    pw_module_metapkg_rdepends =3D []
+    pkgdest =3D d.getVar('PKGDEST')
+
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in blacklist:
+            continue
+
+        is_spa_pkg =3D pkg.startswith(spa_pn)
+        is_pw_module_pkg =3D pkg.startswith(pw_module_pn)
+        if not is_spa_pkg and not is_pw_module_pkg:
+            continue
+
+        if pkg in spa_metapkg_rdepends or pkg in pw_module_metapkg_rdepe=
nds:
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
+            if is_spa_pkg:
+                spa_metapkg_rdepends.append(pkg)
+            if is_pw_module_pkg:
+                pw_module_metapkg_rdepends.append(pkg)
+
+    d.setVar('RDEPENDS_' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' meta package')
+
+    d.setVar('RDEPENDS_' + pw_module_metapkg, ' '.join(pw_module_metapkg=
_rdepends))
+    d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_module_pn + ' meta p=
ackage')
+}
+
+PACKAGES =3D+ "\
+    libpipewire \
+    ${PN}-tools \
+    ${PN}-pulse \
+    ${PN}-alsa \
+    ${PN}-jack \
+    ${PN}-media-session \
+    ${PN}-spa-plugins \
+    ${PN}-spa-plugins-meta \
+    ${PN}-spa-tools \
+    ${PN}-modules \
+    ${PN}-modules-meta \
+    ${PN}-alsa-card-profile \
+    gstreamer1.0-pipewire \
+"
+
+PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-modules.*"
+
+SYSTEMD_SERVICE_${PN} =3D "pipewire.service"
+CONFFILES_${PN} +=3D "${sysconfdir}/pipewire/pipewire.conf"
+FILES_${PN} =3D " \
+    ${sysconfdir}/pipewire/pipewire.conf \
+    ${systemd_user_unitdir}/pipewire.* \
+    ${bindir}/pipewire \
+"
+
+FILES_${PN}-dev +=3D " \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
+"
+
+CONFFILES_libpipewire +=3D "${sysconfdir}/pipewire/client.conf"
+FILES_libpipewire =3D " \
+    ${sysconfdir}/pipewire/client.conf \
+    ${libdir}/libpipewire-*.so.* \
+"
+# Add the bare minimum modules and plugins required to be able
+# to use libpipewire. Without these, it is essentially unusable.
+RDEPENDS_libpipewire +=3D " \
+    ${PN}-modules-client-node \
+    ${PN}-modules-protocol-native \
+    ${PN}-spa-plugins-support \
+"
+
+FILES_${PN}-tools =3D " \
+    ${bindir}/pw-* \
+"
+
+# This is a shim daemon that is intended to be used as a
+# drop-in PulseAudio replacement, providing a pulseaudio-compatible
+# socket that can be used by applications that use libpulse.
+CONFFILES_${PN}-pulse +=3D "${sysconfdir}/pipewire/pipewire-pulse.conf"
+FILES_${PN}-pulse =3D " \
+    ${sysconfdir}/pipewire/pipewire-pulse.conf \
+    ${systemd_user_unitdir}/pipewire-pulse.* \
+    ${bindir}/pipewire-pulse \
+"
+RDEPENDS_${PN}-pulse +=3D " \
+    ${PN}-modules-protocol-pulse \
+"
+
+# alsa plugin to redirect audio to pipewire
+FILES_${PN}-alsa =3D "\
+    ${libdir}/alsa-lib/* \
+    ${datadir}/alsa/alsa.conf.d/* \
+"
+
+# jack drop-in libraries to redirect audio to pipewire
+CONFFILES_${PN}-jack =3D "${sysconfdir}/pipewire/jack.conf"
+FILES_${PN}-jack =3D "\
+    ${sysconfdir}/pipewire/jack.conf \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
+"
+
+# Example session manager. Not intended for use in production.
+CONFFILES_${PN}-media-session =3D "${sysconfdir}/pipewire/media-session.=
d/*"
+FILES_${PN}-media-session =3D " \
+    ${bindir}/pipewire-media-session \
+    ${sysconfdir}/pipewire/media-session.d/* \
+"
+RPROVIDES_${PN}-media-session =3D "virtual/pipewire-sessionmanager"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES_${PN}-spa-plugins =3D ""
+RRECOMMENDS_${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"
+
+FILES_${PN}-spa-tools =3D " \
+    ${bindir}/spa-* \
+"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES_${PN}-modules =3D ""
+RRECOMMENDS_${PN}-modules +=3D "${PN}-modules-meta"
+
+CONFFILES_${PN}-modules-rtkit =3D "${sysconfdir}/pipewire/client-rt.conf=
"
+FILES_${PN}-modules-rtkit +=3D " \
+    ${sysconfdir}/pipewire/client-rt.conf \
+    "
+
+FILES_${PN}-alsa-card-profile =3D " \
+    ${datadir}/alsa-card-profile/* \
+    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
+"
+
+FILES_gstreamer1.0-pipewire =3D " \
+    ${libdir}/gstreamer-1.0/* \
+"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb =
b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
deleted file mode 100644
index 173b695e1..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-SUMMARY =3D "Multimedia processing server for Linux"
-AUTHOR =3D "Wim Taymans <wtaymans@redhat.com>"
-HOMEPAGE =3D "https://pipewire.org"
-SECTION =3D "multimedia"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D " \
-    file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69 \
-    file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
-"
-DEPENDS =3D "alsa-lib dbus udev"
-SRCREV =3D "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
-PV =3D "0.3.1"
-
-SRC_URI =3D "git://github.com/PipeWire/pipewire"
-
-S =3D "${WORKDIR}/git"
-
-inherit meson pkgconfig systemd manpages
-
-PACKAGECONFIG ??=3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan', d=
)} \
-    jack gstreamer \
-"
-
-PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 sbc"
-PACKAGECONFIG[jack] =3D "-Djack=3Dtrue,-Djack=3Dfalse,jack"
-PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gli=
b-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-pe=
rl-native"
-PACKAGECONFIG[pulseaudio] =3D "-Dpipewire-pulseaudio=3Dtrue,-Dpipewire-p=
ulseaudio=3Dfalse,pulseaudio"
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
-PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Dtrue,-Dvulkan=3Dfalse,vulkan-loade=
r"
-
-LDFLAGS_append_mipsarch =3D " -latomic"
-LDFLAGS_append_x86 =3D " -latomic"
-LDFLAGS_append_riscv32 =3D " -latomic"
-
-PACKAGES =3D+ "\
-    ${PN}-spa-plugins \
-    ${PN}-alsa \
-    ${PN}-config \
-    gstreamer1.0-${PN} \
-    lib${PN} \
-    lib${PN}-modules \
-    lib${PN}-jack \
-"
-
-RDEPENDS_lib${PN} +=3D "lib${PN}-modules ${PN}-spa-plugins"
-
-FILES_${PN} =3D "\
-    ${sysconfdir}/pipewire/pipewire.conf \
-    ${bindir}/pw-* \
-    ${bindir}/pipewire* \
-    ${systemd_user_unitdir}/* \
-"
-FILES_lib${PN} =3D "\
-    ${libdir}/libpipewire-*.so.* \
-    ${libdir}/libjack-*.so.* \
-    ${libdir}/libpulse-*.so.* \
-"
-FILES_lib${PN}-modules =3D "\
-    ${libdir}/pipewire-*/* \
-"
-FILES_${PN}-spa-plugins =3D "\
-    ${bindir}/spa-* \
-    ${libdir}/spa-*/* \
-"
-FILES_${PN}-alsa =3D "\
-    ${libdir}/alsa-lib/* \
-"
-FILES_gstreamer1.0-${PN} =3D "\
-    ${libdir}/gstreamer-1.0/* \
-"
-
-CONFFILES_${PN} =3D "\
-    ${sysconfdir}/pipewire/pipewire.conf \
-"
--=20
2.25.1

