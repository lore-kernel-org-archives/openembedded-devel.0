Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976EFC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 06:31:42 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.9080.1752042701430388162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 23:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id E922837A89;
	Wed,  9 Jul 2025 08:31:35 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.161.46]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZOL7-4CaJVI0; Wed, 9 Jul 2025 08:31:34 +0200
Date: Wed, 09 Jul 2025 08:31:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome] [PATCH 05/35] gexiv2: upgrade 0.14.5 -> 0.15.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org,
	"wangmy via lists.openembedded.org"
	<wangmy=fujitsu.com@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Message-Id: <ESC4ZS.OVMPDS5L8SEX1@t-online.de>
In-Reply-To: <20250707090656.1216-5-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
	<20250707090656.1216-5-wangmy@fujitsu.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-JmNa9FAm8P9kTyLtax9G"
X-TOI-EXPURGATEID: 150726::1752042694-5DCA04B1-FBDAD626/0/0 CLEAN NORMAL
X-TOI-MSGID: d568c18c-4f3f-4a2d-ac65-637273a2fb16
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118343

--=-JmNa9FAm8P9kTyLtax9G
Content-Type: text/plain; charset=us-ascii; format=flowed

This seems to be a developement release and it also breaks localsearch 
and gegl.
Eventually its too early for this update

On Mon, Jul 7 2025 at 17:06:25 +08:00:00, wangmy via 
lists.openembedded.org <wangmy=fujitsu.com@lists.openembedded.org> 
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com 
> <mailto:wangmy@fujitsu.com>>
> ---
>  .../gexiv2/{gexiv2_0.14.5.bb => gexiv2_0.15.0.bb}             | 4 
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.5.bb => 
> gexiv2_0.15.0.bb} (90%)
> 
> diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb 
> b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
> similarity index 90%
> rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
> rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
> index fadae34608..bfd9749972 100644
> --- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
> +++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
> @@ -6,9 +6,9 @@ DEPENDS = "exiv2 python3-pygobject-native"
> 
>  GTKDOC_MESON_OPTION = "gtk_doc"
> 
> -inherit gnomebase gobject-introspection gtk-doc python3native vala
> +inherit gnomebase gobject-introspection gtk-doc python3native vala 
> gi-docgen
> 
> -SRC_URI[archive.sha256sum] = 
> "0913c53daabab1f1ab586afd55bb55370796f2b8abcc6e37640ab7704ad99ce1"
> +SRC_URI[archive.sha256sum] = 
> "045ec4584d32963719e0722929f40f1d19566d4582e1eee4604be97e8c3eb740"
> 
>  EXTRA_OEMESON = " \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-Dvapi=true', '-Dvapi=false', d)} \
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118250): 
> <https://lists.openembedded.org/g/openembedded-devel/message/118250>
> Mute This Topic: <https://lists.openembedded.org/mt/114024723/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-JmNa9FAm8P9kTyLtax9G
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This seems to be a developement release and it also breaks localsearch and gegl.</div><div>Eventually its too early for this update&nbsp;</div></div><div id="geary-quote" dir="auto"><br>On Mon, Jul 7 2025 at 17:06:25 +08:00:00, wangmy via lists.openembedded.org &lt;wangmy=fujitsu.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">From: Wang Mingyu &lt;<a href="mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt;

Signed-off-by: Wang Mingyu &lt;<a href="mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt;
---
 .../gexiv2/{gexiv2_0.14.5.bb =&gt; gexiv2_0.15.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.5.bb =&gt; gexiv2_0.15.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
index fadae34608..bfd9749972 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
@@ -6,9 +6,9 @@ DEPENDS = "exiv2 python3-pygobject-native"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-inherit gnomebase gobject-introspection gtk-doc python3native vala
+inherit gnomebase gobject-introspection gtk-doc python3native vala gi-docgen
 
-SRC_URI[archive.sha256sum] = "0913c53daabab1f1ab586afd55bb55370796f2b8abcc6e37640ab7704ad99ce1"
+SRC_URI[archive.sha256sum] = "045ec4584d32963719e0722929f40f1d19566d4582e1eee4604be97e8c3eb740"
 
 EXTRA_OEMESON = " \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} \
<div>-- 
</div>2.43.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#118250): <a href="https://lists.openembedded.org/g/openembedded-devel/message/118250">https://lists.openembedded.org/g/openembedded-devel/message/118250</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/114024723/3618223">https://lists.openembedded.org/mt/114024723/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-JmNa9FAm8P9kTyLtax9G--


