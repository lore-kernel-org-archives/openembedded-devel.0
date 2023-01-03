Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27DBC46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 17:17:32 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.69574.1672766244082210180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 09:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 8C4AB125E7
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 18:17:21 +0100 (CET)
Received: from [192.168.178.83] ([79.219.228.243]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pCkuc-0FPq080; Tue, 3 Jan 2023 18:17:18 +0100
Date: Tue, 03 Jan 2023 18:17:12 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCHv2] xdg-desktop-portal-gtk: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <OO6XNR.MENP0LSUPL5C1@t-online.de>
In-Reply-To: <20230103171327.183892-1-f_l_k@t-online.de>
References: <20230103171327.183892-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6iYpIHkpmfjzbPvbvYym"
X-TOI-EXPURGATEID: 150726::1672766238-6B7FA9DD-B1BD0DDE/0/0 CLEAN NORMAL
X-TOI-MSGID: 26fb4130-2707-482f-a3e3-c62c4ffcf055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 17:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100368

--=-6iYpIHkpmfjzbPvbvYym
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 excludes the background portal by default because it requires 
gnome-shell to be installed

Am Di, 3. Jan 2023 um 18:13:27 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
>  - add it as denpendency for xdg-desktop-portal-gnome
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../xdg-desktop-portal-gnome_43.1.bb          |  3 ++
>  .../xdg-desktop-portal-gtk_1.14.1.bb          | 42 
> +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 
> meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
> 
> diff --git 
> a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb 
> b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
> index a1532c24c..050ce1a04 100644
> --- 
> a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
> +++ 
> b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
> @@ -7,6 +7,7 @@ DEPENDS = " \
>      glib-2.0-native \
>      gtk4\
>      xdg-desktop-portal \
> +    xdg-desktop-portal-gtk \
>      libadwaita \
>      fontconfig \
>      gsettings-desktop-schemas \
> @@ -14,6 +15,8 @@ DEPENDS = " \
>      dconf \
>  "
> 
> +RDEPENDS:${PN} = "xdg-desktop-portal xdg-desktop-portal-gtk"
> +
>  inherit meson pkgconfig gsettings features_check
> 
>  REQUIRED_DISTRO_FEATURES = "polkit"
> diff --git 
> a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb 
> b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
> new file mode 100644
> index 000000000..1e0a90618
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "A backend implementation for xdg-desktop-portal that is 
> using GTK and various pieces of GNOME infrastructure."
> +HOMEPAGE = "<https://github.com/flatpak/xdg-desktop-portal-gtk>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/>
> +
> +DEPENDS = " \
> +    glib-2.0-native \
> +    gtk+3\
> +    xdg-desktop-portal \
> +    libadwaita \
> +    fontconfig \
> +    gsettings-desktop-schemas \
> +    gnome-desktop \
> +    dconf \
> +"
> +
> +inherit gettext autotools pkgconfig gsettings features_check
> +
> +REQUIRED_DISTRO_FEATURES = "polkit"
> +
> +SRC_URI = 
> "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;nobranch=1"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "952005f6a7850a247d286f14838202f506b402b7"
> +
> +# gdbus-codegen wants to create files in ${B}/src and fails because 
> of missing directory
> +do_configure:append() {
> +	mkdir -p ${B}/src
> +}
> +
> +# Note: wlroots has its own implementation for screenshot and 
> screencast, but
> +# you may want to include the according PACKAGECONFIGS for gnome.
> +PACKAGECONFIG ?= "wallpaper appchooser lockdown"
> +
> +PACKAGECONFIG[screenshot] = 
> "--enable-screenshot,--disable-screenshot,gnome-shell"
> +PACKAGECONFIG[screencast] = 
> "--enable-screencast,--disable-screencast,mutter"
> +PACKAGECONFIG[wallpaper] = 
> "--enable-wallpaper,--disable-wallpaper,gnome-desktop"
> +PACKAGECONFIG[background] = 
> "--enable-background,--disable-background,gnome-shell"
> +PACKAGECONFIG[appchooser] = 
> "--enable-appchooser,--disable-appchooser"
> +PACKAGECONFIG[lockdown] = "--enable-lockdown,--disable-lockdown"
> +
> +FILES:${PN} += "${systemd_user_unitdir} ${datadir}"
> --
> 2.34.1
> 


--=-6iYpIHkpmfjzbPvbvYym
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 excludes the background portal by default because it requires gnome-shell to be installed</div></div><div id="geary-quote" dir="auto"><br>Am Di, 3. Jan 2023 um 18:13:27 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"> - add it as denpendency for xdg-desktop-portal-gnome

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../xdg-desktop-portal-gnome_43.1.bb          |  3 ++
 .../xdg-desktop-portal-gtk_1.14.1.bb          | 42 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
index a1532c24c..050ce1a04 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
@@ -7,6 +7,7 @@ DEPENDS = " \
     glib-2.0-native \
     gtk4\
     xdg-desktop-portal \
+    xdg-desktop-portal-gtk \
     libadwaita \
     fontconfig \
     gsettings-desktop-schemas \
@@ -14,6 +15,8 @@ DEPENDS = " \
     dconf \
 "
 
+RDEPENDS:${PN} = "xdg-desktop-portal xdg-desktop-portal-gtk"
+
 inherit meson pkgconfig gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
new file mode 100644
index 000000000..1e0a90618
--- /dev/null
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
@@ -0,0 +1,42 @@
+SUMMARY = "A backend implementation for xdg-desktop-portal that is using GTK and various pieces of GNOME infrastructure."
+HOMEPAGE = "<a href="https://github.com/flatpak/xdg-desktop-portal-gtk">https://github.com/flatpak/xdg-desktop-portal-gtk</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c" "="">file://COPYING;md5=4fbd65380cdd255951079008b364516c"</a>
+
+DEPENDS = " \
+    glib-2.0-native \
+    gtk+3\
+    xdg-desktop-portal \
+    libadwaita \
+    fontconfig \
+    gsettings-desktop-schemas \
+    gnome-desktop \
+    dconf \
+"
+
+inherit gettext autotools pkgconfig gsettings features_check
+
+REQUIRED_DISTRO_FEATURES = "polkit"
+
+SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;nobranch=1"
+
+S = "${WORKDIR}/git"
+SRCREV = "952005f6a7850a247d286f14838202f506b402b7"
+
+# gdbus-codegen wants to create files in ${B}/src and fails because of missing directory
+do_configure:append() {
+	mkdir -p ${B}/src
+}
+
+# Note: wlroots has its own implementation for screenshot and screencast, but
+# you may want to include the according PACKAGECONFIGS for gnome.
+PACKAGECONFIG ?= "wallpaper appchooser lockdown"
+
+PACKAGECONFIG[screenshot] = "--enable-screenshot,--disable-screenshot,gnome-shell"
+PACKAGECONFIG[screencast] = "--enable-screencast,--disable-screencast,mutter"
+PACKAGECONFIG[wallpaper] = "--enable-wallpaper,--disable-wallpaper,gnome-desktop"
+PACKAGECONFIG[background] = "--enable-background,--disable-background,gnome-shell"
+PACKAGECONFIG[appchooser] = "--enable-appchooser,--disable-appchooser"
+PACKAGECONFIG[lockdown] = "--enable-lockdown,--disable-lockdown"
+
+FILES:${PN} += "${systemd_user_unitdir} ${datadir}"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-6iYpIHkpmfjzbPvbvYym--


