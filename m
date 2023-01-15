Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC18C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 17:52:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.145453.1673805121413835392
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 09:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 0D0DA1CA1C;
	Sun, 15 Jan 2023 18:51:59 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.227]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pH7Aj-1JmOno0; Sun, 15 Jan 2023 18:51:58 +0100
Date: Sun, 15 Jan 2023 18:51:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/5] gnome-chess: import recipe
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Message-Id: <FAGJOR.03KA8PRX03JU1@t-online.de>
In-Reply-To: <173A8CB7D290C3E3.25137@lists.openembedded.org>
References: <173A8CB7D290C3E3.25137@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-xh8qIGIjJbhUnt8rBj4o"
X-TOI-MSGID: 68009a66-af3d-4baa-822a-a4344748a0dd
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 17:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100576

--=-xh8qIGIjJbhUnt8rBj4o
Content-Type: text/plain; charset=us-ascii; format=flowed

Resent, because the needed fix is now available in oe-core.

Still need to find some time to look at the clang issue in seahorse

Am So, 15. Jan 2023 um 18:48:32 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-chess/gnome-chess_43.1.bb           | 35 
> +++++++++++++++++++
>  .../gnome-chess/gnuchess_6.2.9.bb             | 19 ++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> 
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb 
> b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
> new file mode 100644
> index 000000000..643e6befe
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "GNOME Chess is a 2D chess game, where games can be played 
> between a combination of human and computer players."
> +HOMEPAGE = "<https://wiki.gnome.org/Apps/Chess>"
> +LICENSE = "GPL-3.0-only"
> +
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
> <file://copying;md5=d32239bcb673463ab874e80d47fae504/>
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
> +
> +GTKIC_VERSION = "4"
> +
> +DEPENDS = " \
> +    appstream-glib-native \
> +    cairo \
> +    desktop-file-utils-native \
> +    glib-2.0 \
> +    glib-2.0 \
> +    gtk4 \
> +    libadwaita \
> +    librsvg \
> +    pango \
> +"
> +
> +RRECOMMENDS:${PN}  = "gnuchess"
> +
> +SRC_URI = 
> "git://github.com/GNOME/gnome-chess.git;protocol=https;nobranch=1"
> +
> +inherit meson pkgconfig gobject-introspection gtk-icon-cache vala 
> features_check mime-xdg gsettings
> +
> +GIR_MESON_OPTION = ""
> +
> +S = "${WORKDIR}/git"
> +PV = "43.1"
> +SRCREV = "95c7fb91daf36014fc1c2a7ec20b7400a21cd316"
> +
> +FILES:${PN} += "${datadir}"
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb 
> b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> new file mode 100644
> index 000000000..8ca40229e
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "GNU Chess is a chess-playing program."
> +HOMEPAGE = "<http://www.gnu.org/software/chess/>"
> +LICENSE = "GPL-3.0-only"
> +
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
> <file://copying;md5=d32239bcb673463ab874e80d47fae504/>
> +
> +SRC_URI = 
> "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz 
> <https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-$%7BPV%7D.tar.gz>"
> +SRC_URI[sha256sum] = 
> "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
> +
> +S = "${WORKDIR}/chess-${PV}"
> +
> +inherit autotools gettext
> +
> +do_configure:prepend() {
> +    touch ${S}/ABOUT-NLS
> +    touch ${S}/man/gnuchess.1
> +}
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100575): 
> <https://lists.openembedded.org/g/openembedded-devel/message/100575>
> Mute This Topic: <https://lists.openembedded.org/mt/96289891/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-xh8qIGIjJbhUnt8rBj4o
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Resent, because the needed fix is now available in oe-core.</div><div><br></div><div>Still need to find some time to look at the clang issue in seahorse</div></div><div id="geary-quote" dir="auto"><br>Am So, 15. Jan 2023 um 18:48:32 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-chess/gnome-chess_43.1.bb           | 35 +++++++++++++++++++
 .../gnome-chess/gnuchess_6.2.9.bb             | 19 ++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
new file mode 100644
index 000000000..643e6befe
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
@@ -0,0 +1,35 @@
+SUMMARY = "GNOME Chess is a 2D chess game, where games can be played between a combination of human and computer players."
+HOMEPAGE = "<a href="https://wiki.gnome.org/Apps/Chess">https://wiki.gnome.org/Apps/Chess</a>"
+LICENSE = "GPL-3.0-only"
+
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504" "="">file://COPYING;md5=d32239bcb673463ab874e80d47fae504"</a>
+
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
+
+GTKIC_VERSION = "4"
+
+DEPENDS = " \
+    appstream-glib-native \
+    cairo \
+    desktop-file-utils-native \
+    glib-2.0 \
+    glib-2.0 \
+    gtk4 \
+    libadwaita \
+    librsvg \
+    pango \
+"
+
+RRECOMMENDS:${PN}  = "gnuchess"
+
+SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;nobranch=1"
+
+inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
+
+GIR_MESON_OPTION = ""
+
+S = "${WORKDIR}/git"
+PV = "43.1"
+SRCREV = "95c7fb91daf36014fc1c2a7ec20b7400a21cd316"
+
+FILES:${PN} += "${datadir}"
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
new file mode 100644
index 000000000..8ca40229e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
@@ -0,0 +1,19 @@
+SUMMARY = "GNU Chess is a chess-playing program."
+HOMEPAGE = "<a href="http://www.gnu.org/software/chess/">http://www.gnu.org/software/chess/</a>"
+LICENSE = "GPL-3.0-only"
+
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504" "="">file://COPYING;md5=d32239bcb673463ab874e80d47fae504"</a>
+
+SRC_URI = "<a href="https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz">https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz</a>"
+SRC_URI[sha256sum] = "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
+
+S = "${WORKDIR}/chess-${PV}"
+
+inherit autotools gettext
+
+do_configure:prepend() {
+    touch ${S}/ABOUT-NLS
+    touch ${S}/man/gnuchess.1
+}
+
+FILES:${PN} += "${datadir}"
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#100575): <a href="https://lists.openembedded.org/g/openembedded-devel/message/100575">https://lists.openembedded.org/g/openembedded-devel/message/100575</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96289891/3618223">https://lists.openembedded.org/mt/96289891/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-xh8qIGIjJbhUnt8rBj4o--


