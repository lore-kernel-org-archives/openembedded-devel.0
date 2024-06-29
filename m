Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1102FC27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 06:00:48 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.1065.1719640839225047931
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 23:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id 41A6E3E5E7
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 08:00:37 +0200 (CEST)
Received: from [192.168.178.67] ([79.219.233.181]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sNR8U-1tWTwm0; Sat, 29 Jun 2024 08:00:35 +0200
Date: Sat, 29 Jun 2024 08:01:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] flatpak: add PACKAGECONFIG for dconf
To: openembedded-devel@lists.openembedded.org
Message-Id: <REVTFS.PKMVXXEL6CC33@t-online.de>
In-Reply-To: <17DD642F63C8ABFC.20740@lists.openembedded.org>
References: <17DD642F63C8ABFC.20740@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VR3RGapR1GX5FNB7cy2/"
X-TOI-EXPURGATEID: 150726::1719640835-FEFFB352-1FE3518A/0/0 CLEAN NORMAL
X-TOI-MSGID: aa43f6c0-8207-4625-81d2-1f26d5846c3e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 06:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111158

--=-VR3RGapR1GX5FNB7cy2/
Content-Type: text/plain; charset=us-ascii; format=flowed

Remove dconf also from RDEPENDS

On Sat, Jun 29 2024 at 08:00:10 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Disable by default to avoid a requirement for meta-gnome
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb 
> b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> index 8351e7d65..3c1de93c5 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> @@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
>  DEPENDS = " \
>      appstream \
>      bison-native \
> -    dconf \
>      fuse3 \
>      gdk-pixbuf \
>      glib-2.0 \
> @@ -36,7 +35,6 @@ DEPENDS = " \
> 
>  RDEPENDS:${PN} = " \
>      ca-certificates \
> -    dconf \
>      flatpak-xdg-utils \
>      fuse3-utils \
>  "
> @@ -49,6 +47,7 @@ GTKDOC_MESON_ENABLE_FLAG = 'enabled'
>  GTKDOC_MESON_DISABLE_FLAG = 'disabled'
> 
>  PACKAGECONFIG[curl] = "-Dhttp_backend=curl,,curl"
> +PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
>  PACKAGECONFIG[docbook_docs] = 
> "-Ddocbook_docs=enabled,-Ddocbook_docs=disabled,xmlto-native"
>  PACKAGECONFIG[man] = "-Dman=enabled,-Dman=disabled,libxslt-native"
>  PACKAGECONFIG[soup] = "-Dhttp_backend=soup,,libsoup-2.4"
> --
> 2.45.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111157): 
> <https://lists.openembedded.org/g/openembedded-devel/message/111157>
> Mute This Topic: <https://lists.openembedded.org/mt/106941795/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-VR3RGapR1GX5FNB7cy2/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Remove dconf also from RDEPENDS</div></div><div id="geary-quote" dir="auto"><br>On Sat, Jun 29 2024 at 08:00:10 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Disable by default to avoid a requirement for meta-gnome

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
index 8351e7d65..3c1de93c5 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 DEPENDS = " \
     appstream \
     bison-native \
-    dconf \
     fuse3 \
     gdk-pixbuf \
     glib-2.0 \
@@ -36,7 +35,6 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = " \
     ca-certificates \
-    dconf \
     flatpak-xdg-utils \
     fuse3-utils \
 "
@@ -49,6 +47,7 @@ GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
 PACKAGECONFIG[curl] = "-Dhttp_backend=curl,,curl"
+PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
 PACKAGECONFIG[docbook_docs] = "-Ddocbook_docs=enabled,-Ddocbook_docs=disabled,xmlto-native"
 PACKAGECONFIG[man] = "-Dman=enabled,-Dman=disabled,libxslt-native"
 PACKAGECONFIG[soup] = "-Dhttp_backend=soup,,libsoup-2.4"
<div>-- 
</div>2.45.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111157): <a href="https://lists.openembedded.org/g/openembedded-devel/message/111157">https://lists.openembedded.org/g/openembedded-devel/message/111157</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/106941795/3618223">https://lists.openembedded.org/mt/106941795/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-VR3RGapR1GX5FNB7cy2/--


