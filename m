Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967AAC10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 11:52:52 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.33432.1715514770840808499
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 04:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id 6DD0818316
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 13:52:49 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.32.90]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s67l1-0rN8YC0; Sun, 12 May 2024 13:52:47 +0200
Date: Sun, 12 May 2024 13:53:19 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv4] malcontent: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <VOFDDS.YCLQ7HLIMQ9W@t-online.de>
In-Reply-To: <17CEBB8BE93D8361.21609@lists.openembedded.org>
References: <17CEBB8BE93D8361.21609@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-B1qowklhSRuydNSNBXS1"
X-TOI-EXPURGATEID: 150726::1715514767-A540BED6-C0C8369A/0/0 CLEAN NORMAL
X-TOI-MSGID: 98a12737-f62f-4768-8f2d-e990de902cdd
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110321

--=-B1qowklhSRuydNSNBXS1
Content-Type: text/plain; charset=us-ascii; format=flowed

v4 adds gobject-introspection to required distrofeatures for 
malcontent-ui

On Sun, May 12 2024 at 01:52:26 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> malcontent is an optional dependency for flatpak and gnome-software
> 
> - Building the malcontent gtk4-ui leads to circular dependency 
> malcontent <-> flatpak
>   Add a separate package for malcontent-ui to avoid this and to make 
> malcontent-control
>   buildable.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../malcontent/malcontent-ui_0.12.0.bb        | 49 
> +++++++++++++++++++
>  .../malcontent/malcontent_0.12.0.bb           | 41 ++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 
> meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
>  create mode 100644 
> meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
> 
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb 
> b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
> new file mode 100644
> index 000000000..effd181b1
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "User-Interface for malcontent."
> +HOMEPAGE = "<https://gitlab.freedesktop.org/pwithnall/malcontent>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/>
> +
> +SRC_URI = 
> "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=main"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
> +
> +DEPENDS = " \
> +	accountsservice \
> +	glib-2.0 \
> +	glib-testing \
> +	dbus \
> +	desktop-file-utils-native \
> +	itstool-native \
> +	libpam \
> +	malcontent \
> +	polkit \
> +	appstream \
> +	flatpak \
> +	libadwaita \
> +	gtk4 \
> +"
> +
> +GIR_MESON_OPTION = ""GTKIC_VERSION = "4"
> +inherit  meson pkgconfig gtk-icon-cache gobject-introspection 
> gettext features_check
> +
> +REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
> +
> +EXTRA_OEMESON = "-Dui=enabled"
> +
> +do_install() {
> +	install -d ${D}${datadir}/gir-1.0 ${D}${libdir}/girepository-1.0 
> ${D}${bindir}
> +	install -d ${D}${datadir}/polkit-1/actions ${D}${datadir}/metainfo 
> ${D}${datadir}/applications
> +	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.gir 
> ${D}${datadir}/gir-1.0
> +	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.typelib 
> ${D}${libdir}/girepository-1.0
> +	ln -sf libmalcontent-ui-1.so.1 ${D}${libdir}/libmalcontent-ui-1.so
> +	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.1 
> ${D}${libdir}
> +	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.0.12.0 
> ${D}${libdir}
> +	install -m 0755 ${B}/malcontent-control/malcontent-control 
> ${D}${bindir}
> +	install -m 0644 
> ${B}/malcontent-control/org.freedesktop.MalcontentControl.policy 
> ${D}${datadir}/polkit-1/actions
> +	install -m 0644 
> ${B}/malcontent-control/org.freedesktop.MalcontentControl.appdata.xml 
> ${D}${datadir}/metainfo
> +	install -m 0644 
> ${B}/malcontent-control/org.freedesktop.MalcontentControl.desktop 
> ${D}${datadir}/applications
> +}
> +
> +FILES:${PN} = "${bindir} ${libdir} ${datadir}"
> +
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb 
> b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
> new file mode 100644
> index 000000000..416751423
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "malcontent implements support for restricting the type of 
> content."
> +HOMEPAGE = "<https://gitlab.freedesktop.org/pwithnall/malcontent>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/>
> +
> +SRC_URI = 
> "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=main"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
> +
> +DEPENDS = " \
> +	accountsservice \
> +	glib-2.0 \
> +	glib-testing \
> +	dbus \
> +	itstool-native \
> +	libpam \
> +	polkit \
> +"
> +
> +GIR_MESON_OPTION = ""
> +
> +inherit  meson pkgconfig gobject-introspection gettext 
> features_check useradd
> +
> +REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
> +
> +PACKAGECONFIG ?= "ui"
> +PACKAGECONFIG[ui] = ",,,malcontent-ui"
> +
> +EXTRA_OEMESON = "-Dui=disabled"
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
> +
> +do_install:append() {
> +        # Fix up permissions on polkit rules.d to work with rpm4 
> constraints
> +        chmod 700 ${D}/${datadir}/polkit-1/rules.d
> +        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> +}
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110320): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110320>
> Mute This Topic: <https://lists.openembedded.org/mt/106053575/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-B1qowklhSRuydNSNBXS1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v4 adds gobject-introspection to required distrofeatures for malcontent-ui</div></div><div id="geary-quote" dir="auto"><br>On Sun, May 12 2024 at 01:52:26 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">malcontent is an optional dependency for flatpak and gnome-software

