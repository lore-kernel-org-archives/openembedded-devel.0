Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D44EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:57:56 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.10761.1692795470556762695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout10.t-online.de (Postfix) with SMTP id 2A7151646
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:57:48 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.170.236]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYnQc-0HBpZ20; Wed, 23 Aug 2023 14:57:42 +0200
Date: Wed, 23 Aug 2023 14:57:37 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-boxes: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <1CHUZR.2470SNSKJ1LU3@t-online.de>
In-Reply-To: <177E047529399A34.28529@lists.openembedded.org>
References: <177E047529399A34.28529@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MrDx2AqMf6QBS3lgHaCX"
X-TOI-EXPURGATEID: 150726::1692795462-BEFE39BF-42FE77B7/0/0 CLEAN NORMAL
X-TOI-MSGID: 4e37ceef-02b2-4f32-bda7-e79bb11f7ff2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 12:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104549

--=-MrDx2AqMf6QBS3lgHaCX
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 adds missing 'inherit features_check'

On Wed, Aug 23 2023 at 02:56:36 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - use dynamic-layers directory because this recipe depends on 
> meta-virtualization
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-boxes/gnome-boxes_44.2.bb           | 40 
> +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 
> meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
> 
> diff --git 
> a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb 
> b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
> new file mode 100644
> index 0000000000..2ab904f869
> --- /dev/null
> +++ 
> b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A simple GNOME application to access virtual machines."
> +SECTION = "network"
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = 
> "file://copyright;md5=a65e9b0c9f78617732f09f68fc4ef79a" 
> <file://copyright;md5=a65e9b0c9f78617732f09f68fc4ef79a/>
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
> +
> +DEPENDS = " \
> +  glib-2.0 \
> +  desktop-file-utils-native \
> +  ovmf \
> +  libarchive \
> +  libgudev \
> +  libhandy \
> +  libosinfo \
> +  libsecret \
> +  libsoup \
> +  libvirt-glib \
> +  mtools \
> +  spice-gtk \
> +  tracker \
> +  webkitgtk3 \
> +  appstream-glib-native \
> +  spice-protocol \
> +  yelp-tools \
> +"
> +
> +RDEPENDS:${PN} = "glib-2.0-dev libvirt-virsh qemu-common 
> qemu-system-x86-64"
> +
> +inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache 
> gobject-introspection vala features_check
> +
> +SRC_URI[archive.sha256sum] = 
> "9dd389c149d0c0fa57456ec363d51a88255f945558fb9df42894ce78ef85df89"
> +
> +GIR_MESON_OPTION = ""
> +
> +FILES:${PN} += "${datadir}"
> +
> +INSANE_SKIP:${PN} = "dev-deps"
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104548): 
> <https://lists.openembedded.org/g/openembedded-devel/message/104548>
> Mute This Topic: <https://lists.openembedded.org/mt/100913942/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-MrDx2AqMf6QBS3lgHaCX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 adds missing 'inherit features_check'</div></div><div id="geary-quote" dir="auto"><br>On Wed, Aug 23 2023 at 02:56:36 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- use dynamic-layers directory because this recipe depends on meta-virtualization

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-boxes/gnome-boxes_44.2.bb           | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
new file mode 100644
index 0000000000..2ab904f869
--- /dev/null
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A simple GNOME application to access virtual machines."
+SECTION = "network"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "<a href="file://copyright;md5=a65e9b0c9f78617732f09f68fc4ef79a" "="">file://copyright;md5=a65e9b0c9f78617732f09f68fc4ef79a"</a>
+
+GNOMEBASEBUILDCLASS = "meson"
+
+REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
+
+DEPENDS = " \
+  glib-2.0 \
+  desktop-file-utils-native \
+  ovmf \
+  libarchive \
+  libgudev \
+  libhandy \
+  libosinfo \
+  libsecret \
+  libsoup \
+  libvirt-glib \
+  mtools \
+  spice-gtk \
+  tracker \
+  webkitgtk3 \
+  appstream-glib-native \
+  spice-protocol \
+  yelp-tools \
+"
+
+RDEPENDS:${PN} = "glib-2.0-dev libvirt-virsh qemu-common qemu-system-x86-64"
+
+inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala features_check
+
+SRC_URI[archive.sha256sum] = "9dd389c149d0c0fa57456ec363d51a88255f945558fb9df42894ce78ef85df89"
+
+GIR_MESON_OPTION = ""
+
+FILES:${PN} += "${datadir}"
+
+INSANE_SKIP:${PN} = "dev-deps"
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104548): <a href="https://lists.openembedded.org/g/openembedded-devel/message/104548">https://lists.openembedded.org/g/openembedded-devel/message/104548</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/100913942/3618223">https://lists.openembedded.org/mt/100913942/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-MrDx2AqMf6QBS3lgHaCX--


