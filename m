Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F31C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 09:29:03 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.6355.1676107738062454843
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 01:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout02.t-online.de (Postfix) with SMTP id 3553613C0E
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 10:28:56 +0100 (CET)
Received: from [192.168.178.83] ([84.163.42.158]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pQmBf-2IDaGO0; Sat, 11 Feb 2023 10:28:51 +0100
Date: Sat, 11 Feb 2023 10:28:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] pipewire-media-session: update 0.4.1 ->
 0.4.2
To: openembedded-devel@lists.openembedded.org
Message-Id: <XZSWPR.BP8CATXQ124M1@t-online.de>
In-Reply-To: <20230211092756.19039-1-f_l_k@t-online.de>
References: <20230211092756.19039-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5uoytKqlqPPs5L5NGWaw"
X-TOI-EXPURGATEID: 150726::1676107731-1B7F0D98-3988B126/0/0 CLEAN NORMAL
X-TOI-MSGID: 714c7d28-4883-4803-959a-a08020b8bb65
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101021

--=-5uoytKqlqPPs5L5NGWaw
Content-Type: text/plain; charset=us-ascii; format=flowed

media-session has been updated. Although it should no longer be used, 
make this update because of the release message, which is not only 
quite funny, but also clarifies that it should no longer be used except 
for experimentation.

Am Sa, 11. Feb 2023 um 10:27:56 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Media Session 0.4.2 (2023-01-20)
> 
> This is a small release to keep the dead corpse walking... Repeated 
> attempts to
> shoot it in the head seem to have failed (We don't think it is 
> running with a lot
> of brains left). It does not look pretty and we don't know yet when 
> it will finally
> stay down. What we do know is that some creatures (humans?) have been 
> secretly
> feeding it with their brain cells and as such, here we are...
> 
> Anyway, it contains some minor patches for some organ (memory?) 
> leaks. It also adds
> some fixes to make things stumble on (compile?) and make disturbing 
> slurping sounds
> again (work?) with the latest PipeWire versions.
> 
> Seriously.. back off.. don't become a victim... use Wireplumber.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...e-media-session_0.4.1.bb => pipewire-media-session_0.4.2.bb} | 2 
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename 
> meta-multimedia/recipes-multimedia/pipewire/{pipewire-media-session_0.4.1.bb 
> => pipewire-media-session_0.4.2.bb} (92%)
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
> similarity index 92%
> rename from 
> meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> rename to 
> meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
> index da8d1d7ad..8ae062413 100644
> --- 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> +++ 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
> @@ -13,7 +13,7 @@ DEPENDS = " \
>  SRC_URI = 
> "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
> 
>  S = "${WORKDIR}/git"
> -SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
> +SRCREV = "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"
> 
>  inherit meson pkgconfig
>  # <https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952>
> --
> 2.34.1
> 


--=-5uoytKqlqPPs5L5NGWaw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>media-session has been updated. Although it should no longer be used, make this update because of the release message, which is not only quite funny, but also clarifies that it should no longer be used except for experimentation.</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 11. Feb 2023 um 10:27:56 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Media Session 0.4.2 (2023-01-20)

This is a small release to keep the dead corpse walking... Repeated attempts to
shoot it in the head seem to have failed (We don't think it is running with a lot
of brains left). It does not look pretty and we don't know yet when it will finally
stay down. What we do know is that some creatures (humans?) have been secretly
feeding it with their brain cells and as such, here we are...

Anyway, it contains some minor patches for some organ (memory?) leaks. It also adds
some fixes to make things stumble on (compile?) and make disturbing slurping sounds
again (work?) with the latest PipeWire versions.

Seriously.. back off.. don't become a victim... use Wireplumber.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...e-media-session_0.4.1.bb =&gt; pipewire-media-session_0.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire-media-session_0.4.1.bb =&gt; pipewire-media-session_0.4.2.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
index da8d1d7ad..8ae062413 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
+SRCREV = "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"
 
 inherit meson pkgconfig
 # <a href="https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952">https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952</a>
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-5uoytKqlqPPs5L5NGWaw--