- Building the malcontent gtk4-ui leads to circular dependency malcontent &lt;-&gt; flatpak
  Add a separate package for malcontent-ui to avoid this and to make malcontent-control
  buildable.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../malcontent/malcontent-ui_0.12.0.bb        | 49 +++++++++++++++++++
 .../malcontent/malcontent_0.12.0.bb           | 41 ++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
 create mode 100644 meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
new file mode 100644
index 000000000..effd181b1
--- /dev/null
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
@@ -0,0 +1,49 @@
+SUMMARY = "User-Interface for malcontent."
+HOMEPAGE = "<a href="https://gitlab.freedesktop.org/pwithnall/malcontent">https://gitlab.freedesktop.org/pwithnall/malcontent</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c" "="">file://COPYING;md5=4fbd65380cdd255951079008b364516c"</a>
+
+SRC_URI = "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
+SRCREV = "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
+
+DEPENDS = " \
+	accountsservice \
+	glib-2.0 \
+	glib-testing \
+	dbus \
+	desktop-file-utils-native \
+	itstool-native \
+	libpam \
+	malcontent \
+	polkit \
+	appstream \
+	flatpak \
+	libadwaita \
+	gtk4 \
+"
+
+GIR_MESON_OPTION = ""GTKIC_VERSION = "4"
+inherit  meson pkgconfig gtk-icon-cache gobject-introspection gettext features_check
+
+REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
+
+EXTRA_OEMESON = "-Dui=enabled"
+
+do_install() {
+	install -d ${D}${datadir}/gir-1.0 ${D}${libdir}/girepository-1.0 ${D}${bindir}
+	install -d ${D}${datadir}/polkit-1/actions ${D}${datadir}/metainfo ${D}${datadir}/applications
+	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.gir ${D}${datadir}/gir-1.0
+	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.typelib ${D}${libdir}/girepository-1.0
+	ln -sf libmalcontent-ui-1.so.1 ${D}${libdir}/libmalcontent-ui-1.so
+	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.1 ${D}${libdir}
+	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.0.12.0 ${D}${libdir}
+	install -m 0755 ${B}/malcontent-control/malcontent-control ${D}${bindir}
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentControl.policy ${D}${datadir}/polkit-1/actions
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentControl.appdata.xml ${D}${datadir}/metainfo
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentControl.desktop ${D}${datadir}/applications
+}
+
+FILES:${PN} = "${bindir} ${libdir} ${datadir}"
+
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
new file mode 100644
index 000000000..416751423
--- /dev/null
+++ b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
@@ -0,0 +1,41 @@
+SUMMARY = "malcontent implements support for restricting the type of content."
+HOMEPAGE = "<a href="https://gitlab.freedesktop.org/pwithnall/malcontent">https://gitlab.freedesktop.org/pwithnall/malcontent</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c" "="">file://COPYING;md5=4fbd65380cdd255951079008b364516c"</a>
+
+SRC_URI = "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
+SRCREV = "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
+
+DEPENDS = " \
+	accountsservice \
+	glib-2.0 \
+	glib-testing \
+	dbus \
+	itstool-native \
+	libpam \
+	polkit \
+"
+
+GIR_MESON_OPTION = ""
+
+inherit  meson pkgconfig gobject-introspection gettext features_check useradd
+
+REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
+
+PACKAGECONFIG ?= "ui"
+PACKAGECONFIG[ui] = ",,,malcontent-ui"
+
+EXTRA_OEMESON = "-Dui=disabled"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
+
+do_install:append() {
+        # Fix up permissions on polkit rules.d to work with rpm4 constraints
+        chmod 700 ${D}/${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
+FILES:${PN} += "${libdir} ${datadir}"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110320): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110320">https://lists.openembedded.org/g/openembedded-devel/message/110320</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/106053575/3618223">https://lists.openembedded.org/mt/106053575/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-B1qowklhSRuydNSNBXS1--


