Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479FCD49204
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:31:37 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.37288.1731922294050015592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id A5D9D7CA
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 10:31:31 +0100 (CET)
Received: from [192.168.178.67] ([79.219.230.25]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tCy6S-3taZ280; Mon, 18 Nov 2024 10:31:28 +0100
Date: Mon, 18 Nov 2024 10:33:55 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gdm: fix service start
To: openembedded-devel@lists.openembedded.org
Message-Id: <JW35NS.XRP6GM22YOEF3@t-online.de>
In-Reply-To: <1809060B9A95F23E.17101@lists.openembedded.org>
References: <1809060B9A95F23E.17101@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3HUz5bkWRvP39b90A4K5"
X-TOI-EXPURGATEID: 150726::1731922288-7B7E8CFB-8D82867D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7f85cdcc-979d-496a-835e-09b9821242c3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113899

--=-3HUz5bkWRvP39b90A4K5
Content-Type: text/plain; charset=us-ascii; format=flowed

Additionally remove the '--user-group' option as it also lets gdm fail

On Mon, Nov 18 2024 at 10:31:59 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> gdm doesn't require to create a home directory but it needs to be 
> member of
> the video group to work properly
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb 
> b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
> index 94836cdbc..caf882d02 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
> @@ -41,7 +41,7 @@ do_install:append() {
>  }
> 
>  USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --home 
> ${localstatedir}/lib/gdm --user-group gdm"
> +USERADD_PARAM:${PN} = "--system --no-create-home --groups video gdm"
> 
>  SYSTEMD_SERVICE:${PN} = "${BPN}.service"
> 
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113866): 
> <https://lists.openembedded.org/g/openembedded-devel/message/113866>
> Mute This Topic: <https://lists.openembedded.org/mt/109641286/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-3HUz5bkWRvP39b90A4K5
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Additionally remove the '<span style="white-space: break-spaces;">--user-group</span>' option as it also lets gdm fail</div></div><div id="geary-quote" dir="auto"><br>On Mon, Nov 18 2024 at 10:31:59 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">gdm doesn't require to create a home directory but it needs to be member of
the video group to work properly

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
index 94836cdbc..caf882d02 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -41,7 +41,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
+USERADD_PARAM:${PN} = "--system --no-create-home --groups video gdm"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#113866): <a href="https://lists.openembedded.org/g/openembedded-devel/message/113866">https://lists.openembedded.org/g/openembedded-devel/message/113866</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109641286/3618223">https://lists.openembedded.org/mt/109641286/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-3HUz5bkWRvP39b90A4K5--


