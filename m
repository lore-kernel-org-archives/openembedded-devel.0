Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2EBC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 08:07:33 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.191686.1673942846033191180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 00:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 67E5ECC2F
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 09:07:23 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.203]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHh07-3RU06i0; Tue, 17 Jan 2023 09:07:23 +0100
Date: Tue, 17 Jan 2023 09:07:17 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-control-center: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <5KEMOR.6WGJDFF79C763@t-online.de>
In-Reply-To: <173B07F8C57D523F.23170@lists.openembedded.org>
References: <173B07F8C57D523F.23170@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ygmCIFwR+11pXDMGuS+7"
X-TOI-EXPURGATEID: 150726::1673942843-DDB4A4E4-FEA01CC4/0/0 CLEAN NORMAL
X-TOI-MSGID: e18d6aaf-1121-4b5b-8c0e-212114cfba84
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 08:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100633

--=-ygmCIFwR+11pXDMGuS+7
Content-Type: text/plain; charset=us-ascii; format=flowed

I'll send a v2 for this patch. It has wrong name because of c&p

Am Di, 17. Jan 2023 um 08:27:16 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Add a recipe for gnome-remote-desktop and a corresponding 
> PACKAGECONFIG for
> gnome-control-center from where it can be enabled/disabled, if 
> available.
> 
> It is not enabled by default because it has a dependency on tpm2-tss 
> and thus
> adds a layer dependency on meta-security/meta-tpm.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-control-center_43.2.bb              |  1 +
>  .../gnome-remote-desktop_43.3.bb              | 38 
> +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
> index 830f3ec68..16a400c5c 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
> @@ -42,6 +42,7 @@ SRC_URI[archive.sha256sum] = 
> "d7f256aba80a92c727b329fd01c8602da4b78f0fddaec93fcd
>  PACKAGECONFIG ??= "ibus ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland', d)}"
>  PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
>  PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
> +PACKAGECONFIG[remote-desktop] = ",,,gnome-remote-desktop"
> 
>  EXTRA_OEMESON = " \
>      -Doe_sysroot=${STAGING_DIR_HOST} \
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb 
> b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
> new file mode 100644
> index 000000000..5d1a85d5f
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "Remote desktop daemon for GNOME using pipewire."
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +inherit gnomebase gettext gsettings features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +SRC_URI[archive.sha256sum] = 
> "11d451d1fde44f1809ebf61aff4bea5f9ef4fdc02359a89647f6e9e7d45429ac"
> +
> +DEPENDS = " \
> +    asciidoc-native \
> +    libdrm \
> +    libepoxy \
> +    cairo \
> +    glib-2.0 \
> +    pipewire \
> +    libnotify \
> +    libsecret \
> +    nv-codec-headers \
> +    tpm2-tss \
> +"
> +
> +PACKAGECONFIG ??= " \
> +    vnc \
> +    rdp \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('LICENSE_FLAGS_ACCEPTED', 'commercial', 
> 'fdk_aac', '', d)} \
> +    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd', d)} \
> +"
> +
> +PACKAGECONFIG[vnc] = "-Dvnc=true,-Dvnc=false,libvncserver"
> +PACKAGECONFIG[rdp] = "-Drdp=true,-Drdp=false,freerdp fuse3 
> libxkbcommon"
> +PACKAGECONFIG[fdk_aac] = "-Dfdk_aac=true,-Dfdk_aac=false,fdk-aac"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +
> +FILES:${PN} += "${systemd_user_unitdir}"
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100630): 
> <https://lists.openembedded.org/g/openembedded-devel/message/100630>
> Mute This Topic: <https://lists.openembedded.org/mt/96325846/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ygmCIFwR+11pXDMGuS+7
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I'll send a v2 for this patch. It has wrong name because of c&amp;p&nbsp;</div></div><div id="geary-quote" dir="auto"><br>Am Di, 17. Jan 2023 um 08:27:16 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Add a recipe for gnome-remote-desktop and a corresponding PACKAGECONFIG for
gnome-control-center from where it can be enabled/disabled, if available.

It is not enabled by default because it has a dependency on tpm2-tss and thus
adds a layer dependency on meta-security/meta-tpm.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-control-center_43.2.bb              |  1 +
 .../gnome-remote-desktop_43.3.bb              | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
index 830f3ec68..16a400c5c 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
@@ -42,6 +42,7 @@ SRC_URI[archive.sha256sum] = "d7f256aba80a92c727b329fd01c8602da4b78f0fddaec93fcd
 PACKAGECONFIG ??= "ibus <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
 PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
+PACKAGECONFIG[remote-desktop] = ",,,gnome-remote-desktop"
 
 EXTRA_OEMESON = " \
     -Doe_sysroot=${STAGING_DIR_HOST} \
diff --git a/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
new file mode 100644
index 000000000..5d1a85d5f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Remote desktop daemon for GNOME using pipewire."
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext gsettings features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+SRC_URI[archive.sha256sum] = "11d451d1fde44f1809ebf61aff4bea5f9ef4fdc02359a89647f6e9e7d45429ac"
+
+DEPENDS = " \
+    asciidoc-native \
+    libdrm \
+    libepoxy \
+    cairo \
+    glib-2.0 \
+    pipewire \
+    libnotify \
+    libsecret \
+    nv-codec-headers \
+    tpm2-tss \
+"
+
+PACKAGECONFIG ??= " \
+    vnc \
+    rdp \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('LICENSE_FLAGS_ACCEPTED', 'commercial', 'fdk_aac', '', d)} \
+    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd', d)} \
+"
+
+PACKAGECONFIG[vnc] = "-Dvnc=true,-Dvnc=false,libvncserver"
+PACKAGECONFIG[rdp] = "-Drdp=true,-Drdp=false,freerdp fuse3 libxkbcommon"
+PACKAGECONFIG[fdk_aac] = "-Dfdk_aac=true,-Dfdk_aac=false,fdk-aac"
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
+
+FILES:${PN} += "${systemd_user_unitdir}"
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#100630): <a href="https://lists.openembedded.org/g/openembedded-devel/message/100630">https://lists.openembedded.org/g/openembedded-devel/message/100630</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96325846/3618223">https://lists.openembedded.org/mt/96325846/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ygmCIFwR+11pXDMGuS+7--


