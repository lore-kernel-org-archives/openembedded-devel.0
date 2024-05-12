Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEF8C10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 09:49:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.32289.1715507371044550247
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 02:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id DFE1053F59
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:49:28 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.32.90]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s65pe-2MLanQ0; Sun, 12 May 2024 11:49:26 +0200
Date: Sun, 12 May 2024 11:49:53 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] malcontent: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <5Z9DDS.BEU3Z2DGFFJI3@t-online.de>
In-Reply-To: <17CEB4D101C60FD3.21609@lists.openembedded.org>
References: <17CEB4D101C60FD3.21609@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U2+4yEg6rh/X0deOknaB"
X-TOI-EXPURGATEID: 150726::1715507366-AF294336-07919412/0/0 CLEAN NORMAL
X-TOI-MSGID: 6295ca76-77e2-4a1e-9731-353c6b69eaf1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 09:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110318

--=-U2+4yEg6rh/X0deOknaB
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 adds a missing appstream dependency

On Sun, May 12 2024 at 11:49:00 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> malcontent is an optional dependency for flatpak and gnome-software
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../malcontent/malcontent_0.12.0.bb           | 31 
> +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 
> meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
> 
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb 
> b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
> new file mode 100644
> index 000000000..a21241901
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
> @@ -0,0 +1,31 @@
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
> +	desktop-file-utils-native \
> +	itstool-native \
> +	libpam \
> +	polkit \
> +"
> +
> +GTKIC_VERSION = "4"
> +inherit  meson pkgconfig gtk-icon-cache gobject-introspection-data 
> gettext features_check
> +
> +REQUIRED_DISTRO_FEATURES = "pam polkit"
> +
> +# If building with ui, we run into circular dependency flatpak <-> 
> malcontent
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[ui] = "-Dui=enabled,-Dui=disabled,appstream flatpak 
> libadwaita gtk4"
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110317): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110317>
> Mute This Topic: <https://lists.openembedded.org/mt/106052544/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-U2+4yEg6rh/X0deOknaB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 adds a missing appstream dependency</div></div><div id="geary-quote" dir="auto"><br>On Sun, May 12 2024 at 11:49:00 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">malcontent is an optional dependency for flatpak and gnome-software

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../malcontent/malcontent_0.12.0.bb           | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
new file mode 100644
index 000000000..a21241901
--- /dev/null
+++ b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
@@ -0,0 +1,31 @@
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
+	desktop-file-utils-native \
+	itstool-native \
+	libpam \
+	polkit \
+"
+
+GTKIC_VERSION = "4"
+inherit  meson pkgconfig gtk-icon-cache gobject-introspection-data gettext features_check
+
+REQUIRED_DISTRO_FEATURES = "pam polkit"
+
+# If building with ui, we run into circular dependency flatpak &lt;-&gt; malcontent
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[ui] = "-Dui=enabled,-Dui=disabled,appstream flatpak libadwaita gtk4"
+
+FILES:${PN} += "${libdir} ${datadir}"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110317): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110317">https://lists.openembedded.org/g/openembedded-devel/message/110317</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/106052544/3618223">https://lists.openembedded.org/mt/106052544/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-U2+4yEg6rh/X0deOknaB--


