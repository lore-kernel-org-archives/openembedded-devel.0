Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E9DC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 07:14:55 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.54277.1723101293359309541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 00:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id F1399862D
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Aug 2024 09:14:50 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.166.49]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sbxMI-0Rqc5Y0; Thu, 8 Aug 2024 09:14:50 +0200
Date: Thu, 08 Aug 2024 09:16:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-networking][PATCHv4] blueman: skip buildpath error
To: openembedded-devel@lists.openembedded.org
Message-Id: <2J1WHS.B6TLGK30077A3@t-online.de>
In-Reply-To: <17E9AF6C1E4299C3.19172@lists.openembedded.org>
References: <17E9AF6C1E4299C3.19172@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tpjOb9s12gGOJ1tmZ2Cc"
X-TOI-EXPURGATEID: 150726::1723101290-8EFEEB07-163C6A39/0/0 CLEAN NORMAL
X-TOI-MSGID: 1055d6a7-ecab-4762-9f13-b8f6ca135e61
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 07:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111645

--=-tpjOb9s12gGOJ1tmZ2Cc
Content-Type: text/plain; charset=us-ascii; format=flowed

sorry, failed again after cleansstate

On Thu, Aug 8 2024 at 09:14:14 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Blueman has compiled the buildpath into _blueman.so.
> The underlying issue is related to the cython compiler, so theres 
> nothing
> that can be done from the blueman side.
> [<https://github.com/cython/cython/issues/5949>]
> 
> Disable the buildpath error to keep blueman usable until the problem 
> is fixed.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git 
> a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb 
> b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> index 5aa3b2bd5..5e146d648 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> @@ -64,3 +64,6 @@ do_install:append() {
>          chmod 700 ${D}/${datadir}/polkit-1/rules.d
>          chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
>  }
> +
> +INSANE_SKIP:${PN} += "buildpaths"
> +INSANE_SKIP:${PN}-src += "buildpaths"
> --
> 2.45.2
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111644): 
> <https://lists.openembedded.org/g/openembedded-devel/message/111644>
> Mute This Topic: <https://lists.openembedded.org/mt/107783734/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-tpjOb9s12gGOJ1tmZ2Cc
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sorry, failed again after cleansstate&nbsp;</div></div><div id="geary-quote" dir="auto"><br>On Thu, Aug 8 2024 at 09:14:14 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Blueman has compiled the buildpath into _blueman.so.
The underlying issue is related to the cython compiler, so theres nothing
that can be done from the blueman side.
[<a href="https://github.com/cython/cython/issues/5949">https://github.com/cython/cython/issues/5949</a>]

Disable the buildpath error to keep blueman usable until the problem is fixed.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index 5aa3b2bd5..5e146d648 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -64,3 +64,6 @@ do_install:append() {
         chmod 700 ${D}/${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
 }
+
+INSANE_SKIP:${PN} += "buildpaths"
+INSANE_SKIP:${PN}-src += "buildpaths"
<div>-- 
</div>2.45.2

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111644): <a href="https://lists.openembedded.org/g/openembedded-devel/message/111644">https://lists.openembedded.org/g/openembedded-devel/message/111644</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/107783734/3618223">https://lists.openembedded.org/mt/107783734/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-tpjOb9s12gGOJ1tmZ2Cc--


