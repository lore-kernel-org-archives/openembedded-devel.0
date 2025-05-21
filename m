Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0427FC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:24:33 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.1884.1747841064328256899
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 08:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 6224E92F;
	Wed, 21 May 2025 17:24:14 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.33.59]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uHlIg-0qqxpQ0; Wed, 21 May 2025 17:24:10 +0200
Date: Wed, 21 May 2025 17:24:04 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] libsdl2-compat: use nonarch_libdir
To: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <4SAMWS.YONL0DD7NI4H2@t-online.de>
In-Reply-To: <184193B941EEFFB8.22209@lists.openembedded.org>
References: <184193B941EEFFB8.22209@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ekeBT3+/ATsSSFx0n26W"
X-TOI-EXPURGATEID: 150726::1747841050-177FC541-1FF7B049/0/0 CLEAN NORMAL
X-TOI-MSGID: 4cca9ceb-e0f4-47a6-98f8-909164569921
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 15:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117574

--=-ekeBT3+/ATsSSFx0n26W
Content-Type: text/plain; charset=us-ascii; format=flowed

I forgot to mark this one RFC. I'm not quite sure about this.

On Wed, May 21 2025 at 17:15:44 +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Use nonarch_libdir for do_install:append
> 
> This should prevent a possible multilib issue
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git 
> a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb 
> b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> index 7e3a06f34f..1d46ebf511 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> @@ -23,7 +23,7 @@ inherit cmake pkgconfig upstream-version-is-even 
> features_check
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
> 
>  do_install:append() {
> -	mv ${D}${libdir}/pkgconfig/sdl2-compat.pc 
> ${D}${libdir}/pkgconfig/sdl2.pc
> +	mv ${D}${nonarch_libdir}/pkgconfig/sdl2-compat.pc 
> ${D}${nonarch_libdir}/pkgconfig/sdl2.pc
>  }
> 
>  FILES:${PN} += "${datadir}/licenses"
> --
> 2.49.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117573): 
> <https://lists.openembedded.org/g/openembedded-devel/message/117573>
> Mute This Topic: <https://lists.openembedded.org/mt/113230803/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ekeBT3+/ATsSSFx0n26W
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I forgot to mark this one RFC. I'm not quite sure about this.</div></div><div id="geary-quote" dir="auto"><br>On Wed, May 21 2025 at 17:15:44 +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Use nonarch_libdir for do_install:append

This should prevent a possible multilib issue

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
index 7e3a06f34f..1d46ebf511 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
@@ -23,7 +23,7 @@ inherit cmake pkgconfig upstream-version-is-even features_check
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 do_install:append() {
-	mv ${D}${libdir}/pkgconfig/sdl2-compat.pc ${D}${libdir}/pkgconfig/sdl2.pc
+	mv ${D}${nonarch_libdir}/pkgconfig/sdl2-compat.pc ${D}${nonarch_libdir}/pkgconfig/sdl2.pc
 }
 
 FILES:${PN} += "${datadir}/licenses"
<div>-- 
</div>2.49.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#117573): <a href="https://lists.openembedded.org/g/openembedded-devel/message/117573">https://lists.openembedded.org/g/openembedded-devel/message/117573</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/113230803/3618223">https://lists.openembedded.org/mt/113230803/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ekeBT3+/ATsSSFx0n26W--


