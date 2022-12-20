Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667A6C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 09:53:22 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.46705.1671530001022521720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 01:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id C20F321E76
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:52:59 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.229]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7ZIx-4Pxf0a0; Tue, 20 Dec 2022 10:52:59 +0100
Date: Tue, 20 Dec 2022 10:52:53 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv3] xdg-desktop-portal: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <5SO6NR.NDHO0X8ANDBV@t-online.de>
In-Reply-To: <20221220095207.34654-1-f_l_k@t-online.de>
References: <20221220095207.34654-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-taak3zP8D3X5PM8pYyBe"
X-TOI-EXPURGATEID: 150726::1671529979-0A697417-45074E9D/0/0 CLEAN NORMAL
X-TOI-MSGID: a80519a1-abcf-4ca1-bae9-6172c8e4b38d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 09:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100128

--=-taak3zP8D3X5PM8pYyBe
Content-Type: text/plain; charset=us-ascii; format=flowed

Added missing 'inherit features_check'

Am Di, 20. Dez 2022 um 10:52:07 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 25 +++++++++++
>  .../xdg-desktop-portal_1.16.0.bb              | 41 
> +++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
>  create mode 100644 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> 
> diff --git 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
> new file mode 100644
> index 000000000..4b80c6e9f
> --- /dev/null
> +++ 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
> @@ -0,0 +1,25 @@
> +From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 12 Dec 2022 18:40:31 +0100
> +Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
> +
> +---
> + xdg-desktop-portal.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
> +index 585c0c8..15b5817 100644
> +--- a/xdg-desktop-portal.pc.in
> ++++ b/xdg-desktop-portal.pc.in
> +@@ -2,7 +2,7 @@ prefix=@prefix@
> + datarootdir=@datarootdir@
> + datadir=@datadir@
> +
> +-interfaces_dir=${datadir}/dbus-1/interfaces/
> ++interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces
> +
> + Name: xdg-desktop-portal
> + Description: Desktop integration portal
> +--
> +2.34.1
> +
> diff --git 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> new file mode 100644
> index 000000000..84e04e9f2
> --- /dev/null
> +++ 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "A portal frontend service for Flatpak and possibly other 
> desktop containment frameworks."
> +HOMEPAGE = "<https://github.com/flatpak/xdg-desktop-portal>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/>
> +
> +REQUIRED_DISTRO_FEATURES = "polkit"
> +
> +DEPENDS = " \
> +    json-glib \
> +    glib-2.0 \
> +    libportal \
> +    geoclue \
> +    pipewire \
> +    dbus-native \
> +    fuse3 \
> +    bubblewrap-native \
> +    xmlto-native \
> +    flatpak \
> +    python3-dbus-native \
> +"
> +
> +PORTAL_BACKENDS ?= " \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 
> 'xdg-desktop-portal-wlr', '', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gtk', 
> 'xdg-desktop-portal-gnome', '', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gtk+3', 
> 'xdg-desktop-portal-gnome', '', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gtk4', 
> 'xdg-desktop-portal-gnome', '', d)} \
> +"
> +
> +RDEPENDS:${PN} = "bubblewrap ${PORTAL_BACKENDS}"
> +
> +inherit meson pkgconfig python3native features_check
> +
> +SRC_URI = " \
> +	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=main 
> \
> +	file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch 
> <file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch/> \
> +"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "88af6c8ca4106fcf70925355350a669848e9fd5a"
> +
> +FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
> --
> 2.34.1
> 


--=-taak3zP8D3X5PM8pYyBe
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Added missing 'inherit features_check'</div></div><div id="geary-quote" dir="auto"><br>Am Di, 20. Dez 2022 um 10:52:07 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 25 +++++++++++
 .../xdg-desktop-portal_1.16.0.bb              | 41 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
 create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
new file mode 100644
index 000000000..4b80c6e9f
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
@@ -0,0 +1,25 @@
+From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 12 Dec 2022 18:40:31 +0100
+Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
+
+---
+ xdg-desktop-portal.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
+index 585c0c8..15b5817 100644
+--- a/xdg-desktop-portal.pc.in
++++ b/xdg-desktop-portal.pc.in
+@@ -2,7 +2,7 @@ prefix=@prefix@
+ datarootdir=@datarootdir@
+ datadir=@datadir@
+ 
+-interfaces_dir=${datadir}/dbus-1/interfaces/
++interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces
+ 
+ Name: xdg-desktop-portal
+ Description: Desktop integration portal
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
new file mode 100644
index 000000000..84e04e9f2
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
@@ -0,0 +1,41 @@
+SUMMARY = "A portal frontend service for Flatpak and possibly other desktop containment frameworks."
+HOMEPAGE = "<a href="https://github.com/flatpak/xdg-desktop-portal">https://github.com/flatpak/xdg-desktop-portal</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c" "="">file://COPYING;md5=4fbd65380cdd255951079008b364516c"</a>
+
+REQUIRED_DISTRO_FEATURES = "polkit"
+
+DEPENDS = " \
+    json-glib \
+    glib-2.0 \
+    libportal \
+    geoclue \
+    pipewire \
+    dbus-native \
+    fuse3 \
+    bubblewrap-native \
+    xmlto-native \
+    flatpak \
+    python3-dbus-native \
+"
+
+PORTAL_BACKENDS ?= " \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'xdg-desktop-portal-wlr', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gtk', 'xdg-desktop-portal-gnome', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gtk+3', 'xdg-desktop-portal-gnome', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gnome', '', d)} \
+"
+
+RDEPENDS:${PN} = "bubblewrap ${PORTAL_BACKENDS}"
+
+inherit meson pkgconfig python3native features_check
+
+SRC_URI = " \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=main \
+	<a href="file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch">file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch</a> \
+"
+
+S = "${WORKDIR}/git"
+SRCREV = "88af6c8ca4106fcf70925355350a669848e9fd5a"
+
+FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-taak3zP8D3X5PM8pYyBe--


