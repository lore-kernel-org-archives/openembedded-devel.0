Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00360CF9C5B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 02:37:42 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.8485.1726972657010893394
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 19:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout07.t-online.de (Postfix) with SMTP id 25BD818BF1;
	Sun, 22 Sep 2024 04:37:35 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.41.228]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ssCTd-0GNEZ60; Sun, 22 Sep 2024 04:37:33 +0200
Date: Sun, 22 Sep 2024 04:39:20 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] grilo: fix gir build
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <KP07KS.HO7J5275J2HF3@t-online.de>
In-Reply-To: <17F76C4BD6F6124F.32431@lists.openembedded.org>
References: <17F76C4BD6F6124F.32431@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nhKlJ742GQ1xiyUHrppC"
X-TOI-EXPURGATEID: 150726::1726972653-2E7FA45E-3FD2A51A/0/0 CLEAN NORMAL
X-TOI-MSGID: 8cf1579c-2a87-4ac7-9a4a-f0ebd71f0a4e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 02:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112445

--=-nhKlJ742GQ1xiyUHrppC
Content-Type: text/plain; charset=us-ascii; format=flowed

I'll send an update for this patch. Only the FILES:${PN} line is 
missing. No need to mess with inherit

On Sun, Sep 22 2024 at 03:22:33 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb 
> b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
> index b6ac75dd8..1ed9a036c 100644
> --- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
> +++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
> @@ -7,8 +7,7 @@ DEPENDS = " \
>      glib-2.0 \
>  "
> 
> -
> -inherit gnomebase gobject-introspection gtk-doc gettext vala
> +inherit gnomebase gobject-introspection-data gtk-doc gettext vala
> 
>  SRC_URI[archive.sha256sum] = 
> "884580e8c5ece280df23aa63ff5234b7d48988a404df7d6bfccd1e77b473bd96"
> 
> @@ -37,3 +36,5 @@ do_compile:append() {
>              ${B}/src/grl-type-builtins.c
>      done
>  }
> +
> +FILES:${PN} += "${libdir}/girepository-1.0"
> --
> 2.46.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112441): 
> <https://lists.openembedded.org/g/openembedded-devel/message/112441>
> Mute This Topic: <https://lists.openembedded.org/mt/108584956/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-nhKlJ742GQ1xiyUHrppC
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I'll send an update for this patch. Only the FILES:${PN} line is missing. No need to mess with inherit</div></div><div id="geary-quote" dir="auto"><br>On Sun, Sep 22 2024 at 03:22:33 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
index b6ac75dd8..1ed9a036c 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -7,8 +7,7 @@ DEPENDS = " \
     glib-2.0 \
 "
 
-
-inherit gnomebase gobject-introspection gtk-doc gettext vala
+inherit gnomebase gobject-introspection-data gtk-doc gettext vala
 
 SRC_URI[archive.sha256sum] = "884580e8c5ece280df23aa63ff5234b7d48988a404df7d6bfccd1e77b473bd96"
 
@@ -37,3 +36,5 @@ do_compile:append() {
             ${B}/src/grl-type-builtins.c
     done
 }
+
+FILES:${PN} += "${libdir}/girepository-1.0"
<div>-- 
</div>2.46.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112441): <a href="https://lists.openembedded.org/g/openembedded-devel/message/112441">https://lists.openembedded.org/g/openembedded-devel/message/112441</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/108584956/3618223">https://lists.openembedded.org/mt/108584956/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-nhKlJ742GQ1xiyUHrppC--


